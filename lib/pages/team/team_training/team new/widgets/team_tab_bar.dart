/*
 * @Description: 我的球队的训练和比赛
 * @Author: lihonghao
 * @Date: 2024-09-27 19:21:36
 * @LastEditTime: 2024-12-12 17:47:33
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamTabbar extends GetView<TeamController> {
  const TeamTabbar({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "TOTAL POWER",
                    style: 12.w4(
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.75),
                  ),
                  7.vGap,
                  AnimatedNum(
                      number: controller.myTeamEntity.oVR,
                      withConma: true,
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
            child: Obx(() {
              int length =
                  controller.myBagList.where((e) => e.position == -1).length;
              return Container(
                width: 195.w,
                height: 51.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.w),
                    color: AppColors.c000000.withOpacity(0.5)),
                child: controller.current.value == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "SALARY CAP",
                                style: 12.w4(
                                    color: AppColors.cFFFFFF,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 0.75),
                              ),
                              6.hGap,
                              if (controller.myTeamEntity.salary >=
                                  controller.myTeamEntity.salaryCap)
                                Container(
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
                              Expanded(
                                child: Container(),
                              ),
                              Image.asset(
                                Assets.iconUiIconRead,
                                height: 12.w,
                              )
                            ],
                          ),
                          3.5.vGap,
                          Row(
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.none,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AnimatedNum(
                                        number: controller.myTeamEntity.salary,
                                        isMoney: true,
                                        textStyle: 21.w4(
                                            color: AppColors.cFFFFFF,
                                            height: 0.75,
                                            fontFamily:
                                                FontFamily.fOswaldMedium),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        "/${Utils.formatMoney(controller.myTeamEntity.salaryCap)}",
                                        style: 16.w4(
                                            color: AppColors.cFFFFFF,
                                            height: 0.75,
                                            fontFamily:
                                                FontFamily.fOswaldRegular),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              SizedBox(
                                width: 71.w,
                                child: CustomLinearProgressBar(
                                    width: 71.w,
                                    height: 6.w,
                                    progressColor: controller
                                                .myTeamEntity.salary >=
                                            controller.myTeamEntity.salaryCap
                                        ? AppColors.cD60D20
                                        : AppColors.cFFFFFF,
                                    backgroundColor: AppColors.c4D4D4D,
                                    progress: controller.myTeamEntity.salary /
                                        controller.myTeamEntity.salaryCap),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "STASH PLAYERS",
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
                          6.5.vGap,
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "$length",
                                    style: 21.w4(
                                        color: AppColors.cFFFFFF,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "/50",
                                    style: 16.w4(
                                        color: AppColors.cFFFFFF,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
              );
            }),
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
                              e,
                            ))
                        .toList()),
              ))
        ],
      ),
    );
  }
}
