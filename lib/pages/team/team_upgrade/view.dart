import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/player_item_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamUpgradePage extends GetView<TeamUpgradeController> {
  const TeamUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    TeamPlayerInfoEntity player = Get.arguments['player'];
    return HorizontalDragBackWidget(
      child: GetBuilder<TeamUpgradeController>(
        init: TeamUpgradeController(player),
        builder: (_) {
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
                    ..._buildHeader(context, controller.player.playerId),
                    Expanded(
                        child: PageView(
                      children: [
                        _buildBaseInfo(),
                        _buildUpgradeWidget(context),
                      ],
                    ))
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Container _buildUpgradeWidget(BuildContext context) {
    return Container(
      color: AppColors.cF2F2F2,
      child: NestedScrollView(
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.w),
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
                                              "Special training status",
                                              style: 10.w4(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fRobotoRegular),
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
                                                    color: AppColors.cFFFFFF,
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
                                    } else if (controller.gradeSort.value ==
                                        0) {
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
                      child: GetBuilder<TeamUpgradeController>(
                          id: TeamUpgradeController.idUpgradePlayers,
                          builder: (logic) {
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
                                  children: List.generate(5, (index) {
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
                                              "+${controller.ppUpValue.value}",
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
                                                color: AppColors.cFFFFFF,
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
                  );
                })
              ],
            ),
          )),
    );
  }

  Container _buildListItem(int index) {
    UpgradePlayer upgradePlayer = controller.allTeamPlayers[index];
    AllTeamPlayersByUpStarEntity item = upgradePlayer.item;
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
            level: item.breakThroughGrade + 1,
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
                              icon: Utils.getStatusUrl(
                                  controller.teamPlayerInfo.playerStatus)),
                          //todo
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
                          _buildProperty(
                            "POW",
                            item.power.format(),
                          ),
                          4.hGap,
                          _buildProperty(
                            "ATTRIB",
                            item.power.format(), //todo
                          ),
                          4.hGap,
                          _buildProperty(
                            "STATUS",
                            "+${item.probability.format()}%",
                          ),
                          4.hGap,
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
    upgradePlayer.select.value = !upgradePlayer.select.value;
    controller.onSelectTap();
  }

  Container _buildProperty(String title, String value) {
    return Container(
      height: 29.w,
      width: 55.w,
      padding: EdgeInsets.only(left: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(width: 1.w, color: AppColors.cE6E6E),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: 8.w4(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          ),
          3.vGap,
          Text(
            value,
            style: 12.w5(
                color: AppColors.c010101,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _buildBaseInfo() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 9.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(12.w)),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.vGap,
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16.w),
                          child: Text(
                            "ABILITY",
                            style: 30.w7(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold),
                          ),
                        ),
                      ],
                    ),
                    26.vGap,
                    ...List.generate(8, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 17.w),
                        child: Row(
                          children: [
                            29.hGap,
                            Text(
                              "FGM",
                              style: 16.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldRegular),
                            ),
                            19.hGap,
                            SizedBox(
                              height: 12.w,
                              width: 235.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.w),
                                child: Builder(builder: (context) {
                                  double value =
                                      Random().nextInt(100).toDouble() + 70;
                                  double total = value + 20;
                                  double baseValue = 30;
                                  double beforeUpgradeValue = 50;
                                  double afterUpgradeValue = 60;
                                  double maxProgress = value / total;
                                  double baseProgress = baseValue / total;
                                  double beforeProgress =
                                      beforeUpgradeValue / total;
                                  double afterProgress =
                                      afterUpgradeValue / total;

                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      /// 边框
                                      Container(
                                        height: 12.w,
                                        width: 235.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.w),
                                            border: Border.all(
                                                color: AppColors.cD1D1D1,
                                                width: 1.w)),
                                      ),
                                      AnimatedPositioned(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          left: -(235.w * (1 - maxProgress)),
                                          child: Container(
                                            width: 235.w,
                                            height: 10.w,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color:
                                                            AppColors.c000000,
                                                        width: 2.w))),
                                          )),

                                      /// 升级后
                                      AnimatedPositioned(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          left: -(235.w * (1 - afterProgress)),
                                          child: Container(
                                            height: 12.w,
                                            width: 235.w,
                                            decoration: BoxDecoration(
                                                color: AppColors.cFFD133,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            6.w))),
                                          )),

                                      /// 升级前
                                      AnimatedPositioned(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          left: -(235.w * (1 - beforeProgress)),
                                          child: Container(
                                            height: 12.w,
                                            width: 235.w,
                                            decoration: BoxDecoration(
                                                color: AppColors.cFF7954,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            6.w))),
                                          )),

                                      /// 基础
                                      AnimatedPositioned(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          left: -(235.w * (1 - baseProgress)),
                                          child: Container(
                                            height: 12.w,
                                            width: 235.w,
                                            decoration: BoxDecoration(
                                                color: AppColors.c000000,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            6.w))),
                                          )),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            9.hGap,
                            Text(
                              "3000",
                              style: 16.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldRegular),
                            ),
                          ],
                        ),
                      );
                    }),
                    16.vGap,
                    if (controller.player.breakThroughGrade < 10)
                      MtInkwell(
                        onTap: () {
                          print('upgrade--------');
                        },
                        child: Container(
                          height: 51.w,
                          width: 343.w,
                          decoration: BoxDecoration(
                              color: AppColors.c000000,
                              borderRadius: BorderRadius.circular(9.w)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                "UPGRADE",
                                style: 23.w5(
                                    color: AppColors.cFFFFFF,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                              Positioned(
                                  right: 13.w,
                                  child: IconWidget(
                                      iconWidth: 11.w,
                                      icon: Assets
                                          .commonUiCommonIconSystemJumpto))
                            ],
                          ),
                        ),
                      ),
                    21.vGap,
                  ],
                ),
                Positioned(
                    right: 10.w,
                    top: 10.w,
                    child: ShareWidget(globalKey: GlobalKey())) //todo
              ],
            ),
          ),
          Container(
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
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                  ],
                ),
                22.vGap,
                Container(
                  margin: EdgeInsets.only(left: 29.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      double progress = Random().nextDouble();

                      var borderSweepAngle = 190.0;

                      var progressSweepAngle = progress * borderSweepAngle;

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
                              ArcWidget(
                                45.w,
                                borderColor: AppColors.cE1E1E1,
                                progressColor: AppColors.cFF7954,
                                progressWidth: 7.w,
                                progressSweepAngle: progressSweepAngle,
                                borderWidth: 7.w,
                                startAngle: 170,
                                borderSweepAngle: borderSweepAngle,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${progress.format()}%",
                                      style: 20.w7(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldBold),
                                    ),
                                    7.vGap,
                                    Text(
                                      "LAYUP",
                                      style: 10.w4(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily:
                                              FontFamily.fRobotoRegular),
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
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                  ],
                ),
                16.vGap,
                Divider(
                  color: AppColors.cD1D1D1,
                  height: 1.w,
                ),
                Container(
                  height: 110.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return SizedBox(
                            width: 125.w,
                            height: 28.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Midline defense",
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                                15.hGap,
                                Text(
                                  "2630",
                                  style: 12.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                      56.hGap,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return SizedBox(
                            width: 125.w,
                            height: 28.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Midline defense",
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                                15.hGap,
                                Text(
                                  "2630",
                                  style: 12.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Divider(
                      color: AppColors.cD1D1D1,
                      height: 1.w,
                    )),
                21.vGap,
              ],
            ),
          ),
          9.vGap,
        ],
      ),
    );
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
                  "${controller.pps[index]} +${controller.ppUpValue.value}",
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

  List<Widget> _buildHeader(BuildContext context, int playerId) {
    return [
      Container(
        height: 117.w,
        width: double.infinity,
        color: Utils.getTeamColor(controller.playerBaseInfo.teamId),
        child: Stack(
          children: [
            Row(
              children: [
                20.hGap,
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 116.w,
                      width: 144.w,
                      child: ImageWidget(
                        url: Utils.getPlayUrl(playerId),
                        imageFailedPath: Assets.iconUiDefault04,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Positioned(
                      right: 2.w,
                      top: 18.w,
                      child: Container(
                        width: 29.w,
                        height: 16.w,
                        margin: EdgeInsets.only(right: 3.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Text(
                          controller.teamPlayerInfo.position > 0
                              ? "MAIN"
                              : "SUB",
                          style: 10.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                8.hGap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      18.vGap,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.getLastName(),
                          style: 16.w4(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        ),
                      ),
                      4.vGap,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.getLastName(),
                          style: 24.w5(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                      ),
                      11.vGap,
                      Row(
                        children: [
                          Text(
                            "${Utils.getTeamInfo(controller.playerBaseInfo.teamId).shortEname} · ${controller.playerBaseInfo.position}",
                            style: 12.w4(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          10.hGap,
                          IconWidget(
                              iconWidth: 16.w,
                              icon: Utils.getStatusUrl(
                                  controller.teamPlayerInfo.playerStatus)),
                          6.hGap,
                          if (controller.playerBaseInfo.injuries)
                            IconWidget(
                                iconWidth: 16.w,
                                icon: Assets.commonUiCommonIconInjury),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: 18.w,
                left: 16.w,
                bottom: 8.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Text(
                          "S",
                          style: TextStyle(
                            fontSize: 30.sp,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamily.fRobotoRegular,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.w
                              ..color = AppColors.cFFFFFF,
                          ),
                        ),
                        Text(
                          "S",
                          style: TextStyle(
                            fontSize: 30.sp,
                            height: 1,
                            color: AppColors.c000000,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.managerUiManagerPlayerstar),
                        Text(
                          "${controller.teamPlayerInfo.getBreakThroughGrade()}",
                          style: 13.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fRobotoMedium,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${controller.playerBaseInfo.playerScore}",
                          style: 19.w7(
                              height: 1,
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fOswaldBold),
                        ),
                        Text(
                          "OVR",
                          style: 10.w4(
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      Container(
        height: 37.w,
        width: double.infinity,
        color: AppColors.cFFFFFF,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.hGap,
            Expanded(
              flex: 114,
              child: Container(
                width: 114.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "POWER",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Text(
                      "${controller.teamPlayerInfo.power}",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
              ),
            ),
            4.hGap,
            Expanded(
              flex: 139,
              child: Container(
                width: 139.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SALARY",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Row(
                      children: [
                        IconWidget(
                            iconWidth: 16.w, icon: Assets.commonUiCommonProp05),
                        4.hGap,
                        Text(
                          Utils.formatMoney(controller.playerBaseInfo.salary),
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldRegular),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            4.hGap,
            Expanded(
              flex: 82,
              child: Container(
                width: 82.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconWidget(
                        iconWidth: 11.w,
                        icon: Assets.managerUiManagerIconRecover),
                    7.hGap,
                    Text(
                      ///todo 暂无此字段
                      "${controller.teamPlayerInfo.power}",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
              ),
            ),
            16.hGap
          ],
        ),
      )
    ];
  }
}
