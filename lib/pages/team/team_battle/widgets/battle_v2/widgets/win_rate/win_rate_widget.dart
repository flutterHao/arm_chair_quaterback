import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/DashedLine.dart';
import 'package:arm_chair_quaterback/common/widgets/chart_painter.dart';
import 'package:arm_chair_quaterback/common/widgets/clipper/line_chart_clipper.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/12:38

class WinRateWidget extends StatelessWidget {
  const WinRateWidget(this.controller,{super.key});

  final WinRateController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315.h,
      margin: EdgeInsets.only(top: 9.w),
      color: AppColors.c262626,
      child: Column(
        children: [
          50.vGap,
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //背景
              Text(
                "WIN RATE",
                style: 40.w7(
                    color: AppColors.cB3B3B3.withOpacity(.1),
                    height: 1),
              ),
              //前景
              Container(
                margin: EdgeInsets.only(bottom: 5.h),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "WIN RATE",
                  style: 16.w7(color: AppColors.cD3D3D3, height: 1),
                ),
              ),
            ],
          ),
          // 9.vGap,
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 325.w,
                    height: 181.h,
                    color: AppColors.c0D0D0D.withOpacity(.3),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        // 表格的纵向参照线
                        ...List.generate(3, (index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left:
                                (325.w / 4) * (index + 1) - 3.w),
                            height: 181.h,
                            width: 3.w,
                            color: AppColors.c262626,
                          );
                        }),
                        //横向50参照线
                        const DashedLine(
                          axis: Axis.horizontal,
                          dashedWidth: 4,
                          dashedColor: AppColors.c666666,
                          count: 40,
                        ),
                        Obx(() {
                          return Stack(
                            children: [
                              //倾斜渐变线
                              SizedBox(
                                width: 325.w,
                                height: 181.h,
                                child: ClipPath(
                                  clipper: LineChartClipper(
                                      controller.chartPoints.value),
                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.c3B93FF,
                                            AppColors.c3B93FF,
                                            AppColors.c3B93FF,
                                            Colors.black,
                                            AppColors.cFF7954,
                                            AppColors.cFF7954,
                                            AppColors.cFF7954
                                          ]).createShader(bounds);
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(Assets
                                                  .teamUiBgDiagonal),
                                              repeat: ImageRepeat
                                                  .repeat)),
                                    ),
                                  ),
                                ),
                              ),
                              //折线图实线
                              CustomPaint(
                                size: Size(325.w, 181.h),
                                painter: ChartPainter(
                                    controller.chartPoints.value, 181.h),
                              )
                            ],
                          );
                        }),
                        //实时指标虚线
                        Obx(() {
                          return Positioned(
                            left: controller.pointOffset.value != Offset.zero
                                ? controller.pointOffset.value.dx - 2
                                : 0,
                            child: SizedBox(
                              width: 325.w,
                              height: 181.h,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: AppColors.c3B3B3B
                                        .withOpacity(.3),
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
                                          count: 30,
                                          dashedColor:
                                          AppColors.cF2F2F2,
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
                    height: 181.h,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "100",
                          style: 10.w4(
                              color:
                              AppColors.cB3B3B3.withOpacity(.7),
                              height: 1),
                        ),
                        Text(
                          "50",
                          style: 10.w4(
                              color:
                              AppColors.cB3B3B3.withOpacity(.7),
                              height: 1),
                        ),
                        Text(
                          "100",
                          style: 10.w4(
                              color:
                              AppColors.cB3B3B3.withOpacity(.7),
                              height: 1),
                        )
                      ],
                    ),
                  ),
                  8.hGap
                ],
              ),
              //实时数据指示点
              SizedBox(
                width: 332.w,
                height: 188.h,
                child: Stack(
                  children: [
                    Obx(() {
                      return Positioned(
                        left: controller.pointOffset.value != Offset.zero
                            ? controller.pointOffset.value.dx - 7.h / 2
                            : 0,
                        top: controller.pointOffset.value != Offset.zero
                            ? controller.pointOffset.value.dy
                            : (181.h - 7.h) / 2, //修改位置
                        child: Container(
                          width: 7.h,
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius:
                              BorderRadius.circular(4.h)),
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
          )
        ],
      ),
    );
  }
}
