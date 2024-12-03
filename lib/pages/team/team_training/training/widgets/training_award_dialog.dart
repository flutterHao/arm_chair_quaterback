/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-02 10:15:35
 * @LastEditTime: 2024-12-02 22:46:51
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
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
    double top = (75 + 9 + 115 + 47 + 10).w;
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
                  AnimatedPositioned(
                    // top: 415.h,
                    top: top + 78.5.w,
                    duration: 300.milliseconds,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 300),
                      scale: controller.showBuff.value ? 1 : 0,
                      child: MtInkwell(
                          onTap: () {
                            buff.isSelect.value = true;
                            controller.tacticId = buff.id;
                            controller.changeTacticId = 0;
                            controller.chooseTactic(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.w, color: AppColors.cFF7954),
                                borderRadius: BorderRadius.circular(8.w)),
                            child: TacticCard(
                              num: buff.face,
                              color: buff.color,
                              width: 74.w,
                              buff: buff,
                            ),
                          )),
                    ),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: controller.showBuff.value &&
                              !controller.isChange.value ||
                          true,
                      child: Positioned(
                        top: top + 205.w,
                        child: MtInkwell(
                          onTap: () {
                            if (controller.isNotTip.value) {
                              controller.chooseFinish();
                              Navigator.pop(context);
                              return;
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
                  Positioned(
                    // left: 143.w,
                    right: 15.5.w,
                    top: 168.w,
                    // bottom: 812.h - (141 + 47).w,
                    // bottom: 500.h,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        SizedBox(
                          height: 62.w,
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return MtInkwell(
                                  onTap: () {
                                    controller.changeTacticId =
                                        controller.tacticList[index].id;
                                    controller.chooseTactic(context);
                                  },
                                  child: TacticItem(
                                    buff: controller.tacticList[index],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => 7.hGap,
                              itemCount: controller.tacticList.length > 5
                                  ? 5
                                  : controller.tacticList.length),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _TipDialog extends GetView<TrainingController> {
  const _TipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // height: 30.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Are yout confirm to qiut the 'Tactics Pick'",
                style: 16.w4(),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return SizedBox(
                    width: 40.w,
                    child: Checkbox(
                        value: controller.isNotTip.value,
                        activeColor: AppColors.cFF7954,
                        onChanged: (v) {
                          controller.isNotTip.value =
                              !controller.isNotTip.value;
                        }),
                  );
                }),
                Text(
                  "No more tips today",
                  style: 12.w4(),
                )
              ],
            )
          ],
        ),
        onTap: () {
          controller.saveNotTip();
          controller.chooseFinish();
        });
  }
}
