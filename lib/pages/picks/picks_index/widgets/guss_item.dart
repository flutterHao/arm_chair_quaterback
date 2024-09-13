import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/rank_start_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/10/10:58

class GussItem extends StatefulWidget {
  const GussItem({super.key});

  @override
  State<GussItem> createState() => _GussItemState();
}

class _GussItemState extends State<GussItem>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  var scrollValue = 0.0.obs;

  var currentIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.animation?.addListener(() {
      scrollValue.value = tabController.animation?.value ?? 0;
    });
    tabController.addListener(() => currentIndex.value = tabController.index);
  }

  FlTitlesData get titlesData => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget _generateBarChart() {
    List<BarChartGroupData> barGroups = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
              toY: 10,
              width: 6.w,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(2)),
              color: AppColors.cFF7954)
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
              toY: 15,
              width: 6.w,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(2)),
              color: AppColors.cFF7954)
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
              toY: 8,
              width: 6.w,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(2)),
              color: AppColors.c000000.withOpacity(.5))
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
              toY: 13,
              width: 6.w,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(2)),
              color: AppColors.cFF7954)
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
              toY: 7,
              width: 6.w,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(2)),
              color: AppColors.c000000.withOpacity(.5))
        ],
      ),
    ];

    return BarChart(BarChartData(
        barGroups: barGroups,
        titlesData: titlesData,
        borderData: FlBorderData(show: false)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 109.w,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.w),
      padding:
          EdgeInsets.only(top: 13.w, bottom: 10.w, left: 13.w, right: 11.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(20.w)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      constraints: BoxConstraints(maxHeight: 500.w),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.cE6E6E6,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(22.w),
                                    topLeft: Radius.circular(22.w))),
                          ),
                          Container(
                            height: 42.w,
                            decoration: BoxDecoration(
                                color: AppColors.cFF7954,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(22.w),
                                    topLeft: Radius.circular(22.w))),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.c262626,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(22.w),
                                        topLeft: Radius.circular(22.w))),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              height: 42.w,
                                              width: 42.w,
                                              child: Image.asset(
                                                Assets.iconClosePng,
                                                width: 13.w,
                                              )),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 27.w, bottom: 17.w),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              SizedBox(
                                                width: 70.w,
                                                height: 70.w,
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                child: Center(
                                                  child: Container(
                                                      width: 60.w,
                                                      height: 60.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      32.w))),
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 6.w,
                                                  child: Container(
                                                      width: 63.w,
                                                      height: 55.w,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Image.asset(
                                                        Assets.testTeamLogoPng,
                                                        width: 55.w,
                                                        fit: BoxFit.fitWidth,
                                                      ))),
                                              Text(
                                                "SS",
                                                style: TextStyle(
                                                    color: AppColors.cF2F2F2,
                                                    fontSize: 21.w,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 9.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Star Name",
                                                  style: TextStyle(
                                                      color: AppColors.cD9D9D9,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "NYY SF/SF",
                                                  style: TextStyle(
                                                      color: AppColors.c666666,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "How will PLAYERNAME do vs MIN Twins?",
                                                  style: TextStyle(
                                                      color: AppColors.cFF7954,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 30.w,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 27.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 62.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "LAST 5",
                                        style: TextStyle(
                                            color: AppColors.c666666,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    Container(
                                      width: 62.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "STAT",
                                        style: TextStyle(
                                            color: AppColors.c666666,
                                            fontSize: 12.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (_, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: 75.w,
                                            color: AppColors.cF2F2F2,
                                            padding:
                                                EdgeInsets.only(left: 27.w),
                                            child: Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 62.w,
                                                      height: 32.w,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 12.w),
                                                            child: 1.hLine,//todo 换成箭头图片
                                                          ),
                                                          _generateBarChart()
                                                        ],
                                                      ),
                                                    ),
                                                    3.vGap,
                                                    Text("L5 Avg.4.8",
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .c666666))
                                                  ],
                                                ),
                                                18.hGap,
                                                Container(
                                                  width: 62.w,
                                                  height: 55.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.w),
                                                      border: Border.all(
                                                          color:
                                                              AppColors.ce5e5e5,
                                                          width: 1)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "25.6",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .cFF7954),
                                                      ),
                                                      Text(
                                                        "PTS",
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            color: AppColors
                                                                .cFF7954),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    print('点击了more');
                                                  },
                                                  child: Container(
                                                    height: 24.w,
                                                    width: 83.w,
                                                    margin: EdgeInsets.only(
                                                        left: 24.w),
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.w),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.cFF7954,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12.w)),
                                                    child: Text.rich(
                                                        textAlign:
                                                            TextAlign.start,
                                                        TextSpan(children: [
                                                          TextSpan(
                                                              text: "MORE",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text: " +1.5",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      9.sp))
                                                        ])),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    print('点击了less');
                                                  },
                                                  child: Container(
                                                    height: 24.w,
                                                    width: 83.w,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.w),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .cFF7954,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12.w)),
                                                    child: Text.rich(
                                                        TextSpan(children: [
                                                      TextSpan(
                                                          text: "LESS",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .cFF7954,
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                          text: " +1.5",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .cFF7954,
                                                              fontSize: 9.sp))
                                                    ])),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          //todo index==9
                                          Divider(
                                            height: index == 9 ? 70.w : 2.w,
                                            color: AppColors.cE6E6E6,
                                          )
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                          //下注
                          Positioned(
                              left: 63.w,
                              right: 63.w,
                              bottom: 20.w,
                              child: const RankStartButton())
                        ],
                      ),
                    );
                  });
            },
            child: SizedBox(
              height: 55.w,
              child: TabBarView(
                  controller: tabController,
                  children: List.generate(
                    3, //todo
                    (index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // print('点击了头像');
                            Get.toNamed(RouteNames.picksPlayerDetail,
                                id: GlobalNestedKey.PICKS);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.ce5e5e5,
                                borderRadius: BorderRadius.circular(26.w)),
                            child: Stack(children: [
                              Image.asset(
                                Assets.testTeamLogoPng,
                                width: 55.w,
                              ),
                              Text("SS", style: 14.w7(color: AppColors.c262626))
                            ]),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 89.w),
                          margin: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PLAYER NAME",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.c666666),
                              ),
                              Text(
                                "vs nop 8:05am",
                                style: TextStyle(
                                    color: AppColors.cB3B3B3, fontSize: 8.sp),
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              Text(
                                "PPG: 26P",
                                style: TextStyle(
                                    color: AppColors.cB3B3B3, fontSize: 8.sp),
                              ),
                              Text(
                                "L10: 26.7P",
                                style: TextStyle(
                                    color: AppColors.cB3B3B3, fontSize: 8.sp),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 62.w,
                          height: 55.w,
                          margin: EdgeInsets.only(left: 9.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.w),
                              border: Border.all(
                                  color: AppColors.ce5e5e5, width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("25.6",
                                  style: 18.w7(color: AppColors.cFF7954)),
                              Text(
                                "PTS",
                                style: TextStyle(
                                    fontSize: 11.sp, color: AppColors.cFF7954),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 11.w),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  print('点击了more');
                                },
                                child: Container(
                                  height: 24.w,
                                  width: 83.w,
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cFF7954,
                                      borderRadius:
                                          BorderRadius.circular(12.w)),
                                  child: Text.rich(
                                      textAlign: TextAlign.start,
                                      TextSpan(children: [
                                        TextSpan(
                                            text: "MORE",
                                            style: 11
                                                .w7(color: AppColors.cFFFFFF)),
                                        TextSpan(
                                            text: " +1.5",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9.sp))
                                      ])),
                                ),
                              ),
                              SizedBox(
                                height: 7.w,
                              ),
                              InkWell(
                                onTap: () {
                                  print('点击了less');
                                },
                                child: Container(
                                  height: 24.w,
                                  width: 83.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.cFF7954, width: 1),
                                      borderRadius:
                                          BorderRadius.circular(12.w)),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "LESS",
                                        style: 11.w7(color: AppColors.cFF7954)),
                                    TextSpan(
                                        text: " +1.5",
                                        style: TextStyle(
                                            color: AppColors.cFF7954,
                                            fontSize: 9.sp))
                                  ])),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          //滚动指示器
          Container(
            margin: EdgeInsets.only(top: 12.w, right: 4.w, left: 4.w),
            child: Column(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 1.w,
                        width: double.infinity,
                        decoration:
                            const BoxDecoration(color: AppColors.cD8D8D8),
                      ),
                      Obx(() => Container(
                            width: 8.w,
                            height: 2.w,
                            margin: EdgeInsets.only(
                                left: (constraints.maxWidth /
                                                tabController.length -
                                            8.w) /
                                        2 +
                                    (constraints.maxWidth /
                                            tabController.length) *
                                        scrollValue.value),
                            decoration: BoxDecoration(
                                color: AppColors.cFF7954,
                                borderRadius: BorderRadius.circular(1.w)),
                          ))
                    ],
                  );
                }),
                // SizedBox(
                //   height: 8.w,
                // ),
                Container(
                  height: 24.w,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        tabController.length,
                        (index) => Obx(
                              () => InkWell(
                                onTap: () => tabController.animateTo(index),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  alignment: Alignment.centerRight,
                                  child: Text("PTS",
                                      style: TextStyle(
                                          color: currentIndex.value == index
                                              ? AppColors.c1A1A1A
                                              : AppColors.cB3B3B3,
                                          fontSize: 11.sp)),
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
