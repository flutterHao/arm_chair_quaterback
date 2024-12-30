import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/start_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/add_sparring_players_dialog_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/player_property_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/upgrade_header_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/24/10:09

class StartUpgradeWidget extends GetView<StartUpgradeController> {
  const StartUpgradeWidget({required this.player, super.key});

  final TeamPlayerUpStarVoEntity player;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<StartUpgradeController>(
          init: StartUpgradeController(player),
          builder: (logic) {
            return BlackAppWidget(
              const UserInfoBar(
                showPop: true,
              ),
              bodyWidget: Expanded(
                child: Obx(() {
                  if (controller.loadStatus.value != LoadDataStatus.success) {
                    return Center(
                      child: LoadStatusWidget(
                        loadDataStatus: controller.loadStatus.value,
                      ),
                    );
                  }
                  return Column(
                    children: [
                      const UpgradeHeaderWidget(),
                      Expanded(child: _buildUpgradeWidget(context))
                    ],
                  );
                }),
              ),
            );
          }),
    );
  }

  Widget _buildUpgradeWidget(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // controller.showFloatWidget.value = innerBoxIsScrolled;
          return <Widget>[
            SliverPersistentHeader(
              delegate: FixedHeightSliverHeaderDelegate(
                  child: SizedBox(
                    height: 189.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          child: IconWidget(
                            iconWidth: 309.w,
                            icon: Assets.managerUiManagerPlayerinfoBg01,
                          ),
                        ),
                        SizedBox(
                          width: 241.w,
                          child: Column(
                            children: [
                              15.vGap,
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  InnerShadow(
                                    shadows: [
                                      Shadow(
                                          color: AppColors.c000000
                                              .withOpacity(0.78),
                                          blurRadius: 4.w,
                                          offset: Offset(1.5.w, 0.w))
                                    ],
                                    child: Container(
                                      height: 106.w,
                                      width: 241.w,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.c323232,
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 199.w,
                                    height: 106.w,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.c000000,
                                            AppColors.c262626,
                                            AppColors.c000000
                                          ]),
                                    ),
                                    child: _buildSlotWidget(),
                                  ),
                                  Positioned(
                                      left: 0,
                                      child: IconWidget(
                                        iconWidth: 16.w,
                                        icon: Assets.commonUiCommonArrow,
                                        rotateAngle: -90,
                                      )),
                                  Positioned(
                                      right: 0,
                                      child: IconWidget(
                                        iconWidth: 16.w,
                                        icon: Assets.commonUiCommonArrow,
                                        rotateAngle: 90,
                                      ))
                                ],
                              ),
                              10.vGap,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Obx(() {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Star Up success",
                                            style: 10.w4(
                                                color: AppColors.cFFFFFF,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular),
                                          ),
                                          Text(
                                            "${min(100, controller.upSuccessRate.value).format()}%",
                                            style: 12.w5(
                                                color: AppColors.cFFFFFF,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium),
                                          )
                                        ],
                                      ),
                                      5.vGap,
                                      Container(
                                        height: 9.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.c333333,
                                            borderRadius:
                                                BorderRadius.circular(4.5.w)),
                                        child: Row(
                                          children: [
                                            AnimatedContainer(
                                              height: 9.w,
                                              width: 225.w *
                                                  min(
                                                      1,
                                                      controller.upSuccessRate
                                                              .value /
                                                          100),
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .upSuccessRate
                                                              .value <
                                                          30
                                                      ? AppColors.cD60D20
                                                      : AppColors.cFFFFFF,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.5.w)),
                                              duration: const Duration(
                                                  milliseconds: 300),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 189.w),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: FixedHeightSliverHeaderDelegate(
                    child: Container(
                      padding: EdgeInsets.only(left: 15.5.w),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12.w)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.vGap,
                          Text(
                            "SPARRING PLAYERS",
                            style: 19.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                          20.vGap,
                          Row(
                            children: [
                              MtInkwell(
                                onTap: () {
                                  controller.gradeSort.value = -1;
                                  if (controller.starSort.value == -1) {
                                    controller.starSort.value = 0;
                                  } else if (controller.starSort.value == 0) {
                                    controller.starSort.value = 1;
                                  } else {
                                    controller.starSort.value = 0;
                                  }
                                  controller.sortList();
                                },
                                child: Obx(() {
                                  return Container(
                                    width: 82.w,
                                    height: 28.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.cEEEEEE,
                                        borderRadius:
                                            BorderRadius.circular(14.w)),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          "star",
                                          style: 16.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldRegular),
                                        ),
                                        Positioned(
                                          right: 10.w,
                                          child: Column(
                                            children: [
                                              IconWidget(
                                                iconWidth: 4.w,
                                                icon: Assets
                                                    .commonUiCommonIconSystemArrow,
                                                iconColor:
                                                    controller.starSort == 0
                                                        ? AppColors.c000000
                                                        : AppColors.cB3B3B3,
                                                rotateAngle: -90.w,
                                              ),
                                              3.vGap,
                                              IconWidget(
                                                iconWidth: 4.w,
                                                icon: Assets
                                                    .commonUiCommonIconSystemArrow,
                                                iconColor:
                                                    controller.starSort == 1
                                                        ? AppColors.c000000
                                                        : AppColors.cB3B3B3,
                                                rotateAngle: 90.w,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              5.hGap,
                              MtInkwell(
                                onTap: () {
                                  controller.starSort.value = -1;
                                  if (controller.gradeSort.value == -1) {
                                    controller.gradeSort.value = 0;
                                  } else if (controller.gradeSort.value == 0) {
                                    controller.gradeSort.value = 1;
                                  } else {
                                    controller.gradeSort.value = 0;
                                  }
                                  controller.sortList();
                                },
                                child: Obx(() {
                                  return Container(
                                    width: 82.w,
                                    height: 28.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.cEEEEEE,
                                        borderRadius:
                                            BorderRadius.circular(14.w)),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          "grade",
                                          style: 16.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldRegular),
                                        ),
                                        Positioned(
                                          right: 10.w,
                                          child: Column(
                                            children: [
                                              IconWidget(
                                                iconWidth: 4.w,
                                                icon: Assets
                                                    .commonUiCommonIconSystemArrow,
                                                iconColor:
                                                    controller.gradeSort == 0
                                                        ? AppColors.c000000
                                                        : AppColors.cB3B3B3,
                                                rotateAngle: -90.w,
                                              ),
                                              3.vGap,
                                              IconWidget(
                                                iconWidth: 4.w,
                                                icon: Assets
                                                    .commonUiCommonIconSystemArrow,
                                                iconColor:
                                                    controller.gradeSort == 1
                                                        ? AppColors.c000000
                                                        : AppColors.cB3B3B3,
                                                rotateAngle: 90.w,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    height: 94.w))
          ];
        },
        body: Container(
          color: AppColors.cFFFFFF,
          child: Stack(
            children: [
              Column(
                children: [
                  Divider(
                    color: AppColors.cD1D1D1,
                    height: 1.w,
                  ),
                  Expanded(
                    child: GetBuilder<StartUpgradeController>(
                        id: StartUpgradeController.idUpgradePlayers,
                        builder: (logic) {
                          if (controller.allTeamPlayers.isEmpty) {
                            return SizedBox(
                              height: 250.w,
                              child: const Center(
                                child: LoadStatusWidget(
                                  loadDataStatus: LoadDataStatus.noData,
                                ),
                              ),
                            );
                          }
                          return MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.allTeamPlayers.length,
                                itemBuilder: (context, index) {
                                  return _buildListItem(index);
                                }),
                          );
                        }),
                  ),
                ],
              ),
              Obx(() {
                return AnimatedPositioned(
                  bottom: controller.showFloatWidget.value ? 35.w : -250.w,
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: MtInkwell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return AddSparringPlayersDialogWidget(
                              onBack: (value) {
                            print('isSuccess:$value');
                            Get.back(result: value);
                          });
                        },
                      ),
                      child: Container(
                        height: 79.w,
                        width: 360.w,
                        padding: EdgeInsets.only(right: 11.w, left: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.c000000,
                          borderRadius: BorderRadius.circular(16.w),
                          border:
                              Border.all(color: AppColors.cFF7A58, width: 2.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ADD SPARRING PLAYERS",
                                  style: 16.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                17.vGap,
                                Row(
                                  children: List.generate(
                                      controller.selfStarUpDefine.starPlayerNum,
                                      (index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 4.5.w),
                                      child: IconWidget(
                                        iconWidth: 15.5.w,
                                        icon: Assets
                                            .managerUiManagerPlayerinfoIconPeople,
                                        iconColor: index + 1 <=
                                                controller
                                                    .getSelectedPlayers()
                                                    .length
                                            ? AppColors.cFF7A58
                                            : AppColors.c4D4D4D,
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ),
                            Container(
                              height: 59.w,
                              width: 99.w,
                              decoration: BoxDecoration(
                                color: AppColors.c383838,
                                borderRadius: BorderRadius.circular(9.w),
                              ),
                              child: Column(
                                children: [
                                  5.vGap,
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 69.w,
                                        height: 35.w,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.c1A1A1A,
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                        ),
                                        child: Center(
                                          child: Obx(() {
                                            return Text(
                                              "+${controller.ppUpValue.value.toStringAsFixed(3)}",
                                              style: 16.w5(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium),
                                            );
                                          }),
                                        ),
                                      ),
                                      Positioned(
                                          left: 0,
                                          child: IconWidget(
                                            iconWidth: 6.w,
                                            icon: Assets
                                                .commonUiCommonIconSystemArrow,
                                            iconColor: AppColors.cFF7954,
                                          )),
                                      Positioned(
                                          right: 0,
                                          child: IconWidget(
                                            iconWidth: 6.w,
                                            icon: Assets
                                                .commonUiCommonIconSystemArrow,
                                            iconColor: AppColors.cFF7954,
                                            rotateAngle: 180,
                                          ))
                                    ],
                                  ),
                                  7.vGap,
                                  Obx(() {
                                    return Container(
                                      height: 6.w,
                                      width: 84.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.c262626,
                                          border: Border.all(
                                            color: AppColors.c808080,
                                            width: 1.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3.w)),
                                      child: Row(
                                        children: [
                                          AnimatedContainer(
                                            height: 4.w,
                                            width: 82.w *
                                                min(
                                                    1,
                                                    controller.upSuccessRate
                                                            .value /
                                                        100),
                                            decoration: BoxDecoration(
                                                color: controller.upSuccessRate
                                                            .value <
                                                        30
                                                    ? AppColors.cD60D20
                                                    : AppColors.cFFFFFF,
                                                borderRadius:
                                                    BorderRadius.circular(2.w)),
                                            duration: const Duration(
                                                milliseconds: 300),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ));
  }

  Swiper _buildSlotWidget() {
    return Swiper(
        itemCount: controller.pps.length,
        viewportFraction: 0.38,
        scale: 0.8,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        onIndexChanged: (value) => controller.slotIndex.value = value,
        itemBuilder: (context, index) {
          return Obx(() {
            return SizedBox(
              height: 46.w,
              child: Center(
                child: Text(
                  "${controller.pps[index]} +${controller.ppUpValue.value.toStringAsFixed(3)}",
                  style: 16.w7(
                      color: controller.slotIndex.value == index
                          ? AppColors.cFFFFFF
                          : AppColors.cFFFFFF.withOpacity(0.2),
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
              ),
            );
          });
        });
  }

  Container _buildListItem(int index) {
    UpgradePlayer upgradePlayer = controller.allTeamPlayers[index];
    AllTeamPlayersByUpStarEntity item = upgradePlayer.teamPlayer;
    var baseInfo = Utils.getPlayBaseInfo(item.playerId);
    bool lastIndex = controller.allTeamPlayers.length - 1 == index;
    return Container(
      height: 121.w,
      margin: EdgeInsets.only(
          left: 13.w, right: 13.w, bottom: lastIndex ? 123.w : 0),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          border:
              Border(bottom: BorderSide(color: AppColors.cE6E6E6, width: 1.w))),
      child: Row(
        children: [
          13.hGap,
          PlayerCard(
            width: 73.w,
            height: 93.w,
            playerId: item.playerId,
            grade: Utils.formatGrade(baseInfo.grade),
            level: item.breakThroughGrade,
          ),
          11.hGap,
          Expanded(
            child: InkWell(
              onTap: () => _itemTap(upgradePlayer),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        baseInfo.ename,
                        style: 21.w5(
                            color: AppColors.c262626,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                      7.vGap,
                      Row(
                        children: [
                          Text(
                            "${Utils.getTeamInfo(baseInfo.teamId).shortEname} · ${baseInfo.position}",
                            style: 12.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          9.hGap,
                          IconWidget(
                              iconWidth: 16.w,
                              icon: Utils.getStatusUrl(item.playerStatus)),
                          4.hGap,
                          if (baseInfo.injuries)
                            IconWidget(
                                iconWidth: 16.w,
                                icon: Assets.commonUiCommonIconInjury),
                        ],
                      ),
                      12.vGap,
                      Row(
                        children: [
                          PlayerPropertyWidget(
                            title: "POW",
                            value: item.power.format(),
                          ),
                          if (upgradePlayer.starUpDefine.starUpRange != 0)
                            PlayerPropertyWidget(
                              title: "ATTRIB",
                              value:
                                  "+${upgradePlayer.starUpDefine.starUpRange}",
                            ),
                          PlayerPropertyWidget(
                            title: "SUCCESS",
                            value: "+${item.probability.format()}%",
                          ),
                        ],
                      )
                    ],
                  )),
                  MtInkwell(
                    onTap: () => _itemTap(upgradePlayer),
                    child: Obx(() {
                      return Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: upgradePlayer.select.value
                                ? AppColors.c10A86A
                                : AppColors.cB3B3B3),
                        child: IconWidget(
                          iconWidth: 18.w,
                          icon: Assets.commonUiCommonStatusBarMission02,
                          iconColor: AppColors.cFFFFFF,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _itemTap(UpgradePlayer upgradePlayer) {
    if (upgradePlayer.teamPlayer.position >= 0) {
      EasyLoading.showToast("please remove player from lineup");
      return;
    }
    if (controller.getSelectedPlayers().length ==
            controller.selfStarUpDefine.starPlayerNum &&
        !upgradePlayer.select.value) {
      EasyLoading.showToast("The maximum quantity limit has been reached");
      return;
    }
    upgradePlayer.select.value = !upgradePlayer.select.value;
    controller.onSelectTap();
  }
}
