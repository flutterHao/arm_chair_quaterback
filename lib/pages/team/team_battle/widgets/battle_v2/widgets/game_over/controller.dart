import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
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
  var leftCup = RxInt(0);
  var rightCup = RxInt(0);
  var giftScaleObs = false.obs;
  var giftObs = false.obs;
  var opacityObs = false.obs;
  var moneyOpacityObs = false.obs;
  var moneyIncomeObs = false.obs;
  var mvpObs = false.obs;
  var moneyAnimationEnd = false.obs;
  var onMvpAnimationEndObs = false.obs;

  var leftCupNum = -1;
  var rightCupNum = -1;

  @override
  void onReady() {
    super.onReady();
    startObs.value = true;
    print('=========onReady');
  }

  PkResultUpdatedPlayerResults? getMvpInfo() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    return teamBattleV2Controller.pkResultUpdatedEntity?.playerResults
        .firstWhereOrNull((e) => e.type == 1);
  }

  TeamPlayerInfoEntity getTeamPlayerInfoEntityByPlayerId(
      int teamId, int playerId) {
    TeamBattleV2Controller teamBattleV2Controller = Get.find();
    var battleEntity = teamBattleV2Controller.battleEntity;
    List<TeamPlayerInfoEntity> list = [];
    if (teamId == battleEntity.homeTeam.teamId) {
      list = battleEntity.homeTeamPlayerList;
    } else {
      list = battleEntity.awayTeamPlayerList;
    }
    var result = list.firstWhere((e) => e.playerId == playerId);
    return result;
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
    var beforeHomeCup = getHomeTeam().cup;
    var currentHomeCup = getHomeCurrentCup();
    var result = (currentHomeCup - beforeHomeCup).abs();
    leftCupNum = result;
    leftCup.value = leftCupNum > 0 ? 1 : 0;
    var beforeAwayCup = getAwayTeam().cup;
    var currentAwayCup = getAwayCurrentCup();
    rightCupNum = (currentAwayCup - beforeAwayCup).abs();
    rightCup.value = rightCupNum > 0 ? 1 : 0;
    Timer.periodic(const Duration(milliseconds: 100), (t) {
      if (leftCup.value == leftCupNum && rightCup.value == rightCupNum) {
        t.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          giftScaleObs.value = true;
        });
        return;
      }
      if (leftCup.value != leftCupNum) {
        leftCup.value = leftCup.value + 1;
      }
      if (rightCup.value != rightCupNum) {
        rightCup.value = rightCup.value + 1;
      }
    });
    print('leftCupNum:$leftCupNum,,,,$rightCupNum');
    if (result != 0) {
      var cupPercent = getHomeCupPercent();
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
                    "$beforeHomeCup",
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
                    "$currentHomeCup",
                    style: 16.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoMedium),
                  ),
                  5.hGap,
                  if (currentHomeCup != beforeHomeCup)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.commonUiCommonIconSystemArrow,
                          iconColor: AppColors.c000000,
                          rotateAngle:
                              currentHomeCup > beforeHomeCup ? -90 : 90,
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

  BattleTeam getHomeTeam() {
    var homeTeam = Get.find<TeamBattleController>().battleEntity.homeTeam;
    return homeTeam;
  }

  BattleTeam getAwayTeam() {
    var awayTeam = Get.find<TeamBattleController>().battleEntity.awayTeam;
    return awayTeam;
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

  double getHomeCupPercent() {
    int currentCup = getHomeCurrentCup();
    var where = CacheApi.cupDefineList.firstWhereOrNull(
        (e) => e.getCupMax() > currentCup && e.getCupMin() <= currentCup);
    if (where == null) {
      return 0;
    }
    var cupMax = where.getCupMax();
    return (currentCup / cupMax).handlerNaNInfinity().toDouble();
  }

  CupDefineEntity? getHomeCurrentCupDefine() {
    int id = getHomeTeam().cupRankId;
    var where =
        CacheApi.cupDefineList.firstWhereOrNull((e) => e.cupNumId == id);
    return where;
  }

  CupDefineEntity? getAwayCurrentCupDefine() {
    int id = getAwayTeam().cupRankId;
    var where =
        CacheApi.cupDefineList.firstWhereOrNull((e) => e.cupNumId == id);
    return where;
  }

  int getHomeCurrentCup() {
    var currentCup = Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .cup ??
        0;
    return currentCup;
  }

  int getAwayCurrentCup() {
    var currentCup = Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.awayTeamResult
            .cup ??
        0;
    return currentCup;
  }
}
