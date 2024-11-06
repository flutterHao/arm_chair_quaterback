/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-11-04 16:20:47
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/battle_award_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/pie_chart.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/vertical_drag_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamIndexPage extends StatefulWidget {
  const TeamIndexPage({super.key});

  @override
  State<TeamIndexPage> createState() => _TeamIndexPageState();
}

class _TeamIndexPageState extends State<TeamIndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Navigator(
      key: GlobalNestedKey.TeamTabGlobalKey,
      initialRoute: RouteNames.teamTeamIndex,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouteNames.teamTeamIndex:
            return GetPageRoute(
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const _TeamView(),
            );
          case RouteNames.teamTrainingPage:
            return GetPageRoute(
              opaque: false,
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const TrainingPage(),
              // binding: NewDetailBinding(), /*  */
            );
          case RouteNames.teamBeautyPage:
            return GetPageRoute(
              opaque: false,
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const BeautyPage(),
            );
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
        }
        return null;
      },
    );
  }
}

class _TeamView extends GetView<TeamIndexController> {
  const _TeamView();

  Duration get _duration => const Duration(milliseconds: 300);

  // 主视图
  Widget _buildView(TeamIndexController ctrl) {
    return Expanded(
        child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy < 0) {
                if (controller.isShow.value) return;
                controller.pageOnTap();
              }
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // _backGroud(ctrl),
                _buildleft(ctrl),
                _buildRight(ctrl),
              ],
            )
            // child: AnimatedBuilder(
            //     animation: ctrl.pageAnimation,
            //     builder: (context, child) {
            //       return Stack(
            //         alignment: Alignment.bottomCenter,
            //         children: [
            //           _buildleft(ctrl),
            //           _buildRight(ctrl),
            //         ],
            //       );
            //     }),
            ));
  }

  Widget _backGroud(TeamIndexController ctrl) {
    return Positioned(
        top: 0,
        left: 0,
        bottom: 0,
        right: 0,
        // child: Obx(() {
        //   double progress = -ctrl.pageX.value / 250;
        //   return Container(
        //     color: Colors.white.withOpacity(0.5 + 0.5 * progress),
        //   );
        // }),
        child: Container(
          color: Colors.white.withOpacity(0.5),
        ));
  }

  ///左边美女部分
  Widget _buildleft(TeamIndexController ctrl) {
    BeautyController beautyCtrl = Get.find();

    return AnimatedPositioned(
      top: 0,
      right: 0,
      bottom: 0,
      duration: _duration,
      left: ctrl.pageX.value,
      // left: ctrl.pageAnimation.value,
      child: Stack(
        children: [
          Positioned(
            top: 0.h,
            child: Image.asset(
              Assets.uiCommonGrainPng,
              fit: BoxFit.fitWidth,
              width: 375.h,
            ),
          ),
          Positioned(
            top: 27.h,
            bottom: 70.h,
            left: -15.h,
            child: Obx(() {
              return Image.asset(
                  beautyCtrl.beautyList[beautyCtrl.beautyIndex.value],
                  fit: BoxFit.cover,
                  // height: 567.w,
                  width: 232.w,
                  alignment: Alignment.topRight);
            }),
          ),

          ///刷新按钮
          Positioned(
            top: 40.h,
            left: 16.h,
            child: InkWell(
              onTap: () => Get.toNamed(RouteNames.teamBeautyPage,
                  id: GlobalNestedKey.TEAM),
              child: Container(
                width: 32.h,
                height: 32.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: Colors.white),
                child: IconWidget(
                  iconWidth: 16.h,
                  icon: Assets.uiIconSwitch_01Png,
                  iconColor: AppColors.c262626,
                ),
              ),
            ),
          ),

          Positioned(
            top: 436.h,
            left: 16.h,
            child: Container(
              width: 50.h,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.h),
                  color: Colors.black.withOpacity(0.8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    iconWidth: 24.h,
                    icon: Assets.uiIconBondPng,
                    iconColor: AppColors.cFFFFFF,
                  ),
                  1.vGap,
                  Text(
                    "bond",
                    style: 9.w4(color: AppColors.cE6E6E),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rewardContent() {
    return Column(
      children: [
        ShadowContainer(
            width: 162.w,
            height: 24.w,
            backgroudColor: AppColors.ccccccc,
            borderRadius: BorderRadius.circular(12.w),
            margin: EdgeInsets.only(top: 16.w),
            child: Text(
              "Award",
              style: 14.w4(color: AppColors.c262626),
            )),
        9.vGap,
        IconWidget(
          icon: Assets.uiPropsMoenyPng,
          iconWidth: 64.w,
        ),
        7.vGap,
        Text(
          "x 100",
          style: 14.w4(color: AppColors.c262626),
        )
      ],
    );
  }

  ///右边队伍信息
  Widget _buildRight(TeamIndexController ctrl) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: 0,
      duration: _duration,
      right: ctrl.pageX.value,
      // right: ctrl.pageAnimation.value,
      child: Stack(
        children: [
          ///文字区
          Positioned(
            right: 10.h,
            top: 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.h,
                  child: Text(
                    "Hi,Manager ",
                    overflow: TextOverflow.ellipsis,
                    style: 24.w7(
                        color: AppColors.c262626,
                        fontFamily: FontFamily.fOswaldLight),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30.h),
                      child: Text(
                        "It’s your game progress for the day",
                        style: 10.w4(color: AppColors.c262626),
                      ),
                    ),
                    10.vGap,
                    Row(
                      children: [
                        _numWidget("Battle", 24),
                        8.hGap,
                        _numWidget("Training", 52),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          Positioned(
            bottom: 137.h,
            // top: 350.h,
            right: 0,
            child: Container(
              width: 185.h,
              height: 283.h,
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Positioned(
                    top: 0,
                    right: 15.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///宝箱
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _blackBox(
                                onTap: () {
                                  if (!ctrl.box1Claimed.value) {
                                    showDialog(
                                        context: Get.context!,
                                        builder: (context) {
                                          return CustomDialog(
                                              content: _rewardContent(),
                                              onTap: () {
                                                ctrl.claimBox(1);
                                              });
                                        });
                                  } else if (!ctrl.box2Claimed.value) {
                                    Get.dialog(CustomDialog(
                                        content: _rewardContent(),
                                        onTap: () {
                                          ctrl.claimBox(2);
                                        }));
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 48.h,
                                      height: 40.h,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Obx(() {
                                                return Image.asset(
                                                  ctrl.box2Claimed.value
                                                      ? Assets.uiTeamBox_04Png
                                                      : Assets.uiTeamBox_03Png,
                                                  width: 23.h,
                                                  fit: BoxFit.fill,
                                                );
                                              })),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: Obx(() {
                                              return Image.asset(
                                                ctrl.box1Claimed.value
                                                    ? Assets.uiTeamBox_02Png
                                                    : Assets.uiTeamBox_01Png,
                                                width: 38.h,
                                                fit: BoxFit.fill,
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Obx(() {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ctrl.isCountdownActive.value
                                                ? Column(
                                                    children: [
                                                      Text(
                                                        "Next",
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .cB3B3B3,
                                                            height: 1),
                                                      ),
                                                      Text(
                                                        ctrl.getCountDownTimeStr(),
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .c10A86A,
                                                            height: 1),
                                                      ),
                                                    ],
                                                  )
                                                : BorderContainer(
                                                    height: 16.h,
                                                    width: 44.h,
                                                    borderColor:
                                                        AppColors.cFF7954,
                                                    child: Text(
                                                      "OPEN",
                                                      style: 10.w4(
                                                          color: AppColors
                                                              .cFF7954),
                                                    ),
                                                  )
                                          ],
                                        );
                                      }),
                                    ),
                                  ],
                                )),
                            12.hGap,
                            _blackBox(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: Get.context!,
                                      builder: (context) {
                                        return const BattleAwardDialog();
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.uiTeamBox_01Png,
                                      width: 43.h,
                                      height: 37.h,
                                      fit: BoxFit.fill,
                                    ),
                                    13.vGap,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        PieChart(progress: 1),
                                        2.4.hGap,
                                        PieChart(progress: 0.8),
                                        2.4.hGap,
                                        PieChart(progress: 0),
                                        2.4.hGap,
                                        PieChart(progress: -1),
                                      ],
                                    )
                                  ],
                                ))
                          ],
                        ),

                        ///百分比
                        SizedBox(height: 20.h),
                        Text(
                          "38%",
                          style: 39.w7(color: AppColors.cFF7954),
                        ),
                      ],
                    ),
                  ),

                  ///背景
                  Positioned(
                    bottom: 0,
                    right: 0.h,
                    child: InkWell(
                      // onTap: () => controller.openPage(),
                      onTap: () {
                        Get.toNamed(RouteNames.teamTrainingPage,
                            id: GlobalNestedKey.TEAM);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 148.h,
                            height: 26.h,
                            padding: EdgeInsets.only(left: 13.h),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: AppColors.cFF7954,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.h))),
                            child: Text(
                              "Preparation Level",
                              style: 14.w4(color: AppColors.c262626),
                            ),
                          ),
                          Container(
                            width: 148.h,
                            height: 122.h,
                            decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.h))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16.h,
                    bottom: 70.h,
                    child: InkWell(
                      onTap: () => controller.openPage(),
                      child: ShadowContainer(
                          width: 147.h,
                          height: 38.h,
                          backgroudColor: AppColors.c343434,
                          borderRadius: BorderRadius.circular(19.h),
                          padding: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            children: [
                              Image.asset(
                                width: 30.h,
                                height: 30.h,
                                Assets.uiStateGeneralPng,
                                fit: BoxFit.fill,
                              ),
                              10.hGap,
                              Expanded(
                                  child: Text(
                                "x10",
                                style: 16.w4(color: AppColors.cF2F2F2),
                              )),
                              BorderContainer(
                                height: 30.h,
                                width: 30.h,
                                borderColor: AppColors.cB3B3B3,
                                child: Image.asset(
                                  Assets.uiIconArrowsPng,
                                  width: 14.h,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    right: 12.h,
                    bottom: 13.h,
                    child: Row(
                      children: [
                        CircleProgressView(
                            title: "PF",
                            progressColor: AppColors.c6DBD18,
                            progress: 100,
                            width: 49.h,
                            height: 49.h),
                        5.hGap,
                        CircleProgressView(
                            title: "SG",
                            progress: 80,
                            width: 49.h,
                            height: 49.h),
                        5.hGap,
                        CircleProgressView(
                            title: "SG",
                            progress: 50,
                            width: 49.h,
                            height: 49.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///训练界面
          // Obx(() {
          //   return AnimatedPositioned(
          //       bottom: ctrl.myTeamBottom.value,
          //       duration: _duration,
          //       left: 0,
          //       right: 0,
          //       child: const VerticalDragBackWidget(child: TeamTrainingPage()));
          // }),

          // Positioned(
          //       bottom: ctrl.myTeamBottom.value,
          //       // duration: _duration,
          //       left: 0,
          //       right: 0,
          //       child: const VerticalDragBackWidget(child: TeamTrainingPage())),
          const VerticalDragBackWidget(child: TeamMenberView()),

          ///战斗按键
          Obx(() {
            return AnimatedPositioned(
              left: ctrl.trainingLeft.value,
              duration: _duration,
              bottom: 45.h,
              child: BorderWidget(
                offset: Offset(0, -3.h),
                width: 152.h,
                height: 64.h,
                onTap: () => Get.toNamed(RouteNames.teamTeamBattle),
                margin: EdgeInsets.only(bottom: 2.h),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.h),
                  bottomRight: Radius.circular(32.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "BATTLE",
                      style: 21.w7(color: AppColors.cFF7954),
                    ),
                    6.hGap,
                    SizedBox(
                      height: 40.h,
                      width: 36.h,
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            top: 0,
                            child: IconWidget(
                              iconWidth: 31.h,
                              icon: Assets.uiIconTrophy_01Png,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: ShadowContainer(
                                // width:35.w ,
                                // height: 10.h,
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                borderRadius: BorderRadius.circular(5.h),
                                backgroudColor: AppColors.cFED141,
                                child: Text(
                                  "15000",
                                  style: 10
                                      .w7(color: AppColors.c262626, height: 1),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          ///训练按钮
          Obx(() {
            return AnimatedPositioned(
              right: ctrl.bettleRight.value,
              duration: Duration(milliseconds: 200),
              bottom: 45.h,
              child: BorderWidget(
                offset: Offset(0, -3.h),
                width: 152.h,
                height: 64.h,
                onTap: () {
                  // ctrl.pageOnTap();
                  Get.toNamed(RouteNames.teamTrainingPage,
                      id: GlobalNestedKey.TEAM);
                },
                margin: EdgeInsets.only(bottom: 2.h),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.h),
                  bottomLeft: Radius.circular(32.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconWidget(
                      iconWidth: 35.h,
                      icon: Assets.uiIconBasketballPng1,
                      iconColor: AppColors.cFF7954,
                    ),
                    5.hGap,
                    Text(
                      "TRAINING",
                      style: 21.w7(color: AppColors.cFF7954),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _numWidget(String title, int num) {
    return BorderContainer(
        height: 42.h,
        width: 68.h,
        borderRadius: BorderRadius.circular(12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$num",
              style: 24.w4(color: AppColors.c262626, height: 1),
            ),
            Text(
              title,
              style: 10.w4(height: 1),
            )
          ],
        ));
  }

  Widget _blackBox({required Widget child, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 56.h,
        height: 77.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.c262626,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BeautyController());
    return GetBuilder<TeamIndexController>(
      init: TeamIndexController(),
      id: "team_index",
      builder: (ctrl) {
        return BlackAppWidget(
          const UserInfoBar(
            title: "TEAM",
            routeId: GlobalNestedKey.TEAM,
          ),
          bodyWidget: _buildView(ctrl),
          floatWidgets: [],
        );
      },
    );
  }
}
