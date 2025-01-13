import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/reward_package_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/week_prize_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DailyTaskPage extends GetView<DailyTaskController> {
  const DailyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<DailyTaskController>(
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
              canTapDailyTask: false,
            ),
            bodyWidget: Expanded(
                child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  9.vGap,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.cFFFFFF,
                    ),
                    child: Column(
                      children: [
                        _buildSlotPan(),
                        SizedBox(
                          width: double.infinity,
                          height: 86.w,
                          child: PageView(
                            controller: controller.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildStartWidget(),
                              _buildPackageAndSpin(context)
                            ],
                          ),
                        ),
                        15.vGap
                      ],
                    ),
                  ),
                  9.vGap,
                  _buildDailyMission(),
                  9.vGap
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  Container _buildSlotPan() {
    return Container(
      width: 339.w,
      height: 447.w,
      decoration: BoxDecoration(
        color: AppColors.c000000,
        borderRadius: BorderRadius.circular(23.w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildOuterWheel(),
          _buildCenterTopWheel(),
          _buildCenter(),
          _buildCenterBottomWheel(),
        ],
      ),
    );
  }

  Container _buildDailyMission() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(9.w),
      ),
      child: Column(
        children: [
          25.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DAILY MISSION",
                  style: 24.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                ),
                Row(
                  children: [
                    IconWidget(
                        iconWidth: 16.w,
                        icon: Assets.commonUiCommonCountdown02),
                    6.hGap,
                    Text(
                      "23:59:59",
                      style: 16.w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldRegular,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          16.vGap,
          Divider(
            height: 1.w,
            color: AppColors.cD1D1D1,
          ),
          _buildDailyMissionItem(
            "Register 50 players in the archive in archive in the archive.Register 50 players in the archive. ",
            Assets.commonUiCommonIconTask,
            0,
          ),
          _buildDailyMissionItem(
            "Register 50 players in the archive. ",
            Assets.commonUiCommonIconCurrency02,
            1,
          ),
          _buildDailyMissionItem(
            "Register 50 players in the archive in archive in the archive.Register 50 players in the archive. ",
            Assets.commonUiCommonIconCurrency02,
            2,
          ),
          9.vGap,
        ],
      ),
    );
  }

  Container _buildPackageAndSpin(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              /// 临时背包
              Stack(
                children: [
                  MtInkWell(
                    onTap: () {
                      print('package ------ ');
                      showDialog(
                          useSafeArea: false,
                          barrierColor: AppColors.cTransparent,
                          context: context,
                          builder: (context) {
                            return const RewardPackageWidget();
                          });
                    },
                    child: Container(
                      width: 94.w,
                      height: 51.w,
                      margin: EdgeInsets.only(top: 4.w, right: 9.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(
                            color: AppColors.c666666,
                            width: 1.w,
                          )),
                      child: IconWidget(
                        iconWidth: 33.w,
                        icon: Assets.managerUiManagerWheelGift,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 5.w,
                      child: Container(
                        height: 16.w,
                        constraints: BoxConstraints(minWidth: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          color: AppColors.cFF7954,
                        ),
                        child: Center(
                          child: Text(
                            "99",
                            style: 10.w5(
                              color: AppColors.cFFFFFF,
                              height: 0.5,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Expanded(
                child: MtInkWell(
                  onTap: () {
                    print('spin ---- ');
                  },
                  child: Container(
                    height: 51.w,
                    decoration: BoxDecoration(
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    child: Center(
                      child: Text(
                        "SPIN",
                        style: 23.w5(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              MtInkWell(
                onTap: () {
                  print('week prize');
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.cTransparent,
                      builder: (context) {
                        return const WeekPrizeWidget();
                      });
                },
                child: Container(
                  width: 59.w,
                  height: 51.w,
                  margin: EdgeInsets.only(left: 22.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(
                        color: AppColors.c666666,
                        width: 1.w,
                      )),
                  child: IconWidget(
                    iconWidth: 24.w,
                    icon: Assets.managerUiManagerWheelCalendar,
                    iconColor: AppColors.c000000,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Column _buildStartWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(iconWidth: 18.w, icon: Assets.commonUiCommonIconTask),
            4.hGap,
            Text(
              "1/10",
              style: 16.w5(
                height: 1,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            )
          ],
        ),
        7.vGap,
        MtInkWell(
          onTap: () {
            if (controller.scrollController.offset > 0) {
              controller.scrollController
                  .animateTo(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear)
                  .then((_) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  controller.wheelController.start();
                });
              });
            } else {
              controller.wheelController.start();
            }
            //todo test code
            controller.pageController.animateToPage(1,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          child: Container(
            height: 51.w,
            width: 211.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              border: Border.all(
                color: AppColors.cE6E6E6,
                width: 1.w,
              ),
            ),
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "START",
                style: 23.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fOswaldMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildDailyMissionItem(String text, String image, int status) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 12.w,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: AppColors.cE6E6E6,
        width: 1.w,
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.vGap,
          Text.rich(TextSpan(children: [
            TextSpan(
                text: text,
                style: 12.w4(
                  color: AppColors.c000000,
                  height: 1.2,
                  fontFamily: FontFamily.fRobotoRegular,
                )),
            TextSpan(
                text: "(50/50)",
                style: 12.w4(
                  color: AppColors.c10A86A,
                  height: 1.2,
                  fontFamily: FontFamily.fRobotoMedium,
                ))
          ])),
          19.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      IconWidget(
                          iconWidth: 40.w, icon: Assets.commonUiCommonProp05),
                      7.vGap,
                      Text(
                        "50k",
                        style: 14.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      )
                    ],
                  ),
                  39.hGap,
                  Column(
                    children: [
                      IconWidget(iconWidth: 40.w, icon: image),
                      7.vGap,
                      Text(
                        "50k",
                        style: 14.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Builder(builder: (context) {
                if (status == 1) {
                  return Container(
                    width: 59.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.c666666, width: 1.w),
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    child: Center(
                      child: Text(
                        "GO TO",
                        style: 16.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                    ),
                  );
                }
                if (status == 2) {
                  return Container(
                    width: 59.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.cE6E6E6, width: 1.w),
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    child: Center(
                      child: IconWidget(
                        iconWidth: 21.w,
                        icon: Assets.commonUiCommonStatusBarMission02,
                        iconColor: AppColors.c10A86A,
                      ),
                    ),
                  );
                }
                return Container(
                  width: 59.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: Center(
                    child: Text(
                      "CLAIM",
                      style: 16.w5(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
          16.vGap,
        ],
      ),
    );
  }

  Positioned _buildOuterWheel() {
    List<Widget> list = randomWheelData(24);
    return Positioned(
      left: 6.w,
      right: 6.w,
      top: 5.w,
      bottom: 5.w,
      child: WheelWidget(
        rowCount: 6,
        columnCount: 8,
        itemWidth: 52.w,
        itemHeight: 52.w,
        radius: 4.w,
        bigRadius: 18.w,
        controller: controller.wheelController,
        builder: (index) {
          return list[index];
        },
      ),
    );
  }

  List<Widget> randomWheelData(int size, {double scale = 1}) {
    List<Widget> randomWidgetList = [
      IconWidget(
          iconWidth: 26.w * scale, icon: Assets.commonUiCommonIconCurrency02),
      IconWidget(iconWidth: 32.w * scale, icon: Assets.managerUiManagerGift03),
      IconWidget(iconWidth: 30.w * scale, icon: Assets.commonUiCommonProp05),
      IconWidget(
        iconWidth: 27.w * scale,
        icon: Assets.managerUiManagerPlayerinfoIcon01,
        iconColor: AppColors.c4D4D4D,
      ),
      IconWidget(
          iconWidth: 27.w * scale,
          icon: Assets.managerUiManagerPlayerinfoIcon04)
    ];
    var random = Random();
    var list = List.generate(size, (index) {
      return randomWidgetList[random.nextInt(randomWidgetList.length)];
    });
    return list;
  }

  Positioned _buildCenterTopWheel() {
    List<Widget> list = randomWheelData(12, scale: 31 / 52);
    return Positioned(
        left: 66.w,
        top: 69.w,
        height: 99.w,
        width: 207.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            WheelWidget(
                rowCount: 5,
                columnCount: 3,
                itemWidth: 39.w,
                itemHeight: 31.w,
                radius: 2.w,
                bigRadius: 9.w,
                builder: (index) {
                  return list[index];
                }),

            /// 爱心
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                    margin: EdgeInsets.only(right: 5.w),
                    child: IconWidget(
                        iconWidth: 20.w,
                        icon: Assets.managerUiManagerTactics01));
              }),
            )
          ],
        ));
  }

  Positioned _buildCenterBottomWheel() {
    List<Widget> list = randomWheelData(12, scale: 31 / 52);
    return Positioned(
        left: 66.w,
        bottom: 69.w,
        height: 99.w,
        width: 207.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            WheelWidget(
                rowCount: 5,
                columnCount: 3,
                itemWidth: 39.w,
                itemHeight: 31.w,
                radius: 2.w,
                bigRadius: 9.w,
                builder: (index) {
                  return list[index];
                }),

            /// 电池
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.c9EEB53,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(5.w),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.c9EEB53.withOpacity(0.4),
                            offset: Offset.zero,
                            blurRadius: 3.w,
                            spreadRadius: 3.w)
                      ]),
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (index) {
                      bool isFirst = index == 0;
                      bool isLast = index == 9;
                      BorderRadius? borderRadius;
                      if (isFirst) {
                        borderRadius =
                            BorderRadius.horizontal(left: Radius.circular(2.w));
                      } else if (isLast) {
                        borderRadius = BorderRadius.horizontal(
                            right: Radius.circular(2.w));
                      }
                      return Container(
                        margin: EdgeInsets.only(right: isLast ? 0 : 2.w),
                        width: 8.w,
                        height: 15.w,
                        decoration: BoxDecoration(
                          color: AppColors.c9EEB53,
                          borderRadius: borderRadius,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Positioned _buildCenter() {
    return Positioned(
        child: Container(
      width: 207.w,
      height: 105.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.c666666,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(12.w),
      ),
      padding: EdgeInsets.all(4.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.c404040,
                AppColors.c666666,
              ]),
          boxShadow: [
            BoxShadow(
              color: AppColors.cFFFFFF.withOpacity(0.6),
              offset: Offset(0.w, 0.w),
              blurRadius: 3.w,
              spreadRadius: 1.w,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9.w),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 37.w,
                    width: 181.w,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 7.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      border: Border.all(
                        color: AppColors.c666666,
                        width: 1.w,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          height: 12.w,
                          left: 26.w,
                          right: 33.w,
                          child: const LinearProgressIndicator(
                            value: 0.2,
                            color: AppColors.cFF7954,
                            backgroundColor: AppColors.c000000,
                          ),
                        ),
                        Positioned(
                            left: 9.w,
                            child: IconWidget(
                                iconWidth: 24.w,
                                icon: Assets.commonUiCommonIconTask)),
                        Positioned(
                            right: 9.w,
                            child: IconWidget(
                                iconWidth: 24.w,
                                icon: Assets.commonUiCommonProp05)),
                        Text(
                          "15/20",
                          style: 12.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 7.w,
                      right: 6.w,
                      child: Container(
                        height: 16.w,
                        constraints: BoxConstraints(
                          minWidth: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cFF7954,
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style: 10.w5(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              7.vGap,
              Expanded(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "COINS IN",
                    style: 52.w7(
                      height: 0.1,
                      color: AppColors.c000000.withOpacity(0.2),
                      fontFamily: FontFamily.fOswaldBold,
                    ),
                  ),
                  IconWidget(
                      iconWidth: 80.w,
                      icon: Assets.managerUiManagerDailymissionSlot)
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
