import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/10/15:14

class GameOverController extends GetxController {
  GameOverController(this.context);

  final BuildContext context;
  var startObs = false.obs;
  var cup = RxInt(0);
  var giftScaleObs = false.obs;
  var giftObs = false.obs;
  var opacityObs = false.obs;
  var moneyOpacityObs = false.obs;
  var moneyIncomeObs = false.obs;
  var mvpObs = false.obs;
  var moneyAnimationEnd = false.obs;
  var onMvpAnimationEndObs = false.obs;

  var cupNum = 0;
  var leftZero = false;

  @override
  void onReady() {
    super.onReady();
    startObs.value = true;
  }

  PkResultUpdatedPlayerResults? getMvpInfo() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    return teamBattleV2Controller.pkResultUpdatedEntity?.playerResults
        .firstWhereOrNull((e) => e.type == 1);
  }

  /// 获取mvp球员的星级
  int getMvpBreakThroughGrade() {
    var mvpInfo = getMvpInfo();
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    PkResultUpdatedAwayTeamResultTeamPlayers? teamPlayer;
    print('mvpInfo---teamId---:${mvpInfo?.teamId}');
    print('mvpInfo---playerId---:${mvpInfo?.playerId}');
    if (teamBattleV2Controller.pkResultUpdatedEntity?.homeTeamResult.teamId ==
        mvpInfo?.teamId) {
      teamPlayer = teamBattleV2Controller
          .pkResultUpdatedEntity?.homeTeamResult.teamPlayers
          .firstWhereOrNull((e) => e.playerId == mvpInfo?.playerId);
    } else {
      teamPlayer = teamBattleV2Controller
          .pkResultUpdatedEntity?.awayTeamResult.teamPlayers
          .firstWhereOrNull((e) => e.playerId == mvpInfo?.playerId);
    }
    return max(1, teamPlayer?.breakThroughGrade ?? 1);
  }

  bool isLeftWin() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    var win = teamBattleV2Controller.pkResultUpdatedEntity?.homeTeamResult.win;
    return win == true;
  }

  PkResultUpdatedTeamResult? getWinnerInfo() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    return isLeftWin()
        ? teamBattleV2Controller.pkResultUpdatedEntity?.homeTeamResult
        : teamBattleV2Controller.pkResultUpdatedEntity?.awayTeamResult;
  }

  void initCup() {
    var beforeCup = getBeforeCup();
    var currentCup = getCurrentCup();
    var result = (currentCup - beforeCup).abs();
    if (result != 0) {
      cupNum = result;
    } else {
      cupNum = (getCurrentCupDefine()?.loseCup ?? 0).toInt();
      leftZero = true;
    }
    cup.value = 1;
    if (result != 0) {
      var cupPercent = getCupPercent();
      showTopToastDialog(
          child: Row(
        children: [
          Container(
            height: 64.w,
            width: 57.w,
            decoration: BoxDecoration(
                color: AppColors.c000000,
                borderRadius: BorderRadius.circular(6.w)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconWidget(
                    iconWidth: 37.w,
                    icon: Assets.managerUiManagerIconCurrency04),
                Positioned(
                  bottom: 15.w,
                  right: 0,
                  child: IconWidget(
                    iconWidth: 14.w,
                    icon: Assets.managerUiManagerTacticsArrow,
                    iconColor: AppColors.c40F093,
                  ),
                )
              ],
            ),
          ),
          14.hGap,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("TROPHY COUNT INCREASE",
                  style: 19.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium)),
              6.vGap,
              TweenAnimationBuilder(
                builder: (context, value, child) {
                  return Container(
                    height: 12.w,
                    width: 244.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        border:
                            Border.all(color: AppColors.c000000, width: 1.w)),
                    child: LinearProgressIndicator(
                      value: cupPercent * value,
                      backgroundColor: AppColors.cTransparent,
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1000),
              ),
              6.vGap,
              Row(
                children: [
                  Text(
                    "$beforeCup",
                    style: 16.w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                  7.hGap,
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.commonUiCommonIconSystemJumpto,
                          iconColor: AppColors.c000000.withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.commonUiCommonIconSystemJumpto,
                          iconColor: AppColors.c000000,
                        ),
                      )
                    ],
                  ),
                  7.hGap,
                  Text(
                    "$currentCup",
                    style: 16.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoMedium),
                  ),
                  5.hGap,
                  if (currentCup != beforeCup)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.commonUiCommonIconSystemArrow,
                          iconColor: AppColors.c000000,
                          rotateAngle: currentCup > beforeCup ? -90 : 90,
                        )
                      ],
                    )
                ],
              )
            ],
          ),
        ],
      ));
    }
  }

  int getBeforeCup() {
    var beforeCup = Get.find<TeamBattleController>().teamInfoEntity.cup;
    return beforeCup;
  }

  bool isFull() {
    return Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .cardBoxIsFull ??
        false;
  }

  int getMoneyCount() {
    return Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .dropAwardData
            .firstWhereOrNull((e) => e.id == 102)
            ?.num ??
        0;
  }

  double getCupPercent() {
    int currentCup = getCurrentCup();
    var where = CacheApi.cupDefineList.firstWhereOrNull(
        (e) => e.getCupMax() > currentCup && e.getCupMin() <= currentCup);
    if (where == null) {
      return 0;
    }
    var cupMax = where.getCupMax();
    return (currentCup / cupMax).handlerNaNInfinity().toDouble();
  }

  CupDefineEntity? getCurrentCupDefine() {
    int currentCup = getCurrentCup();
    var where = CacheApi.cupDefineList.firstWhereOrNull(
        (e) => e.getCupMax() > currentCup && e.getCupMin() <= currentCup);
    return where;
  }

  int getCurrentCup() {
    var currentCup = Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .cup ??
        0;
    return currentCup;
  }
}
