import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

class OvrStandingDetailPage extends GetView<NbaPlayerController> {
  const OvrStandingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: GetBuilder<NbaPlayerController>(builder: (context) {
        return BlackAppWidget(
            UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
                child: NestedScrollView(
                    headerSliverBuilder: (context, iOSHorizontalOffset) {
                      return [
                        SliverPersistentHeader(
                            floating: true,
                            delegate: FixedHeightSliverHeaderDelegate(child: _ovrTitleWidget(), height: 100.w)),
                        SliverPersistentHeader(
                            pinned: true,
                            delegate: FixedHeightSliverHeaderDelegate(child: _ovrTabWidget(), height: 28.w)),
                      ];
                    },
                    body: Container(
                      color: Colors.white,
                      child: ListView.separated(
                        itemCount: controller.allPlayerStrengthRank.length,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          return _playerItemWidget(index);
                        },
                        separatorBuilder: (context, index) => Divider(height: 1, color: AppColors.cE3E3E3),
                      ),
                    ))));
      }),
    );
  }

  Widget _ovrTitleWidget() {
    // 获取当前时间
    DateTime now = DateTime.now();
    // 创建今天的 23:59:59 时间
    DateTime todayLastSecond = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return Container(
        margin: EdgeInsets.only(top: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: Colors.white,
        child: Column(
          children: [
            10.vGap,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'OVR STANDING',
                    style: 34.w7(fontFamily: FontFamily.fOswaldBold),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.cD1D1D1), borderRadius: BorderRadius.circular(8.w)),
                  child: Row(
                    children: [
                      IconWidget(
                        iconWidth: 16.w,
                        icon: Assets.commonUiCommonIconSystemLikeComment,
                        iconColor: Colors.black,
                      ),
                      8.hGap,
                      Text(
                        '329K',
                        style: 12.w5(fontFamily: FontFamily.fRobotoRegular),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconWidget(iconWidth: 13.w, icon: Assets.commonUiCommonCountdown02),
                6.hGap,
                Text(
                  '6D ${DateUtil.formatDate(todayLastSecond, format: 'HH:mm:ss')}',
                  style: 12.w5(fontFamily: FontFamily.fOswaldRegular),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _ovrTabWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                _tabItemWidget('rank'.toUpperCase(), 0),
                20.hGap,
                _tabItemWidget('power'.toUpperCase(), 1),
                20.hGap,
                _tabItemWidget('collect'.toUpperCase(), 2),
                Spacer(),
                IconWidget(
                  iconWidth: 16.w,
                  icon: Assets.commonUiCommonIconManager,
                  iconColor: AppColors.c000000,
                )
              ],
            ),
          )),
          Divider(height: 1, color: AppColors.cE3E3E3),
        ],
      ),
    );
  }

  Widget _tabItemWidget(String title, int tabIndex) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (controller.currentIndex.value != 2 * tabIndex) {
            controller.currentIndex.value = 2 * tabIndex;
          } else {
            controller.currentIndex.value = (2 * tabIndex) + 1;
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: 12.w7(
                fontFamily: FontFamily.fRobotoMedium,
                color:
                    controller.currentIndex.value != 2 * tabIndex && controller.currentIndex.value != (2 * tabIndex) + 1
                        ? AppColors.c000000
                        : AppColors.cFF5D54,
              ),
            ),
            6.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateZ(-pi / 180 * 90.0)
                    ..translate(-1.w, 0.0),
                  child: IconWidget(
                    iconWidth: 5.w,
                    iconHeight: 10.w,
                    icon: Assets.commonUiCommonIconSystemArrow,
                    iconColor: controller.currentIndex.value == 2 * tabIndex ? AppColors.cFF5D54 : AppColors.cDBDBDB,
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateZ(pi / 180 * 90.0)
                    ..translate(-1.w, 0.0),
                  child: IconWidget(
                      iconWidth: 5.w,
                      iconHeight: 10.w,
                      icon: Assets.commonUiCommonIconSystemArrow,
                      iconColor:
                          controller.currentIndex.value == (2 * tabIndex) + 1 ? AppColors.cFF5D54 : AppColors.cDBDBDB),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _playerItemWidget(int index) {
    return Obx(() {
      List<PlayerStrengthRankTrendList> item = controller.allPlayerStrengthRank[index].trendList;

      ///开始到结束分数差值
      var differenceScore = item[0].playerScore - item[1].playerScore;
      var player = Utils.getPlayBaseInfo(controller.allPlayerStrengthRank[index].playerId);
      return InkWell(
        onTap: () => controller.goPlayerDetail(controller.allPlayerStrengthRank[index].playerId),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.w),
          height: 93.w,
          child: Row(
            children: [
              Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.w),
                    color: Colors.white,
                  ),
                  child: Center(child: Text("${index + 1}", style: TextStyle()))),
              6.hGap,
              Stack(
                children: [
                  PlayerAvatarWidget(
                    width: 73.w,
                    height: 93.w,
                    radius: 9.w,
                    playerId: controller.allPlayerStrengthRank[index].playerId,
                    backgroundColor: AppColors.cD9D9D9,
                  ),
                  Positioned(
                      top: 4.w,
                      right: 4.w,
                      child: Container(
                        height: 16.w,
                        width: 16.w,
                        decoration: BoxDecoration(color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(4.w)),
                        child: IconWidget(
                          iconWidth: 9.w,
                          icon: Assets.iconUiIconRead,
                          iconColor: AppColors.c000000,
                        ),
                      ))
                ],
              ),
              10.hGap,
              Expanded(
                  child: Container(
                      // color: Colors.green.withOpacity(.1),
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                          child: Text(
                        Utils.getPlayBaseInfo(controller.allPlayerStrengthRank[index].playerId).ename.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                      )),
                      4.hGap,
                      Container(
                        decoration: BoxDecoration(color: AppColors.cFF5454, borderRadius: BorderRadius.circular(4.w)),
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          'INJ',
                          style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Text(
                    ' ${Utils.getTeamInfo(player.teamId).shortEname} · ${player.position}'.toUpperCase(),
                    style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.cB3B3B3),
                  ),
                  _playerchart(controller.allPlayerStrengthRank[index].trendList),
                  4.vGap,
                  Text(
                    'POW ${controller.allPlayerStrengthRank[index].strength}',
                    style: 10.w5(fontFamily: FontFamily.fRobotoMedium),
                  ),
                ],
              ))),
              16.hGap,
              Container(
                width: 82.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print('star');
                          },
                          child: IconWidget(
                              iconWidth: 16.w,
                              iconColor: AppColors.c8A8A8A,
                              icon: Assets.commonUiCommonStatusBarStar01),
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 55.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.c333333,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(6.w), bottomLeft: Radius.circular(6.w))),
                          child: Column(
                            children: [
                              Text(
                                '${item[0].playerScore}',
                                style: 19.w5(color: AppColors.cFFFFFF, fontFamily: FontFamily.fOswaldBold),
                              ),
                              Text(
                                'OVR',
                                style: 12.w5(color: AppColors.cFFFFFF, fontFamily: FontFamily.fOswaldRegular),
                              ),
                              2.vGap
                            ],
                          ),
                        ),
                        3.hGap,
                        Container(
                          height: 50.w,
                          width: 24.w,
                          decoration: BoxDecoration(
                              color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                              borderRadius:
                                  BorderRadius.only(bottomRight: Radius.circular(6.w), topRight: Radius.circular(6.w))),
                          child: Column(
                            children: [
                              Text(
                                '${differenceScore.abs()}',
                                style: 19.w5(color: AppColors.cFFFFFF, fontFamily: FontFamily.fOswaldBold),
                              ),
                              Transform.rotate(
                                angle: differenceScore >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
                                child: IconWidget(
                                    iconWidth: 8.w, iconHeight: 12.w, icon: Assets.commonUiCommonIconSystemArrow),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _playerchart(List<PlayerStrengthRankTrendList> item) {
    // NbaPlayerInfosPlayerBaseInfoList player = Utils.getPlayBaseInfo(1001);

    List<int> scores = item.map((element) => element.playerScore).toList();

    // 获取最大值
    int maxScore = scores.reduce(max);
    var horizontalInterval = maxScore / 2;

    var data = List.generate(item.length, (index) {
      if (index == 0) {
        FlSpot(index.toDouble(), horizontalInterval);
      }
      return FlSpot(index.toDouble(), item[item.length - index - 1].playerScore.toDouble());
    });
    return Stack(
      children: [
        Container(
            height: 32.w,
            margin: EdgeInsets.only(
              right: 32.w,
            ),
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                      spots: data,
                      color: AppColors.cE34D4D,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          // 如果是最后一个点，则返回一个特定样式的点
                          if (index == data.length - 1) {
                            return FlDotCirclePainter(
                                radius: 1.6, color: Colors.red, strokeColor: Colors.white, strokeWidth: 1.6);
                          } else {
                            return FlDotCirclePainter(radius: 0);
                          }
                        },
                      ),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                              colors: [AppColors.cE34D4D.withOpacity(0.3), AppColors.cE34D4D.withOpacity(0.1)])))
                ],
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(color: AppColors.cB3B3B3, strokeWidth: 1, dashArray: [4, 2]);
                    },
                    horizontalInterval: horizontalInterval,
                    checkToShowHorizontalLine: (value) {
                      return true;
                    },
                    checkToShowVerticalLine: (value) {
                      return false;
                    }),
              ),
            )),
      ],
    );
  }
}
