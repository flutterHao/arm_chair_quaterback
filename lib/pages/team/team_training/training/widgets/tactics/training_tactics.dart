import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/buble_box.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/card_rule_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_utils.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingTactics extends StatelessWidget {
  const TrainingTactics({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();

    void onItemTap(BuildContext context, int index) {
      TrainingController ctrl = Get.find();
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);

      final OverlayState overlayState = Overlay.of(context);
      ctrl.getBuffValue(ctrl.tacticList[index]);
      final OverlayEntry overlayEntry = OverlayEntry(
        builder: (BuildContext context) {
          return Positioned(
            top: position.dy,
            right: (4 - index) * 42.w,
            child: BubbleBox(
              arrowOffset: 25.w,
              color: AppColors.c000000,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 9.w),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    getCardTacticNmae(ctrl.tacticList[index].color),
                    style: 16.w4(
                        fontFamily: FontFamily.fOswaldMedium,
                        color: AppColors.cFFFFFF,
                        height: 1),
                  ),
                  7.hGap,
                  Text(
                    "+${(ctrl.tacticList[index].buffValue * 100).toInt()}%",
                    style: 16.w4(color: AppColors.cFFFFFF, height: 1),
                  ),
                ]),
              ),
            ),
          );
        },
      );
      overlayState.insert(overlayEntry);
      Future.delayed(const Duration(seconds: 1), () {
        overlayEntry.remove();
      });
    }

    return Material(
      child: GetBuilder<TrainingController>(
          id: "training_page",
          builder: (ctrl) {
            final myTeamCtrl = Get.find<TeamController>();
            return Container(
                key: key,
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
                        child: TacticList(
                      onItemTap: (context, index) => onItemTap(context, index),
                    ))
                  ],
                ));
          }),
    );
  }
}

