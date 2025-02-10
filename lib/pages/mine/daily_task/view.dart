import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/mission_define_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/rounder_border_progress_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/random_reward_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/reward_package_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/week_price/week_prize_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DailyTaskPage extends GetView<DailyTaskController> {
  const DailyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: GetBuilder<DailyTaskController>(
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
              canTapDailyTask: false,
            ),
            bodyWidget: Expanded(
                child: GetBuilder<DailyTaskController>(
                    id: DailyTaskController.idMain,
                    builder: (logic) {
                      if (controller.loadStatus.value !=
                          LoadDataStatus.success) {
                        return Center(
                          child: LoadStatusWidget(
                            loadDataStatus: controller.loadStatus.value,
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        controller: controller.scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            9.vGap,
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(top: 16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.w),
                                color: AppColors.cFFFFFF,
                              ),
                              child: GetBuilder<DailyTaskController>(
                                  id: DailyTaskController.idSlotPan,
                                  builder: (logic) {
                                    return Column(
                                      children: [
                                        _buildSlotPan(context),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 117.w,
                                          child: PageView(
                                            controller:
                                                controller.btnPageController,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              _buildStartWidget(),
                                              _buildPackageAndSpin(context),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            9.vGap,
                            _buildDailyMission(),
                            9.vGap
                          ],
                        ),
                      );
                    })),
          );
        },
      ),
    );
  }

  Widget _buildSlotPan(BuildContext context) {
    return RoundedBorderProgressBar(
      progress: controller.turnTableEntity.cardProgress.toDouble(),
      strokeWidth: 8.w,
      progressColor: AppColors.cTransparent,
      //todo 卡包进度
      backgroundColor: AppColors.cTransparent,
      //todo 卡包进度
      borderRadius: 31.w,
      child: Container(
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
            _buildCenter(context),
            _buildCenterBottomWheel(),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyMission() {
    return GetBuilder<DailyTaskController>(
        id: DailyTaskController.idDailyMission,
        builder: (logic) {
          if (controller.dailyMissionList.isEmpty) {
            return const SizedBox.shrink();
          }
          return Container(
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(9.w),
            ),
            child: Column(
              children: [
                25.vGap,
                Container(
                  margin: EdgeInsets.only(left: 16.w),
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
                          Obx(() {
                            var ms = controller.dailyCountDown.value;
                            return Container(
                              margin: EdgeInsets.only(left: 6.w),
                              width: 73.w,
                              child: Text(
                                controller.formatDailyTaskTime(ms),
                                style: 16.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldRegular,
                                ),
                              ),
                            );
                          })
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
                ...List.generate(controller.dailyMissionList.length, (index) {
                  var item = controller.dailyMissionList[index];
                  return _buildDailyMissionItem(
                    item.missionDefineEntity.desc,
                    item.missionDefineEntity,
                    item.teamMissionEntity.status,
                  );
                }),
                9.vGap,
              ],
            ),
          );
        });
  }

  Container _buildPackageAndSpin(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          34.vGap,
          Row(
            children: [
              /// 临时背包
              if (controller.getTurnRewardList().isNotEmpty)
                Stack(
                  children: [
                    MtInkWell(
                      onTap: () {
                        print('package ------ ');
                        showDialog(
                            useSafeArea: false,
                            barrierColor: AppColors.cTransparent,
                            context: context,
                            builder: (_) {
                              return RewardPackageWidget(
                                claimAndExit: () {
                                  /// 退出弹框
                                  Get.back();
                                  controller.claimRewards();
                                },
                              );
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
                              "${controller.getTurnRewardList().length}",
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
                    controller.spin(onEnd: () {
                      if (controller.turnTableEntity.currentLife > 0) {
                        return;
                      }
                    });
                  },
                  child: Obx(() {
                    return AnimatedContainer(
                      height: 51.w,
                      decoration: BoxDecoration(
                        color: controller.isSpinBtnEnable.value
                            ? AppColors.c000000
                            : AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(9.w),
                      ),
                      duration: const Duration(milliseconds: 200),
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
                    );
                  }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStartWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 35.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconWidget(iconWidth: 18.w, icon: Assets.commonUiCommonIconTask),
              4.hGap,
              GetBuilder<DailyTaskController>(
                  id: DailyTaskController.idLuckyCoin,
                  builder: (logic) {
                    return Text(
                      "${controller.teamProp.num}/${controller.getMaxLuckyCoinNum()}",
                      style: 16.w5(
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    );
                  })
            ],
          ),
        ),
        MtInkWell(
          onTap: () {
            controller.spin();
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

  Container _buildDailyMissionItem(
      String text, MissionDefineEntity missionDefine, int status) {
    var list = controller.getAwardList(missionDefine.awardData);
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
          Opacity(
            opacity: status == 3 ? 0.5 : 1,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: text,
                  style: 12.w4(
                    color: AppColors.c000000,
                    height: 1.2,
                    fontFamily: FontFamily.fRobotoRegular,
                  )),
            ])),
          ),
          19.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: status == 3 ? 0.5 : 1,
                child: Row(
                  children: List.generate(list.length, (index) {
                    var item = list[index];
                    return Container(
                      margin: EdgeInsets.only(right: 30.w),
                      child: Column(
                        children: [
                          Image.asset(
                            controller.getImageByAward(item),
                            width: 40.w,
                            height: 40.w,
                            errorBuilder: (context, error, s) {
                              return Image.asset(
                                Assets.managerUiManagerGift00,
                                width: 40.w,
                                height: 40.w,
                              );
                            },
                          ),
                          7.vGap,
                          Text(
                            controller.getPropNum(item),
                            style: 14.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Builder(builder: (context) {
                if (status == 1) {
                  return MtInkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 59.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
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
                    ),
                  );
                }
                if (status == 3) {
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
                return MtInkWell(
                  onTap: () => controller
                      .getTeamMissionAward(missionDefine.missionDefineId),
                  child: Container(
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
        controller: controller.outerWheelController,
        builder: (index) {
          // return list[index];
          var item = controller.getOutWheel()[index];
          var size = 30.w;
          return Center(
            child: Builder(builder: (context) {
              var child = Image.asset(
                controller.getImage(item),
                width: size,
                height: size,
                errorBuilder: (context, error, s) {
                  return Image.asset(
                    Assets.managerUiManagerGift00,
                    width: size,
                    height: size,
                  );
                },
              );
              if (item.rewardType == 0 && item.reward == 104) {
                /// 随机奖励(问号)特殊处理
                return Obx(() {
                  var showRandomReward = controller.showRandomReward.value;
                  if (controller.outerWheelController.index == index &&
                      showRandomReward) {
                    return RandomRewardWidget(
                      targetId: controller.turnTableEntity.unKnowRewardId,
                      size: size,
                      onEnd: controller.onRandomAwardEnd,
                    );
                  }
                  return child;
                });
              }
              return child;
            }),
          );
          return IconWidget(iconWidth: size, icon: controller.getImage(item));
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
        top: 65.w,
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
                controller: controller.innerTopWheelController,
                builder: (index) {
                  // return list[index];
                  var item = controller.getInnerTopWheel()[index];
                  var size = 30.w * 31 / 52;
                  return Center(
                    child: Image.asset(
                      controller.getImage(item),
                      width: size,
                      height: size,
                      errorBuilder: (context, error, s) {
                        return Image.asset(
                          Assets.managerUiManagerGift00,
                          width: size,
                          height: size,
                        );
                      },
                    ),
                  );
                  return IconWidget(
                      iconWidth: size, icon: controller.getImage(item));
                }),

            /// 爱心
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                bool isActive =
                    controller.turnTableEntity.currentLife >= index + 1;
                return Container(
                    margin: EdgeInsets.only(right: 5.w),
                    child: IconWidget(
                      iconWidth: 20.w,
                      icon: Assets.managerUiManagerTactics01,
                      iconColor: isActive ? null : AppColors.c4D4D4D,
                    ));
              }),
            )
          ],
        ));
  }

  Positioned _buildCenterBottomWheel() {
    List<Widget> list = randomWheelData(12, scale: 31 / 52);
    return Positioned(
        left: 66.w,
        bottom: 65.w,
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
                controller: controller.innerBottomWheelController,
                builder: (index) {
                  // return list[index];
                  var item = controller.getInnerBottomWheel()[index];
                  var size = 30.w * 31 / 52;
                  return Center(
                    child: Image.asset(
                      controller.getImage(item),
                      width: size,
                      height: size,
                      errorBuilder: (context, error, s) {
                        return Image.asset(
                          Assets.managerUiManagerGift00,
                          width: size,
                          height: size,
                        );
                      },
                    ),
                  );
                  return IconWidget(
                      iconWidth: size, icon: controller.getImage(item));
                }),

            /// 电池
            Builder(builder: (context) {
              bool isFull = controller.getBatteryCount() >=
                  controller.getBatteryTotalCount();
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 105.w,
                    decoration: BoxDecoration(
                        border: !isFull
                            ? null
                            : Border.all(
                                color: AppColors.c9EEB53,
                                width: 1.w,
                              ),
                        borderRadius: BorderRadius.circular(5.w),
                        boxShadow: !isFull
                            ? null
                            : [
                                BoxShadow(
                                    color: AppColors.c9EEB53.withOpacity(0.4),
                                    offset: Offset.zero,
                                    blurRadius: 3.w,
                                    spreadRadius: 3.w)
                              ]),
                    padding: EdgeInsets.all(3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(controller.getBatteryTotalCount(),
                          (index) {
                        bool isFirst = index == 0;
                        bool isLast =
                            index == controller.getBatteryTotalCount() - 1;
                        bool isActive = index < controller.getBatteryCount();
                        BorderRadius? borderRadius;
                        if (isFirst) {
                          borderRadius = BorderRadius.horizontal(
                              left: Radius.circular(2.w));
                        } else if (isLast) {
                          borderRadius = BorderRadius.horizontal(
                              right: Radius.circular(2.w));
                        }
                        return Expanded(
                          child: Container(
                            height: 15.w,
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.c9EEB53
                                  : AppColors.c4D4D4D,
                              borderRadius: borderRadius,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            })
          ],
        ));
  }

  Widget _buildCenter(BuildContext context) {
    return SizedBox(
      width: 207.w,
      height: 105.w,
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: controller.centerPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
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
                          margin: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 7.w),
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
                                  child: MtInkWell(
                                    onTap: () {
                                      BottomTipDialog.showWithSound(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor:
                                              AppColors.cTransparent,
                                          builder: (context) {
                                            return WeekPrizeWidget();
                                          });
                                    },
                                    child: IconWidget(
                                        iconWidth: 24.w,
                                        icon: Assets.commonUiCommonProp05),
                                  )),
                              Text(
                                "${controller.getWeekFinishMission().length}/${controller.getCurrentWeekMission().targetNum}",
                                style: 12.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                        if (controller.getNotGetMission().isNotEmpty)
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
                                    "${controller.getNotGetMission().length}",
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
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.c998460,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(12.w),
            ),
            padding: EdgeInsets.all(4.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9.w),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.managerUiManagerWheelBg01),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 23.w,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 9.w, right: 12.w),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            AppColors.cB29E78,
                            AppColors.cE2D3A7,
                          ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconWidget(
                                  iconWidth: 18.w,
                                  icon: Assets.commonUiCommonProp05),
                              6.hGap,
                              Text(
                                "PRIZE POOL",
                                style: 14.w5(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "1000",
                            style: 14.w5(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 47.w,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        controller: controller.girlPageController,
                        itemBuilder: (BuildContext context, int index) {
                          var item =
                              controller.getInnerCenterGirlWheel()[index];
                          return SizedBox(
                            width: 47.w,
                            height: 47.w,
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.w),
                                  child: Opacity(
                                    opacity:
                                        controller.turnTableEntity.circle == 4
                                            ? 1
                                            : 0.7,
                                    child: SizedBox(
                                        width: 47.w,
                                        height: 47.w,
                                        child: IconWidget(
                                            iconWidth: 47.w,
                                            icon: controller.getImage(item))),
                                  )),
                            ),
                          );
                        },
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.managerUiManagerWheelBg01))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget(
                      url:
                          Utils.getAvatarUrl(controller.turnTableEntity.teamId),
                      width: 40.w,
                      imageFailedPath: Assets.teamUiHead03,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    20.vGap,
                    Obx(() {
                      return AnimatedNum(
                        number: controller.leftScore.value,
                        fromZero: true,
                        textStyle: 14.w5(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      );
                    })
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget(
                      url: "",
                      imageFailedPath: Assets.testTestTeamLogo,
                      width: 40.w,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    20.vGap,
                    Obx(() {
                      return AnimatedNum(
                        number: controller.rightScore.value,
                        fromZero: true,
                        textStyle: 14.w5(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
