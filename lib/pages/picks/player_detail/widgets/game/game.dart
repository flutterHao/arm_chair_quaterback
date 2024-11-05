import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/game/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

///
///@auther gejiahui
///created at 2024/10/17/11:23

class PlayerDetailGame extends StatefulWidget {
  const PlayerDetailGame(
      {super.key,
      required this.headHeight,
      required this.upStarSuccessCallBack});

  final double headHeight;
  final Function? upStarSuccessCallBack;

  @override
  State<PlayerDetailGame> createState() => _PlayerDetailGameState();
}

class _PlayerDetailGameState extends State<PlayerDetailGame>
    with AutomaticKeepAliveClientMixin {
  late GameController controller;
  late PlayerDetailController playerDetailController;

  //星级视图高度
  var levelWidgetHeight = 119.w;

  var scrollController = ScrollController();

  // 主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _leverWidget(context),
            9.vGap,
            Container(
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)),
              padding: EdgeInsets.all(14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ability",
                    style: 19.w7(color: AppColors.c262626, height: 1),
                  ),
                  if (playerDetailController.baseInfo != null)
                    LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        height: 190.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _buildBackgroundSmartLabelPieChart(),
                            _buildSmartLabelPieChart()
                          ],
                        ),
                      );
                    }),
                  Text(
                    "Potential",
                    style: 19.w7(color: AppColors.c262626, height: 1),
                  ),
                  13.vGap,
                  LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      height: 130.h,
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(left: 14.w, right: 18.w, top: 5.w),
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          axisLine: const AxisLine(color: AppColors.cD9D9D9),
                          majorTickLines: const MajorTickLines(
                              color: AppColors.cTransparent),
                          labelStyle: 10.w4(color: AppColors.cB2B2B2),
                        ),
                        primaryYAxis: NumericAxis(
                          isVisible: true,
                          minimum: 0,
                          maximum: controller.getMaxValue(),
                          labelStyle: 10.w4(color: AppColors.cB2B2B2),
                          axisLine:
                              const AxisLine(color: AppColors.cTransparent),
                          majorGridLines: const MajorGridLines(
                              color: AppColors.cD9D9D9,
                              width: 1,
                              dashArray: [3, 2]),
                          majorTickLines: const MajorTickLines(
                              color: AppColors.cTransparent),
                        ),
                        tooltipBehavior: TooltipBehavior(
                            enable: true, header: '', canShowMarker: false),
                        series: <ColumnSeries<ChartSampleData, String>>[
                          ColumnSeries<ChartSampleData, String>(
                            width: 0.2,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10.w)),
                            dataSource: controller.getPotentialData(),
                            xValueMapper: (ChartSampleData datum, int index) {
                              return datum.x as String;
                            },
                            yValueMapper: (ChartSampleData datum, int index) {
                              return datum.y;
                            },
                            pointColorMapper:
                                (ChartSampleData datum, int index) {
                              return datum.pointColor;
                            },
                            dataLabelSettings: DataLabelSettings(
                                builder: (data, point, series, pointIndex,
                                    seriesIndex) {
                                  // 根据数据值设置标签颜色
                                  Color labelColor =
                                      Utils.getChartColor(point.y);
                                  var y = point.y;
                                  if (y == controller.SPECIALVALUE) {
                                    y = 0;
                                  }
                                  return Text(
                                    '${y?.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: labelColor,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                                isVisible: true,
                                textStyle: 10.w7(color: AppColors.c10A86A)),
                          )
                        ],
                      ),
                      // child:
                    );
                  }),
                  18.vGap,
                  if (controller.starUpDefineEntity != null)
                    Center(
                      child: InkWell(
                        onTap: () {
                          _upgradeDialog(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.cFF7954, width: 2.w),
                              borderRadius: BorderRadius.circular(18.h)),
                          height: 36.h,
                          width: 303.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox.shrink(),
                              Text(
                                "UPGRADE",
                                style: 18.w7(color: AppColors.cFF7954),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 11.w),
                                  child: IconWidget(
                                    iconHeight: 14.w,
                                    iconWidth: 14.w,
                                    icon: Assets.uiIconArrowsPng,
                                    iconColor: AppColors.cFF7954,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            20.vGap,
          ],
        ),
      ),
    );
  }

  Widget _leverWidget(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('constraints.maxWidth:${constraints.maxWidth}');
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.w),
        child: SizedBox(
          height: levelWidgetHeight,
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
                              "${playerDetailController.baseInfo?.playerScore}",
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
                              "${playerDetailController.baseInfo?.salary}",
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
                  left: (constraints.maxWidth - levelWidgetHeight - 16.w) /
                          2 *
                          controller.startLeft.value +
                      ((1 - controller.startLeft.value) * -15.w),
                  child: SizedBox(
                    width: levelWidgetHeight,
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
                            SizedBox(
                              width: 50.w,
                              height: 8.w,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Positioned(
                                    right: 17.w,
                                    child: IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconArrows_01Png,
                                      iconColor:
                                          AppColors.cF2F2F2.withOpacity(.2),
                                    ),
                                  ),
                                  Positioned(
                                    right: 11.w,
                                    child: IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconArrows_01Png,
                                      iconColor:
                                          AppColors.cF2F2F2.withOpacity(.5),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5.w,
                                    child: IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconArrows_01Png,
                                      iconColor: AppColors.cF2F2F2,
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                    "${controller.uuidPlayerInfo?.getNextBreakThroughGrade() ?? 2}",
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
                          width: 94.w,
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
                                "+${controller.starUpDefineEntity?.getPotantialMin().toStringAsFixed(0) ?? 0}~${controller.starUpDefineEntity?.getPotantialMax().toStringAsFixed(0) ?? 0}%",
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
                  left: (constraints.maxWidth - levelWidgetHeight - 16.w) /
                          2 *
                          controller.startLeft.value +
                      ((1 - controller.startLeft.value) * -15.w),
                  child: Transform.rotate(
                    angle: controller.starRotate.value * 2 * 3.14159,
                    child: SizedBox(
                      width: levelWidgetHeight,
                      height: levelWidgetHeight,
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
                              "${controller.uuidPlayerInfo?.getBreakThroughGrade() ?? 1}",
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
        isScrollControlled: true,
        builder: (context) {
          return Obx(() {
            var choiceList =
                controller.teamPlayerList.where((e) => e.choice).toList();
            var money = Get.find<HomeController>()
                    .userEntiry
                    .teamLoginInfo
                    ?.getMoney() ??
                0;
            var cost = 0.0;
            for (int i = 0; i < choiceList.length; i++) {
              cost += choiceList[i].getCost();
            }
            return Container(
              height: MediaQuery.of(context).size.height -
                  widget.headHeight -
                  levelWidgetHeight,
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
                        InkWell(
                          onTap: () => controller.sort(0),
                          child: Container(
                            height: 24.w,
                            width: 92.w,
                            decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.circular(12.w)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox.shrink(),
                                Text("Star",
                                    style: 13.w4(color: AppColors.cF2F2F2)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconShrinkPng,
                                      iconColor: !controller.isGradeSort &&
                                              !controller.breakThroughGradeSort
                                          ? AppColors.cF2F2F2
                                          : AppColors.cB3B3B3,
                                    ),
                                    3.vGap,
                                    IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconUnfoldPng,
                                      iconColor: !controller.isGradeSort &&
                                              controller.breakThroughGradeSort
                                          ? AppColors.cF2F2F2
                                          : AppColors.cB3B3B3,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.sort(1),
                          child: Container(
                            height: 24.w,
                            width: 92.w,
                            decoration: BoxDecoration(
                                color: AppColors.cE6E6E6,
                                borderRadius: BorderRadius.circular(12.w)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox.shrink(),
                                Text("Grade",
                                    style: 13.w4(color: AppColors.c262626)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconShrinkPng,
                                      iconColor: controller.isGradeSort &&
                                              !controller.gradeSort
                                          ? AppColors.cF2F2F2
                                          : AppColors.cB3B3B3,
                                    ),
                                    3.vGap,
                                    IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconUnfoldPng,
                                      iconColor: controller.isGradeSort &&
                                              controller.gradeSort
                                          ? AppColors.cF2F2F2
                                          : AppColors.cB3B3B3,
                                    )
                                  ],
                                )
                              ],
                            ),
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
                              "${choiceList.length}",
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        controller.teamPlayerList.isEmpty
                            ? Center(
                                child: LoadStatusWidget(
                                  text: LoadDataStatus.noData.desc,
                                ),
                              )
                            : ListView.builder(
                                controller: scrollController,
                                physics: OneBoundaryScrollPhysics(
                                    scrollController: scrollController),
                                itemBuilder: (context, index) {
                                  var item = controller.teamPlayerList[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.dialogListItemTap(index);
                                    },
                                    child: Container(
                                      height: 84.w,
                                      margin: EdgeInsets.only(
                                          left: 16.w,
                                          right: 16.w,
                                          bottom:
                                              controller.teamPlayerList.length -
                                                          1 ==
                                                      index
                                                  ? 100
                                                  : 9.w),
                                      decoration: BoxDecoration(
                                          color: AppColors.cF2F2F2,
                                          borderRadius:
                                              BorderRadius.circular(16.w),
                                          border: Border.all(
                                              color: item.choice
                                                  ? AppColors.c10A86A
                                                  : Colors.transparent,
                                              width: 1)),
                                      child: Row(
                                        children: [
                                          13.hGap,
                                          PlayerAvatarWidget(
                                            width: 64.w,
                                            playerId: item.teamPlayer.playerId
                                                .toInt(),
                                            fontColor: AppColors.c262626,
                                          ),
                                          9.hGap,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  item.baseInfo.ename,
                                                  style: 16.w4(
                                                      color: AppColors.c262626),
                                                ),
                                                8.vGap,
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColors.c666666,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                      ),
                                                      child: Text(
                                                        item.baseInfo.position,
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .cF2F2F2),
                                                      ),
                                                    ),
                                                    3.hGap,
                                                    SizedBox(
                                                      width: 14.w,
                                                      height: 14.w,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          IconWidget(
                                                            iconWidth: 14.w,
                                                            icon: Assets
                                                                .uiIconStar_01Png,
                                                            iconColor: AppColors
                                                                .cFF7954,
                                                          ),
                                                          Text(
                                                            "${item.teamPlayer.breakThroughGrade}",
                                                            style: 9.w4(
                                                                color: AppColors
                                                                    .cFFFFFF),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    3.hGap,
                                                    IconWidget(
                                                        iconWidth: 12.w,
                                                        icon: Assets
                                                            .uiStateBestPng)
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
                                                    color: AppColors.ce5e5e5,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.w)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "+${(item.getUPPercent() * 100).toStringAsFixed(0)}%",
                                                    style: 21.w7(
                                                        color:
                                                            AppColors.cFF7954,
                                                        height: 1)),
                                                2.vGap,
                                                // Text(
                                                //   "SR",
                                                //   style: 12.w4(color: AppColors.cFF7954),
                                                // )
                                              ],
                                            ),
                                          ),
                                          15.hGap,
                                          Container(
                                            width: 32.w,
                                            height: 32.w,
                                            decoration: BoxDecoration(
                                                color: item.choice
                                                    ? AppColors.c10A86A
                                                    : AppColors.cB3B3B3,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.w)),
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
                                itemCount: controller.teamPlayerList.length,
                              ),
                        Positioned(
                            bottom: 29.w,
                            child: SizedBox(
                              width: 203.w,
                              child: InkWell(
                                onTap: () {
                                  print('----');
                                  if (choiceList.isEmpty) {
                                    return;
                                  }
                                  if (money < cost) {
                                    return;
                                  }
                                  controller.levelUpTap(context);
                                },
                                child: BtnBackground(
                                    child: Container(
                                  padding:
                                      EdgeInsets.only(left: 30.w, right: 15.w),
                                  alignment: Alignment.center,
                                  height: 36.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "LEVEL UP",
                                        style: 18.w7(
                                            color: AppColors.cF2F2F2,
                                            height: 1),
                                      ),
                                      Row(
                                        children: [
                                          IconWidget(
                                            iconWidth: 15.w,
                                            icon: Assets.uiIconMoneyPng,
                                            iconColor: AppColors.cF2F2F2,
                                          ),
                                          4.hGap,
                                          Text(
                                            "${cost}k",
                                            style: 12.w4(
                                                color: money < cost
                                                    ? AppColors.cE72646
                                                    : AppColors.cF2F2F2,
                                                height: 1),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
    controller.dismiss();
  }

  SfCircularChart _buildSmartLabelPieChart() {
    return SfCircularChart(
      // title: ChartTitle(
      //     text: isCardView ? '' : 'Gold medals count in Rio Olympics'),
      series: _getSmartLabelPieSeries(),
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  SfCircularChart _buildBackgroundSmartLabelPieChart() {
    return SfCircularChart(
      // title: ChartTitle(
      //     text: isCardView ? '' : 'Gold medals count in Rio Olympics'),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            animationDuration: 0,
            dataSource: controller.dataSource,
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) =>
                (data.yValue! < 5 ? 10 : data.yValue),
            pointColorMapper: (data, _) => AppColors.ce5e5e5,
            pointRadiusMapper: (data, _) => data.y.toString(),
            explodeAll: true,
            explodeOffset: '3%',
            explode: true,
            dataLabelSettings: DataLabelSettings(
                margin: EdgeInsets.zero,
                isVisible: true,
                builder:
                    (data, point, series, int pointIndex, int seriesIndex) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    decoration: BoxDecoration(
                        color: AppColors.cE6E6E6,
                        borderRadius: BorderRadius.circular(15.h)),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "${(data as ChartSampleData).x}:  ",
                          style: 10.w4(color: AppColors.cB3B3B3, height: 1)),
                      TextSpan(
                          text: (data).secondSeriesYValue!.toStringAsFixed(0),
                          style: 12.w7(color: AppColors.c262626, height: 1))
                    ])),
                  );
                },
                labelPosition: ChartDataLabelPosition.outside,
                connectorLineSettings: const ConnectorLineSettings(
                    color: AppColors.cB3B3B3,
                    type: ConnectorType.curve,
                    length: '10%'),
                labelIntersectAction: LabelIntersectAction.shift))
      ],
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  List<PieSeries<ChartSampleData, String>> _getSmartLabelPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
        animationDuration: 0,
        dataSource: controller.dataSource,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) =>
            (data.yValue! < 5 ? 10 : data.yValue),
        pointColorMapper: (data, _) => AppColors.c3B93FF,
        pointRadiusMapper: (data, _) => data.yValue.toString(),
        explodeAll: true,
        explodeOffset: '3%',
        explode: true,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('PlayerDetailGame----build---');
    playerDetailController = Get.find();
    controller = Get.put(GameController(
        playerDetailController.arguments, widget.upStarSuccessCallBack));
    return GetBuilder<GameController>(
        id: GameController.idPlayerDetailGameMain,
        builder: (logic) {
          return Obx(() {
            if (controller.loadStatus.value != LoadDataStatus.success) {
              return Center(
                child: LoadStatusWidget(
                  loadDataStatus: controller.loadStatus.value,
                  onRefreshTap: controller.reloadData,
                ),
              );
            }
            return _buildView(context);
          });
        });
  }

  @override
  bool get wantKeepAlive => true;
}