class TacticList extends StatelessWidget {
  const TacticList({super.key, required this.onItemTap});
  final Function onItemTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (ctrl) {
          return GestureDetector(
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
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14.w),
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
                                                  BorderRadius.circular(6.w),
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
                                      separatorBuilder: (context, index) =>
                                          7.hGap,
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
                                        return Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            AnimatedBuilder(
                                              animation:
                                                  ctrl.tacticScaleAnimated,
                                              builder: (context, child) {
                                                return Transform.scale(
                                                  scale: 1,
                                                  child: MtInkwell(
                                                    onTap: () {
                                                      onItemTap(context, index);
                                                    },
                                                    child: TacticItem(
                                                      buff: ctrl
                                                          .tacticList[index],
                                                      widthAnimition: false,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),

                                            ///颜色动画
                                            // AnimatedBuilder(
                                            //     animation: ctrl
                                            //         .tacticExpAnimated,
                                            //     builder: (context,
                                            //         child) {
                                            //       return Transform
                                            //           .scale(
                                            //         scale: 2 -
                                            //             ctrl.tacticExpAnimated
                                            //                 .value,
                                            //         child: Opacity(
                                            //           opacity: ctrl
                                            //               .tacticExpAnimated
                                            //               .value,
                                            //           child:
                                            //               Visibility(
                                            //             visible: TacticUtils
                                            //                     .matchedIndices
                                            //                     .contains(
                                            //                         index) &&
                                            //                 ctrl.showTacticColor
                                            //                     .value,
                                            //             child:
                                            //                 Container(
                                            //               width:
                                            //                   36.w,
                                            //               height:
                                            //                   62.w,
                                            //               decoration: BoxDecoration(
                                            //                   color: AppColors.cFF7954.withOpacity(
                                            //                       0.5),
                                            //                   borderRadius:
                                            //                       BorderRadius.circular(6.w)),
                                            //             ),
                                            //             // child:
                                            //             //     Container(
                                            //             //   width:
                                            //             //       36.w,
                                            //             //   height:
                                            //             //       62.w,
                                            //             //   decoration:
                                            //             //       BoxDecoration(
                                            //             //     border:
                                            //             //         Border.all(
                                            //             //       width:
                                            //             //           2.w,
                                            //             //       color: AppColors
                                            //             //           .cFF7954
                                            //             //           .withOpacity(0.6),
                                            //             //     ),
                                            //             //     borderRadius:
                                            //             //         BorderRadius.circular(6.w),
                                            //             //   ),
                                            //             // ),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     }),

                                            AnimatedBuilder(
                                                animation: ctrl.tacticAnimCtrl,
                                                builder: (context, child) {
                                                  double opacity = 0.5 +
                                                              ctrl.tacticExpAnimated
                                                                  .value >
                                                          1
                                                      ? 1
                                                      : (0.4 +
                                                          ctrl.tacticExpAnimated
                                                              .value);
                                                  return Transform.scale(
                                                    scale: (1.3 -
                                                                ctrl.tacticExpAnimated
                                                                    .value) <
                                                            1
                                                        ? 1
                                                        : 1.3 -
                                                            ctrl.tacticExpAnimated
                                                                .value,
                                                    child: Opacity(
                                                      opacity: opacity,
                                                      child: Visibility(
                                                        visible: TacticUtils
                                                                .matchedIndices
                                                                .contains(
                                                                    index) &&
                                                            ctrl.showTacticColor
                                                                .value,
                                                        // child:
                                                        //     Container(
                                                        //   width:
                                                        //       36.w,
                                                        //   height:
                                                        //       62.w,
                                                        //   decoration: BoxDecoration(
                                                        //       color: AppColors.cFF7954.withOpacity(
                                                        //           0.5),
                                                        //       borderRadius:
                                                        //           BorderRadius.circular(6.w)),
                                                        // ),
                                                        child: Container(
                                                          width: 36.w,
                                                          height: 62.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              width: 2.w,
                                                              color: AppColors
                                                                  .cFF7954
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.w),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),

                                            // AnimatedBuilder(
                                            //     animation: ctrl
                                            //         .tacticExpAnimated,
                                            //     builder: (context,
                                            //         child) {
                                            //       return Visibility(
                                            //         visible: TacticUtils
                                            //                 .matchedIndices
                                            //                 .contains(
                                            //                     index) &&
                                            //             ctrl.showTacticColor
                                            //                 .value,
                                            //         child:
                                            //             Container(
                                            //           width: 36.w,
                                            //           height: 62.w,
                                            //           decoration:
                                            //               BoxDecoration(
                                            //             border:
                                            //                 Border
                                            //                     .all(
                                            //               width:
                                            //                   2.w,
                                            //               color: AppColors
                                            //                   .cFF7954,
                                            //             ),
                                            //             borderRadius:
                                            //                 BorderRadius.circular(
                                            //                     6.w),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     })
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          7.hGap,
                                      itemCount: ctrl.tacticList.length > 5
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
                            separatorBuilder: (context, index) => 7.hGap,
                            itemCount: ctrl.tacticList.length),
                      ),
                      7.5.vGap
                    ],
                  ),
                ),
                AnimatedBuilder(
                    animation: ctrl.tacticPosAnimated,
                    builder: (context, child) {
                      return Visibility(
                        visible: ObjectUtil.isNotEmpty(ctrl.tacticType),
                        child: Positioned(
                            top: ctrl.tacticPosAnimated.value.dy.w,
                            child: Opacity(
                              opacity: ctrl.widthAniamtion.value,
                              child: Transform.scale(
                                scaleX: ctrl.widthAniamtion.value,
                                child: Container(
                                  height: 15.w,
                                  constraints: BoxConstraints(maxWidth: 100.w),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFF7954,
                                      borderRadius: BorderRadius.circular(4.w)),
                                  child: Text(
                                    ctrl.tacticType,
                                    style: 12.w4(height: 1),
                                  ),
                                ),
                              ),
                            )),
                      );
                    }),
              ],
            ),
          );
        });
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
