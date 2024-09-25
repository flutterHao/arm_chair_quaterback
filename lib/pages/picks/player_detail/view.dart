import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
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
  Widget _buildView(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _leverWidget(context),
              9.vGap,
              Text(
                "Ability",
                style: 19.w7(color: AppColors.c262626, height: 1),
              ),
              10.vGap,
              LayoutBuilder(builder: (context, constraints) {
                return Wrap(
                  spacing: 9.w,
                  runSpacing: 9.w,
                  children: List.generate(
                      6,
                      (index) => Container(
                            width: (constraints.maxWidth - 9.w * 2) / 3,
                            height: 51.w,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          )),
                );
              }),
              24.vGap,
              Text(
                "Potential",
                style: 19.w7(color: AppColors.c262626, height: 1),
              ),
              13.vGap,
              LayoutBuilder(builder: (context, constraints) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.w),
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(16.w)),
                  child: Wrap(
                    spacing: 9.w,
                    runSpacing: 9.w,
                    children: List.generate(
                        6,
                        (index) => SizedBox(
                              width:
                                  (constraints.maxWidth - 9.w * 2 - 16.w * 2) /
                                      3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "206",
                                        style: 19.w7(
                                            color: AppColors.c262626,
                                            height: 1),
                                      ),
                                      Text("/500",
                                          style:
                                              10.w4(color: AppColors.cB3B3B3))
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
                            )),
                  ),
                );
              }),
              18.vGap,
              Center(
                child: InkWell(
                  onTap: () {
                    _upgradeDialog(context);
                  },
                  child: SizedBox(
                    width: 203.w,
                    child: BtnBackground(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        Text(
                          "UPGRADE",
                          style: 18.w7(color: AppColors.cF2F2F2),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 11.w),
                            child: IconWidget(
                                iconHeight: 14.w,
                                iconWidth: 14.w,
                                icon: Assets.uiIconArrowsPng))
                      ],
                    )),
                  ),
                ),
              ),
              13.vGap,
              Text(
                "Price Fluctuation",
                style: 19.w7(color: AppColors.c262626, height: 1),
              ),
              13.vGap,
              Container(
                height: 76.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "JAN 26,2024",
                      style: 10.w4(color: AppColors.cFF7954),
                    ),
                    Row(
                      children: [
                        Text(
                          "395K",
                          style: 36.w7(color: AppColors.c262626, height: 1),
                        ),
                        44.hGap,
                        Text(
                          "-35%",
                          style: 36.w7(color: AppColors.cE72646, height: 1),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              9.vGap,
              Container(
                height: 165.w,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
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
              _buildStats(),
              24.vGap,
              Text(
                "News",
                style: 19.w7(color: AppColors.c262626, height: 1),
              ),
              13.vGap,
              20.vGap
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      24.vGap,
      Text(
        "Stats",
        style: 19.w7(color: AppColors.c262626, height: 1),
      ),
      13.vGap,
      Container(
        height: 135.w,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.cF2F2F2,
            borderRadius: BorderRadius.circular(16.w)),
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
                      child:
                          Text("TEAM", style: 10.w4(color: AppColors.cB3B3B3))),
                  ...List.generate(
                      3,
                      (index) => Container(
                          height: 30.w,
                          width: 77.w,
                          alignment: Alignment.center,
                          child: Text("REG",
                              style: 12.w4(color: AppColors.c818181))))
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Obx(() {
                    return Container(
                      height: 135.w,
                      width: 2.w,
                      decoration: BoxDecoration(
                          boxShadow: controller.statsIsScrolling.value
                              ? [
                                  BoxShadow(
                                    color: AppColors.c262626.withOpacity(.1),
                                    offset: const Offset(0, 2),
                                    blurRadius: 1,
                                    // spreadRadius: 1.0,
                                  )
                                ]
                              : []),
                    );
                  }),
                  SingleChildScrollView(
                    // physics: const BouncingScrollPhysics(),
                    controller: controller.statsScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 7.w),
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        children: [
                          Table(
                            columnWidths: List.generate(
                                8, (index) => FixedColumnWidth(40.w)).asMap(),
                            children: List.generate(
                                1,
                                (index) => TableRow(
                                    children: List.generate(
                                        8,
                                        (index) => Container(
                                            height: 30.w,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "GP",
                                              style: 10
                                                  .w4(color: AppColors.cB3B3B3),
                                            ))))),
                          ),
                          Table(
                            columnWidths: List.generate(
                                8, (index) => FixedColumnWidth(40.w)).asMap(),
                            children: List.generate(
                                3,
                                (index) => TableRow(
                                    children: List.generate(
                                        8,
                                        (index) => Container(
                                            height: 30.w,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "$index",
                                              style: 12
                                                  .w4(color: AppColors.c545454),
                                            ))))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            13.hGap
          ],
        ),
      )
    ]);
  }

  Widget _leverWidget(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      controller.validScreenWidth.value = constraints.maxWidth;
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.w),
        child: SizedBox(
          height: 119.w,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ///背景色块
              Container(
                height: 87.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.circular(16.w)),
              ),

              /// 左边星级评分
              Obx(() {
                return AnimatedPositioned(
                  left: controller.other.value * -100.w,
                  top: 14.w,
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      9.vGap,
                      SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: IconWidget(
                            iconWidth: 32.w,
                            icon: Assets.uiIconPingjiPng,
                            iconHeight: 32.w,
                          )),
                      6.vGap,
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
                                  color: AppColors.cB3B3B3, fontSize: 12.sp),
                            ),
                            10.hGap,
                            Text(
                              "85",
                              style: TextStyle(
                                  color: AppColors.cF1F1F1, fontSize: 12.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),

              /// 右边sal
              Obx(() {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: controller.other.value * -100,
                  top: 14.w,
                  child: Column(
                    children: [
                      9.vGap,
                      SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: IconWidget(
                            iconWidth: 32.w,
                            icon: Assets.uiStateBestPng,
                            iconHeight: 32.w,
                          )),
                      6.vGap,
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
                                  color: AppColors.cB3B3B3, fontSize: 12.sp),
                            ),
                            10.hGap,
                            Text(
                              "250k",
                              style: TextStyle(
                                  color: AppColors.cF1F1F1, fontSize: 12.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),

              /// 背后橙色的渐变光
              Obx(() {
                return Positioned(
                  left: controller.startLeft.value == -1111
                      ? (constraints.maxWidth - 119.w - 16.w) / 2
                      : controller.startLeft.value,
                  child: SizedBox(
                    width: 119.w,
                    height: 87.w,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(16.w)),
                      child: Image.asset(
                        alignment: Alignment.center,
                        Assets.uiLight_01Png,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),

              /// 升级成功的概率
              Obx(() {
                return Positioned(
                    right: 32.w,
                    child: Opacity(
                      opacity: controller.rateBoxOpacity.value,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                  height: 42.w,
                                  width: 84.w,
                                  child: ArcWidget(
                                    42.w,
                                    progressColor: AppColors.cFF7954,
                                    progressWidth: 8.w,
                                    borderColor: AppColors.cB3B3B3,
                                    borderWidth: 3.w,
                                    progressSweepAngle:
                                        controller.rateProgress.value,
                                    borderSweepAngle:
                                        controller.progressBorder.value,
                                  )),
                              Positioned(
                                  bottom: 0.w,
                                  child: Text(
                                    "${((controller.rateProgress.value / 180 * 100) > 100 ? 100 : (controller.rateProgress.value / 180 * 100)).toStringAsFixed(0)}%",
                                    style: 24.w7(
                                        color: AppColors.cFF7954, height: 1),
                                  ))
                            ],
                          ),
                          3.vGap,
                          Text(
                            "Success Rate",
                            style: 12.w4(color: AppColors.cFF7954),
                          )
                        ],
                      ),
                    ));
              }),

              /// 升级后的属性值
              Obx(() {
                return Positioned(
                  left: controller.propertyLeft.value,
                  child: Container(
                    height: 64.w,
                    width: 151.w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.c666666.withOpacity(0),
                          AppColors.c666666
                        ]),
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(32.w))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconWidget(
                                iconWidth: 8.w,
                                icon: Assets.uiIconArrows_01Png),
                            10.hGap,
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 35.w,
                                  icon: Assets.uiIconStar_01Png,
                                  iconColor: AppColors.cFF7954,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5.w),
                                  child: Text(
                                    "6",
                                    style: 21.w7(color: AppColors.c262626),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        3.vGap,
                        Container(
                          height: 16.w,
                          width: 110.w,
                          decoration: BoxDecoration(
                              color: AppColors.c262626,
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Potential",
                                style: 10.w4(color: AppColors.cB3B3B3),
                              ),
                              6.hGap,
                              Text(
                                "+4~8%",
                                style: 12.w4(color: AppColors.cF2F2F2),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),

              /// 居中重叠的五角星
              Obx(() {
                return Positioned(
                  left: controller.startLeft.value == -1111
                      ? (constraints.maxWidth - 119.w - 16.w) / 2
                      : controller.startLeft.value,
                  child: Transform.rotate(
                    angle: controller.starRotate.value * 2 * 3.14159,
                    child: SizedBox(
                      width: 119.w,
                      height: 119.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            Assets.uiIconStar_02Png,
                            height: controller.starSize.value,
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
                  ),
                );
              })
            ],
          ),
        ),
      );
    });
  }

  Future<void> _upgradeDialog(BuildContext context) async {
    controller.upgradeTap();
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.cD8D8D8,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.w))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 11.w,
                    right: 14.w,
                    left: 16.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.w,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.circular(12.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox.shrink(),
                            Text("Grade",
                                style: 13.w4(color: AppColors.cF2F2F2)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconShrinkPng,
                                  iconColor: AppColors.cF2F2F2,
                                ),
                                3.vGap,
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconUnfoldPng,
                                  iconColor: AppColors.cB3B3B3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 24.w,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: AppColors.cE6E6E6,
                            borderRadius: BorderRadius.circular(12.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox.shrink(),
                            Text("Level",
                                style: 13.w4(color: AppColors.c262626)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconShrinkPng,
                                  iconColor: AppColors.cB3B3B3,
                                ),
                                3.vGap,
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconUnfoldPng,
                                  iconColor: AppColors.cB3B3B3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Selected: ",
                            style: 13.w4(color: AppColors.cB3B3B3),
                          ),
                          7.hGap,
                          Text(
                            "2",
                            style: 13.w4(color: AppColors.c10A86A),
                          ),
                          Text(
                            "/5",
                            style: 13.w4(color: AppColors.c262626),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () => Get.back(),
                          child: IconWidget(
                            iconWidth: 18.w,
                            icon: Assets.iconClosePng,
                            iconColor: AppColors.c262626,
                          ))
                    ],
                  ),
                ),
                19.vGap,
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool item = controller.dialogListDatas[index];
                        return InkWell(
                          onTap: () => controller.dialogListItemTap(index),
                          child: Container(
                            height: 84.w,
                            margin: EdgeInsets.only(
                                left: 16.w, right: 16.w, bottom: 9.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w),
                                border: Border.all(
                                    color: item
                                        ? AppColors.c10A86A
                                        : Colors.transparent,
                                    width: 1)),
                            child: Row(
                              children: [
                                13.hGap,
                                Container(
                                  width: 64.w,
                                  height: 64.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cE1E1E1,
                                      borderRadius:
                                          BorderRadius.circular(32.w)),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      IconWidget(
                                          iconWidth: 64.w,
                                          icon: Assets.testTeamLogoPng),
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Text(
                                            "SS",
                                            style:
                                                16.w7(color: AppColors.c262626),
                                          ))
                                    ],
                                  ),
                                ),
                                9.hGap,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Player Name",
                                        style: 16.w4(color: AppColors.c262626),
                                      ),
                                      8.vGap,
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.c666666,
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                            ),
                                            child: Text(
                                              "SG",
                                              style: 10
                                                  .w4(color: AppColors.cF2F2F2),
                                            ),
                                          ),
                                          3.hGap,
                                          SizedBox(
                                            width: 14.w,
                                            height: 14.w,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                IconWidget(
                                                  iconWidth: 14.w,
                                                  icon: Assets.uiIconStar_01Png,
                                                  iconColor: AppColors.cFF7954,
                                                ),
                                                Text(
                                                  "5",
                                                  style: 9.w4(
                                                      color: AppColors.cFFFFFF),
                                                ),
                                              ],
                                            ),
                                          ),
                                          3.hGap,
                                          IconWidget(
                                              iconWidth: 12.w,
                                              icon: Assets.uiStateBestPng)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                20.hGap,
                                Container(
                                  width: 81.w,
                                  height: 56.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.ce5e5e5, width: 1),
                                      borderRadius:
                                          BorderRadius.circular(12.w)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("+25%",
                                          style: 21.w7(
                                              color: AppColors.cFF7954,
                                              height: 1)),
                                      2.vGap,
                                      Text(
                                        "SR",
                                        style: 12.w4(color: AppColors.cFF7954),
                                      )
                                    ],
                                  ),
                                ),
                                15.hGap,
                                Container(
                                  width: 32.w,
                                  height: 32.w,
                                  decoration: BoxDecoration(
                                      color: item
                                          ? AppColors.c10A86A
                                          : AppColors.cB3B3B3,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: IconWidget(
                                      iconWidth: 16.w,
                                      icon: Assets.uiIconRuidgtPng),
                                ),
                                12.hGap
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: controller.dialogListDatas.length,
                    );
                  }),
                ),
              ],
            ),
          );
        });
    controller.dismiss();
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
                              child: Image.asset(Assets.testTeamLogoPng,
                                  height: 80.w)),
                        ), //todo icon换图
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 29.w, bottom: 12.w),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 13.w),
                            child: IconWidget(
                                iconWidth: 64.w, icon: Assets.testTeamLogoPng)),
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
          bodyWidget: _buildView(context),
        );
      },
    );
  }
}
