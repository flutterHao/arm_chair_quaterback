import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/match_success_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/19/17:36

class MatchSuccessNew extends GetView<MatchSuccessNewController> {
  MatchSuccessNew({this.onEnd, super.key});

  final Function? onEnd;
  late TeamBattleController teamBattleController;

  @override
  Widget build(BuildContext context) {
    teamBattleController = Get.find();
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<MatchSuccessNewController>(
        init: MatchSuccessNewController(onEnd),
        builder: (logic) {
          var maxWidth = 87.w;
          return PopScope(
            canPop: false,
            child: Container(
              color: AppColors.c000000.withOpacity(.6),
              width: Utils.getMaxWidth(context),
              height: height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 300.h,
                      child: Container(
                        width: 356.w,
                        height: 237.h,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(12.w)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ///白色背景
                            Positioned(
                              top: 7.h,
                              child: Container(
                                width: 342.w,
                                height: 139.h,
                                decoration: BoxDecoration(
                                    color: AppColors.cF2F2F2,
                                    borderRadius: BorderRadius.circular(7.w)),
                              ),
                            ),

                            /// 蓝色背景
                            Positioned(
                                bottom: 7.h,
                                child: Container(
                                  width: 342.w,
                                  height: 68.h,
                                  child: PageView(
                                    controller: controller.pageController,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(Assets
                                                .managerUiManagerBattleTextbase),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7.w),
                                        ),
                                        child: SizedBox(
                                          height: 27.h,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "MATCH GAME",
                                              style: 32.w4(
                                                color: AppColors.cFFFFFF,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldRegular,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(Assets
                                                .managerUiManagerBattleTextbase02),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7.w),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "MATCH PRIZE",
                                              style: 16.w5(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                              ),
                                            ),
                                            7.vGap,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconWidget(
                                                    iconWidth: 25.w,
                                                    icon: Assets.teamUiMoney02),
                                                3.hGap,
                                                Obx(() {
                                                  return AnimatedNum(
                                                      number: controller
                                                          .moneyCount.value,
                                                      isMoney: true,
                                                      textStyle: 16.w5(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium,
                                                      ));
                                                })
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),

                            /// left avatar
                            Positioned(
                                top: 20.w,
                                left: 42.w,
                                width: maxWidth,
                                child: Center(
                                  child: Container(
                                    height: 38.h,
                                    width: 38.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19.h),
                                      border: Border.all(
                                        color: AppColors.c1F8FE5,
                                        width: 2.w,
                                      ),
                                    ),
                                    child: ImageWidget(
                                      url: Utils.getAvatarUrl(
                                          teamBattleController
                                              .battleEntity.homeTeam.teamLogo),
                                      imageFailedPath: Assets.teamUiHead01,
                                      borderRadius: BorderRadius.circular(19.h),
                                    ),
                                  ),
                                )),

                            ///left userName
                            Positioned(
                              top: 67.h,
                              left: 42.w,
                              width: maxWidth,
                              child: Center(
                                child: Text(
                                  teamBattleController
                                      .battleEntity.homeTeam.teamName,
                                  style: 12.w5(
                                    color: AppColors.c000000,
                                    overflow: TextOverflow.ellipsis,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                ),
                              ),
                            ),

                            /// left preparation
                            Positioned(
                                top: 84.h,
                                left: 42.w,
                                width: maxWidth - 10.w,
                                child: PreparationWidget(
                                    playerReadiness: teamBattleController
                                        .battleEntity
                                        .homeTeam
                                        .playerReadiness)),

                            ///left money
                            Obx(() {
                              var value = controller
                                  .moneyFlyAnimationController.value.value;
                              var offset = controller.mathFlyOffset(
                                  Offset(42.w, 111.h),
                                  Offset(128.w, 196.h),
                                  value);
                              return Positioned(
                                  top: offset.dy,
                                  left: offset.dx,
                                  width: maxWidth,
                                  child: Opacity(
                                    opacity: 1 - value,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconWidget(
                                            iconWidth: 25.w,
                                            icon: Assets.teamUiMoney02),
                                        3.hGap,
                                        Text(
                                          Utils.formatMoney(
                                              controller.getCostMoney()),
                                          style: 16.w5(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),

                            /// left power
                            Obx(() {
                              var value = controller
                                  .moneyFlyAnimationController.value.value;
                              return Positioned(
                                  top: 111.h,
                                  left: 36.w,
                                  child: Opacity(
                                    opacity: value,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: maxWidth,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "POWER ${teamBattleController.battleEntity.homeTeam.currTeamStrength}",
                                              style: 16.w5(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // 7.hGap,
                                        // Row(
                                        //   children: [
                                        //     IconWidget(
                                        //       iconWidth: 9.w,
                                        //       icon: Assets
                                        //           .commonUiCommonIconSystemArrow,
                                        //       rotateAngle: -90,
                                        //       iconColor: AppColors.c32B975,
                                        //     ),
                                        //     5.hGap,
                                        //     Text(
                                        //       "1500",
                                        //       style: 12.w4(
                                        //           color: AppColors.c32B975,
                                        //           height: 1,
                                        //           fontFamily: FontFamily
                                        //               .fOswaldRegular),
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ));
                            }),

                            /// right avatar
                            Positioned(
                                top: 20.w,
                                right: 42.w,
                                width: maxWidth,
                                child: Center(
                                  child: Container(
                                    height: 38.h,
                                    width: 38.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19.h),
                                      border: Border.all(
                                        color: AppColors.cD60D20,
                                        width: 2.w,
                                      ),
                                    ),
                                    child: ImageWidget(
                                      url: Utils.getAvatarUrl(
                                          teamBattleController
                                              .battleEntity.awayTeam.teamLogo),
                                      imageFailedPath: Assets.teamUiHead03,
                                      borderRadius: BorderRadius.circular(19.h),
                                    ),
                                  ),
                                )),

                            ///left userName
                            Positioned(
                              right: 42.w,
                              top: 67.h,
                              width: maxWidth,
                              child: Center(
                                child: Text(
                                  teamBattleController
                                      .battleEntity.awayTeam.teamName,
                                  style: 12.w5(
                                    color: AppColors.c000000,
                                    overflow: TextOverflow.ellipsis,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                ),
                              ),
                            ),

                            /// right preparation
                            Positioned(
                                top: 84.h,
                                right: 42.w,
                                width: maxWidth - 10.w,
                                child: PreparationWidget(
                                    playerReadiness: teamBattleController
                                        .battleEntity
                                        .awayTeam
                                        .playerReadiness)),

                            ///right money
                            Obx(() {
                              var value = controller
                                  .moneyFlyAnimationController.value.value;
                              var offset = controller.mathFlyOffset(
                                  Offset(42.w, 111.h),
                                  Offset(128.w, 196.h),
                                  value);
                              return Positioned(
                                  top: offset.dy,
                                  right: offset.dx,
                                  width: maxWidth,
                                  child: Opacity(
                                    opacity: 1 - value,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconWidget(
                                            iconWidth: 25.w,
                                            icon: Assets.teamUiMoney02),
                                        3.hGap,
                                        Text(
                                          Utils.formatMoney(
                                              controller.getCostMoney()),
                                          style: 16.w5(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),

                            /// right power
                            Obx(() {
                              var value = controller
                                  .moneyFlyAnimationController.value.value;
                              return Positioned(
                                  top: 111.h,
                                  right: 36.w,
                                  width: maxWidth,
                                  child: Opacity(
                                    opacity: value,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "POWER ${teamBattleController.battleEntity.awayTeam.currTeamStrength}",
                                        style: 16.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                    ),
                                  ));
                            }),

                            /// vs
                            Positioned(
                              top: 54.h,
                              child: Text(
                                "VS",
                                style: 40.w5(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
