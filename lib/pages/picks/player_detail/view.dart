import 'dart:math';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_page_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/game/game.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PlayerDetailPageArguments {
  final int playerId;
  final String? tabStr;//选中的初始tab属性
  final bool isMyPlayer;//是不是我的球员

  PlayerDetailPageArguments(this.playerId, {this.tabStr,this.isMyPlayer = false});
}

class PlayerDetailPage extends GetView<PlayerDetailController> {
  const PlayerDetailPage({super.key, this.arguments});

  final PlayerDetailPageArguments? arguments;

  @override
  Widget build(BuildContext context) {
    PlayerDetailPageArguments args = arguments ?? Get.arguments;
    return HorizontalDragBackWidget(
      child: GetBuilder<PlayerDetailController>(
        init: PlayerDetailController(args),
        id: PlayerDetailController.idMain,
        builder: (_) {
          return BlackAppWidget(
            AppBarWidget(
              title: "PLAYER",
              borderRadius: 32.w,
              bottomChild: Stack(
                children: [
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: 95.w,
                        height: 77.w,
                        alignment: Alignment.bottomLeft,
                        child: Opacity(
                          opacity: .3,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.w)),
                              child: ImageWidget(
                                url: Utils.getTeamUrl(controller.teamInfo?.id),
                                width: 84.w,
                              )),
                        ),
                      )),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 13.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.w)),
                            child: ImageWidget(
                              imageFailedPath: Assets.iconUiDefault04,
                              url: Utils.getPlayUrl(
                                  controller.baseInfo?.playerId),
                              width: 100.w,
                              height: 100.w,
                            ),
                          )),
                      2.vGap,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.baseInfo?.elname}",
                                  style: 16
                                      .w4(color: AppColors.cF2F2F2, height: 1),
                                ),
                                IconWidget(
                                    iconWidth: 17.w,
                                    icon: Assets.playerUiIconFollow),
                              ],
                            ),
                            Text.rich(
                                style:
                                    10.w4(color: AppColors.cB3B3B3, height: 1),
                                TextSpan(children: [
                                  TextSpan(
                                      text: "${controller.baseInfo?.position}",
                                      style: 10.w4(
                                          color: AppColors.cF2F2F2, height: 1)),
                                  TextSpan(
                                      text:
                                          "·${controller.teamInfo?.shortEname}")
                                ])),
                            13.vGap,
                            if (false) //todo 接口未提供数据,隐藏
                              Row(
                                children: [
                                  _buildPlayerInfoItem("AGE", "23"),
                                  24.hGap,
                                  _buildPlayerInfoItem("HEIGHT", '''5'11"'''),
                                  24.hGap,
                                  _buildPlayerInfoItem("WEIGHT", "217 lbs"),
                                  24.hGap,
                                  _buildPlayerInfoItem("EXP", "5"),
                                ],
                              )
                          ],
                        ),
                      ),
                      23.hGap
                    ],
                  ),
                ],
              ),
            ),
            totalScreenBuilder: (context, appBarHeight) {
              return Column(
                children: [
                  Container(
                    height: appBarHeight + 66.w,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.cD9D9D9,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16.w))),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400.w),
                      height: 34.w,
                      margin: EdgeInsets.only(
                          left: 13.w, right: 13.w, bottom: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(17.w)),
                      child: LayoutBuilder(builder: (context, constraints) {
                        var itemWidth = (constraints.maxWidth - 8.w) /
                            controller.tabController.length;
                        return TLBuildWidget(
                            controller: controller.tabController,
                            builder: (current, next, progress, totalProgress) {
                              return Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                    left: totalProgress * itemWidth,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 4.w),
                                      height: 26.w,
                                      width: itemWidth,
                                      decoration: BoxDecoration(
                                          color: AppColors.c262626,
                                          borderRadius:
                                              BorderRadius.circular(26.w)),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                        controller.tabs.length,
                                        (index) => Expanded(
                                              child: InkWell(
                                                  onTap: () => controller
                                                      .tabController
                                                      .animateTo(index),
                                                  child: Center(
                                                      child: Text(
                                                          controller
                                                              .tabs[index],
                                                          style: 13.w4(
                                                            color: current ==
                                                                    index
                                                                ? Color.lerp(
                                                                    AppColors
                                                                        .cF2F2F2,
                                                                    AppColors
                                                                        .c666666,
                                                                    progress)!
                                                                : next == index
                                                                    ? Color.lerp(
                                                                        AppColors
                                                                            .c666666,
                                                                        AppColors
                                                                            .cF2F2F2,
                                                                        progress)!
                                                                    : AppColors
                                                                        .c666666,
                                                          )))),
                                            )),
                                  )
                                ],
                              );
                            });
                      }),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: controller.tabController,
                        physics: OneBoundaryPageScrollPhysics(
                            tabController: controller.tabController),
                        children: [
                          SummaryPage(
                            playerId: args.playerId,
                            tabStr: args.tabStr,
                          ),
                          HistoryPage(
                            headHeight: appBarHeight + 66.w,
                            playerId: args.playerId,
                          ),
                          PlayerDetailGame(
                            headHeight: appBarHeight + 66.w,
                            upStarSuccessCallBack: controller.reloadData,
                          )
                        ]),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  Column _buildPlayerInfoItem(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: 10.w4(color: AppColors.c666666, height: 1),
        ),
        5.vGap,
        Text(
          value,
          style: 14.w4(color: AppColors.cF2F2F2, height: 1),
        )
      ],
    );
  }
}
