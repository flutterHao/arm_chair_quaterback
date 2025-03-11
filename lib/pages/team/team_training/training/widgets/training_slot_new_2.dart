import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingSlotNew extends GetView<TrainingController> {
  const TrainingSlotNew({super.key});

  // BorderRadius? _borderRadius(int index) {
  //   return index == 0
  //       ? BorderRadius.horizontal(left: Radius.circular(6.w))
  //       : index == 5
  //           ? BorderRadius.horizontal(right: Radius.circular(6.w))
  //           : null;
  // }

  // LinearGradient _linearGradient() {
  //   return const LinearGradient(
  //     begin: Alignment.topCenter,
  //     end: Alignment.bottomCenter,
  //     colors: [
  //       AppColors.cBFBEBE,
  //       AppColors.cD9D9D9,
  //       AppColors.cFFFFFF,
  //       AppColors.cD9D9D9,
  //       AppColors.cBFBEBE,
  //     ],
  //     stops: [0.0, 0.15, 0.5, 0.85, 1.0],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (_) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              // 阻止事件传递给子组件
              return true;
            },
            child: Container(
              width: 315.w,
              height: 70.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 5.w),
              decoration: BoxDecoration(
                  color: AppColors.c000000,
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.circular(2.w)),
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
                                  width: 48.w,
                                  height: 60.w,
                                  margin: EdgeInsets.only(
                                      right: index < 5 ? 3.w : 0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      // gradient: _linearGradient(),
                                      color: AppColors.cFFFFFF),
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
                                                  width: 48.w,
                                                  height: 60.w,
                                                  child: IconWidget(
                                                    iconWidth: 30.w *
                                                        controller
                                                            .scaleAnimations[
                                                                index]
                                                            .value,
                                                    icon: Utils.getSlotIconUrl(
                                                        controller.propList[
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
                                        var show =
                                            controller.isShowColor[index].value;
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
                                                      width: 54.5.w,
                                                      height: 68.w,
                                                      decoration: BoxDecoration(
                                                        color: _getSlotColor(
                                                                controller
                                                                    .awardLength)
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9.w),
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
                                            width: 48.w + 3.w,
                                            height: 60.w + 3.w,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2.w,
                                                  color: _getSlotColor(
                                                      controller.awardLength)),
                                            ),
                                          ),
                                        );
                                      }),
                                      Obx(() {
                                        return Visibility(
                                          visible:
                                              !controller.slotCard[index].value,
                                          child: Container(
                                            width: 48.w,
                                            height: 60.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: IconWidget(
                                              iconWidth: 16.w,
                                              icon: Assets
                                                  .managerUiManagerTrainingUnknown,
                                              iconColor:
                                                  Colors.black.withOpacity(0.2),
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
