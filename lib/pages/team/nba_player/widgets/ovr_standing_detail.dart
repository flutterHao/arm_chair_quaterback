import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
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
                child: Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: NestedScrollView(
                  headerSliverBuilder: (context, iOSHorizontalOffset) {
                    return [
                      SliverPersistentHeader(
                          pinned: true,
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
                  )),
            )));
      }),
    );
  }

  Widget _ovrTitleWidget() {
    // 获取当前时间
    DateTime now = DateTime.now();
    // 创建今天的 23:59:59 时间
    DateTime todayLastSecond = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return Container(
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
                Obx(() {
                  controller.gameStartTimesCountDown.value;
                  return Text(
                    '6D ${controller.getTime}',
                    style: 12.w5(fontFamily: FontFamily.fOswaldRegular),
                  );
                })
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
                30.hGap,
                _tabItemWidget('power'.toUpperCase(), 1),
                30.hGap,
                // _tabItemWidget('collect'.toUpperCase(), 2),
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
        onTap: () => controller.currentIndexChange(tabIndex),
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
      NbaPlayerInfosPlayerBaseInfoList player = Utils.getPlayBaseInfo(controller.allPlayerStrengthRank[index].playerId);
      return MtInkWell(
        onTap: () async {
          Get.toNamed(RouteNames.playerTrendPage, arguments: controller.allPlayerStrengthRank[index]);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.w),
          height: 93.w,
          child: Row(
            children: [
              _playRankWidget(index),
              6.hGap,
              _playerCardWidget(player),
              10.hGap,
              Expanded(child: _playerInfoWidget(index, player)),
              10.hGap,
              _playerOvrRightWidget(index)
            ],
          ),
        ),
      );
    });
  }

  Widget _playerInfoWidget(int index, NbaPlayerInfosPlayerBaseInfoList player) {
    List<PlayerStrengthRankTrendList> item = controller.allPlayerStrengthRank[index].trendList;

    ///最后两天分数差值
    int differenceScore = item[0].playerScore - item[1].playerScore;
    int differenceStrength = item[0].playerStrength - item[1].playerStrength;
    return Container(
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
            player.injuries
                ? Container(
                    decoration: BoxDecoration(color: AppColors.cFF5454, borderRadius: BorderRadius.circular(4.w)),
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'INJ',
                      style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: Colors.white),
                    ),
                  )
                : SizedBox()
          ],
        ),
        Text(
          ' ${Utils.getTeamInfo(player.teamId).shortEname} · ${player.position}  SAL ${player.salary}K'.toUpperCase(),
          style: 10.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.c8A8A8A),
        ),
        6.vGap,
        Expanded(child: _playerchartWidget(controller.allPlayerStrengthRank[index].trendList, differenceScore)),
        Row(
          children: [
            Text(
              'POW ${controller.allPlayerStrengthRank[index].strength}',
              style: 10.w5(fontFamily: FontFamily.fRobotoMedium),
            ),
            4.hGap,
            Transform.rotate(
              angle: differenceStrength >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
              child: IconWidget(
                iconWidth: 5.w,
                iconHeight: 8.w,
                icon: Assets.commonUiCommonIconSystemArrow,
                iconColor: differenceStrength >= 0 ? AppColors.c0FA76C : AppColors.cFF5D54,
              ),
            ),
            4.hGap,
            Text(
              '${differenceStrength.abs()}',
              style: 10.w5(fontFamily: FontFamily.fRobotoMedium),
            ),
          ],
        )
      ],
    ));
  }

  Widget _playerOvrRightWidget(int index) {
    List<PlayerStrengthRankTrendList> item = controller.allPlayerStrengthRank[index].trendList;
    int differenceScore = item[0].playerScore - item[1].playerScore;
    return SizedBox(
      width: 82.w,
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              MtInkWell(
                onTap: () => controller.changeLikePlayer(controller.allPlayerStrengthRank[index].playerId),
                child: Obx(() => IconWidget(
                    iconWidth: 16.w,
                    iconColor: controller.likePlayersList.contains(controller.allPlayerStrengthRank[index].playerId)
                        ? Colors.yellow
                        : AppColors.c8A8A8A,
                    icon: controller.likePlayersList.contains(controller.allPlayerStrengthRank[index].playerId)
                        ? Assets.commonUiCommonStatusBarStar02
                        : Assets.commonUiCommonStatusBarStar01)),
              )
            ],
          ),
          Spacer(),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 55.w,
                  decoration: BoxDecoration(
                      color: AppColors.c333333,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(6.w), bottomLeft: Radius.circular(6.w))),
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
                        child: IconWidget(iconWidth: 8.w, iconHeight: 12.w, icon: Assets.commonUiCommonIconSystemArrow),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          7.vGap
        ],
      ),
    );
  }

  Widget _playRankWidget(int index) {
    return Container(
        width: 30.w,
        height: 30.w,
        alignment: Alignment.center,
        child: index == 0
            ? IconWidget(
                iconWidth: 30.w,
                icon: Assets.commonUiManagerIconMedal01,
              )
            : index == 1
                ? IconWidget(
                    iconWidth: 30.w,
                    icon: Assets.commonUiManagerIconMedal02,
                  )
                : index == 2
                    ? IconWidget(
                        iconWidth: 30.w,
                        icon: Assets.commonUiManagerIconMedal03,
                      )
                    : Text("${index + 1}", style: 19.w5(fontFamily: FontFamily.fOswaldMedium)));
  }

  Widget _playerCardWidget(NbaPlayerInfosPlayerBaseInfoList player) {
    return Stack(
      children: [
        PlayerAvatarWidget(
          width: 73.w,
          height: 93.w,
          radius: 9.w,
          playerId: player.playerId,
          backgroundColor: AppColors.cD9D9D9,
        ),
        Positioned(
            left: 3.5.w,
            top: 4.w,
            child: OutlinedText(
              text: Utils.getPlayBaseInfo(player.playerId).grade,
              textStyle: 21.w4(
                color: AppColors.c262626,
                height: 0.8,
                fontFamily: FontFamily.fRobotoBlack,
              ),
            )),
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
    );
  }

  Widget _playerchartWidget(List<PlayerStrengthRankTrendList> item, int differenceScore) {
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
                      color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          // 如果是最后一个点，则返回一个特定样式的点
                          if (index == data.length - 1) {
                            return FlDotCirclePainter(
                                radius: 1.6,
                                color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                                strokeColor: Colors.white,
                                strokeWidth: 1.6);
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
                              colors: differenceScore >= 0
                                  ? [AppColors.c0FA76C.withOpacity(0.3), AppColors.c0FA76C.withOpacity(0.1)]
                                  : [AppColors.cE34D4D.withOpacity(0.3), AppColors.cE34D4D.withOpacity(0.1)])))
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
