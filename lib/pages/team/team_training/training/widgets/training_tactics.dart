import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/card_rule_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingTactics extends StatelessWidget {
  const TrainingTactics({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetBuilder<TrainingController>(
          id: "training_page",
          builder: (ctrl) {
            final myTeamCtrl = Get.find<TeamController>();
            return Container(
                width: double.infinity,
                height: 115.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: Get.context!,
                            builder: (context) {
                              return const VerticalDragBackWidget(
                                  child: TeamMenberView());
                            });
                      },
                      child: Container(
                        width: 140.w,
                        height: 115.w,
                        padding: EdgeInsets.only(left: 34.w, right: 21.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                7.hGap,
                                Text(
                                  "MORALE",
                                  style: 14.w4(
                                      color: AppColors.c000000,
                                      fontFamily: FontFamily.fOswaldRegular,
                                      height: 1),
                                ),
                                18.hGap,
                                IconWidget(
                                  iconWidth: 14.w,
                                  iconHeight: 12.w,
                                  icon: Assets.iconUiIconRead,
                                  iconColor: AppColors.c000000,
                                )
                              ],
                            ),
                            13.vGap,
                            CircleProgressView(
                                progress: myTeamCtrl.myTeamEntity.powerP * 1.0,
                                width: 55.w,
                                height: 55.w,
                                progressWidth: 5.w,
                                progressColor: Utils.getProgressColor(
                                    myTeamCtrl.myTeamEntity.powerP),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 18.w,
                                      icon: Assets.managerUiManagerIconRecover,
                                    ),
                                    3.vGap,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedNum(
                                          number:
                                              myTeamCtrl.myTeamEntity.powerP,
                                          textStyle: 10.w4(),
                                        ),
                                        Text(
                                          "%",
                                          style: 10.w4(),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 91.w,
                      color: AppColors.cE6E6E,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              // barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              context: Get.context!,
                              builder: (context) {
                                return const VerticalDragBackWidget(
                                    child: CardRuleDialog());
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 14.w),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              18.vGap,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "TACTICS",
                                      style: 14.w4(
                                          color: AppColors.c000000,
                                          fontFamily: FontFamily.fOswaldRegular,
                                          height: 1),
                                    ),
                                  ),
                                  18.hGap,
                                  IconWidget(
                                    iconWidth: 14.w,
                                    iconHeight: 12.w,
                                    icon: Assets.iconUiIconRead,
                                    iconColor: AppColors.c000000,
                                  ),
                                  21.hGap,
                                ],
                              ),
                              // 17.vGap,
                              Expanded(
                                child: Obx(() {
                                  return Visibility(
                                    visible: !ctrl.isChange.value,
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        //底部空缺图
                                        SizedBox(
                                          height: 52.w,
                                          child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  width: 36.w,
                                                  height: 52.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.w),
                                                      color: AppColors.cF2F2F2),
                                                  child: Image.asset(
                                                    Assets
                                                        .managerUiManagerTacticsIconEmpty,
                                                    color: AppColors.ccccccc,
                                                    width: 18.w,
                                                    height: 18.w,
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) => 7.hGap,
                                              itemCount: 5),
                                        ),
                                        //战术卡牌
                                        SizedBox(
                                          height: 72.w,
                                          child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return TacticItem(
                                                  buff: ctrl.tacticList[index],
                                                  widthAnimition: false,
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) => 7.hGap,
                                              itemCount:
                                                  ctrl.tacticList.length > 5
                                                      ? 5
                                                      : ctrl.tacticList.length),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              // 4.vGap,
                              Container(
                                height: 8.w,
                                margin: EdgeInsets.only(top: 2.w),
                                alignment: Alignment.topLeft,
                                child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          width: 36.w,
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "x${ctrl.tacticList[index].takeEffectGameCount}",
                                            style: 10.w4(height: 0.75),
                                          ));
                                    },
                                    separatorBuilder: (context, index) =>
                                        7.hGap,
                                    itemCount: ctrl.tacticList.length),
                              ),
                              7.5.vGap
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          }),
    );
  }
}

///相同战术卡牌叠加
class TacticItem extends GetView<TrainingController> {
  const TacticItem({super.key, required this.buff, this.widthAnimition = true});
  final TrainingInfoBuff buff;
  final bool widthAnimition;

  @override
  Widget build(BuildContext context) {
    var card = Obx(() {
      int count = buff.takeEffectGameCount > 3 ? 3 : buff.takeEffectGameCount;
      return Container(
        height: 62.w,
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            SizedBox(
              width: 36.w,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  for (var i = 0; i < count; i++)
                    Positioned(
                        bottom: 2.w * i + 2,
                        child: SmallTacticCard(
                          num: buff.face,
                          color: buff.color,
                        ))
                ],
              ),
            ),
            if (controller.isChange.value)
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(7.w),
                    ),
                    child: IconWidget(
                        rotateAngle: 90,
                        iconWidth: 8.w,
                        icon: Assets.commonUiCommonIconSystemExchange),
                  )),
          ],
        ),
      );
    });
    if (!widthAnimition) {
      return card;
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
          animation: controller.shakeAnimation,
          builder: (context, child) {
            return RotationTransition(
              alignment: Alignment.center,
              turns: controller.shakeAnimation,
              child: AnimatedSlide(
                duration: 100.milliseconds,
                offset: Offset(controller.shakeAnimation.value * 1,
                    controller.shakeAnimation.value * 1),
                child: card,
              ),
            );
          }),
    );
  }
}
