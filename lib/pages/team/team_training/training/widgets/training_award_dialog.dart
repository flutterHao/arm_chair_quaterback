/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-02 10:15:35
 * @LastEditTime: 2024-12-24 14:49:46
 */
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/training_tactics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingAwardDialog extends GetView<TrainingController> {
  const TrainingAwardDialog(this.buff, {super.key});
  final TrainingInfoBuff buff;

  @override
  Widget build(BuildContext context) {
    double smallTop = (47 + 96.5).w;
    // double top = (75 + 9 + 115 + 47 + 10).w;
    double bigTop = (177.w + 9 + 47 + 78.5).w;
    Rx<Offset> offset = Offset((375 - 74).w / 2, bigTop).obs;
    // RxBool isFly = false.obs;
    Duration duration = 300.milliseconds;
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (_) {
          return Align(
            child: Container(
              // color: Colors.white,
              width: 375.w,
              height: 812.h,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  for (int index = 0;
                      index < controller.trainingInfo.buff.length;
                      index++)
                    Positioned(
                        top: smallTop,
                        left: 10.w + 143.5.w + index * 43.w,
                        // right: 195.5.w - index * 43.w,
                        child: MtInkwell(
                          splashColor: Colors.transparent,
                          onTap: () async {
                            offset.value = Offset(
                                10.w + 143.5.w + index * 43.w, smallTop + 4.w);
                            controller.changeTacticId =
                                controller.trainingInfo.buff[index].id;
                            controller.chooseTactic(context);
                          },
                          child: Obx(() {
                            var buff = controller.trainingInfo.buff[index];
                            return AnimatedScale(
                              duration: 150.milliseconds,
                              scale: buff.show.value ? 1.5 : 1,
                              child: TacticItem(
                                buff: controller.trainingInfo.buff[index],
                              ),
                            );
                          }),
                        )),
                  Obx(() {
                    return Visibility(
                      visible: controller.showBuff.value,
                      child: AnimatedPositioned(
                        left: offset.value.dx,
                        top: offset.value.dy,
                        duration: duration,
                        curve: BezierCurve(0.25, 0.1, 0.25, 1.0),
                        child: AnimatedScale(
                          curve: Curves.easeInOut,
                          alignment: Alignment.topLeft,
                          duration: duration,
                          scale: !controller.tacticFly.value ? 1 : 0.5,
                          child: MtInkwell(
                              onTap: () {
                                buff.isSelect.value = true;
                                controller.selectTacticId = buff.id;
                                controller.changeTacticId = 0;
                                controller.chooseTactic(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: !controller.tacticFly.value
                                        ? Border.all(
                                            width: 2.w,
                                            color: AppColors.cFF7954)
                                        : null,
                                    borderRadius: BorderRadius.circular(8.w)),
                                child: !controller.tacticFly.value
                                    ? TacticCard(
                                        num: buff.face,
                                        color: buff.color,
                                        width: 74.w,
                                        buff: buff,
                                      )
                                    : SmallTacticCard(
                                        num: buff.face,
                                        color: buff.color,
                                        width: 74.w,
                                      ),
                              )),
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return Visibility(
                      visible: controller.showBuff.value &&
                          !controller.tacticFly.value,
                      child: Positioned(
                        top: bigTop + 97.w + 28.w,
                        child: MtInkwell(
                          onTap: () async {
                            if (Utils.getNoTip("tactics")) {
                              controller.chooseFinish();
                              Get.back();
                              // return;
                            } else {
                              await BottomTipDialog.show(
                                  context: context,
                                  title: "Tip",
                                  desc:
                                      "Are you confirm to qiut the tactics pick?",
                                  onTap: () {
                                    Utils.saveNotTip("tactics");
                                    controller.chooseFinish();
                                    Navigator.pop(context);
                                    Get.back();
                                  });
                            }
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.cEB0000,
                                borderRadius: BorderRadius.circular(6.w)),
                            child: Image.asset(
                              Assets.iconUiIconDelete02,
                              width: 16.w,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }
}

class BezierCurve extends Curve {
  final double cx1;
  final double cy1;
  final double cx2;
  final double cy2;

  const BezierCurve(this.cx1, this.cy1, this.cx2, this.cy2);

  @override
  double transform(double t) {
    return _bezier(t, 0, cx1, cx2, 1);
  }

  double _bezier(double t, double start, double c1, double c2, double end) {
    return ((1 - t) * (1 - t) * (1 - t) * start +
        3 * (1 - t) * (1 - t) * t * c1 +
        3 * (1 - t) * t * t * c2 +
        t * t * t * end);
  }
}
