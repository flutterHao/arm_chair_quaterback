import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/DashedLine.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/index.dart';
import 'package:arm_chair_quaterback/pages/trade/trade_index/bindings.dart';
import 'package:arm_chair_quaterback/pages/trade/trade_index/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class TradeIndex extends StatelessWidget {
  const TradeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.TRADETabGlobalKey,
      initialRoute: RouteNames.tradeTradeIndex,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.tradeTradeIndex:
            return GetPageRoute(
              opaque: false,
              settings: setting,
              page: () => const TradeIndexPage(),
              // binding: TradeIndexBinding(),
            );
          case RouteNames.picksPlayerDetail:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                barrierColor: Colors.transparent,
                page: () => PlayerDetailPage(
                      arguments: setting.arguments as PlayerDetailPageArguments,
                    ));
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
        }
      },
    );
  }
}

class TradeIndexPage extends StatefulWidget {
  const TradeIndexPage({super.key});

  @override
  State<TradeIndexPage> createState() => _TradeIndexPageState();
}

class _TradeIndexPageState extends State<TradeIndexPage>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  ScrollController scrollController = ScrollController();
  late TradeIndexController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return GetBuilder<TradeIndexController>(
      id: TradeIndexController.idTradeIndexMain,
      builder: (controller) {
        return BlackAppWidget(
          const UserInfoBar(
            title: "TRADE",
            routeId: GlobalNestedKey.TRADE,
          ),
          totalScreenBuilder: (context, appBarHeight) {
            return Obx(() {
              var emptyWidget = Center(
                child: LoadStatusWidget(
                  loadDataStatus: controller.loadStatus.value,
                  onRefreshTap: controller.refreshData,
                ),
              );
              return Container(
                padding: EdgeInsets.only(top: appBarHeight),
                child: controller.tradeInfoEntity == null
                    ? emptyWidget
                    : NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  16.vGap,
                                  SizedBox(
                                    height: 250.w,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: 0,
                                            top: 65.w,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: 185.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.cD9D9D9,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  16.w))),
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 400.w),
                                                height: 34.w,
                                                margin: EdgeInsets.only(
                                                    left: 16.w,
                                                    right: 16.w,
                                                    bottom: 16.w),
                                                decoration: BoxDecoration(
                                                    color: AppColors.cF2F2F2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.w)),
                                                child: LayoutBuilder(builder:
                                                    (context, constraints) {
                                                  var itemWidth =
                                                      (constraints.maxWidth -
                                                              8.w) /
                                                          controller
                                                              .tabController
                                                              .length;
                                                  return TLBuildWidget(
                                                      controller: controller
                                                          .tabController,
                                                      builder: (current,
                                                          next,
                                                          progress,
                                                          totalProgress) {
                                                        return Stack(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          children: [
                                                            Positioned(
                                                              left:
                                                                  totalProgress *
                                                                      itemWidth,
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 4
                                                                            .w),
                                                                height: 26.w,
                                                                width:
                                                                    itemWidth,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors
                                                                        .c262626,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            26.w)),
                                                              ),
                                                            ),
                                                            Row(
                                                              children:
                                                                  List.generate(
                                                                      controller
                                                                          .tabs
                                                                          .length,
                                                                      (index) =>
                                                                          Expanded(
                                                                            child: InkWell(
                                                                                onTap: () => controller.tabController.animateTo(index),
                                                                                child: Center(
                                                                                    child: Text(controller.tabs[index],
                                                                                        style: 13.w4(
                                                                                          color: current == index
                                                                                              ? Color.lerp(AppColors.cF2F2F2, AppColors.c666666, progress)!
                                                                                              : next == index
                                                                                                  ? Color.lerp(AppColors.c666666, AppColors.cF2F2F2, progress)!
                                                                                                  : AppColors.c666666,
                                                                                        )))),
                                                                          )),
                                                            )
                                                          ],
                                                        );
                                                      });
                                                }),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 184.w,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            padding: EdgeInsets.only(
                                                top: 12.w,
                                                right: 9.w,
                                                left: 12.w,
                                                bottom: 16.w),
                                            decoration: BoxDecoration(
                                                color: AppColors.c262626,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.w)),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Accumulated income",
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .cB3B3B3,
                                                            height: 1),
                                                      ),
                                                      4.vGap,
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            Utils.formatMoney(
                                                                _getTodayCost()),
                                                            style: 19.w7(
                                                                color: AppColors
                                                                    .cD9D9D9,
                                                                height: 1),
                                                          ),
                                                          8.hGap,
                                                          if (_getPercent() !=
                                                              0)
                                                            Row(
                                                              children: [
                                                                IconWidget(
                                                                  iconWidth:
                                                                      8.w,
                                                                  icon: Assets
                                                                      .uiTriangleGPng,
                                                                  iconColor: _getTodayCost() >
                                                                          _getLastDayCost()
                                                                      ? AppColors
                                                                          .c23E8A9
                                                                      : AppColors
                                                                          .cE72646,
                                                                  rotateAngle:
                                                                      _getTodayCost() >
                                                                              _getLastDayCost()
                                                                          ? 0
                                                                          : 180,
                                                                ),
                                                                Text(
                                                                  "${_getPercent().toStringAsFixed(1)}%",
                                                                  style: 10.w4(
                                                                      color: _getTodayCost() >
                                                                              _getLastDayCost()
                                                                          ? AppColors
                                                                              .c23E8A9
                                                                          : AppColors
                                                                              .cE72646,
                                                                      height:
                                                                          1),
                                                                )
                                                              ],
                                                            )
                                                        ],
                                                      ),
                                                      11.vGap,
                                                      Expanded(
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: 175.w,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .c1A1A1A,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.w)),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.w),
                                                            child: Stack(
                                                              children: [
                                                                SfCartesianChart(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  plotAreaBorderWidth:
                                                                      0,
                                                                  primaryXAxis:
                                                                      NumericAxis(
                                                                    labelStyle:
                                                                        const TextStyle(
                                                                            color:
                                                                                AppColors.cTransparent),
                                                                    axisLine:
                                                                        const AxisLine(
                                                                            width:
                                                                                0),
                                                                    majorTickLines:
                                                                        const MajorTickLines(
                                                                            width:
                                                                                0),
                                                                    // 隐藏 X 轴的刻度线
                                                                    labelPosition:
                                                                        ChartDataLabelPosition
                                                                            .inside,
                                                                    tickPosition:
                                                                        TickPosition
                                                                            .inside,
                                                                    plotBands: <PlotBand>[
                                                                      for (var data
                                                                          in _getLineData())
                                                                        PlotBand(
                                                                          start:
                                                                              data.x,
                                                                          // 在每个数据点的 x 位置绘制垂直线
                                                                          end: data
                                                                              .x,
                                                                          borderColor:
                                                                              AppColors.c262626,
                                                                          // 垂直线的颜色
                                                                          borderWidth:
                                                                              1, // 垂直线的宽度
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  // const NumericAxis(
                                                                  //   isVisible: false,
                                                                  //   // axisLine: AxisLine(
                                                                  //   //   color: Colors.red
                                                                  //   // ),
                                                                  //   majorGridLines: MajorGridLines(width: 1),
                                                                  // ),
                                                                  primaryYAxis:
                                                                      const NumericAxis(
                                                                    isVisible:
                                                                        false,
                                                                  ),
                                                                  series:
                                                                      _getAreaZoneSeries(),
                                                                ),
                                                                SfCartesianChart(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  plotAreaBorderWidth:
                                                                      0,
                                                                  primaryXAxis:
                                                                      NumericAxis(
                                                                    labelStyle:
                                                                        const TextStyle(
                                                                            color:
                                                                                AppColors.cTransparent),
                                                                    axisLine:
                                                                        const AxisLine(
                                                                            width:
                                                                                0),
                                                                    majorTickLines:
                                                                        const MajorTickLines(
                                                                            width:
                                                                                0),
                                                                    // 隐藏 X 轴的刻度线
                                                                    labelPosition:
                                                                        ChartDataLabelPosition
                                                                            .inside,
                                                                    tickPosition:
                                                                        TickPosition
                                                                            .inside,
                                                                    plotBands: <PlotBand>[
                                                                      for (var data
                                                                          in _getLineData())
                                                                        PlotBand(
                                                                          start:
                                                                              data.x,
                                                                          // 在每个数据点的 x 位置绘制垂直线
                                                                          end: data
                                                                              .x,
                                                                          borderColor:
                                                                              AppColors.c262626,
                                                                          // 垂直线的颜色
                                                                          borderWidth:
                                                                              1, // 垂直线的宽度
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  primaryYAxis:
                                                                      const NumericAxis(
                                                                    isVisible:
                                                                        false,
                                                                  ),
                                                                  series: [
                                                                    LineSeries<
                                                                            ChartSampleData,
                                                                            num>(
                                                                        animationDuration:
                                                                            0,
                                                                        dataSource:
                                                                            _getLineData(),
                                                                        xValueMapper: (ChartSampleData sales, _) =>
                                                                            sales
                                                                                .x,
                                                                        yValueMapper: (ChartSampleData sales,
                                                                                _) =>
                                                                            sales
                                                                                .y,
                                                                        name:
                                                                            'Germany',
                                                                        markerSettings:
                                                                            const MarkerSettings(isVisible: false))
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                20.hGap,
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Total salary",
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .cB3B3B3,
                                                            height: 1),
                                                      ),
                                                      2.vGap,
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconWidget(
                                                            iconWidth: 28.w,
                                                            icon: Assets
                                                                .uiMoney_02Png,
                                                          ),
                                                          3.hGap,
                                                          Text(
                                                            Utils.formatMoney(controller
                                                                    .tradeInfoEntity
                                                                    ?.totalSalary
                                                                    .getTotal() ??
                                                                0),
                                                            style: 19.w7(
                                                                color: AppColors
                                                                    .cD9D9D9,
                                                                height: 1),
                                                          )
                                                        ],
                                                      ),
                                                      Expanded(
                                                          child: SizedBox(
                                                        // width: 100.w,
                                                        // height: 82.w,
                                                        child: SfCircularChart(
                                                          margin:
                                                              EdgeInsets.zero,
                                                          series:
                                                              _getDefaultDoughnutSeries(
                                                                  controller),
                                                        ),
                                                      )),
                                                      Row(
                                                        children: [
                                                          _buildPieDot(
                                                              AppColors.c27FFBA,
                                                              "main"),
                                                          5.hGap,
                                                          _buildPieDot(
                                                              AppColors.c10A86A,
                                                              "substitute"),
                                                          5.hGap,
                                                          _buildPieDot(
                                                              AppColors.c12714A,
                                                              "else"),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ];
                        },
                        body: TabBarView(
                          controller: controller.tabController,
                          children: [
                            //buy
                            _buildView(controller.tradeInfoEntity!.tradePlayers,
                                context, controller, true),
                            //sell
                            _buildView(controller.sellAllTradePlayers, context,
                                controller, false),
                          ],
                        )),
              );
            });
          },
          floatWidgets: [],
        );
      },
    );
  }

  Column _buildView(List<TradeInfoTradePlayers> tradePlayers,
      BuildContext context, TradeIndexController controller, bool isBuyTab) {
    if (tradePlayers.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadStatusWidget(
            loadDataStatus: LoadDataStatus.noData,
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        18.vGap,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Player List",
            style: 19.w7(color: AppColors.c262626),
          ),
        ),
        10.vGap,
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SmartRefresher(
              onRefresh: () => controller.refreshData(),
              controller: isBuyTab
                  ? controller.buyRefreshController
                  : controller.sellRefreshController,
              child: ListView.separated(
                  itemCount: tradePlayers.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var trendPlayer = tradePlayers[index];
                    var player = Utils.getPlayBaseInfo(trendPlayer.playerId);
                    var basicMarketPrice = (isBuyTab
                            ? trendPlayer.basicMarketPrice
                            : trendPlayer.buyPrice) ??
                        player.basicMarketPrice;
                    var marketPrice = player.marketPrice;
                    bool isGood = basicMarketPrice < marketPrice;
                    double percent = (basicMarketPrice - marketPrice).abs() /
                        basicMarketPrice *
                        100;
                    if (percent.isNaN) {
                      percent = 0;
                    }
                    bool isSpecial = trendPlayer.top ?? false;
                    var color = isGood ? AppColors.c10A86A : AppColors.cE72646;
                    Widget child = Container(
                      margin: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          bottom: index == tradePlayers.length - 1 ? 20 : 0),
                      height: 79.w,
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Row(
                        children: [
                          9.hGap,
                          PlayerAvatarWidget(
                            grade: player.grade,
                            playerId: player.playerId,
                            width: 55.w,
                            backgroundColor: AppColors.cE1E1E1,
                            fontColor: AppColors.c262626,
                          ),
                          6.hGap,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 80.w),
                                  child: Text(
                                    player.ename,
                                    style: 12.w4(
                                        color: AppColors.c262626,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                3.vGap,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      player.position,
                                      style: 9.w4(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                    7.hGap,
                                    Text(
                                      "PTS:${Utils.getPTS(player.playerId).toStringAsFixed(1)}",
                                      style: 9.w4(
                                          color: AppColors.cB3B3B3, height: 1),
                                    ),
                                  ],
                                ),
                                5.vGap,
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 68.w,
                                      height: 26.w,
                                      child: Builder(builder: (context) {
                                        var trend =
                                            trendPlayer.trend.reversed.toList();
                                        var data = List.generate(trend.length,
                                            (index) {
                                          return FlSpot(
                                              index.toDouble() + 1,
                                              trend[index]
                                                  .playerMarketPrice
                                                  .toDouble());
                                        });
                                        data.insert(
                                            0,
                                            FlSpot(0,
                                                basicMarketPrice.toDouble()));
                                        return LineChart(
                                          LineChartData(
                                            lineTouchData: const LineTouchData(
                                                enabled: false),
                                            titlesData: controller.titlesData,
                                            borderData: controller.borderData,
                                            lineBarsData: [
                                              LineChartBarData(
                                                  spots: data,
                                                  color: AppColors.cFF7954,
                                                  dotData: const FlDotData(
                                                      show: false),
                                                  barWidth: 2,
                                                  belowBarData: BarAreaData(
                                                      show: true,
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            AppColors.cFF7954
                                                                .withOpacity(
                                                                    0.3),
                                                            AppColors.cFF7954
                                                                .withOpacity(
                                                                    0.1)
                                                          ])))
                                            ],
                                            gridData: FlGridData(
                                                show: true,
                                                drawHorizontalLine: true,
                                                getDrawingHorizontalLine:
                                                    (value) {
                                                  return const FlLine(
                                                      color: AppColors.cB3B3B3,
                                                      strokeWidth: 1,
                                                      dashArray: [4, 2]);
                                                },
                                                verticalInterval: max(
                                                    basicMarketPrice.toDouble(),
                                                    1),
                                                checkToShowVerticalLine:
                                                    (value) {
                                                  if (value ==
                                                      basicMarketPrice
                                                          .toDouble()) {
                                                    return true;
                                                  }
                                                  return false;
                                                }),
                                          ),
                                        );
                                      }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 121.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 121.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                IconWidget(
                                                    iconWidth: 19.w,
                                                    icon: Assets.uiMoney_02Png),
                                                3.hGap,
                                                Text(
                                                  Utils.formatMoney(
                                                      marketPrice),
                                                  style: 16.w7(
                                                      color: color, height: 1),
                                                )
                                              ],
                                            ),
                                            if (percent != 0)
                                              Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  if (isSpecial)
                                                    Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: IconWidget(
                                                          iconWidth: 14.w,
                                                          icon: Assets
                                                              .uiIconDecreasingAmplitudePng,
                                                          iconColor: color,
                                                        )),
                                                  Container(
                                                      height: 16.w,
                                                      width: 39.w,
                                                      margin: EdgeInsets.only(
                                                          top: 6.w, right: 3.w),
                                                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                                                      decoration: BoxDecoration(
                                                          color: color,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.w)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          "${isGood ? "+" : "-"}${percent.toStringAsFixed(0)}%",
                                                          style: 12.w4(
                                                              color: AppColors
                                                                  .cFFFFFF,
                                                              height: 1),
                                                        ),
                                                      )),
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                      12.vGap,
                                      InkWell(
                                        onTap: () {
                                          if ((trendPlayer.isBuy ?? false) &&
                                              isBuyTab) {
                                            return;
                                          }
                                          if ((trendPlayer.position ?? -1) >=
                                                  0 &&
                                              !isBuyTab) {
                                            EasyLoading.showToast(
                                                "can not sell the line up player");
                                            return;
                                          }
                                          if (isBuyTab) {
                                            controller.buy(player.playerId);
                                          } else {
                                            controller.sell(trendPlayer.uuid!);
                                          }
                                        },
                                        child: Container(
                                          height: 26.w,
                                          constraints:
                                              BoxConstraints(maxWidth: 121.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.w),
                                              border: Border.all(
                                                  color: AppColors.c262626
                                                      .withOpacity(0.4),
                                                  width: 1)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            isBuyTab
                                                ? ((trendPlayer.isBuy ??
                                                            false) &&
                                                        isBuyTab)
                                                    ? "HAVE BOUGHT"
                                                    : "BUY"
                                                : "SELL",
                                            style: 13.w7(
                                                color: ((trendPlayer.isBuy ??
                                                            false) &&
                                                        isBuyTab)
                                                    ? AppColors.cB3B3B3
                                                    : ((trendPlayer.position ??
                                                                    -1) >=
                                                                0 &&
                                                            !isBuyTab)
                                                        ? AppColors.cB3B3B3
                                                        : AppColors.c262626,
                                                height: 1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.hGap,
                        ],
                      ),
                    );
                    if (isSpecial) {
                      child = Stack(
                        children: [
                          Container(
                            height: 79.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                gradient: const LinearGradient(colors: [
                                  AppColors.cB6553B,
                                  AppColors.c262626
                                ])),
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 25.w,
                              margin: EdgeInsets.only(left: 12.w, right: 22.w),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount in limited time",
                                    style: 14.w4(
                                        color: AppColors.cF2F2F2, height: 1),
                                  ),
                                  Row(
                                    children: [
                                      IconWidget(
                                          iconWidth: 13.w,
                                          icon: Assets.uiIconCountdownPng),
                                      3.hGap,
                                      Obx(() {
                                        return Text(
                                          controller.specialTime.value,
                                          style: 14.w4(
                                              color: AppColors.cF2F2F2,
                                              height: 1),
                                        );
                                      })
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 25.w), child: child),
                        ],
                      );
                    }
                    return child;
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 9.w,
                      color: AppColors.cTransparent,
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries(
      TradeIndexController controller) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          explode: true,
          innerRadius: 25.w.toString(),
          radius: 41.w.toString(),
          animationDuration: 0,
          dataSource: <ChartSampleData>[
            ChartSampleData(
              x: "f",
              y: controller.tradeInfoEntity?.totalSalary.main,
              pointColor: AppColors.c27FFBA,
            ),
            ChartSampleData(
              x: 's',
              y: controller.tradeInfoEntity?.totalSalary.substitute,
              pointColor: AppColors.c10A86A,
            ),
            ChartSampleData(
              x: 't',
              y: controller.tradeInfoEntity?.totalSalary.other,
              pointColor: AppColors.c12714A,
            ),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => "",
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }

  List<CartesianSeries<ChartSampleData, num>> _getAreaZoneSeries() {
    return <CartesianSeries<ChartSampleData, num>>[
      AreaSeries<ChartSampleData, num>(
        animationDuration: 0,
        borderColor: AppColors.c10A86A,
        dataSource: _getLineData(),
        name: 'US',
        onCreateShader: (ShaderDetails details) {
          return ui.Gradient.linear(
              details.rect.bottomLeft, details.rect.bottomRight, <Color>[
            AppColors.c3B93FF.withOpacity(0.2),
            AppColors.c3B93FF.withOpacity(0.3),
            AppColors.c3B93FF.withOpacity(0.3),
            AppColors.c3B93FF.withOpacity(0.4),
            AppColors.c3B93FF.withOpacity(0.4),
            AppColors.c3B93FF.withOpacity(0.5),
            AppColors.c3B93FF.withOpacity(0.5),
            AppColors.c3B93FF.withOpacity(0.6),
          ], <double>[
            0.2,
            0.2,
            0.4,
            0.4,
            0.6,
            0.6,
            0.8,
            0.8
          ]);
        },
        xValueMapper: (ChartSampleData sales, _) => sales.x as num,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }

  List<ChartSampleData> _getLineData() {
    var tradeLogs = controller.tradeInfoEntity!.tradeLogs;
    var yesterday = MyDateUtils.getYesterday();
    for (int i = 0; i < 6; i++) {
      var formatDate =
          MyDateUtils.formatDate(yesterday, format: DateFormats.Y_M_D);
      yesterday = MyDateUtils.previousDay(yesterday);
      if (tradeLogs.containsKey(formatDate)) {
        continue;
      } else {
        tradeLogs[formatDate] = 0;
      }
    }
    var sortedEntries = tradeLogs.entries.toList()
      ..sort((a, b) => MyDateUtils.getDateTime(a.key)!
          .millisecond
          .compareTo(MyDateUtils.getDateTime(b.key)!.millisecond));
    var map = Map.fromEntries(sortedEntries);
    var reversed = map.values.toList().reversed.toList();
    List<ChartSampleData> list = [];
    for (int i1 = 0; i1 < reversed.length; i1++) {
      list.add(ChartSampleData(x: i1, y: reversed[i1]));
    }
    return list;
  }

  num _getTodayCost() {
    var getLineData = _getLineData();
    return getLineData[getLineData.length - 1].y ?? 0;
  }

  num _getLastDayCost() {
    var getLineData = _getLineData();
    return getLineData[getLineData.length - 2].y ?? 0;
  }

  num _getPercent() {
    num todayCost = _getTodayCost();
    todayCost = todayCost == 0 ? 1 : todayCost;
    num lastDayCost = _getLastDayCost();
    lastDayCost = lastDayCost == 0 ? 1 : lastDayCost;
    var percent = (todayCost - lastDayCost).abs() / lastDayCost;
    return percent;
  }

  Row _buildPieDot(Color color, String text) {
    return Row(
      children: [
        Container(
          height: 4.w,
          width: 4.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(2.w)),
        ),
        2.hGap,
        Text(
          text,
          style: 10.w4(color: AppColors.c666666, height: 1),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 注册监听器
    WidgetsBinding.instance.addObserver(this);
    Get.find<HomeController>().tabIndex.listen((value) {
      if (value == 3) {
        controller.refreshData();
      }
    });
  }

  @override
  void dispose() {
    // 移除监听器
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    var value = Get.find<HomeController>().tabIndex.value;
    if (state == AppLifecycleState.resumed && value == 3) {
      controller.refreshData();
    }
  }
}
