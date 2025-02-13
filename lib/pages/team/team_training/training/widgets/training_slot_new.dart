import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingSlotNew extends GetView<TrainingController> {
  const TrainingSlotNew({super.key});

  BorderRadius? _borderRadius(int index) {
    return index == 0
        ? BorderRadius.horizontal(left: Radius.circular(6.w))
        : index == 5
            ? BorderRadius.horizontal(right: Radius.circular(6.w))
            : null;
  }

  LinearGradient _linearGradient() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.cBFBEBE,
          AppColors.cD9D9D9,
          AppColors.cFFFFFF,
          AppColors.cFFFFFF,
          AppColors.cFFFFFF,
          AppColors.cD9D9D9,
          AppColors.cBFBEBE,
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                width: 356.w,
                height: 37.5.w,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 136.5.w,
                          height: 37.5.w,
                          padding: EdgeInsets.only(
                              left: 10.5.w, right: 10.5.w, top: 5.w),
                          decoration: BoxDecoration(
                              border: Border.all(width: 0),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12.w)),
                              color: AppColors.c000000),
                          child: Row(
                            children: [
                              Container(
                                width: 32.w,
                                height: 32.w,
                                decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(16.w)),
                                child: Center(
                                  child: UserAvaterWidget(
                                    url: Utils.getAvatarUrl(1),
                                    radius: 14.5.w,
                                    width: 29.w,
                                    height: 29.w,
                                  ),
                                ),
                              ),
                              8.5.hGap,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "user name user ...",
                                    style: 10.w4(
                                      fontFamily: FontFamily.fOswaldRegular,
                                      color: AppColors.cFFFFFF,
                                      height: 0.8,
                                    ),
                                  ),
                                  2.5.vGap,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconWidget(
                                        iconWidth: 23.5.w,
                                        icon: Assets.commonUiCommonProp05,
                                      ),
                                      2.5.hGap,
                                      Text(
                                        "150K",
                                        style: 14.w4(
                                          fontFamily: FontFamily.fOswaldBold,
                                          color: AppColors.cFFFFFF,
                                          height: 0.8,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 219.5.w,
                              height: 26.w,
                              decoration: BoxDecoration(
                                color: AppColors.c000000,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12.w),
                                ),
                                border: Border.all(width: 0),
                              ),
                            ),
                            Container(
                              width: 219.5.w,
                              height: 26.w,
                              decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12.w),
                                  bottomLeft: Radius.circular(12.w),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AwardDialog();
                                      });
                                },
                                child: Container(
                                  // color: Colors.red,
                                  padding: EdgeInsets.only(left: 12.w),
                                  alignment: Alignment.topCenter,
                                  width: double.infinity,
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Positioned(
                                          top: 9.5.w,
                                          left: 11.5.w,
                                          right: 44.w,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 150.w,
                                                height: 9.w,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                alignment: Alignment.centerLeft,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.cTransparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.w),
                                                    border: Border.all(
                                                        width: 1.w,
                                                        color:
                                                            AppColors.c666666)),
                                              ),
                                              Obx(() {
                                                return Positioned(
                                                  left: 0,
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    width: 150.w *
                                                        controller
                                                            .taskValue.value /
                                                        controller
                                                            .currentTaskNeed,
                                                    height: 9.w,
                                                    constraints: BoxConstraints(
                                                        maxWidth: 290.w),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    4.5.w),
                                                        gradient:
                                                            const LinearGradient(
                                                                colors: [
                                                              AppColors.c3296F2,
                                                              AppColors.c3BE1FF
                                                            ])),
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 0.w,
                                          left: 0.w,
                                          child: IconWidget(
                                            iconWidth: 19.5.w,
                                            icon: Assets.commonUiCommonProp03,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: 9.w,
                      right: 12.w,
                      child: MtInkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AwardDialog();
                              });
                        },
                        child: Column(
                          children: [
                            Obx(() {
                              return AnimatedScale(
                                duration: const Duration(milliseconds: 300),
                                scale: controller.showProp.value ? 1.5 : 1,
                                child: Image.asset(
                                  // Assets.commonUiCommonProp05,
                                  Utils.getPropIconUrl(
                                      controller.getTaskAward().propId),
                                  width: 23.5.w,
                                ),
                              );
                            }),
                            Text(
                              Utils.formatMoney(
                                  controller.getTaskAward().propNum),
                              style: 10.w4(
                                  fontFamily: FontFamily.fOswaldMedium,
                                  color: AppColors.cFFFFFF,
                                  height: 0.8),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // slot
              Container(
                width: 356.w,
                height: 82.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: AppColors.c000000,
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12.w),
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: AnimatedBuilder(
                              animation: controller.slotsAnimlList[index],
                              builder: (context, child) {
                                int length = controller.propList.length;
                                return Container(
                                    width: 54.5.w,
                                    height: 68.w,
                                    margin: EdgeInsets.only(
                                        right: index < 5 ? 3.w : 0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: _linearGradient(),
                                      borderRadius: _borderRadius(index),
                                    ),
                                    child: Stack(
                                      children: [
                                        SizeTransition(
                                          sizeFactor:
                                              controller.sizeAnimations[index],
                                          child: ListView.builder(
                                            reverse: true,
                                            // itemExtent: 68.w,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: const EdgeInsets.all(0),
                                            controller: controller
                                                .scrollerCtrlList[index],
                                            itemCount: length * 10,
                                            itemBuilder: (context, itemIndex) {
                                              return Obx(() {
                                                var show = controller
                                                    .isAwards[index].value;

                                                return AnimatedScale(
                                                  curve: Curves.linear,
                                                  duration: Duration(
                                                      milliseconds:
                                                          show ? 150 : 300),
                                                  scale: show ? 1.8 : 1,
                                                  child: SizedBox(
                                                    width: 54.5.w,
                                                    height: 68.w,
                                                    child: IconWidget(
                                                      iconWidth: 30.w *
                                                          controller
                                                              .scaleAnimations[
                                                                  index]
                                                              .value,
                                                      icon:
                                                          Utils.getSlotIconUrl(
                                                              controller
                                                                      .propList[
                                                                  itemIndex %
                                                                      length]),
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                        ),
                                        Obx(() {
                                          var show = controller
                                              .isShowColor[index].value;
                                          return Visibility(
                                            visible: show,
                                            child: AnimatedBuilder(
                                                animation:
                                                    controller.colorAnimation,
                                                builder: (context, child) {
                                                  return Transform.scale(
                                                    scale: controller
                                                            .colorAnimation
                                                            .value +
                                                        1,
                                                    child: Opacity(
                                                      opacity: 1 -
                                                          controller
                                                              .colorAnimation
                                                              .value,
                                                      child: Container(
                                                        width: 50.w,
                                                        height: 68.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              _linearGradient(),
                                                          color: _getSlotColor(
                                                                  controller
                                                                      .awardLength)
                                                              .withOpacity(0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9.w),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          );
                                        }),
                                        Obx(() {
                                          return Visibility(
                                            visible: controller
                                                .showBoxList[index].value,
                                            child: Container(
                                              width: 50.w + 3.w,
                                              height: 68.w + 3.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2.w,
                                                    color: _getSlotColor(
                                                        controller
                                                            .awardLength)),
                                                borderRadius:
                                                    _borderRadius(index),
                                              ),
                                            ),
                                          );
                                        }),
                                        Obx(() {
                                          return Visibility(
                                            visible: !controller
                                                .slotCard[index].value,
                                            child: Container(
                                              width: 50.w,
                                              height: 68.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    _borderRadius(index),
                                              ),
                                              child: IconWidget(
                                                iconWidth: 16.w,
                                                icon: Assets
                                                    .managerUiManagerTrainingUnknown,
                                                iconColor: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          );
                                        })
                                      ],
                                    ));
                              })),
                    );
                  }),
                ),
              ),
            ],
          );
        });
  }
}

Color _getSlotColor(int length) {
  switch (length) {
    case 3:
      return AppColors.c8cc142;
    case 4:
      return AppColors.c36a7e2;
    case 5:
      return AppColors.c9465D4;
    case 6:
      return AppColors.cF48F19;
    default:
      return Colors.transparent;
  }
}
