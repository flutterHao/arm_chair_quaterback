import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/battle_box_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/*
 * @Description: 换人+宝箱
 * @Author: lihonghao
 * @Date: 2024-11-11 14:05:07
 * @LastEditTime: 2024-11-11 17:27:46
 */
class BeautyAndBoxView extends StatelessWidget {
  const BeautyAndBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    // final beautyCtrl = Get.find<BeautyController>();
    return GetBuilder<TeamIndexController>(
        id: "battleBox",
        builder: (ctrl) {
          return SizedBox(
            width: double.infinity,
            height: 608.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: -15.w,
                  left: 0,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(1),
                          Colors.white.withOpacity(0.2),
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "ARMCHAIR",
                      style: 121.w7(
                          color: AppColors.c262626,
                          height: 0.95,
                          fontFamily: FontFamily.fOswaldBold),
                    ),
                  ),
                ),
                Positioned(
                  top: 32.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: AppColors.cF2F2F2,
                    height: 30.w,
                    alignment: Alignment.center,
                    child: Text(
                      "QUARTERBACK",
                      style: TextStyle(
                          fontSize: 21.sp,
                          letterSpacing: 18,
                          fontFamily: FontFamily.fOswaldBold),
                    ),
                  ),
                ),
                Positioned(
                  top: 21.w,
                  left: 0,
                  right: 0,
                  child: Obx(() {
                    final beautyCtrl = Get.find<BeautyController>();
                    return InkWell(
                      onTap: () => Get.toNamed(RouteNames.teamBeautyPage,
                          id: GlobalNestedKey.TEAM),
                      child: Image.asset(
                          beautyCtrl.beautyList[beautyCtrl.beautyIndex.value],
                          fit: BoxFit.fitHeight,
                          height: 546.w,
                          alignment: Alignment.topCenter),
                    );
                  }),
                ),
                Positioned(
                  right: 16.w,
                  top: 116.w,
                  child: MtInkwell(
                    onTap: () => Get.toNamed(RouteNames.teamBeautyPage,
                        id: GlobalNestedKey.TEAM),
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: AppColors.c000000,
                        borderRadius: BorderRadius.circular(9.w),
                      ),
                      child: IconWidget(
                        iconWidth: 18.w,
                        icon: Assets.iconUiIconSwitch02,
                        iconColor: AppColors.cFFFFFF,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // height: 219.w,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ///战斗进度
                            Expanded(
                                flex: 204,
                                child: Container(
                                  height: 51.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13.w, vertical: 10.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Battle Pass",
                                            style: 14.w4(
                                                color: AppColors.cFFFFFF,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                                height: 0.75),
                                          )),
                                          IconWidget(
                                            iconWidth: 14.w,
                                            icon: Assets.iconUiIconRead,
                                            iconColor: AppColors.cFFFFFF,
                                          )
                                        ],
                                      ),
                                      const Expanded(child: SizedBox.shrink()),
                                      CustomLinearProgressBar(
                                        progress: 0.3,
                                        height: 8.w,
                                        width: double.infinity,
                                        backgroundColor: AppColors.c4D4D4D,
                                        progressColor: AppColors.cFFFFFF,
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(width: 9.w),

                            ///免费宝箱
                            Expanded(
                              flex: 134,
                              child: MtInkwell(
                                onTap: () async {
                                  if (ctrl.recieved) return;
                                  ctrl.openFreeGift();
                                },
                                child: SizedBox(
                                  height: 55.w,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        bottom: 0,
                                        top: 3.5.w,
                                        right: 3.5.w,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 13.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9.w),
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: AppColors.c666666)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Free Gift",
                                                style: 14.w4(
                                                    color: AppColors.c262626,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                    height: 0.75),
                                              ),
                                              10.vGap,
                                              !ctrl.recieved
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          "Click to get",
                                                          style: 10.w4(
                                                              color: AppColors
                                                                  .cFF7954,
                                                              height: 0.75),
                                                        ),
                                                        4.hGap,
                                                        IconWidget(
                                                          iconWidth: 5.w,
                                                          icon: Assets
                                                              .iconUiIconShrink,
                                                          iconColor:
                                                              AppColors.cFF7954,
                                                          rotateAngle: 90,
                                                        )
                                                      ],
                                                    )
                                                  : Obx(() {
                                                      return Text(
                                                        ctrl
                                                            .cardPackInfo
                                                            .freeTimeString
                                                            .value,
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .cFF7954,
                                                            height: 0.75),
                                                      );
                                                    }),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: SizedBox(
                                          width: 55.w,
                                          height: 45.w,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Image.asset(
                                                    ctrl.recieved
                                                        ? Assets.teamUiTeamBox04
                                                        : Assets
                                                            .teamUiTeamBox03,
                                                    width: 30.h,
                                                    fit: BoxFit.fill,
                                                  )),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Image.asset(
                                                  ctrl.cardPackInfo
                                                                  .freeGiftCount >=
                                                              1 ||
                                                          ctrl.recieved
                                                      ? Assets.teamUiTeamBox02
                                                      : Assets.teamUiTeamBox01,
                                                  width: 42.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        //战斗宝箱
                        const BattleBoxWidget(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
