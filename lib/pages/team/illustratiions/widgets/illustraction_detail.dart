/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-01-18 15:28:39
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/detail_controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/ilustraction_drag.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/big_player_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustratiionsDetail extends GetView<IlluSctrationDtlCtrl> {
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
    var item = Get.arguments as PlayerCollectCollects;
    int playerId = item.playerId;
    var player = Utils.getPlayBaseInfo(playerId);
    return GetBuilder<IlluSctrationDtlCtrl>(
      init: IlluSctrationDtlCtrl(player),
      id: "detail",
      builder: (_) {
        Log.d("__canScroller${controller.currentY == 143.w}");
        int teamId = Utils.getPlayBaseInfo(player.playerId).teamId;
        String teamName =
            ObjectUtil.isNotEmpty(Utils.getTeamInfo(teamId).teamEname)
                ? Utils.getTeamInfo(teamId).teamEname
                : Utils.getTeamInfo(teamId).longEname.split(" ").last;
        return HorizontalDragBackWidget(
          child: BlackAppWidget(
            const UserInfoBar(showPop: true),
            bodyWidget: Expanded(
              child: Stack(
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
                        for (int i = 3; i > 0; i--)
                          Positioned(
                            // top: 38.w,
                            top: 40.w + 30.w * (i - 1) * controller.scale,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: (64 + 86 * controller.scale).w,
                              child: ClipRect(
                                // color: Colors.black,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  heightFactor: i == 1 ? 1 : 0.2, //宽度设为原来宽度一半
                                  child: FittedBox(
                                    child: OutlinedText(
                                      text: teamName.toUpperCase(),
                                      strokeWidth: 1,
                                      strokeColor:
                                          controller.getTeamColor(teamId),
                                      textStyle: TextStyle(
                                        letterSpacing: -1,
                                        fontSize:
                                            (77 + 73 * controller.scale).spMin,
                                        fontFamily: FontFamily.fOswaldMedium,
                                        color: Colors.transparent,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          top: 16.5.w + (94.w - 16.5.w) * controller.scale,
                          child: Transform.scale(
                            alignment: Alignment.topCenter,
                            scale: (70 + controller.scale * 104) / 174,
                            child: item.isLight == 1
                                ? BigPlayerCard(playerId: playerId)
                                : Image.asset(
                                    Assets.managerUiManagerPlayercardBig,
                                    width: 174.w,
                                    height: 267.w,
                                  ),
                          ),
                        ),
                        Positioned(
                            top: 240.w,
                            right: 0,
                            child: Opacity(
                              opacity: controller.scale,
                              child: Text(
                                "#${player.number}",
                                style: (75 * controller.scale).w4(
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 1,
                                    color: AppColors.cFFFFFF.withOpacity(0.03)),
                              ),
                            )),
                        if (item.isActive == 1)
                          Positioned(
                            top: 99.w + (332 - 99).w * controller.scale,
                            right: 16.w,
                            child: MtInkWell(
                              onTap: () {
                                int cash = controller.countDestoryCash(item);
                                BottomTipDialog.show(
                                    context: context,
                                    height: 469.w,
                                    btnDirection: Axis.horizontal,
                                    cancelStr: LangKey.gameButtonDelete.tr,
                                    confirmStr: LangKey.gameButtonCancel.tr,
                                    cancelBgColor: AppColors.cD60D20,
                                    title: LangKey.gameTabFire.tr,
                                    desc: LangKey.gameTipsFire.tr,
                                    centerWidget: Column(
                                      children: [
                                        45.vGap,
                                        Text(
                                          LangKey.gameTipsFireReward.tr,
                                          style: 19.w4(
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                              height: 0.85),
                                        ),
                                        9.5.vGap,
                                        Divider(
                                          color: AppColors.cD1D1D1,
                                          height: 1.w,
                                        ),
                                        23.vGap,
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 41.w,
                                              height: 41.w,
                                              child: Center(
                                                child: IconWidget(
                                                    iconWidth: 34.w,
                                                    icon: Assets
                                                        .commonUiCommonProp05),
                                              ),
                                            ),
                                            Text(
                                              Utils.formatMoney(cash),
                                              style: 14.w4(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular,
                                              ),
                                            ),
                                          ],
                                        ),
                                        50.vGap,
                                      ],
                                    ),
                                    onTap: () {
                                      Get.back();
                                    },
                                    cancelTap: () {
                                      controller.destroyTeamPlayer(item);
                                    });
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.cD60D20,
                                  borderRadius: BorderRadius.circular(7.w),
                                ),
                                child: IconWidget(
                                    iconWidth: 12.w,
                                    icon: Assets.iconUiIconDelete02),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  IllustractionDragWidget(
                    child: Stack(
                      children: [
                        //球员基本信息
                        Positioned(
                          top: 66.w,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SingleChildScrollView(
                            controller: controller.scrollController,
                            physics: (controller.currentY == 143.w &&
                                    controller.scale == 0)
                                ? const ClampingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  41.5.vGap,
                                  Text(
                                    player.elname,
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 29.w),
                                    child: Row(
                                      children: [
                                        _borderCard(
                                          LangKey.gameMeanPower.tr,
                                          player.playerStrength.toString(),
                                        ),
                                        9.hGap,
                                        _borderCard(
                                          LangKey.gameMeanSalary.tr,
                                          Utils.formatMoney(player.salary),
                                        ),
                                      ],
                                    ),
                                  ),
                                  55.vGap,
                                  //能力
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16.w),
                                        child: Text(
                                          "ABILITY",
                                          style: 24.w7(
                                              color: AppColors.c000000,
                                              height: 0.8,
                                              fontFamily:
                                                  FontFamily.fOswaldBold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  26.vGap,
                                  ...List.generate(
                                      controller.upgradePlayerAbilityList
                                          .length, (index) {
                                    var ability = controller
                                        .upgradePlayerAbilityList[index];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 17.w),
                                      child: Row(
                                        children: [
                                          29.hGap,
                                          Expanded(
                                            child: Text(
                                              ability.name,
                                              style: 16.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fOswaldRegular),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.w,
                                            width: 235.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.w),
                                              child:
                                                  Builder(builder: (context) {
                                                double value = ability
                                                    .sGradeLevel1PlayerMaxValue;
                                                double total =
                                                    ability.totalValue;
                                                double baseValue =
                                                    ability.baseValue;

                                                double maxProgress =
                                                    ability.selfLevel10Value /
                                                        total;
                                                double baseProgress =
                                                    baseValue / value;

                                                return Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    /// 边框
                                                    Container(
                                                      height: 12.w,
                                                      width: 235.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6
                                                                      .w),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .cD1D1D1,
                                                              width: 1.w)),
                                                    ),
                                                    Positioned(
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
                                                                      width: 2
                                                                          .w))),
                                                        )),

                                                    /// 基础
                                                    Positioned(
                                                        left: -(235.w *
                                                            (1 - baseProgress)),
                                                        child: Container(
                                                          height: 12.w,
                                                          width: 235.w,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .c000000,
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
                                              ability.baseValue
                                                  .toStringAsFixed(0),
                                              style: 16.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fOswaldRegular),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 16.w),
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
                                                    .getOffensive()
                                                    .length, (index) {
                                              var offensive = controller
                                                  .getOffensive()[index];
                                              double progress =
                                                  offensive.progress;

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
                                                    alignment:
                                                        Alignment.topCenter,
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
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "${progress.formatToString()}%",
                                                              style: 20.w7(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .fOswaldBold),
                                                            ),
                                                            7.vGap,
                                                            Text(
                                                              offensive.name,
                                                              style: 10.w4(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                      FontFamily
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 16.w),
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
                                                children:
                                                    List.generate(3, (index) {
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
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            additional.name,
                                                            style: 12.w4(
                                                                color: AppColors
                                                                    .c000000,
                                                                height: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular),
                                                          ),
                                                        ),
                                                        15.hGap,
                                                        Text(
                                                          additional.value
                                                              .toStringAsFixed(
                                                                  0),
                                                          style: 12.w4(
                                                              color: AppColors
                                                                  .c000000,
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
                                                children:
                                                    List.generate(3, (index) {
                                                  var additional = controller
                                                          .getAdditional()[
                                                      index + 3];
                                                  return SizedBox(
                                                    width: 125.w,
                                                    height: 28.w,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            additional.name,
                                                            style: 12.w4(
                                                                color: AppColors
                                                                    .c000000,
                                                                height: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular),
                                                          ),
                                                        ),
                                                        15.hGap,
                                                        Text(
                                                          additional.value
                                                              .toStringAsFixed(
                                                                  0),
                                                          style: 12.w4(
                                                              color: AppColors
                                                                  .c000000,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //进度条
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColors.cDEDEDE,
                                      offset: Offset(0, 2),
                                      blurRadius: 9)
                                ],
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            "${item.fragmentNum}/${item.needNum}",
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
                                        progress:
                                            item.fragmentNum / item.needNum,
                                        width: 270.w,
                                        height: 12.w,
                                      ),
                                    ],
                                  ),
                                ),
                                MtInkWell(
                                  onTap: () {
                                    if (item.fragmentNum < item.needNum) {
                                      return;
                                    }
                                    controller.composeTeamPlayer(item);
                                  },
                                  child: Container(
                                    width: 59.w,
                                    height: 40.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.w),
                                      color: item.fragmentNum < item.needNum
                                          ? AppColors.cEEEEEE
                                          : AppColors.c000000,
                                    ),
                                    child: Text(
                                      "CLAIM",
                                      style: 16.w4(
                                          // height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                          color: item.fragmentNum < item.needNum
                                              ? AppColors.ccccccc
                                              : AppColors.cFFFFFF),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ), //球员信息
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
