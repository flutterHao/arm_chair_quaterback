import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/DashedLine.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
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
                binding: TradeIndexBinding());
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
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
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
                  text: controller.loadStatus.value.desc,
                  onRefreshTap: controller.refreshData,
                ),
              );
              return Container(
                padding: EdgeInsets.only(top: appBarHeight),
                child: SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () => controller.refreshData(),
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
                                                alignment:
                                                    Alignment.bottomCenter,
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
                                                                left: totalProgress *
                                                                    itemWidth,
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              4.w),
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
                                                                children: List
                                                                    .generate(
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
                                                  Column(
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
                                                            "999,999,999",
                                                            style: 19.w7(
                                                                color: AppColors
                                                                    .cD9D9D9,
                                                                height: 1),
                                                          ),
                                                          8.hGap,
                                                          Row(
                                                            children: [
                                                              IconWidget(
                                                                iconWidth: 8.w,
                                                                icon: Assets
                                                                    .uiTriangleGPng,
                                                                iconColor:
                                                                    AppColors
                                                                        .c23E8A9,
                                                              ),
                                                              Text(
                                                                "19.6%",
                                                                style: 10.w4(
                                                                    color: AppColors
                                                                        .c23E8A9,
                                                                    height: 1),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      11.vGap,
                                                      Expanded(
                                                        child: Container(
                                                          // height: 90.w,
                                                          width: 175.w,
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
                                                  30.hGap,
                                                  Column(
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
                                                            "999K",
                                                            style: 19.w7(
                                                                color: AppColors
                                                                    .cD9D9D9,
                                                                height: 1),
                                                          )
                                                        ],
                                                      ),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: 110.w,
                                                        // height: 82.w,
                                                        child: SfCircularChart(
                                                          margin:
                                                              EdgeInsets.zero,
                                                          series:
                                                              _getDefaultDoughnutSeries(),
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
                              _buildView(context, controller),
                              //sell
                              _buildView(context, controller),
                            ],
                          )),
                ),
              );
            });
          },
          floatWidgets: [],
        );
      },
    );
  }

  Column _buildView(BuildContext context, TradeIndexController controller) {
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
            child: ListView.separated(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  bool isGood = index % 2 != 0;
                  bool isSpecial = index == 0;
                  Widget child = Container(
                    margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: index == 9?100:0),//todo 换成最后一个下标
                    height: 79.w,
                    decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Row(
                      children: [
                        9.hGap,
                        PlayerAvatarWidget(
                          playerBaseInfo: null,
                          width: 55.w,
                          backgroundColor: AppColors.cE1E1E1,
                          fontColor: AppColors.c262626,
                        ),
                        6.hGap,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Player Name",
                              style: 12.w4(color: AppColors.c262626, height: 1),
                            ),
                            3.vGap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "PF",
                                  style:
                                      9.w4(color: AppColors.c262626, height: 1),
                                ),
                                7.hGap,
                                Text(
                                  "PTS:",
                                  style:
                                      9.w4(color: AppColors.cB3B3B3, height: 1),
                                ),
                              ],
                            ),
                            5.vGap,
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                    width: 68.w,
                                    height: 1,
                                    child: const DashedLine(
                                      axis: Axis.horizontal,
                                      dashedHeight: 2,
                                      dashedWidth: 4,
                                      dashedColor: AppColors.c666666,
                                    )),
                                SizedBox(
                                  width: 68.w,
                                  height: 26.w,
                                  child: BarChart(
                                    BarChartData(
                                      barTouchData: controller.barTouchData,
                                      titlesData: controller.titlesData,
                                      borderData: controller.borderData,
                                      barGroups: controller.barGroups,
                                      gridData: controller.gridData,
                                      alignment: BarChartAlignment.spaceAround,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconWidget(
                                    iconWidth: 19.w,
                                    icon: Assets.uiMoney_02Png),
                                3.hGap,
                                Text(
                                  "240K",
                                  style: 16.w7(
                                      color: isGood
                                          ? AppColors.c10A86A
                                          : AppColors.cE72646,
                                      height: 1),
                                ),
                                4.hGap,
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
                                                  .uiIconDecreasingAmplitudePng)),
                                    Container(
                                        height: 16.w,
                                        width: 39.w,
                                        margin: EdgeInsets.only(
                                            top: 6.w, right: 3.w),
                                        decoration: BoxDecoration(
                                            color: isGood
                                                ? AppColors.c10A86A
                                                : AppColors.cE72646,
                                            borderRadius:
                                                BorderRadius.circular(5.w)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "-15%",
                                          style: 12.w4(
                                              color: AppColors.cFFFFFF,
                                              height: 1),
                                        )),
                                  ],
                                )
                              ],
                            ),
                            12.vGap,
                            Container(
                              height: 26.w,
                              width: 121.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.w),
                                  border: Border.all(
                                      color: AppColors.c262626.withOpacity(0.4),
                                      width: 1)),
                              alignment: Alignment.center,
                              child: Text(
                                "BUY",
                                style:
                                    13.w7(color: AppColors.c262626, height: 1),
                              ),
                            )
                          ],
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount in limited time",
                                  style: 14
                                      .w4(color: AppColors.cF2F2F2, height: 1),
                                ),
                                Row(
                                  children: [
                                    IconWidget(
                                        iconWidth: 13.w,
                                        icon: Assets.uiIconCountdownPng),
                                    3.hGap,
                                    Text(
                                      "23:10:59",
                                      style: 14.w4(
                                          color: AppColors.cF2F2F2, height: 1),
                                    )
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
      ],
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          explode: true,
          innerRadius: "25",
          radius: "41",
          animationDuration: 0,
          dataSource: <ChartSampleData>[
            ChartSampleData(
              x: "f",
              y: 3,
              pointColor: AppColors.c27FFBA,
            ),
            ChartSampleData(
              x: 's',
              y: 2,
              pointColor: AppColors.c10A86A,
            ),
            ChartSampleData(
              x: 't',
              y: 5,
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
    return <ChartSampleData>[
      ChartSampleData(x: 0, y: 5),
      ChartSampleData(
        x: 1,
        y: 8,
      ),
      ChartSampleData(
        x: 2,
        y: 11,
      ),
      ChartSampleData(
        x: 3,
        y: 17,
      ),
      ChartSampleData(
        x: 4,
        y: 19,
      ),
      ChartSampleData(
        x: 5,
        y: 27,
      ),
    ];
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
}

