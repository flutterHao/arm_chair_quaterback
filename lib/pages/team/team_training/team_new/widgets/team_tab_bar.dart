/*
 * @Description: 我的球队的训练和比赛
 * @Author: lihonghao
 * @Date: 2024-09-27 19:21:36
 * @LastEditTime: 2025-03-15 11:25:00
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamTabbar extends GetView<TeamController> {
  const TeamTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 40.w,
      color: AppColors.c404040,
      child: TabBar(
          controller: controller.tabController,
          labelStyle: 16.w4(height: 1, fontFamily: FontFamily.fOswaldMedium),
          // labelStyle:
          //     16.w7(height: 1, fontFamily: FontFamily.fOswaldRegular),
          labelColor: AppColors.cFFFFFF,
          unselectedLabelStyle:
              16.w4(height: 1, fontFamily: FontFamily.fOswaldRegular),
          unselectedLabelColor: AppColors.cB3B3B3,
          indicatorColor: AppColors.cFF7954,
          dividerColor: AppColors.cD1D1D1,
          indicatorWeight: 3.w,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: controller.tabs
              .map((e) => Text(
                    e.tr,
                  ))
              .toList()),
    );
    return SizedBox(
      width: 375.w,
      height: 109.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 109.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.c262626, width: 0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.c262626, AppColors.c3e3e3e]),
            ),
          ),
          Positioned(
            top: 0,
            child: MirrorImageWidget(
                imagePath: Assets.managerUiManagerLineupBg,
                fullWidth: 258.w,
                imageHeight: 85.w),
          ),
          Positioned(
            top: 16.w,
            left: 16.w,
            child: Container(
              width: 139.w,
              height: 51.w,
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  color: AppColors.c000000.withOpacity(0.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LangKey.teamTabTeamPower.tr,
                    style: 12.w4(
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.75),
                  ),
                  7.vGap,
                  AnimatedNum(
                      number: controller.myTeamEntity.oVR,
                      withConma: true,
                      milliseconds: 1000,
                      textStyle: 21.w4(
                          color: AppColors.cFFFFFF,
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.75))
                ],
              ),
            ),
          ),
          Positioned(
            top: 16.w,
            right: 16.w,
            child: Stack(
              children: [
                Container(
                  width: 195.w,
                  height: 51.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.c000000.withOpacity(0.5)),
                  child:
                      // controller.current.value == 0
                      // ?

                      // Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       8.5.vGap,
                      //       Row(
                      //         children: [
                      //           Text(
                      //             LangKey.gameMeanSalaryCap.tr,
                      //             style: 12.w4(
                      //                 color: AppColors.cFFFFFF,
                      //                 fontFamily: FontFamily.fRobotoRegular,
                      //                 height: 0.75),
                      //           ),
                      //           6.hGap,
                      //           Expanded(
                      //             child: Container(),
                      //           ),
                      //           Image.asset(
                      //             Assets.iconUiIconRead,
                      //             height: 12.w,
                      //           )
                      //         ],
                      //       ),
                      //       // 7.5.vGap,
                      //       const Expanded(child: SizedBox.shrink()),
                      //       Row(
                      //         children: [
                      //           SizedBox(
                      //             width: 100.w,
                      //             height: 16.w,
                      //             child: FittedBox(
                      //               fit: BoxFit.none,
                      //               alignment: Alignment.centerLeft,
                      //               child: Row(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.end,
                      //                 children: [
                      //                   AnimatedNum(
                      //                     number:
                      //                         controller.myTeamEntity.salary,
                      //                     isMoney: true,
                      //                     milliseconds: 1000,
                      //                     textStyle: 21.w4(
                      //                         color: AppColors.cFFFFFF,
                      //                         height: 0.75,
                      //                         fontFamily:
                      //                             FontFamily.fOswaldMedium),
                      //                   ),
                      //                   SizedBox(height: 4.h),
                      //                   Text(
                      //                     "/${Utils.formatMoney(controller.myTeamEntity.salaryCap)}",
                      //                     style: 16.w4(
                      //                         color: AppColors.cFFFFFF,
                      //                         height: 0.75,
                      //                         fontFamily:
                      //                             FontFamily.fOswaldRegular),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           Expanded(child: Container()),
                      //           SizedBox(
                      //             width: 71.w,
                      //             child: CustomLinearProgressBar(
                      //                 width: 71.w,
                      //                 height: 6.w,
                      //                 progressColor:
                      //                     controller.myTeamEntity.salary >
                      //                             controller
                      //                                 .myTeamEntity.salaryCap
                      //                         ? AppColors.cD60D20
                      //                         : AppColors.cFFFFFF,
                      //                 backgroundColor: AppColors.c4D4D4D,
                      //                 progress: controller
                      //                         .myTeamEntity.salary /
                      //                     controller.myTeamEntity.salaryCap),
                      //           ),
                      //         ],
                      //       ),
                      //       10.vGap,
                      //     ],
                      //   )

                      // :

                      Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.5.vGap,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              LangKey.teamTabPlayerBag.tr,
                              style: 12.w4(
                                  color: AppColors.cFFFFFF,
                                  fontFamily: FontFamily.fRobotoRegular,
                                  height: 0.75),
                            ),
                          ),
                          Image.asset(
                            Assets.iconUiIconRead,
                            height: 12.w,
                          )
                        ],
                      ),
                      // 8.5.vGap,
                      const Expanded(child: SizedBox.shrink()),

                      SizedBox(
                        // height: 16.w,
                        child: Row(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${controller.myBagList.where((e) => e.position == -1).length}",
                                  style: 21.w4(
                                      color: AppColors.cFFFFFF,
                                      height: 0.75,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "/${controller.myTeamEntity.playerBackpackNum}",
                                  style: 16.w4(
                                      color: AppColors.cFFFFFF,
                                      height: 0.75,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      10.vGap,
                    ],
                  ),
                ),
                if (controller.myTeamEntity.salary >
                        controller.myTeamEntity.salaryCap &&
                    controller.current.value == 0)
                  Positioned(
                    top: 6.5.w,
                    left: 90.w,
                    child: Container(
                      width: 32.w,
                      // height: 16.5.w,
                      padding: EdgeInsets.symmetric(vertical: 2.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.cD60D20,
                          borderRadius: BorderRadius.circular(4.w)),
                      child: Text(
                        "MAX",
                        style: 12.w4(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldMedium,
                            height: 1),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 36.w,
                child: TabBar(
                    controller: controller.tabController,
                    labelStyle:
                        16.w4(height: 1, fontFamily: FontFamily.fOswaldMedium),
                    // labelStyle:
                    //     16.w7(height: 1, fontFamily: FontFamily.fOswaldRegular),
                    labelColor: AppColors.cFFFFFF,
                    unselectedLabelStyle:
                        16.w4(height: 1, fontFamily: FontFamily.fOswaldRegular),
                    unselectedLabelColor: AppColors.cB3B3B3,
                    indicatorColor: AppColors.cFF7954,
                    dividerColor: AppColors.cD1D1D1,
                    indicatorWeight: 3.w,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: controller.tabs
                        .map((e) => Text(
                              e.tr,
                            ))
                        .toList()),
              ))
        ],
      ),
    );
  }
}
