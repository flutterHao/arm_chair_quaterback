import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MineSettingPage extends GetView<MineSettingController> {
  const MineSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineSettingController>(
      builder: (_) {
        return HorizontalDragBackWidget(
            child: BlackAppWidget(
          const AppBarWidget(
            title: "SETTING",
            right: SizedBox.shrink(),
          ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                24.vGap,
                _buildCBox(InkWell(
                  onTap: () => _showDialog(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconWidget(
                            iconWidth: 20.w,
                            icon: Assets.iconUiIconLanguage,
                            iconColor: AppColors.c262626,
                          ),
                          9.hGap,
                          Text(
                            "Language",
                            style: 14.w4(color: AppColors.c262626, height: 1),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "UK",
                            style: 16.w4(color: AppColors.c666666, height: 1),
                          ),
                          18.hGap,
                          IconWidget(
                            iconWidth: 9.w,
                            icon: Assets.playerUiIconArrows01,
                            iconColor: AppColors.c666666,
                          )
                        ],
                      )
                    ],
                  ),
                )),
                9.vGap,
                _buildCBox(_buildItem(Assets.iconUiIconMuisic, "Music",
                    controller.musicSwitchStatus)),
                9.vGap,
                _buildCBox(_buildItem(Assets.iconUiIconSound, "Sound effect",
                    controller.soundSwitchStatus)),
                9.vGap,
                _buildCBox(_buildItem(Assets.iconUiIconBell,
                    "Systematic notification", controller.notifySwitchStatus)),
                9.vGap,
              ],
            ),
          ),
        ));
      },
    );
  }

  void _showDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return Container(
            height: 666.h,
            child: DialogBackground(
                frontColor: AppColors.cE6E6E6,
                child: Column(
                  children: [
                    12.vGap,
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.cB3B3B3,
                          borderRadius: BorderRadius.circular(2.w)),
                      height: 4.w,
                      width: 64.w,
                    ),
                    24.vGap,
                    Row(
                      children: [
                        35.hGap,
                        Text(
                          "language",
                          style: 16.w7(color: AppColors.c262626, height: 1),
                        ),
                      ],
                    ),
                    7.vGap,
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16.w)),
                          color: AppColors.cF2F2F2),
                      child: SingleChildScrollView(
                        child: Column(
                            children: List.generate(
                          controller.languages.length,
                          (index) {
                            var language = controller.languages[index];
                            return InkWell(
                              onTap: () => controller.setLanguage(index),
                              child: Container(
                                height: 56.w,
                                padding:
                                    EdgeInsets.only(left: 35.w, right: 26.w),
                                color: index % 2 != 0
                                    ? AppColors.cEDEDED
                                    : AppColors.cTransparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${language.eName} (${language.shortEName})",
                                          style: 14.w4(
                                              color: AppColors.c262626,
                                              height: 1),
                                        ),
                                        3.vGap,
                                        Text(
                                          language.oName,
                                          style: 10.w4(
                                              color: AppColors.cB3B3B3,
                                              height: 1),
                                        )
                                      ],
                                    ),
                                    Obx(() {
                                      return Visibility(
                                        visible: controller
                                                .currentLanguageIndex.value ==
                                            index,
                                        child: IconWidget(
                                          iconWidth: 18.w,
                                          icon: Assets.iconUiIconRuidgt,
                                          iconColor: AppColors.c1BC27D,
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                      ),
                    ))
                  ],
                )),
          );
        });
  }

  Widget _buildItem(String icon, String text, Rx obs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconWidget(
              iconWidth: 20.w,
              icon: icon,
              iconColor: AppColors.c262626,
            ),
            9.hGap,
            Text(
              text,
              style: 14.w4(color: AppColors.c262626, height: 1),
            )
          ],
        ),
        InkWell(
          onTap: () {
            obs.value = !obs.value;
          },
          child: Obx(() {
            var value = obs.value;
            return AnimatedContainer(
              width: 50.w,
              height: 25.w,
              decoration: BoxDecoration(
                  color: value ? AppColors.cFF7954 : AppColors.cD9D9D9,
                  borderRadius: BorderRadius.circular(13.w)),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              duration: const Duration(milliseconds: 100),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    left: value ? 24.w : 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(10.w)),
                      width: 20.w,
                      height: 20.w,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCBox(Widget child) {
    return Container(
      height: 66.w,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.only(left: 25.w, right: 16.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(16.w)),
      child: child,
    );
  }
}
