import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryPage extends GetView<SummaryController> {
  const SummaryPage({required this.playerId, super.key});

  final int playerId;

  // 主视图
  Widget _buildView() {
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummaryController>(
      init: SummaryController(playerId),
      builder: (_) {
        var scrollController1 = ScrollController();

        var scrollController = ScrollController();
        return controller.nbaPlayerBaseInfoEntity == null ? Obx(() {
          return Center(
            child: LoadStatusWidget(
              loadDataStatus: controller.loadStatus.value,),
          );
        }) : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              18.vGap,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Season Average",
                  style: 16.w7(color: AppColors.c262626, height: 1),
                ),
              ),
              Container(
                height: 90.w,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: scrollController1,
                    physics: OneBoundaryScrollPhysics(
                        scrollController: scrollController1),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 62.w,
                        width: 62.w,
                        margin: EdgeInsets.only(
                            right: 4.w,
                            top: 14.w,
                            bottom: 14.w,
                            left: index == 0 ? 16.w : 0),
                        decoration: BoxDecoration(
                            color: AppColors.cF2F2F2,
                            borderRadius: BorderRadius.circular(16.w)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "24.1",
                              style: 19.w7(color: AppColors.c262626, height: 1),
                            ),
                            8.vGap,
                            Text(
                              "PTS",
                              style: 10.w4(color: AppColors.c666666, height: 1),
                            ),
                            1.vGap,
                            Opacity(
                                opacity: index % 2 == 0 ? 1 : 0, //todo
                                child: Text(
                                  "1st",
                                  style: 12
                                      .w7(color: AppColors.cFF7954, height: 1),
                                )),
                            2.vGap
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Recent Performance",
                  style: 16.w7(color: AppColors.c262626, height: 1),
                ),
              ),
              SizedBox(
                height: 48.w,
                child: ListView.builder(
                    itemCount: 10,
                    controller: scrollController,
                    physics: OneBoundaryScrollPhysics(
                        scrollController: scrollController),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        bool isSelected =
                            controller.currentIndex.value == index;
                        return InkWell(
                          onTap: () => controller.currentIndex.value = index,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 4.w,
                                top: 14.w,
                                bottom: 14.w,
                                left: index == 0 ? 16.w : 0),
                            height: 20.w,
                            width: 61.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.c262626
                                    : AppColors.cD9D9D9,
                                borderRadius: BorderRadius.circular(10.w)),
                            child: Text(
                              "PTS",
                              style: 13.w4(
                                  color: isSelected
                                      ? AppColors.cF2F2F2
                                      : AppColors.c262626,
                                  height: 1),
                            ),
                          ),
                        );
                      });
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 70.w,
                          padding: EdgeInsets.only(left: 14.w),
                          decoration: BoxDecoration(
                              color: AppColors.cF2F2F2,
                              borderRadius: BorderRadius.circular(16.w)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Season Avg",
                                style: 14.w4(
                                    color: AppColors.c666666, height: 1),
                              ),
                              10.vGap,
                              Text(
                                "24.1",
                                style: 27.w7(
                                    color: AppColors.c262626, height: 1),
                              )
                            ],
                          ),
                        )),
                    9.hGap,
                    Expanded(
                        child: Container(
                          height: 70.w,
                          padding: EdgeInsets.only(left: 14.w),
                          decoration: BoxDecoration(
                              color: AppColors.cF2F2F2,
                              borderRadius: BorderRadius.circular(16.w)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last 5 Avg",
                                style: 14.w4(
                                    color: AppColors.c666666, height: 1),
                              ),
                              10.vGap,
                              Text(
                                "24.1",
                                style: 27.w7(
                                    color: AppColors.c262626, height: 1),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              9.vGap,
              Container(
                height: 162.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                child: Stack(
                  children: [
                    _buildDefaultColumnChart(),
                  ],
                ),
              ),
              9.vGap,
              Container(
                height: 63.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    image: DecorationImage(
                        image: const AssetImage(Assets.uiIconPickPng),
                        alignment: Alignment.bottomLeft,
                        scale: 0.5,
                        colorFilter: ColorFilter.mode(
                            AppColors.cFF7954.withOpacity(.1),
                            BlendMode.srcIn)),
                    borderRadius: BorderRadius.circular(16.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "PICKS",
                          style: 19.w7(color: AppColors.cFF7954, height: 1),
                        ),
                        5.vGap,
                        Text("oCT 14 vs orl",
                            style: 9.w4(color: AppColors.c666666, height: 1))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 39.w,
                          width: 62.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(
                                  color: AppColors.cE6E6E6, width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "25.6",
                                style:
                                18.w7(color: AppColors.c262626, height: 1),
                              ),
                              Text(
                                "PTS",
                                style: 10.w7(color: AppColors.cB3B3B3),
                              )
                            ],
                          ),
                        ),
                        9.hGap,
                        Container(
                          height: 39.w,
                          width: 110.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.cFF7954, width: 1),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.cF2F2F2,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(8.w))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        IconWidget(
                                          iconWidth: 14.w,
                                          icon: Assets.uiIconUpPng,
                                          iconColor: AppColors.cFF7954,
                                        ),
                                        Text(
                                          "MORE",
                                          style: 10.w7(
                                              color: AppColors.cFF7954),
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                width: 1,
                                height: double.infinity,
                                color: AppColors.cFF7954,
                              ),
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.cF2F2F2,
                                        borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(8.w))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        IconWidget(
                                          iconWidth: 14.w,
                                          icon: Assets.uiIconUpPng,
                                          iconColor: AppColors.cFF7954,
                                          rotateAngle: 180,
                                        ),
                                        Text(
                                          "LESS",
                                          style: 10.w7(
                                              color: AppColors.cFF7954),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              9.vGap,
              Container(
                height: 77.w,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Community Pick",
                      style: 14.w7(color: AppColors.c262626, height: 1),
                    ),
                    8.vGap,
                    Builder(builder: (context) {
                      double morePercent = 71.5;
                      int moreFlex = int.parse(morePercent.toStringAsFixed(0));
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "More(71.5)",
                                  style: 10.w4(color: AppColors.c262626),
                                ),
                                Text(
                                  "PTS 25.6",
                                  style: 12.w4(color: AppColors.c262626),
                                ),
                                Text(
                                  "Less(28.5)",
                                  style: 10.w4(color: AppColors.c262626),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: moreFlex,
                                child: SizedBox(
                                  height: 8.w,
                                  child: LinearProgressIndicator(
                                    value: 1,
                                    color: AppColors.c10A86A,
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                ),
                              ),
                              2.hGap,
                              Expanded(
                                flex: 100 - moreFlex,
                                child: SizedBox(
                                  height: 8.w,
                                  child: LinearProgressIndicator(
                                    value: 1,
                                    color: AppColors.cE72646,
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
              9.vGap,
              Container(
                height: 87.w,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    image: const DecorationImage(
                        image: AssetImage(
                          Assets.testTeamLogoPng,
                        ),
                        alignment: Alignment.topRight,
                        opacity: 0.1),
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "vs ORL",
                      style: 14.w7(color: AppColors.c262626, height: 1),
                    ),
                    10.vGap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "24.1",
                              style: 21.w7(color: AppColors.c262626, height: 1),
                            ),
                            2.vGap,
                            Text(
                              "Oct 14",
                              style: 10.w4(color: AppColors.c666666, height: 1),
                            )
                          ],
                        ),
                        Container(
                          height: 40.w,
                          width: 1,
                          color: AppColors.cD9D9D9,
                        ),
                        Column(
                          children: [
                            Text(
                              "24.1",
                              style: 21.w7(color: AppColors.c262626, height: 1),
                            ),
                            2.vGap,
                            Text(
                              "Oct 14",
                              style: 10.w4(color: AppColors.c666666, height: 1),
                            )
                          ],
                        ),
                        Container(
                          height: 40.w,
                          width: 1,
                          color: AppColors.cD9D9D9,
                        ),
                        Column(
                          children: [
                            Text(
                              "24.1",
                              style: 21.w7(color: AppColors.c262626, height: 1),
                            ),
                            2.vGap,
                            Text(
                              "Oct 14",
                              style: 10.w4(color: AppColors.c666666, height: 1),
                            )
                          ],
                        ),
                        Container(
                          height: 40.w,
                          width: 1,
                          color: AppColors.cD9D9D9,
                        ),
                        Column(
                          children: [
                            Text(
                              "24.1",
                              style: 21.w7(color: AppColors.c262626, height: 1),
                            ),
                            2.vGap,
                            Text(
                              "Oct 14",
                              style: 10.w4(color: AppColors.c666666, height: 1),
                            )
                          ],
                        ),
                        Container(
                          height: 40.w,
                          width: 1,
                          color: AppColors.cD9D9D9,
                        ),
                        Column(
                          children: [
                            Text(
                              "24.1",
                              style: 21.w7(color: AppColors.c262626, height: 1),
                            ),
                            2.vGap,
                            Text(
                              "Oct 14",
                              style: 10.w4(color: AppColors.c666666, height: 1),
                            )
                          ],
                        ),
                        Container(
                          height: 40.w,
                          width: 1,
                          color: AppColors.cD9D9D9,
                        ),
                      ],
                    ),
                    9.vGap
                  ],
                ),
              ),
              18.vGap,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Trade",
                      style: 16.w7(color: AppColors.c262626, height: 1)),
                  TextSpan(
                      text: " (You already have this player )",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1))
                ])),
              ),
              13.vGap,
              Container(
                height: 185.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    color: AppColors.cF2F2F2), //todo
              ),
              9.vGap,
              Container(
                height: 100.w,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    color: AppColors.cF2F2F2),
                padding: EdgeInsets.only(
                    left: 13.w, right: 13.w, top: 13.w, bottom: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Volume of business",
                      style: 14.w7(color: AppColors.c262626, height: 1),
                    ),
                    10.vGap,
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          child: LineChart(LineChartData(
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      interval: 4,
                                      reservedSize: 25.w,
                                      showTitles: true,
                                      getTitlesWidget: (v, data) {
                                        var text = v == 4 ? v : "";
                                        return Text(
                                          "$text",
                                          style:
                                          10.w4(color: AppColors.cB3B3B3),
                                          textAlign: TextAlign.end,
                                        );
                                      })),
                            ),
                            gridData: FlGridData(
                                drawVerticalLine: false,
                                horizontalInterval: 4,
                                getDrawingHorizontalLine: (v) {
                                  return const FlLine(
                                    dashArray: [3, 2],
                                    color: AppColors.cB3B3B3,
                                    strokeWidth: 1,
                                  );
                                },
                                checkToShowHorizontalLine: (value) {
                                  return value == 4;
                                }),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                color: AppColors.c262626,
                                spots: const [
                                  FlSpot(1, 3),
                                  FlSpot(2, 2),
                                  FlSpot(3, 5),
                                  FlSpot(4, 3.1),
                                  FlSpot(5, 4),
                                  FlSpot(6, 3),
                                  FlSpot(7, 4),
                                  FlSpot(8, 3),
                                  FlSpot(9, 2),
                                  FlSpot(10, 5),
                                  FlSpot(11, 3.1),
                                  FlSpot(12, 4),
                                  FlSpot(13, 3),
                                  FlSpot(14, 4),
                                ],
                                dotData: FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) {
                                    return FlDotCirclePainter(
                                      radius: 3,
                                      color: spot.x % 2 == 0
                                          ? AppColors.c10A86A
                                          : AppColors.cE72646,
                                      strokeColor: AppColors.cF2F2F2,
                                      strokeWidth: 1,
                                    );
                                  },
                                ),
                                // isCurved: true,
                                barWidth: 1,
                                isStrokeCapRound: false,
                              ),
                            ],
                          ))),
                    ),
                    // Container(height: 60.w, child: _buildDefaultLineChart()),
                  ],
                ),
              ),
              9.vGap,
              Stack(
                children: [
                  Container(
                    height: 79.w,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        gradient: const LinearGradient(
                            colors: [AppColors.cB6553B, AppColors.c262626])),
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
                            style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                          ),
                          Row(
                            children: [
                              IconWidget(
                                  iconWidth: 13.w,
                                  icon: Assets.uiIconCountdownPng),
                              3.hGap,
                              Text(
                                "23:10:59",
                                style:
                                14.w4(color: AppColors.cF2F2F2, height: 1),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25.w),
                      child: Container(
                        margin: EdgeInsets.only(left: 16.w, right: 16.w),
                        height: 79.w,
                        padding: EdgeInsets.only(left: 17.w, right: 12.w),
                        decoration: BoxDecoration(
                            color: AppColors.cF2F2F2,
                            borderRadius: BorderRadius.circular(16.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Game Quality",
                                  style: 14.w4(color: AppColors.c666666),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "S",
                                      style: 40.w7(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                    11.hGap,
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        IconWidget(
                                          iconWidth: 37.w,
                                          icon: Assets.uiIconStar_01Png,
                                          iconColor: AppColors.cFF7954,
                                        ),
                                        Positioned(
                                            top: 10.w,
                                            child: Text(
                                              "1",
                                              style: 23.w7(
                                                  color: AppColors.cF2F2F2,
                                                  height: 1),
                                            ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
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
                                          color: AppColors.cE72646, height: 1),
                                    ),
                                    4.hGap,
                                    Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconWidget(
                                              iconWidth: 14.w,
                                              icon: Assets
                                                  .uiIconDecreasingAmplitudePng,
                                              iconColor: AppColors.cE72646,
                                            )),
                                        Container(
                                            height: 16.w,
                                            width: 39.w,
                                            margin: EdgeInsets.only(
                                                top: 6.w, right: 3.w),
                                            decoration: BoxDecoration(
                                                color: AppColors.cE72646,
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
                                InkWell(
                                  child: Container(
                                    height: 26.w,
                                    width: 121.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(13.w),
                                        border: Border.all(
                                            color: AppColors.c262626
                                                .withOpacity(0.4),
                                            width: 1)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "BUY",
                                      style: 13.w7(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              19.vGap,
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Text(
                  "Stats",
                  style: 19.w7(color: AppColors.c262626, height: 1),
                ),
              ),
              13.vGap,
              Container(
                width: double.infinity,
                height: 135.w,
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.only(
                    top: 14.w, right: 30.w, left: 14.w, bottom: 14.w),
              ),
              19.vGap,
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Text(
                  "News",
                  style: 19.w7(color: AppColors.c262626, height: 1),
                ),
              ),
              13.vGap,
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.only(
                    top: 14.w, right: 30.w, left: 14.w, bottom: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tyler O'Neill's 465-foot home run run run.Tyler O'Neill's 465-fTyler O'Neill's 465-foot home run run run.Tyler O'Neill's 465-foot home run run run.Tyler O'Neill's 465-foot home run run run.Tyler O'Neill's 465-foot home run run run.",
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12.sp,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,

                      ),
                      // style: 12.w4(
                      //     color: AppColors.c262626,
                      //     height: 1,
                      //     overflow: TextOverflow.ellipsis),
                    ),
                    10.vGap,
                    Text(
                      "2024/07/10 12:05 -via twitter",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    )
                  ],
                ),
              ),
              70.vGap
            ],
          ),
        );
      },
    );
  }

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      margin: const EdgeInsets.all(0),
      plotAreaBorderWidth: 0,
      primaryXAxis: const NumericAxis(
          isVisible: false,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          opposedPosition: true,
          plotBands: <PlotBand>[
            PlotBand(
              start: 40,
              // 虚线的起始位置（y 值）
              end: 40,
              // 虚线的终止位置（y 值），相同值表示一条线
              borderWidth: 1,
              // 虚线的宽度
              borderColor: AppColors.cB3B3B3.withOpacity(0.5),
              // 虚线的颜色
              dashArray: const [3, 2],
              // 设置虚线样式：[线段长度, 间隔长度]
              horizontalTextAlignment: TextAnchor.end,
              verticalTextAlignment: TextAnchor.end,
            ),
          ],
          isVisible: true,
          // labelStyle: 1.w4(color: AppColors.cTransparent),
          axisLine: AxisLine(width: 0),
          majorGridLines:
          MajorGridLines(width: 1, color: Colors.red, dashArray: [2, 2]),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: controller.getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCartesianChart _buildDefaultColumnChart() {
    return SfCartesianChart(
      margin: const EdgeInsets.only(bottom: 0),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(color: AppColors.cD9D9D9, width: 1),
        majorTickLines: const MajorTickLines(size: 0),
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        labelStyle: 9.w4(color: AppColors.cB3B3B3),
      ),
      // 添加标注
      annotations: <CartesianChartAnnotation>[
        CartesianChartAnnotation(
          widget: Text(
            'ProJ\n25.6',
            style: 9.w4(color: AppColors.c262626, height: 1),
          ),
          coordinateUnit: CoordinateUnit.logicalPixel,
          // 设置标注的位置，使其位于虚线的右上方
          x: 325, // X 轴逻辑像素值
          y: 58, // Y 轴逻辑像素值
        ),
      ],
      primaryYAxis: NumericAxis(
        labelStyle: 9.w4(color: AppColors.cB3B3B3),
        plotBands: <PlotBand>[
          PlotBand(
            start: 25.6,
            // 虚线的起始位置（y 值）
            end: 25.6,
            // 虚线的终止位置（y 值），相同值表示一条线
            borderWidth: 1,
            // 虚线的宽度
            borderColor: AppColors.cFF7954.withOpacity(0.5),
            // 虚线的颜色
            dashArray: const [3, 2], // 设置虚线样式：[线段长度, 间隔长度]
          ),
        ],
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(
            width: 1, color: AppColors.cD9D9D9, dashArray: [2, 2]),
      ),
      series: controller.getDefaultColumnSeries(),
      // tooltipBehavior: _tooltipBehavior,
    );
  }
}
