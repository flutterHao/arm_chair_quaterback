/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-01-10 17:57:15
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/illustration_list.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/level_arc.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/big_player_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustratiionsDetail extends GetView<IllustratiionsController> {
  const IllustratiionsDetail({super.key});

  Widget _borderCard(String title, String value) {
    return Expanded(
      child: Container(
          width: double.infinity,
          // width: 154.w,
          height: 77.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cE6E6E6, width: 1.w),
            borderRadius: BorderRadius.circular(9.w),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              title,
              style: 12.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.9),
            ),
            9.vGap,
            Text(
              value,
              style: 27.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.9),
            )
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "FGM",
      "3PM",
      "FTM",
      "PASS",
      "REB",
      "BLK",
      "STL",
      "TECH",
    ];
    final randow = Random();
    int count = randow.nextInt(100);
    int playerId = Get.arguments["playerId"];
    bool achivement = Get.arguments["isAchivement"];
    var player = Utils.getPlayBaseInfo(playerId);
    return GetBuilder<IllustratiionsController>(
      init: IllustratiionsController(),
      id: "illustratiions",
      builder: (_) {
        return HorizontalDragBackWidget(
          child: BlackAppWidget(
            UserInfoBar(showPop: true),
            bodyWidget: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 437.w,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.c1A1A1A, AppColors.c333333],
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // for (int i = 3; i > 0; i--)
                          Positioned(
                            top: 38.w,
                            child: OutlinedText(
                              text: "BUCKS",
                              strokeWidth: 1,
                              strokeColor: AppColors.c179248,
                              textStyle: TextStyle(
                                letterSpacing: -1,
                                fontSize: 150.spMin,
                                fontFamily: FontFamily.fOswaldMedium,
                                color: Colors.transparent,
                                height: 1,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 97.w,
                            child: achivement
                                ? BigPlayerCard(playerId: playerId)
                                : Image.asset(
                                    Assets.managerUiManagerPlayercardBig,
                                    width: 174.w,
                                    height: 267.w,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    //进度条
                    Container(
                      color: AppColors.cFFFFFF,
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.c333333,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(9.w))),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              width: double.infinity,
                              height: 66.5.w,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            5.5.hGap,
                                            IconWidget(
                                              iconWidth: 23.5.w,
                                              iconColor: AppColors.c000000,
                                              icon: Assets
                                                  .managerUiManagerArchiveDebris,
                                            ),
                                            8.hGap,
                                            Text(
                                              "$count/100",
                                              style: 16.w4(
                                                color: AppColors.c262626,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                        4.5.vGap,
                                        CustomLinearProgressBar(
                                          progress: count / 100,
                                          width: 270.w,
                                          height: 12.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 59.w,
                                    height: 40.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.w),
                                      color: AppColors.cEEEEEE,
                                    ),
                                    child: Text(
                                      "CLAM",
                                      style: 16.w4(
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                          color: AppColors.ccccccc),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ), //球员信息
                    //球员基本信息
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 9.w,
                            color: AppColors.cDEDEDE.withOpacity(0.1),
                          ),
                          32.5.vGap,
                          Text(
                            player.ename,
                            style: 35.w4(
                                fontFamily: FontFamily.fOswaldMedium,
                                height: 0.9),
                          ),
                          19.vGap,
                          Text(
                            player.position,
                            style: 21.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 0.9),
                          ),
                          37.5.vGap,
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 29.w),
                            child: Row(
                              children: [
                                _borderCard(
                                  "ROWER",
                                  player.playerStrength.toString(),
                                ),
                                9.hGap,
                                _borderCard(
                                  "SALARY",
                                  Utils.formatMoney(player.salary),
                                ),
                              ],
                            ),
                          ),
                          55.vGap,
                        ],
                      ),
                    ),
                    //能力
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 16.w),
                                child: Text(
                                  "ABILITY",
                                  style: 24.w7(
                                      color: AppColors.c000000,
                                      height: 0.8,
                                      fontFamily: FontFamily.fOswaldBold),
                                ),
                              ),
                            ],
                          ),
                          26.vGap,
                          ...List.generate(names.length, (index) {
                            var ability = names[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 17.w),
                              child: Row(
                                children: [
                                  29.hGap,
                                  Expanded(
                                    child: Text(
                                      ability,
                                      style: 16.w4(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily:
                                              FontFamily.fOswaldRegular),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.w,
                                    width: 235.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6.w),
                                      child: Builder(builder: (context) {
                                        // double value =
                                        //     ability.sGradeLevel1PlayerMaxValue;
                                        // double total = ability.totalValue;
                                        // double baseValue = ability.baseValue;
                                        // double beforeUpgradeValue =
                                        //     ability.beforeValue;
                                        // double afterUpgradeValue =
                                        //     ability.afterValue;
                                        double maxProgress =
                                            randow.nextDouble();
                                        double baseProgress =
                                            randow.nextInt(10) * 0.05;

                                        double beforeProgress = baseProgress +
                                            randow.nextDouble() * 0.5;

                                        double afterProgress =
                                            baseProgress + randow.nextDouble();

                                        return Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            /// 边框
                                            Container(
                                              height: 12.w,
                                              width: 235.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.w),
                                                  border: Border.all(
                                                      color: AppColors.cD1D1D1,
                                                      width: 1.w)),
                                            ),
                                            AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                left: -(235.w *
                                                    (1 - maxProgress)),
                                                child: Container(
                                                  width: 235.w,
                                                  height: 10.w,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color: AppColors
                                                                  .c000000,
                                                              width: 2.w))),
                                                )),

                                            /// 升级后
                                            AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                left: -(235.w *
                                                    (1 - afterProgress)),
                                                child: Container(
                                                  height: 12.w,
                                                  width: 235.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.cFFD133,
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      6.w))),
                                                )),

                                            /// 升级前
                                            AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                left: -(235.w *
                                                    (1 - beforeProgress)),
                                                child: Container(
                                                  height: 12.w,
                                                  width: 235.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.cFF7954,
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      6.w))),
                                                )),

                                            /// 基础
                                            AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                left: -(235.w *
                                                    (1 - baseProgress)),
                                                child: Container(
                                                  height: 12.w,
                                                  width: 235.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.c000000,
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      6.w))),
                                                )),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                  9.hGap,
                                  Expanded(
                                    child: Text(
                                      "${((randow.nextInt(4) + 5) * 1000).round()}",
                                      style: 16.w4(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily:
                                              FontFamily.fOswaldRegular),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          Builder(builder: (context) {
                            return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 9.w),
                              decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(12.w),
                              ),
                              child: Column(
                                children: [
                                  20.vGap,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16.w),
                                        child: Text(
                                          "OFFENSIVE",
                                          style: 24.w7(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldBold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  22.vGap,
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 29.w, right: 16.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          controller
                                              .getOffensive(playerId)
                                              .length, (index) {
                                        var offensive = controller
                                            .getOffensive(playerId)[index];
                                        double progress = offensive.progress;

                                        var borderSweepAngle = 190.0;

                                        var progressSweepAngle =
                                            progress * borderSweepAngle;

                                        progress = progress * 100;
                                        return Container(
                                          height: 99.w,
                                          alignment: Alignment.topCenter,
                                          child: SizedBox(
                                            height: 52.w,
                                            width: 90.w,
                                            child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                AnimationArcWidget(
                                                  45.w,
                                                  borderColor:
                                                      AppColors.cE1E1E1,
                                                  progressColor:
                                                      AppColors.cFF7954,
                                                  progressWidth: 7.w,
                                                  progressSweepAngle:
                                                      progressSweepAngle,
                                                  borderWidth: 7.w,
                                                  startAngle: 170,
                                                  borderSweepAngle:
                                                      borderSweepAngle,
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${progress.formatToString()}%",
                                                        style: 20.w7(
                                                            color: AppColors
                                                                .c000000,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fOswaldBold),
                                                      ),
                                                      7.vGap,
                                                      Text(
                                                        offensive.name,
                                                        style: 10.w4(
                                                            color: AppColors
                                                                .c000000,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fRobotoRegular),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16.w),
                                        child: Text(
                                          "ADDITIONAL",
                                          style: 24.w7(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldBold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  16.vGap,
                                  Divider(
                                    color: AppColors.cD1D1D1,
                                    height: 1.w,
                                  ),
                                  SizedBox(
                                    height: 110.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(3, (index) {
                                            var additional = controller
                                                .getAdditional()[index];
                                            return SizedBox(
                                              width: 125.w,
                                              height: 28.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      additional.name,
                                                      style: 12.w4(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily: FontFamily
                                                              .fRobotoRegular),
                                                    ),
                                                  ),
                                                  15.hGap,
                                                  Text(
                                                    additional.value
                                                        .toStringAsFixed(0),
                                                    style: 12.w4(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                        56.hGap,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(3, (index) {
                                            var additional = controller
                                                .getAdditional()[index + 3];
                                            return SizedBox(
                                              width: 125.w,
                                              height: 28.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      additional.name,
                                                      style: 12.w4(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily: FontFamily
                                                              .fRobotoRegular),
                                                    ),
                                                  ),
                                                  15.hGap,
                                                  Text(
                                                    additional.value
                                                        .toStringAsFixed(0),
                                                    style: 12.w4(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //     padding: EdgeInsets.symmetric(
                                  //         horizontal: 16.w),
                                  //     child: Divider(
                                  //       color: AppColors.cD1D1D1,
                                  //       height: 1.w,
                                  //     )),
                                  // 21.vGap,
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
