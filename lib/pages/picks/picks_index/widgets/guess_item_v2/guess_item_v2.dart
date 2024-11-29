import 'dart:ui';

import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_controller_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:43

class GuessItemV2 extends StatefulWidget {
  const GuessItemV2(
      {super.key,
      required this.playerV2,
      required this.index,
      this.mainRoute = false});

  final PicksPlayerV2 playerV2;
  final int index;
  final bool mainRoute;

  @override
  State<GuessItemV2> createState() => _GuessItemV2State();
}

class _GuessItemV2State extends State<GuessItemV2> with WidgetsBindingObserver {
  late GuessItemControllerV2 controller;
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    PicksPlayerV2 player = widget.playerV2;
    PicksIndexController picksIndexController = Get.find();
    controller = Get.put(GuessItemControllerV2(player),
        tag: "${player.guessInfo.playerId}_${widget.index}_${player.tabStr}");
    var count = player.guessInfo.moreCount + player.guessInfo.lessCount;
    Future.delayed(Duration.zero, () {
      controller.currentIndex.value = widget.playerV2.status;
      controller.formatGameStartTime();
    });
    var morePercent = player.guessInfo.moreCount / count;
    if (player.guessInfo.moreCount == 0 && player.guessInfo.lessCount == 0) {
      morePercent = 50;
    } else if (player.guessInfo.moreCount == 0) {
      morePercent = 0;
    } else if (player.guessInfo.lessCount == 0) {
      morePercent = 100;
    } else {
      morePercent = player.guessInfo.moreCount /
          (player.guessInfo.moreCount + player.guessInfo.lessCount) *
          100;
    }
    return Stack(
      children: [
        RepaintBoundary(
          key: _repaintBoundaryKey,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                25.vGap,
                InkWell(
                  onTap: () => Get.toNamed(RouteNames.leagueLeagueDetail,
                      arguments: {"gameId": player.guessInfo.gameId}),
                  child: Row(
                    children: [
                      29.hGap,
                      Stack(
                        children: [
                          PlayerAvatarWidget(
                            width: 73.w,
                            height: 93.w,
                            radius: 9.w,
                            playerId: player.guessInfo.playerId,
                            getXRouteId:
                                widget.mainRoute ? null : GlobalNestedKey.PICKS,
                            backgroundColor: AppColors.cD9D9D9,
                            tabStr: player.tabStr,
                          ),
                          Positioned(
                              top: 4.w,
                              right: 4.w,
                              child: Container(
                                height: 16.w,
                                width: 16.w,
                                decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: IconWidget(
                                  iconWidth: 9.w,
                                  icon: Assets.iconUiIconRead,
                                  iconColor: AppColors.c000000,
                                ),
                              ))
                        ],
                      ),
                      14.hGap,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              player.baseInfoList.ename,
                              style: 16.w4(
                                  color: AppColors.c000000,
                                  fontFamily: FontFamily.fOswaldRegular,
                                  height: 1),
                              overflow: TextOverflow.ellipsis,
                            ),
                            8.vGap,
                            Row(
                              children: [
                                Text(
                                  "${player.guessInfo.guessReferenceValue[player.tabStr] ?? 0}",
                                  style: 24.w7(
                                      color: AppColors.c262626,
                                      fontFamily: FontFamily.fOswaldMedium,
                                      height: 1),
                                ),
                                14.hGap,
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      Utils.getLongName(player.tabStr),
                                      style: 19.w7(
                                        color: AppColors.c262626,
                                        fontFamily: FontFamily.fOswaldMedium,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                20.hGap,
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.playerUiIconArrows01,
                                  iconColor: AppColors.c000000,
                                ),
                                18.hGap,
                              ],
                            ),
                            16.vGap,
                            Obx(() {
                              return FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "${Utils.getTeamInfo(player.baseInfoList.teamId).shortEname}@${player.awayTeamInfo?.shortEname ?? ""}   ${controller.gameStartTimeStr.value}",
                                  style: 12.w4(
                                      color: AppColors.c000000,
                                      fontFamily: FontFamily.fRobotoRegular,
                                      height: 1),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                11.vGap,
                _buildBtn(picksIndexController, player, controller),
                16.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MORE",
                            style: 10.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          Text(
                            "APPROVAL RATING",
                            style: 10.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          Text(
                            "LESS",
                            style: 10.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          )
                        ],
                      ),
                      2.vGap,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${morePercent.toStringAsFixed(0)}%",
                            style: 14.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                          3.hGap,
                          Expanded(
                            child: SupportPercentProgressWidget(
                                leftPercent: morePercent.toInt(),
                                rightPercent: 100 - morePercent.toInt()),
                          ),
                          3.hGap,
                          Text(
                            "${(100 - morePercent).toStringAsFixed(0)}%",
                            style: 14.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                21.vGap,
                if (player.guessTopReviews != null) ...[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 1.w,
                    width: double.infinity,
                    color: AppColors.cE6E6E,
                  ),
                  11.vGap,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        UserAvaterWidget(
                          url: Utils.getAvaterUrl(
                              player.guessTopReviews?.teamLogo),
                          width: 26.w,
                          height: 26.w,
                          radius: 13.w,
                        ),
                        5.hGap,
                        Expanded(
                            child: Text(
                          player.guessTopReviews?.context ??
                              "Add a comment about this stake about",
                          style: 14.w4(
                            color: AppColors.c4D4D4D,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                        9.hGap,
                        IconWidget(
                            iconWidth: 18.w,
                            icon: Assets.commonUiCommonIconCurrency02),
                        2.hGap,
                        Text(
                          Utils.formatChip((double.parse(
                                  picksIndexController.picksDefine.betCost) *
                              count)),
                          style: 12.w5(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoMedium,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  11.vGap
                ]
              ],
            ),
          ),
        ),
        Positioned(
            top: 11.w,
            right: 10.w,
            child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    border: Border.all(color: AppColors.c666666, width: 1)),
                child: MtInkwell(
                    vibrate: true,
                    onTap: () =>
                        Utils.generateAndShareImage(_repaintBoundaryKey),
                    child: IconWidget(
                      iconWidth: 15.w,
                      icon: Assets.commonUiCommonIconSystemShare,
                      iconColor: AppColors.c000000,
                    ))))
      ],
    );
  }

  Widget _buildBtn(PicksIndexController picksIndexController,
      PicksPlayerV2 player, GuessItemControllerV2 controller) {
    if (player.guessInfo.guessData.isNotEmpty) {
      getBtn(bool choice, String text) {
        var bgColor = choice ? AppColors.c000000 : AppColors.cEEEEEE;
        var textColor = choice ? AppColors.cFFFFFF : AppColors.ccccccc;
        return Expanded(
          child: Container(
            height: 41.w,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(9.w)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  text,
                  style: 19.w5(
                      color: textColor,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
                if (choice)
                  Positioned(
                      left: 11.w,
                      child: IconWidget(
                        iconWidth: 19.w,
                        icon: Assets.commonUiCommonIconPick,
                        iconColor: AppColors.cFFFFFF,
                      )),
              ],
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 29.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getBtn(player.guessInfo.guessData[0].guessChoice == 1, "MORE"),
            9.hGap,
            getBtn(player.guessInfo.guessData[0].guessChoice != 1, "LESS"),
          ],
        ),
      );
    }
    return Obx(() {
      return Container(
        height: 46.w,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 29.w),
        child: Row(
          children: [
            Expanded(
              child: MtInkwell(
                vibrate: true,
                onTap: () {
                  if (maxLimit(picksIndexController, player)) {
                    return;
                  }
                  controller.guessItemTap(0);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: controller.currentIndex.value == 0
                        ? AppColors.c000000
                        : AppColors.cTransparent,
                    border: Border.all(color: AppColors.c666666, width: 1),
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: Text(
                    "MORE",
                    style: 19.w5(
                        color: controller.currentIndex.value == 0
                            ? AppColors.cFFFFFF
                            : AppColors.c000000,
                        fontFamily: FontFamily.fOswaldMedium,
                        height: 1),
                  ),
                ),
              ),
            ),
            9.hGap,
            Expanded(
              child: MtInkwell(
                vibrate: true,
                onTap: () {
                  if (maxLimit(picksIndexController, player)) {
                    return;
                  }
                  controller.guessItemTap(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: controller.currentIndex.value == 1
                        ? AppColors.c000000
                        : AppColors.cTransparent,
                    border: Border.all(color: AppColors.c666666, width: 1),
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LESS",
                        style: 19.w5(
                            color: controller.currentIndex.value == 1
                                ? AppColors.cFFFFFF
                                : AppColors.c000000,
                            fontFamily: FontFamily.fOswaldMedium,
                            height: 1),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  maxLimit(PicksIndexController picksIndexController, PicksPlayerV2 player) {
    var length = picksIndexController.getChoiceGuessPlayers().length;
    if (length >= 6 && player.status == -1) {
      EasyLoading.showToast("Select up to 6");
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Get.find<HomeController>().tabIndex.listen((value) {
      if (value == 0) {
        controller.formatGameStartTime();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    var value = Get.find<HomeController>().tabIndex.value;
    if (state == AppLifecycleState.resumed && value == 0) {
      controller.formatGameStartTime();
    }
  }
}
