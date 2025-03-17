/*
 * @Description: 我的球队的训练和比赛
 * @Author: lihonghao
 * @Date: 2024-09-27 19:21:36
 * @LastEditTime: 2025-03-17 17:01:48
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
    bool isMax = controller.myBagList.length >=
        controller.myTeamEntity.playerBackpackNum;
    return SizedBox(
      width: 375.w,
      height: 130.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 130.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.c262626, width: 0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.c1D1D1D, AppColors.c3e3e3e]),
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
              top: 28.w,
              child: Obx(() {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.c000000.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(9.w)),
                  width: 287.w,
                  height: 53.w,
                  child: controller.current.value == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "OVR",
                              style: 21.w4(
                                color: AppColors.cFFFFFF,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                            12.hGap,
                            AnimatedNum(
                              textStyle: 21.w4(
                                color: AppColors.cFFFFFF,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                              number: controller.getTeamOvr(),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "stash players".toUpperCase(),
                              style: 21.w4(
                                color: AppColors.cFFFFFF,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                            12.hGap,
                            Text(
                              "${controller.myBagList.length}",
                              style: 21.w4(
                                  color: isMax
                                      ? AppColors.cE72646
                                      : AppColors.cFFFFFF,
                                  height: 0.75,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "/${controller.myTeamEntity.playerBackpackNum}",
                              style: 21.w4(
                                  color: AppColors.cFFFFFF,
                                  height: 0.75,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                          ],
                        ),
                );
              })),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 40.w,
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
                              e.tr.toUpperCase(),
                            ))
                        .toList()),
              ))
        ],
      ),
    );
  }
}
