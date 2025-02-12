import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/grade_in_star_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_done_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TeamUpgradeController extends GetxController {
  TeamUpgradeController(this.playerUuid);

  final String playerUuid;

  final GlobalKey globalKey = GlobalKey();
  late NbaPlayerInfosPlayerBaseInfoList playerBaseInfo;
  var loadStatus = LoadDataStatus.loading.obs;
  late TeamPlayerUpStarVoEntity teamPlayerUpStarVoEntity;
  late List<UpgradePlayerAbility> upgradePlayerAbilityList;

  /// 升星点击done结束的返回值
  StarUpDoneEntity? starUpDoneEntity;

  var isInit = false;

  @override
  void onInit() {
    super.onInit();
    upgradePlayerAbilityList = initPlayerAbility();
    initData();
  }

  initData() {
    if (!isInit) {
      loadStatus.value = LoadDataStatus.loading;
    }
    Future.wait([
      TeamApi.getTeamPlayerUpStarVO(playerUuid),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getStarUpDefine(),
      CacheApi.getGradeInStarDefine(),
    ]).then((result) {
      isInit = true;
      teamPlayerUpStarVoEntity = result[0] as TeamPlayerUpStarVoEntity;
      playerBaseInfo = Utils.getPlayBaseInfo(teamPlayerUpStarVoEntity.playerId);
      setBeforePlayerAbility();
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  List<UpgradePlayerAbility> initPlayerAbility() {
    List<String> names = [
      "FGM",
      "3PM",
      "FTM",
      "PASS",
      "REB",
      "BLK",
      "STL",
      "TECH",
    ];
    var list = names.map((e) {
      var key = e;
      if (key == "FGM") {
        key = "PTS";
      }
      return UpgradePlayerAbility(
        name: e,
      );
    }).toList();
    return list;
  }

  List<UpgradeOffensive> getOffensive() {
    var playBaseInfo = Utils.getPlayBaseInfo(teamPlayerUpStarVoEntity.playerId);
    List<UpgradeOffensive> data = [
      UpgradeOffensive(LangKey.gameMeanLayUp, playBaseInfo.layupWeight),
      UpgradeOffensive(
          LangKey.gameMeanMidRange, playBaseInfo.perimeterShotWeight),
      UpgradeOffensive(
          LangKey.gameMeanThreePoint, playBaseInfo.threePointWeight),
    ];
    return data;
  }

  List<UpgradeAdditional> getAdditional() {
    if (starUpDoneEntity != null) {
      return [
        UpgradeAdditional(
            LangKey.gameMeanLayUp, starUpDoneEntity!.teamPlayerVO.layup),
        UpgradeAdditional(LangKey.gameMeanThreePoint,
            starUpDoneEntity!.teamPlayerVO.threeShot),
        UpgradeAdditional(LangKey.gameMeanMidRange,
            starUpDoneEntity!.teamPlayerVO.midlineDefense),
        UpgradeAdditional(
            LangKey.gameMeanJumpShot, starUpDoneEntity!.teamPlayerVO.jumpShot),
        UpgradeAdditional(LangKey.gameMeanPaintDefence,
            starUpDoneEntity!.teamPlayerVO.insideDefense),
        UpgradeAdditional(LangKey.gameMeanOutsideDefence,
            starUpDoneEntity!.teamPlayerVO.outsideDefense),
      ];
    }
    List<UpgradeAdditional> data = [
      UpgradeAdditional(LangKey.gameMeanLayUp, teamPlayerUpStarVoEntity.layup),
      UpgradeAdditional(
          LangKey.gameMeanThreePoint, teamPlayerUpStarVoEntity.threeShot),
      UpgradeAdditional(
          LangKey.gameMeanMidRange, teamPlayerUpStarVoEntity.midlineDefense),
      UpgradeAdditional(
          LangKey.gameMeanJumpShot, teamPlayerUpStarVoEntity.jumpShot),
      UpgradeAdditional(
          LangKey.gameMeanPaintDefence, teamPlayerUpStarVoEntity.insideDefense),
      UpgradeAdditional(LangKey.gameMeanOutsideDefence,
          teamPlayerUpStarVoEntity.outsideDefense),
    ];
    return data;
  }

  void setUpgradeResult(StarUpDoneEntity result) {
    starUpDoneEntity = result;
  }

  String getLastName() {
    var split = playerBaseInfo.elname.split(" ");
    return playerBaseInfo.elname.contains(" ")
        ? split[1]
        : playerBaseInfo.elname;
  }

  String getFirstName() {
    var split = playerBaseInfo.elname.split(" ");
    return playerBaseInfo.elname.contains(" ")
        ? split[0]
        : playerBaseInfo.elname;
  }

  double getBest10StarAbility() {
    GradeInStarDefineEntity selfGradeInStar =
        CacheApi.gradeInStars!.firstWhere((e) {
      return e.playerGrade == playerBaseInfo.grade;
    });
    return selfGradeInStar.maxStarRatio;
  }

  double getBestOneStarAbility() {
    GradeInStarDefineEntity selfGradeInStar =
        CacheApi.gradeInStars!.firstWhere((e) {
      return e.playerGrade == playerBaseInfo.grade;
    });
    return selfGradeInStar.zeroStarRatio;
  }

  /// 获取满星属性最大值
  double getLevel10Ability(String key) {
    var playerCapData = Utils.getPlayerCapData(teamPlayerUpStarVoEntity.playerId);
    if (key == "FGM") {
      key = "PTS";
    }
    var proKey = ParamUtils.getProKey(key.toLowerCase());
    num baseValue = playerCapData.getValue(proKey);
    GradeInStarDefineEntity gradeInStar =
        CacheApi.gradeInStars!.firstWhere((e) {
      return e.playerGrade == playerBaseInfo.grade;
    });
    gradeInStar.starUpBase.sort((a, b) => a.compareTo(b));
    List<StarUpDefineEntity> starUpDefines = List.from(CacheApi.starUpDefines!);
    starUpDefines.sort((a, b) => a.starUpRange.compareTo(b.starUpRange));
    var last = starUpDefines.last;
    var greenValue = 1 +
        last.getPotantialMax() / 100 +
        last.starUpRange * last.starPlayerNum;

    double level10Value = baseValue * gradeInStar.starUpBase.last * greenValue;

    return level10Value;
  }

  void setBeforePlayerAbility() {
    var playerCapData = Utils.getPlayerCapData(teamPlayerUpStarVoEntity.playerId);
    for (int i = 0; i < upgradePlayerAbilityList.length; i++) {
      var upgradePlayerAbility = upgradePlayerAbilityList[i];
      var key = upgradePlayerAbility.name;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      num baseValue = playerCapData.getValue(proKey);
      num potentialValue = teamPlayerUpStarVoEntity.potential.toJson()[proKey];
      upgradePlayerAbility.sGradeLevel1PlayerMaxValue = getBestOneStarAbility();
      upgradePlayerAbility.baseValue = baseValue.toDouble();
      upgradePlayerAbility.beforeValue =
          baseValue * max(1.0, potentialValue.toDouble());
      upgradePlayerAbility.selfLevel10Value = getLevel10Ability(key);
      upgradePlayerAbility.totalValue = getBest10StarAbility();

      GradeInStarDefineEntity gradeInStar =
          CacheApi.gradeInStars!.firstWhere((e) {
        return e.playerGrade == playerBaseInfo.grade;
      });
      var starUpBase = getPlayer().breakThroughGrade == 0
          ? 0
          : gradeInStar.starUpBase[getPlayer().breakThroughGrade - 1];
      var first = CacheApi.starUpDefines!
          .firstWhere((e) => e.starUp == getPlayer().breakThroughGrade);
      var greenValue = 1 +
          first.getPotantialMax() / 100 +
          first.starUpRange * first.starPlayerNum;
      double beforeMaxvalue = baseValue * starUpBase * greenValue;
      upgradePlayerAbility.beforeMaxValue = beforeMaxvalue;
    }
  }

  void setAfterPlayerAbility() {
    var playerCapData = Utils.getPlayerCapData(teamPlayerUpStarVoEntity.playerId);
    for (int i = 0; i < upgradePlayerAbilityList.length; i++) {
      var upgradePlayerAbility = upgradePlayerAbilityList[i];
      var key = upgradePlayerAbility.name;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      num baseValue = playerCapData.getValue(proKey);
      num potentialValue =
          starUpDoneEntity!.teamPlayerVO.potential.toJson()[proKey];
      upgradePlayerAbility.afterValue =
          baseValue * max(1.0, potentialValue.toDouble());

      GradeInStarDefineEntity gradeInStar =
          CacheApi.gradeInStars!.firstWhere((e) {
        return e.playerGrade == playerBaseInfo.grade;
      });
      var starUpBase = getPlayer().breakThroughGrade == 0
          ? 0
          : gradeInStar.starUpBase[getPlayer().breakThroughGrade - 1];
      var first = CacheApi.starUpDefines!
          .firstWhere((e) => e.starUp == getPlayer().breakThroughGrade);
      var greenValue = 1 +
          first.getPotantialMax() / 100 +
          first.starUpRange * first.starPlayerNum;
      double afterMaxvalue = baseValue * starUpBase * greenValue;

      upgradePlayerAbility.afterMaxValue = afterMaxvalue;
    }
  }

  void refreshPlayerAbilityUI() {
    setAfterPlayerAbility();
    update();
  }

  TeamPlayerUpStarVoEntity getPlayer() {
    return starUpDoneEntity?.teamPlayerVO ?? teamPlayerUpStarVoEntity;
  }
}

class UpgradePlayerAbility {
  final String name;

  /// 一星s级球员最大值
  double sGradeLevel1PlayerMaxValue = 0;
  double baseValue = 0;

  /// 升级前值
  double beforeValue = 0;

  /// 升级后值
  double afterValue = 0;

  /// 自己满星的最大值
  double selfLevel10Value = 0;

  /// 联盟球员满星最大值
  double totalValue = 0;

  /// 升级前最大值
  double beforeMaxValue = 0;

  /// 升级后最大值
  double afterMaxValue = 0;

  UpgradePlayerAbility({
    required this.name,
    this.sGradeLevel1PlayerMaxValue = 0,
    this.baseValue = 0,
    this.beforeValue = 0,
    this.afterValue = 0,
    this.selfLevel10Value = 0,
    this.totalValue = 0,
  });

  @override
  String toString() {
    return 'UpgradePlayerAbility{name: $name, maxValue: $sGradeLevel1PlayerMaxValue, baseValue: $baseValue, beforeValue: $beforeValue, afterValue: $afterValue}';
  }
}

class UpgradeOffensive {
  final String name;
  final double progress;

  UpgradeOffensive(this.name, this.progress);
}

class UpgradeAdditional {
  final String name;
  final double value;

  UpgradeAdditional(this.name, this.value);
}
