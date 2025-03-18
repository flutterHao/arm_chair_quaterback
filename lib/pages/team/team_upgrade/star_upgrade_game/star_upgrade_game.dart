import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/slot_dialog/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/widget/star_upgrade_game_turntable.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/slot_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/27/15:33

class StarUpgradeGame extends GetView<StarUpgradeGameController> {
  const StarUpgradeGame(this.playerUuid, {super.key});

  final String playerUuid;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<StarUpgradeGameController>(
          init: StarUpgradeGameController(playerUuid),
          builder: (logic) {
            return Container(
              color: AppColors.c1A1A1A,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// 背景
                  Positioned(
                    top: 0.w,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      Assets.managerUiManagerStar06,
                      width: 205.5.w,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),

                  /// sparring
                  Positioned(
                      top: -35.h,
                      bottom: 0,
                      child: OutlinedText(
                          text: "SPARRING",
                          strokeWidth: 1.w,
                          strokeColor: AppColors.c217FE0,
                          textStyle: 94.w7(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold,
                          ))),

                  Obx(() {
                    if (controller.loadStatus.value != LoadDataStatus.success) {
                      return Center(
                        child: LoadStatusWidget(
                          loadDataStatus: controller.loadStatus.value,
                        ),
                      );
                    }
                    return Positioned(
                        top: 118.h,
                        child: Column(
                          children: [
                            /// player info and reward
                            Container(
                              height: 210.h,
                              width: 356.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.w),
                                color: AppColors.c35353E,
                              ),
                              padding: EdgeInsets.all(7.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w),
                                  color: AppColors.cF2F2F2,
                                ),
                                child: Column(
                                  children: [
                                    /// player info
                                    Builder(builder: (context) {
                                      NbaPlayerInfosPlayerBaseInfoList
                                          baseInfo = Utils.getPlayBaseInfo(
                                              controller
                                                  .teamPlayerUpStarVoEntity
                                                  .playerId);
                                      return Container(
                                        height: 74.h,
                                        margin: EdgeInsets.only(
                                            left: 11.w, right: 6.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              children: [
                                                15.vGap,
                                                OutlinedText(
                                                  text:
                                                      "${baseInfo.playerScore}",
                                                  textStyle: 24.w7(
                                                    color: AppColors.c000000,
                                                    height: 1,
                                                    fontFamily:
                                                        FontFamily.fOswaldBold,
                                                  ),
                                                  strokeWidth: 1.5.w,
                                                  strokeColor:
                                                      AppColors.cFFFFFF,
                                                ),
                                              ],
                                            ),
                                            6.hGap,
                                            ImageWidget(
                                              url: Utils.getPlayUrl(
                                                  baseInfo.playerId),
                                              width: 84.w,
                                              height: 64.w,
                                              imageFailedPath:
                                                  Assets.iconUiDefault05,
                                            ),
                                            9.hGap,
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  baseInfo.ename,
                                                  style: 19.w5(
                                                    color: AppColors.c000000,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                  ),
                                                ),
                                                3.vGap,
                                                PlayerStartWidget(
                                                    grade: controller
                                                        .teamPlayerUpStarVoEntity
                                                        .breakThroughGrade),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }),

                                    /// player 属性
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 6.w),
                                      child: Divider(
                                        height: 1.h,
                                        color: AppColors.cA5A5A5,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 15.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                            controller.getPropertyList().length,
                                            (index) {
                                          var item = controller
                                              .getPropertyList()[index];
                                          String property = item.propertyName;
                                          List<Property> list =
                                              controller.slotResult[property] ??
                                                  [];
                                          var totalBet = list.fold(0.0, (p, e) {
                                                return p + e.bet;
                                              }) *
                                              (controller
                                                      .upStarTeamPlayerV2Entity
                                                      ?.addRate ??
                                                  0);
                                          return SizedBox(
                                            width: 28.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Opacity(
                                                  opacity:
                                                      totalBet == 0 ? 0.4 : 1,
                                                  child: Column(
                                                    children: [
                                                      FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          property,
                                                          style: 12.w5(
                                                            color: AppColors
                                                                .c000000,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fRobotoMedium,
                                                          ),
                                                        ),
                                                      ),
                                                      5.vGap,
                                                      FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          (item.baseValue +
                                                                  item.baseValue *
                                                                      totalBet)
                                                              .toStringAsFixed(
                                                                  0),
                                                          style: 14.w5(
                                                            color: AppColors
                                                                .c000000,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fOswaldMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                10.vGap,
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: List.generate(3,
                                                      (innerIndex) {
                                                    var realIndex =
                                                        3 - 1 - innerIndex;
                                                    var has = list.length - 1 >=
                                                        realIndex;
                                                    return AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      height: 14.h,
                                                      width: 28.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2
                                                                      .w),
                                                          color: has
                                                              ? list[realIndex]
                                                                  .color
                                                              : AppColors
                                                                  .cC9C9CF),
                                                      child: has
                                                          ? IconWidget(
                                                              icon: Assets
                                                                  .iconUiIconRuidgt,
                                                              iconWidth: 9.w,
                                                              iconColor: AppColors
                                                                  .cFFFFFF
                                                                  .withOpacity(
                                                                      0.4),
                                                            )
                                                          : null,
                                                    );
                                                  }),
                                                ))
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            21.vGap,
                            SizedBox(
                              height: 434.h,
                              width: 375.w,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  /// 背景
                                  Container(
                                    height: 434.h,
                                    width: 356.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.c363742,
                                      borderRadius: BorderRadius.circular(9.w),
                                      border: Border.all(
                                          color: AppColors.c454957, width: 1.w),
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 9.w,
                                        top: 14.h,
                                        right: 9.w,
                                        bottom: 8.h),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 14.h,
                                      ),

                                      /// 升星次数
                                      Container(
                                        width: 356.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9.w),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 34.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors.c28282E,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.w)),
                                            ),
                                            Obx(() {
                                              var activeValue =
                                                  controller.nowCount.value;
                                              return SizedBox(
                                                height: 42.h,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: controller
                                                        .getMaxStarTimes(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      bool isFirst = index == 0;
                                                      bool isLast = index ==
                                                          controller
                                                                  .getMaxStarTimes() -
                                                              1;
                                                      bool bonus = controller
                                                          .getBonusList()
                                                          .contains(index + 1);
                                                      double width =
                                                          bonus ? 22.w : 19.w;
                                                      String icon = bonus
                                                          ? Assets
                                                              .managerUiManagerRisingstar01
                                                          : Assets
                                                              .managerUiManagerRisingstar02;

                                                      bool isActive =
                                                          index < activeValue;
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                            left: isFirst
                                                                ? 11.w
                                                                : 0,
                                                            right: isLast
                                                                ? 11.w
                                                                : 0),
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          children: [
                                                            SizedBox(
                                                              width: width,
                                                              height: 34.h,
                                                              child: IconWidget(
                                                                icon: icon,
                                                                iconColor: isActive
                                                                    ? null
                                                                    : AppColors
                                                                        .c3D3F4B,
                                                              ),
                                                            ),
                                                            if (bonus)
                                                              Positioned(
                                                                bottom: 0,
                                                                left: 0,
                                                                right: 0,
                                                                child: Transform
                                                                    .scale(
                                                                  scaleX:
                                                                      31 / 22,
                                                                  child:
                                                                      Container(
                                                                    width: 22.w,
                                                                    height:
                                                                        12.h,
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            2.w),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: AppColors
                                                                          .c000000,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.w),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            1.w,
                                                                        color: isActive
                                                                            ? AppColors.cFFC93C
                                                                            : AppColors.c535561,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        FittedBox(
                                                                      fit: BoxFit
                                                                          .scaleDown,
                                                                      child:
                                                                          Text(
                                                                        "BONUS",
                                                                        style: 10
                                                                            .w5(
                                                                          color: isActive
                                                                              ? AppColors.cFFC93C
                                                                              : AppColors.c5F6170,
                                                                          height:
                                                                              0.9,
                                                                          fontFamily:
                                                                              FontFamily.fOswaldMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      // 水果机
                                      SizedBox(
                                        width: 356.w,
                                        height: 137.h,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            /// 背景
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 18.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    controller.selectIndexList
                                                        .length, (index) {
                                                  return Container(
                                                    height: 137.h,
                                                    width: 59.w,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.5.w),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.cF1F1F1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.w)),
                                                  );
                                                }),
                                              ),
                                            ),

                                            /// 中间线
                                            Positioned(
                                                left: 0.w,
                                                right: 0.w,
                                                child: Row(
                                                  children: [
                                                    IconWidget(
                                                      icon: Assets
                                                          .managerUiManagerRisingstar05,
                                                      iconWidth: 17.w,
                                                      rotateAngle: -90,
                                                    ),
                                                    Expanded(
                                                        child: Divider(
                                                      height: 1.h,
                                                      color: AppColors.cC40722,
                                                    )),
                                                    IconWidget(
                                                      icon: Assets
                                                          .managerUiManagerRisingstar05,
                                                      iconWidth: 17.w,
                                                      rotateAngle: 90,
                                                    ),
                                                  ],
                                                )),

                                            /// pageview
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 18.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    controller.selectIndexList
                                                        .length, (index) {
                                                  return Container(
                                                    height: 137.h,
                                                    width: 59.w,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.5.w),
                                                    child: SlotListViewWidget(
                                                        controller: controller
                                                                .slotMachineControllers[
                                                            index],
                                                        itemCount: controller
                                                            .propertyList
                                                            .length,
                                                        onEnd: (index) =>
                                                            controller
                                                                .onSpinEnd(
                                                                    index),
                                                        itemBuilder: (context,
                                                            index,
                                                            selectIndex) {
                                                          String text = controller
                                                                  .propertyList[
                                                              index %
                                                                  controller
                                                                      .propertyList
                                                                      .length];
                                                          return Center(
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              child: Container(
                                                                color: AppColors
                                                                    .cF1F1F1,
                                                                child:
                                                                    OutlinedText(
                                                                  text: text,
                                                                  maxLines: 1,
                                                                  textStyle:
                                                                      21.w7(
                                                                    color: AppColors
                                                                        .c000000,
                                                                    height: 1,
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .fOswaldBold,
                                                                  ),
                                                                  strokeColor:
                                                                      AppColors
                                                                          .cFFFFFF,
                                                                  strokeWidth:
                                                                      2.w,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 22.h,
                                      ),
                                      // 成功率进度条
                                      Container(
                                        width: 319.w,
                                        height: 16.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.c28282E,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Obx(() {
                                          return Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                width: 319.w *
                                                    controller
                                                        .successRate.value,
                                                height: 16.h,
                                                color: controller
                                                            .successRate.value >
                                                        (controller
                                                            .getLowSuccessRate())
                                                    ? AppColors.c2B82E4
                                                    : AppColors.c9B1A2C,
                                              ),
                                              AnimatedBuilder(
                                                  animation: Listenable.merge([
                                                    controller
                                                        .repeatAnimationController,
                                                    controller
                                                        .endAnimationController,
                                                  ]),
                                                  builder: (context, child) {
                                                    return Positioned(
                                                      left: !controller
                                                              .repeatAnimationController
                                                              .isAnimating
                                                          ? controller
                                                              .endAnimation
                                                              .value
                                                          : controller
                                                              .repeatAnimation
                                                              .value,
                                                      child: IconWidget(
                                                        icon: Assets
                                                            .managerUiManagerRisingstar09,
                                                        iconHeight: 16.h,
                                                      ),
                                                    );
                                                  })
                                            ],
                                          );
                                        }),
                                      ),

                                      /// 成功率文本
                                      SizedBox(
                                        height: 37.h,
                                        width: 354.w,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              height: 10.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Divider(
                                                    color: AppColors.c454957,
                                                    height: 1.h,
                                                  ),
                                                  Divider(
                                                    color: AppColors.c454957,
                                                    height: 1.h,
                                                  ),
                                                  Divider(
                                                    color: AppColors.c454957,
                                                    height: 1.h,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Obx(() {
                                              return Container(
                                                width: 170.w,
                                                height: 20.h,
                                                color: AppColors.c363742,
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Text(
                                                      "SUCCESS RATE ${(controller.successRate.value * 100).format()}%",
                                                      style: 14.w4(
                                                        color:
                                                            AppColors.cFFFFFF,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldRegular,
                                                      ),
                                                    ),
                                                    if (controller.successRate
                                                            .value <=
                                                        controller
                                                            .getLowSuccessRate())
                                                      Positioned(
                                                          right: 9.w,
                                                          child: IconWidget(
                                                            icon: Assets
                                                                .commonUiCommonIconSystemDanger01,
                                                            iconWidth: 16.w,
                                                          ))
                                                  ],
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ),

                                      /// 按钮
                                      Container(
                                        height: 137.h,
                                        width: 337.w,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(Assets
                                                    .managerUiManagerRisingstar08))),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            /// 完成按钮
                                            Positioned(
                                                left: 20.w,
                                                top: 27.h,
                                                width: 65.w,
                                                height: 50.h,
                                                child: MtInkWell(
                                                  splashColor:
                                                      AppColors.cTransparent,
                                                  onTap: () {
                                                    if (!controller
                                                        .isGameOver) {
                                                      BottomTipDialog.show(
                                                          context: context,
                                                          onTap: () {
                                                            Get.back();
                                                            controller.finish();
                                                          },
                                                          btnDirection:
                                                              Axis.horizontal,
                                                          title: "ARE YOU SURE",
                                                          desc:
                                                              "Do you want to finish youth training");
                                                      return;
                                                    }
                                                    controller.finish();
                                                  },
                                                  child: Obx(() {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconWidget(
                                                          icon: Assets
                                                              .managerUiManagerRisingstar04,
                                                          iconWidth: 23.w,
                                                          iconColor: controller
                                                                      .nowCount
                                                                      .value <
                                                                  1
                                                              ? AppColors
                                                                  .c5C5E6A
                                                              : null,
                                                        ),
                                                        5.vGap,
                                                        Text(
                                                          "FINISH",
                                                          style: 12.w4(
                                                            color: controller
                                                                        .nowCount
                                                                        .value <
                                                                    1
                                                                ? AppColors
                                                                    .c5C5E6A
                                                                : AppColors
                                                                    .cFFFFFF,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fOswaldRegular,
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  }),
                                                )),

                                            /// 开始转动按钮
                                            Positioned(
                                                top: 13.h,
                                                left: 117.w,
                                                child: Stack(
                                                  children: [
                                                    IconWidget(
                                                      icon: "",
                                                      iconHeight: 100.h,
                                                    ),
                                                    Positioned(
                                                      top: 0.h,
                                                      left: 0.w,
                                                      child: MtInkWell(
                                                        onTap: () {
                                                          print('DRILL');
                                                          if (!controller
                                                                  .isGameOver &&
                                                              controller
                                                                      .getLowSuccessRate() >=
                                                                  controller
                                                                      .successRate
                                                                      .value) {
                                                            BottomTipDialog
                                                                .show(
                                                                    context:
                                                                        context,
                                                                    onTap: () {
                                                                      Get.back();
                                                                      controller
                                                                          .drill();
                                                                    },
                                                                    btnDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    title:
                                                                        "ARE YOU SURE",
                                                                    desc:
                                                                        "The success rete is too low.\nDo you really want to continue?");
                                                            return;
                                                          }
                                                          controller.drill();
                                                        },
                                                        splashColor: AppColors
                                                            .cTransparent,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      25.w,
                                                                  vertical:
                                                                      28.h),
                                                          child: Text(
                                                            "DRILL",
                                                            style: 23.w5(
                                                              color: AppColors
                                                                  .cFFFFFF,
                                                              height: 1,
                                                              fontFamily: FontFamily
                                                                  .fOswaldMedium,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Positioned(
                                                top: 27.h,
                                                right: 20.5.w,
                                                child: Container(
                                                  height: 50.h,
                                                  width: 45.w,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.h),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "INSERT COIN",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: 13.w5(
                                                          color:
                                                              AppColors.c3D3F4B,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium,
                                                        ),
                                                      ),
                                                      Text(
                                                        "TO PLAY",
                                                        style: 10.w5(
                                                          color:
                                                              AppColors.c3D3F4B,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  })
                ],
              ),
            );
          }),
    );
  }
}
