import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class NbaPlayerPage extends GetView<NbaPlayerController> {
  const NbaPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NbaPlayerController());
    return GetBuilder<NbaPlayerController>(
      init: NbaPlayerController(),
      id: "nba_player",
      builder: (_) {
        return Container(
          width: double.infinity,
          height: 409.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.w),
          ),
          margin: EdgeInsets.only(top: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.5.w, top: 22.w),
                child: Text(
                  "ovr standing".toUpperCase(),
                  style: 30.w4(
                    fontFamily: FontFamily.fOswaldBold,
                  ),
                ),
              ),
              36.vGap,
              Expanded(child: _playerLayoutBuild()),
              _seeAllWidget()
            ],
          ),
        );
      },
    );
  }

  Widget _playerLayoutBuild() {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 235.w,
                width: Get.width - 34.w,
                margin: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.cD9D9D9),
                    borderRadius: BorderRadius.circular(9.w)),
              )),
          SizedBox(
              height: 235.w,
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.nbaPlayerList.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 39.w, right: 39.w),
                  itemBuilder: (context, index) {
                    return _playerItemWidget(index);
                  },
                  separatorBuilder: (context, index) {
                    return 11.hGap;
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget _playerItemWidget(int index) {
    return Obx(() => Container(
          width: 143.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.c666666),
              borderRadius: BorderRadius.circular(12.w),
              boxShadow: const [
                BoxShadow(color: Colors.white, blurRadius: 1, spreadRadius: 4),
              ]),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageWidget(
                      url: Utils.getPlayUrl(1002),
                      imageFailedPath: Assets.iconUiDefault05,
                      width: 89,
                      height: 65,
                    ),
                    Text(
                      'LEBRON JAMES',
                      style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                    ),
                    Text(
                      ' lal · sf/pf'.toUpperCase(),
                      style: 12.w5(
                          fontFamily: FontFamily.fRobotoRegular,
                          color: AppColors.cB3B3B3),
                    ),
                    10.vGap,
                    _playerchart(index),
                    18.vGap,
                    IntrinsicHeight(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 27.w),
                        child: Row(
                          children: [
                            Container(
                              width: 55.w,
                              decoration: BoxDecoration(
                                  color: AppColors.c333333,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6.w),
                                      bottomLeft: Radius.circular(6.w))),
                              child: Column(
                                children: [
                                  Text(
                                    '78',
                                    style: 19.w5(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                  Text(
                                    'OVR',
                                    style: 12.w5(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fOswaldRegular),
                                  ),
                                  2.vGap
                                ],
                              ),
                            ),
                            3.hGap,
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: index > 0
                                      ? AppColors.c13C37B
                                      : AppColors.cE34D4D,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(6.w),
                                      topRight: Radius.circular(6.w))),
                              child: Column(
                                children: [
                                  Text(
                                    '8',
                                    style: 19.w5(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                  Transform.rotate(
                                    angle: index > 0
                                        ? -pi / 180 * 90
                                        : pi / 180 * 90,
                                    child: IconWidget(
                                        iconWidth: 8.w,
                                        iconHeight: 12.w,
                                        icon: Assets
                                            .commonUiCommonIconSystemArrow),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: -2.w,
                left: 10.w,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${controller.nbaPlayerList[index]}',
                          style: 40.w5(fontFamily: FontFamily.fOswaldBold)),
                      2.hGap,
                      Padding(
                          padding: EdgeInsets.only(top: 10.w),
                          child: Text('st',
                              style: 12.w4(
                                  fontFamily: FontFamily.fOswaldMedium,
                                  color: AppColors.c010101))),
                    ]),
              )
            ],
          ),
        ));
  }

  Widget _playerchart(int index) {
    NbaPlayerInfosPlayerBaseInfoList player = Utils.getPlayBaseInfo(1001);
    var data = List.generate(7, (index) {
      if (index == 0) {
        return FlSpot(index.toDouble(), 30.0);
      }
      return FlSpot(index.toDouble(), 10.0 * (Random().nextInt(5) + 1));
    });

    return Container(
        height: 32.w,
        margin: EdgeInsets.symmetric(horizontal: 27.w),
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
                            radius: 1.6,
                            color: Colors.red,
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
                      gradient: LinearGradient(colors: [
                        AppColors.cE34D4D.withOpacity(0.3),
                        AppColors.cE34D4D.withOpacity(0.1)
                      ])))
            ],
            gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                      color: AppColors.cB3B3B3,
                      strokeWidth: 1,
                      dashArray: [4, 2]);
                },
                horizontalInterval: 30,
                checkToShowHorizontalLine: (value) {
                  if (value == 30) {
                    return true;
                  }
                  return false;
                },
                checkToShowVerticalLine: (value) {
                  return false;
                }),
          ),
        ));
  }

  Widget _seeAllWidget() {
    return SizedBox(
      height: 50.w,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LangKey.gameButtonSeeAll.tr,
              style: 16.w7(
                  color: AppColors.c262626,
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold),
            ),
            6.hGap,
            IconWidget(
              iconWidth: 5.w,
              icon: Assets.commonUiCommonIconSystemJumpto,
              iconColor: AppColors.c000000,
            ),
            19.hGap,
          ],
        ),
      ),
    );
  }
}
