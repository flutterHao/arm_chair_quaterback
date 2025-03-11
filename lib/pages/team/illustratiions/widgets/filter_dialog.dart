/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-14 14:33:48
 * @LastEditTime: 2025-01-17 10:38:50
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FilterDialog extends GetView<IllustratiionsController> {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
      child: SimpleBottomDialog(
        height: 575.w,
        onComfirm: () {
          controller.update(["list"]);
          Get.back();
        },
        onCencel: () {
          controller.reset();
          // controller.update(["list"]);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                18.vGap,
                Text(
                  LangKey.gameTabPlayerOvr.tr,
                  style: 19.w4(
                    fontFamily: FontFamily.fOswaldMedium,
                    height: 0.85,
                  ),
                ),
                13.vGap,

                ///进度条
                Obx(() {
                  return Container(
                    width: double.infinity,
                    height: 92.5.w,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.w),
                        border: Border.all(color: AppColors.cD9D9D9)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OVR:${controller.rangeValues.value.start.round()}-${controller.rangeValues.value.end.round()}",
                          style: 16.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 0.8),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 7.w,
                            // thumbColor: AppColors.cFFFFFF,
                            // overlayColor: AppColors.c002B5C,
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 10.w), // 设置滑块大小
                            overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 16.w), // 设置覆盖层大小
                          ),
                          child: RangeSlider(
                            values: controller.rangeValues.value,
                            min: 1,
                            max: 100,
                            activeColor: AppColors.c000000,
                            inactiveColor: AppColors.cD9D9D9,
                            onChanged: (RangeValues values) {
                              controller.rangeValues.value = values;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < 5; i++)
                                Text(
                                  i == 0 ? "1" : "${25 * i}",
                                  style: 14.w4(
                                      fontFamily: FontFamily.fOswaldRegular,
                                      height: 0.8),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const _Position(),
                const _Grade(),
                const _Teams()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Position extends GetView<IllustratiionsController> {
  const _Position({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.vGap,
        Text(
          LangKey.gameTabPosition.tr,
          style: 19.w4(
            fontFamily: FontFamily.fOswaldMedium,
            height: 0.85,
          ),
        ),
        15.vGap,
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 112.5 / 33.5,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 10.w,
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return MtInkWell(
                  minScale: 0.9,
                  onTap: () {
                    controller.onTapChange(controller.posiStatuList, index);
                  },
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 33.5.w,
                    width: 112.5.w,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          top: 3.5.w,
                          right: 3.5.w,
                          child: Container(
                            width: 109.w,
                            height: 30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(
                                  color: controller.posiStatuList[index].value
                                      ? AppColors.c000000
                                      : AppColors.cD9D9D9),
                            ),
                            child: Text(
                              controller.positions[index],
                              style: 14.w4(
                                  fontFamily: FontFamily.fOswaldRegular,
                                  height: 1),
                            ),
                          ),
                        ),
                        if (controller.posiStatuList[index].value)
                          Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.w),
                                  color: AppColors.c10A86A,
                                ),
                                child: IconWidget(
                                  iconWidth: 9.w,
                                  icon: Assets.commonUiCommonStatusBarMission02,
                                  iconColor: AppColors.cFFFFFF,
                                ),
                              ))
                      ],
                    ),
                  ),
                );
              });
            },
            itemCount: controller.positions.length,
          ),
        ),
      ],
    );
  }
}

class _Grade extends GetView<IllustratiionsController> {
  const _Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.vGap,
        Text(
          LangKey.gameNameGrade.tr,
          style: 19.w4(
            fontFamily: FontFamily.fOswaldMedium,
            height: 0.85,
          ),
        ),
        16.vGap,
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 82.5 / 33.5,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 10.w,
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return MtInkWell(
                  minScale: 0.9,
                  onTap: () {
                    controller.onTapChange(controller.gradesStatuList, index);
                  },
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 33.5.w,
                    width: 82.5.w,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          top: 3.5.w,
                          right: 3.5.w,
                          child: Container(
                            // width: 109.w,
                            height: 30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(
                                  color: controller.gradesStatuList[index].value
                                      ? AppColors.c000000
                                      : AppColors.cD9D9D9),
                            ),
                            child: Text(
                              controller.grades[index],
                              style: 14.w4(
                                  fontFamily: FontFamily.fOswaldRegular,
                                  height: 1),
                            ),
                          ),
                        ),
                        if (controller.gradesStatuList[index].value)
                          Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.w),
                                  color: AppColors.c10A86A,
                                ),
                                child: IconWidget(
                                  iconWidth: 9.w,
                                  icon: Assets.commonUiCommonStatusBarMission02,
                                  iconColor: AppColors.cFFFFFF,
                                ),
                              ))
                      ],
                    ),
                  ),
                );
              });
            },
            itemCount: controller.grades.length,
          ),
        ),
        15.vGap,
      ],
    );
  }
}

class _Teams extends GetView<IllustratiionsController> {
  const _Teams({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.vGap,
        Text(
          LangKey.gameTabNbaTeam.tr,
          style: 19.w4(
            fontFamily: FontFamily.fOswaldMedium,
            height: 0.85,
          ),
        ),
        16.vGap,
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 170.5 / 39.5,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 10.w,
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return MtInkWell(
                  minScale: 0.9,
                  onTap: () {
                    controller.onTapChange(controller.teamStatuList, index);
                  },
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 39.5.w,
                    width: 170.5.w,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          top: 3.5.w,
                          right: 3.5.w,
                          child: Container(
                            // width: 109.w,
                            height: 30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(
                                  color: controller.teamStatuList[index].value
                                      ? AppColors.c000000
                                      : AppColors.cD9D9D9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.teams[index] != 0)
                                  ImageWidget(
                                    url: Utils.getTeamUrl(
                                        controller.teams[index]),
                                    width: 32.w,
                                    height: 32.w,
                                  ),
                                Text(
                                  controller.teams[index] != 0
                                      ? Utils.getTeamInfo(
                                              controller.teams[index])
                                          .shortEname
                                      : "ALL",
                                  style: 14.w4(
                                      fontFamily: FontFamily.fOswaldRegular,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (controller.teamStatuList[index].value)
                          Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.w),
                                  color: AppColors.c10A86A,
                                ),
                                child: IconWidget(
                                  iconWidth: 9.w,
                                  icon: Assets.commonUiCommonStatusBarMission02,
                                  iconColor: AppColors.cFFFFFF,
                                ),
                              ))
                      ],
                    ),
                  ),
                );
              });
            },
            itemCount: controller.teams.length,
          ),
        ),
        15.vGap,
      ],
    );
  }
}

String _getPosition(int position) {
  switch (position) {
    case 1:
      return "C";
    case 2:
      return "PF";
    case 3:
      return "SF";
    case 4:
      return "SG";
    case 5:
      return "PG";
    case 0:
      return "ALL";
    default:
      return "";
  }
}
