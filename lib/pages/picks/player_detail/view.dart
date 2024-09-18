
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PlayerDetailPage extends GetView<PlayerDetailController> {
  const PlayerDetailPage({super.key});

  // 主视图
  Widget _buildView() {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 119.w,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 87.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              9.vGap,
                              SizedBox(
                                  width: 32.w,
                                  height: 32.w,
                                  child: IconWidget(
                                    iconWidth: 32.w,
                                    icon: Assets.uiIconPingjiPng,
                                    iconHeight: 32.w,
                                  )), //todo 换图
                              3.vGap,
                              Container(
                                height: 26.w,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(13.w))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Score",
                                      style: TextStyle(
                                          color: AppColors.cB3B3B3,
                                          fontSize: 12.sp),
                                    ),
                                    10.hGap,
                                    Text(
                                      "85",
                                      style: TextStyle(
                                          color: AppColors.cF1F1F1,
                                          fontSize: 12.sp),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              9.vGap,
                              SizedBox(
                                  width: 32.w,
                                  height: 32.w,
                                  child: IconWidget(
                                    iconWidth: 32.w,
                                    icon: Assets.uiStateBestPng,
                                    iconHeight: 32.w,
                                  )), // todo 换图
                              3.vGap,
                              Container(
                                height: 26.w,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(13.w))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "SAL",
                                      style: TextStyle(
                                          color: AppColors.cB3B3B3,
                                          fontSize: 12.sp),
                                    ),
                                    10.hGap,
                                    Text(
                                      "250k",
                                      style: TextStyle(
                                          color: AppColors.cF1F1F1,
                                          fontSize: 12.sp),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 87.w,
                      child: IconWidget(
                          iconWidth: 308.w, icon: Assets.uiLight_01Png),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: 119.w,
                        height: 119.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              Assets.uiIconStar_02Png,
                              height: 119.w,
                              fit: BoxFit.fitHeight,
                            ),
                            IconWidget(
                              iconWidth: 68.w,
                              icon: Assets.uiIconStar_01Png,
                              iconColor: AppColors.cFF7954,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.w),
                              child: Text(
                                "5",
                                style: 34.w7(color: AppColors.c262626),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              9.vGap,
              Text(
                "Ability",
                style: 19.w7(color: AppColors.c262626,height: 1),
              ),
              10.vGap,
              SizedBox(
                height: (2 * 51.w) + (9.w * 3),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 108.w,
                        childAspectRatio: 51 / 108,
                        crossAxisCount: 2,
                        mainAxisSpacing: 9.w,
                        crossAxisSpacing: 9.w),
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(16.w)),
                        child: Stack(
                          children: [
                            Positioned(
                                right: 6.w,
                                child: Text("PTS",
                                    style: TextStyle(
                                        height: 1,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.cF2F2F2))),
                            Container(
                              margin: EdgeInsets.only(left: 14.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "3500",
                                    style: 19.w7(color: AppColors.c262626),
                                  ),
                                  Text(
                                    "PTS",
                                    style: 10.w7(color: AppColors.cFF7954),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              24.vGap,
              Text(
                "Potential",
                style: 19.w7(color: AppColors.c262626,height: 1),
              ),
              13.vGap,
              Container(
                height: (2 * 65.w) + (9.w * 3),
                padding: EdgeInsets.symmetric(horizontal:  16.w,vertical: 15.w),
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(16.w)
                ),
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 90.w,
                        childAspectRatio: 65 / 90,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.w,
                        crossAxisSpacing: 9.w),
                    itemBuilder: (_, index) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("206",style: 19.w7(color: AppColors.c262626,height: 1),),
                                Text("/500",style: 10.w4(color: AppColors.cB3B3B3))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 6.w),
                              child: LinearProgressIndicator(
                                color: AppColors.c10A86A,
                                backgroundColor: AppColors.cB3B3B3,
                                value: .6,
                                minHeight: 10.w,
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                            ),
                            Text(
                              "PTS",
                              style: 10.w7(color: AppColors.cFF7954),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              24.vGap,
              Text(
                "Price Fluctuation",
                style: 19.w7(color: AppColors.c262626,height: 1),
              ),
              13.vGap,
              Container(
                height: 76.w,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("JAN 26,2024",style: 10.w4(color: AppColors.cFF7954),),
                    Row(
                      children: [
                        Text("395K",style: 36.w7(color: AppColors.c262626,height: 1),),
                        44.hGap,
                        Text("-35%",style: 36.w7(color: AppColors.cE72646,height: 1),)
                      ],
                    ),

                  ],
                ),
              ),
              9.vGap,
              Container(
                height: 165.w,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)
                ),
                child: Center(
                  child: BarChart(
                    BarChartData(
                      barTouchData: controller.barTouchData,
                      titlesData: controller.titlesData,
                      borderData: controller.borderData,
                      barGroups: controller.barGroups,
                      gridData: controller.gridData,
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 9,
                    ),
                  ),
                ),
              ),
              24.vGap,
              Text(
                "Stats",
                style: 19.w7(color: AppColors.c262626,height: 1),
              ),
              13.vGap,
              Container(
                height: 135.w,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 7.w),
                      child: Column(
                        children: [
                          Container(
                            height: 30.w,
                              width: 77.w,
                              alignment: Alignment.center,
                              child: Text("TEAM",style: 10.w4(color: AppColors.cB3B3B3))),
                          ...List.generate(3, (index)=> Container(
                              height: 30.w,
                              width: 77.w,
                              alignment: Alignment.center,
                              child: Text("REG",style: 12.w4(color: AppColors.c818181))))
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Stack(
                          children: [
                            Container(
                              width: 10.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.cB3B3B3.withOpacity(.3),
                                        offset:const Offset(0, 15),
                                        blurRadius: 15,
                                        spreadRadius: 10.0
                                    )
                                  ]
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 7.w),
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                children: [
                                  Table(
                                    columnWidths: List.generate(8, (index)=>FixedColumnWidth(40.w)).asMap(),
                                    children: List.generate(1, (index)=>TableRow(
                                        children: List.generate(8, (index)=>Container(
                                            height: 30.w,
                                            alignment: Alignment.center,
                                            child: Text("GP",style: 10.w4(color: AppColors.cB3B3B3),)))
                                    )),
                                  ),
                                  Table(
                                    columnWidths: List.generate(8, (index)=>FixedColumnWidth(40.w)).asMap(),
                                    children: List.generate(3, (index)=>TableRow(
                                      children: List.generate(8, (index)=>Container(
                                        height: 30.w,
                                          alignment: Alignment.center,
                                          child: Text("$index",style: 12.w4(color: AppColors.c545454),)))
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    13.hGap
                  ],
                ),
              ),
              24.vGap,
              Text(
                "News",
                style: 19.w7(color: AppColors.c262626,height: 1),
              ),
              13.vGap,
              20.vGap
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerDetailController>(
      builder: (_) {
        return BlackAppWidget(
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: 19.w,
                      height: 19.w,
                      child: InkWell(
                        onTap: () => Get.back(id: GlobalNestedKey.PICKS),
                        child: IconWidget(
                          iconWidth: 19.w,
                          iconHeight: 19.w,
                          icon: Assets.iconBackPng,
                          iconColor: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "PLAYER",
                        style: 19.w7(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              11.vGap,
              Stack(
                children: [
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 130.w,
                        height: 100.w,
                        alignment: Alignment.bottomRight,
                        child: Opacity(
                          opacity: .3,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(32.w)),
                              child: Image.asset(Assets.testTeamLogoPng,height: 80.w)),
                        ), //todo icon换图
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 29.w, bottom: 12.w),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 13.w),
                            child: IconWidget(iconWidth: 64.w, icon: Assets.testTeamLogoPng)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HOU  #6",
                              style: TextStyle(
                                color: AppColors.cB3B3B3,
                                fontSize: 10.sp,
                              ),
                            ),
                            3.vGap,
                            Text(
                              "Player Name",
                              style: TextStyle(
                                color: AppColors.cF2F2F2,
                                fontSize: 16.sp,
                              ),
                            ),
                            3.vGap,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 0.w),
                              decoration: BoxDecoration(
                                  color: AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.circular(2.w)),
                              child: Text("PF",
                                  style: 10.w7(color: AppColors.c262626)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          bodyWidget: _buildView(),
        );
      },
    );
  }
}
