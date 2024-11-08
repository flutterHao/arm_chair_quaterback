import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_controller_v2.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:43

class GuessItemV2 extends StatefulWidget {
  const GuessItemV2({super.key, required this.playerV2, required this.index});

  final PicksPlayerV2 playerV2;
  final int index;

  @override
  State<GuessItemV2> createState() => _GuessItemV2State();
}

class _GuessItemV2State extends State<GuessItemV2> with WidgetsBindingObserver {
  late GuessItemControllerV2 controller;

  @override
  Widget build(BuildContext context) {
    PicksPlayerV2 player = widget.playerV2;
    PicksIndexController picksIndexController = Get.find();
    controller = Get.put(GuessItemControllerV2(player),
        tag: "${player.guessInfo.playerId}_${widget.index}_${player.tabStr}");
    controller.currentIndex.value = player.status;
    controller.formatGameStartTime();
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(16.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PlayerAvatarWidget(
                width: 42.w,
                playerId: player.guessInfo.playerId,
                getXRouteId: GlobalNestedKey.PICKS,
                backgroundColor: AppColors.cD9D9D9,
                tabStr: player.tabStr,
              ),
              5.hGap,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.baseInfoList.ename,
                      style: 14.w4(color: AppColors.c262626, height: 1),
                      overflow: TextOverflow.ellipsis,
                    ),
                    3.5.vGap,
                    Obx(() {
                      return FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "VS ${player.awayTeamInfo?.shortEname ??
                              ""}   ${controller.gameStartTimeStr.value}",
                          style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 37.w,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(color: AppColors.ccccccc, width: 1)),
            child: Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text(
                          "${player.guessInfo.guessReferenceValue.getValue(
                              picksIndexController.getCurrentTabStr())}",
                          style: 18.w7(color: AppColors.c262626, height: 1),
                        ))),
                Container(
                  height: 18.w,
                  width: 1,
                  decoration: const BoxDecoration(color: AppColors.cC4C4C4),
                ),
                Expanded(
                    child: Center(
                        child: Text(
                          Utils.getLongName(
                              picksIndexController.getCurrentTabStr()),
                          style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                          textAlign: TextAlign.center,
                        )))
              ],
            ),
          ),
          _buildBtn(picksIndexController, player, controller)
        ],
      ),
    );
  }

  Widget _buildBtn(PicksIndexController picksIndexController,
      PicksPlayerV2 player, GuessItemControllerV2 controller) {
    if (player.guessInfo.guessData.isNotEmpty) {
      var choiceMore = player.guessInfo.guessData[0].guessChoice == 1;
      return Container(
        height: 46.w,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.cB3B3B3, width: 1),
            borderRadius: BorderRadius.circular(8.w)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconWidget(
                  iconWidth: 11.w,
                  icon: Assets.uiIconUpPng,
                  iconColor: AppColors.cFF7954,
                  rotateAngle: choiceMore ? 0 : 180,
                ),
                5.hGap,
                Text(
                  player.guessInfo.guessData[0].guessChoice == 1
                      ? "MORE"
                      : "LESS",
                  style: 12.w7(
                      color: controller.currentIndex.value == 0
                          ? AppColors.cF2F2F2
                          : AppColors.cFF7954,
                      height: 1),
                )
              ],
            ),
            Text(
              "Be settling",
              style: 10.w4(color: AppColors.cB3B3B3),
            )
          ],
        ),
      );
    }
    return Obx(() {
      return Container(
        height: 46.w,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.cFF7954, width: 1),
            borderRadius: BorderRadius.circular(8.w)),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: MtInkwell(
                vibrate: true,
                onTap: () {
                  if (maxLimit(picksIndexController, player)) {
                    return;
                  }
                  controller.guessItemTap(0);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: controller.currentIndex.value == 0
                          ? AppColors.cFF7954
                          : AppColors.cTransparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.w),
                          bottomLeft: Radius.circular(7.w))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconWidget(
                        iconWidth: 15.w,
                        icon: Assets.uiIconUpPng,
                        iconColor: controller.currentIndex.value == 0
                            ? AppColors.cF2F2F2
                            : AppColors.cFF7954,
                      ),
                      5.vGap,
                      Text(
                        "MORE",
                        style: 12.w7(
                            color: controller.currentIndex.value == 0
                                ? AppColors.cF2F2F2
                                : AppColors.cFF7954,
                            height: 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: 1,
              color: AppColors.cFF7954,
            ),
            Flexible(
              flex: 1,
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
                          ? AppColors.cFF7954
                          : AppColors.cTransparent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7.w),
                          bottomRight: Radius.circular(7.w))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconWidget(
                        iconWidth: 15.w,
                        icon: Assets.uiIconUpPng,
                        iconColor: controller.currentIndex.value == 1
                            ? AppColors.cF2F2F2
                            : AppColors.cFF7954,
                        rotateAngle: 180,
                      ),
                      5.vGap,
                      Text(
                        "LESS",
                        style: 12.w7(
                            color: controller.currentIndex.value == 1
                                ? AppColors.cF2F2F2
                                : AppColors.cFF7954,
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
    var length = picksIndexController
        .getChoiceGuessPlayers()
        .length;
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
      if (value == 1) {
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
    if (state == AppLifecycleState.resumed && value == 1) {
      controller.formatGameStartTime();
    }
  }
}
