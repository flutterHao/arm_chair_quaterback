import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/DashedLine.dart';
import 'package:arm_chair_quaterback/common/widgets/chart_painter.dart';
import 'package:arm_chair_quaterback/common/widgets/clipper/line_chart_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/12:38

class WinRateWidget extends StatelessWidget {
  WinRateWidget(this.controller, {super.key});

  final WinRateController controller;

  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    return Container(
      height: 335.h,
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.vGap,
          Container(
            margin: EdgeInsets.only(left: 16.w),
            child: Text(
              LangKey.gameButtonWinRate.tr,
              style: 30.w7(
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold,
                  color: AppColors.c000000),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Obx(() {
                  var offset = controller.pointOffset.value;
                  return Positioned(
                      top: 6.w,
                      left: offset.dx - 83.w / 2 + 30.w,
                      // -83.w/2 ~
                      width: 83.w,
                      height: 39.w,
                      child: Stack(
                        children: [
                          Container(
                            height: 33.w,
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                border: Border.all(
                                    color: AppColors.cE6E6E, width: 1.w),
                                borderRadius: BorderRadius.circular(4.w)),
                            child: Row(
                              children: [
                                6.hGap,
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.w),
                                      border: Border.all(
                                          color: AppColors.c1F8FE5,
                                          width: 1.w)),
                                  child: ImageWidget(
                                    url: Utils.getTeamUrl(controller.isHomeWin
                                        ? teamBattleV2Controller
                                            .battleEntity.homeTeam.teamLogo
                                        : teamBattleV2Controller
                                            .battleEntity.awayTeam.teamLogo),
                                    imageFailedPath: Assets.teamUiHead01,
                                    width: 21.w,
                                    height: 21.w,
                                    borderRadius: BorderRadius.circular(11.w),
                                  ),
                                ),
                                10.hGap,
                                Text(
                                  controller.getWinRate(),
                                  style: 16.w5(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                )
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: IconWidget(
                                    iconWidth: 10.w,
                                    iconHeight: 10.w,
                                    fit: BoxFit.fitHeight,
                                    icon: Assets.commonUiCommonIconSystemArrow,
                                    iconColor: AppColors.cF2F2F2,
                                    rotateAngle: 90,
                                  )),
                              Positioned(
                                  bottom: 2.w,
                                  left: 0,
                                  right: 0,
                                  child: IconWidget(
                                    iconWidth: 6.w,
                                    iconHeight: 4.w,
                                    fit: BoxFit.fitHeight,
                                    icon: Assets.commonUiCommonIconSystemArrow,
                                    iconColor: AppColors.cFF7954,
                                    rotateAngle: 90,
                                  ))
                            ],
                          )
                        ],
                      ));
                }),
                Positioned(
                  top: 57.h,
                  left: 30.w,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: controller.getWidth(),
                                height: 164.h,
                                decoration: BoxDecoration(
                                    color: AppColors.cF2F2F2,
                                    border: Border.all(
                                        color: AppColors.cD1D1D1, width: 1.w)),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    // 表格的纵向参照线
                                    ...List.generate(3, (index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: (controller.getWidth() / 4) *
                                                    (index + 1) -
                                                3.w),
                                        height: 164.h,
                                        width: 3.w,
                                        color: AppColors.cFFFFFF,
                                      );
                                    }),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        //横向上方25参照线
                                        DashedLine(
                                          axis: Axis.horizontal,
                                          dashedWidth: 8.w,
                                          dashedColor: AppColors.cE6E6E6,
                                          count: 25,
                                        ),
                                        //横向50参照线
                                        DashedLine(
                                          axis: Axis.horizontal,
                                          dashedWidth: 8.w,
                                          dashedColor: AppColors.cB2B2B2,
                                          count: 25,
                                        ),
                                        //横向下方25参照线
                                        DashedLine(
                                          axis: Axis.horizontal,
                                          dashedWidth: 8.w,
                                          dashedColor: AppColors.cE6E6E6,
                                          count: 25,
                                        ),
                                      ],
                                    ),
                                    Obx(() {
                                      return Stack(
                                        children: [
                                          //倾斜渐变线
                                          SizedBox(
                                            width: controller.getWidth(),
                                            height: 164.h,
                                            child: ClipPath(
                                              clipper: LineChartClipper(
                                                  controller.chartPoints.value),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                      AppColors.c1F8FE5
                                                          .withOpacity(0.7),
                                                      AppColors.cF2F2F2
                                                          .withOpacity(0.5),
                                                      AppColors.cD60D20
                                                          .withOpacity(0.7)
                                                    ])),
                                              ),
                                            ),
                                          ),
                                          //折线图实线
                                          CustomPaint(
                                            size: Size(
                                                controller.getWidth(), 164.h),
                                            painter: ChartPainter(
                                                controller.chartPoints.value,
                                                164.h),
                                          )
                                        ],
                                      );
                                    }),
                                    //实时指标虚线
                                    Obx(() {
                                      return Positioned(
                                        left: controller.pointOffset.value !=
                                                Offset.zero
                                            ? controller.pointOffset.value.dx -
                                                2
                                            : 0,
                                        child: SizedBox(
                                          width: controller.getWidth(),
                                          height: 164.h,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                color: AppColors.cFFFFFF
                                                    .withOpacity(0.9),
                                              ),
                                              const Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: double.infinity,
                                                    child: DashedLine(
                                                      axis: Axis.vertical,
                                                      dashedHeight: 2,
                                                      dashedWidth: 2,
                                                      count: 25,
                                                      dashedColor:
                                                          AppColors.c000000,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                              2.hGap,
                              SizedBox(
                                height: 164.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "100",
                                      style: 9.w4(
                                          color: AppColors.c4D4D4D, height: 1),
                                    ),
                                    Text(
                                      "50",
                                      style: 9.w4(
                                          color: AppColors.c4D4D4D, height: 1),
                                    ),
                                    Text(
                                      "100",
                                      style: 9.w4(
                                          color: AppColors.c4D4D4D, height: 1),
                                    )
                                  ],
                                ),
                              ),
                              8.hGap
                            ],
                          ),
                          5.vGap,
                          SizedBox(
                            width: controller.getWidth(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(4, (index) {
                                return Text(
                                  Utils.getSortWithInt(index + 1),
                                  style: 10.w4(
                                      color: AppColors.c4D4D4D,
                                      fontFamily: FontFamily.fRobotoRegular,
                                      height: 1),
                                );
                              }),
                            ),
                          ),
                          10.vGap,
                          SizedBox(
                            width: controller.getWidth(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    IconWidget(
                                      iconWidth: 16.w,
                                      icon: Assets.managerUiManagerIconLine,
                                      iconColor: AppColors.c1F8FE5,
                                    ),
                                    6.hGap,
                                    Text(
                                      teamBattleV2Controller
                                          .battleEntity.homeTeam.teamName,
                                      style: 14.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconWidget(
                                      iconWidth: 16.w,
                                      icon: Assets.managerUiManagerIconLine,
                                      iconColor: AppColors.cD60D20,
                                    ),
                                    6.hGap,
                                    Text(
                                      teamBattleV2Controller
                                          .battleEntity.awayTeam.teamName,
                                      style: 14.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      //实时数据指示点
                      SizedBox(
                        width: 320.w,
                        height: 164.h,
                        child: Stack(
                          children: [
                            Obx(() {
                              return Positioned(
                                left: controller.pointOffset.value !=
                                        Offset.zero
                                    ? controller.pointOffset.value.dx - 7.h / 2
                                    : 0,
                                top: controller.pointOffset.value != Offset.zero
                                    ? controller.pointOffset.value.dy - 7.h / 2
                                    : (164.h - 7.h) / 2, //修改位置
                                child: Container(
                                  width: 7.h,
                                  height: 7.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFFFFFF,
                                      borderRadius: BorderRadius.circular(4.h)),
                                  child: Center(
                                    child: Container(
                                        width: 4.h,
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.cFF7954,
                                            borderRadius:
                                                BorderRadius.circular(2.h))),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
