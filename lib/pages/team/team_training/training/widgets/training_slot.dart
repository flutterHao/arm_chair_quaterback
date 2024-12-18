import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingSlot extends GetView<TrainingController> {
  const TrainingSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (_) {
          return Container(
            width: 375.w,
            height: 80.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                            double v = controller.sizeAnimations[index].value;
                            int length = controller.propList.length;
                            return Container(
                                width: 50.w * (2 - v),
                                height: 68.w * v,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9.w),
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
                                        controller:
                                            controller.scrollerCtrlList[index],
                                        itemCount: length * 10,
                                        itemBuilder: (context, itemIndex) {
                                          return Obx(() {
                                            var show = controller
                                                .isAwards[index].value;

                                            return AnimatedScale(
                                              curve: show
                                                  ? Curves.linear
                                                  : Curves.linear,
                                              duration: Duration(
                                                  milliseconds:
                                                      show ? 150 : 300),
                                              scale: show ? 1.8 : 1,
                                              child: SizedBox(
                                                width: 50.w,
                                                height: 68.w,
                                                child: IconWidget(
                                                  iconWidth: 30.w *
                                                      controller
                                                          .scaleAnimations[
                                                              index]
                                                          .value,
                                                  icon: Utils.getSlotIconUrl(
                                                      controller.propList[
                                                          itemIndex % length]),
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
                                                        .colorAnimation.value +
                                                    1,
                                                child: Opacity(
                                                  opacity: 1 -
                                                      controller
                                                          .colorAnimation.value,
                                                  child: Container(
                                                    width: 50.w,
                                                    height: 68.w,
                                                    decoration: BoxDecoration(
                                                      color: _getSlotColor(
                                                              controller
                                                                  .awardLength)
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                        visible:
                                            controller.showBoxList[index].value,
                                        child: Container(
                                          width: 50.w + 3.w,
                                          height: 68.w + 3.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2.w,
                                                color: _getSlotColor(
                                                    controller.awardLength)),
                                            borderRadius:
                                                BorderRadius.circular(9.w),
                                          ),
                                        ),
                                      );
                                    }),
                                    Obx(() {
                                      return Visibility(
                                        visible:
                                            !controller.slotCard[index].value,
                                        child: Container(
                                          width: 50.w,
                                          height: 68.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(9.w),
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
