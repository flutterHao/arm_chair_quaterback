import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_done_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TeamUpgradeController extends GetxController {
  TeamUpgradeController(this.player);

  final TeamPlayerInfoEntity player;

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
    if(!isInit) {
      loadStatus.value = LoadDataStatus.loading;
    }
    Future.wait([
      TeamApi.getTeamPlayerUpStarVO(player.uuid),
      CacheApi.getNBAPlayerInfo(),
    ]).then((result) {
      isInit = true;
      teamPlayerUpStarVoEntity = result[0] as TeamPlayerUpStarVoEntity;
      playerBaseInfo = Utils.getPlayBaseInfo(player.playerId);
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
    var playBaseInfo = Utils.getPlayBaseInfo(player.playerId);
    List<UpgradeOffensive> data = [
      UpgradeOffensive("LAYUP", playBaseInfo.layupWeight),
      UpgradeOffensive("MID-RANGE", playBaseInfo.perimeterShotWeight),
      UpgradeOffensive("3-POINT", playBaseInfo.threePointWeight),
    ];
    return data;
  }

  List<UpgradeAdditional> getAdditional() {
    if(starUpDoneEntity != null){
      return [
        UpgradeAdditional("Layup", starUpDoneEntity!.teamPlayerVO.layup),
        UpgradeAdditional("Three shot", starUpDoneEntity!.teamPlayerVO.threeShot),
        UpgradeAdditional(
            "Midline defense", starUpDoneEntity!.teamPlayerVO.midlineDefense),
        UpgradeAdditional("Jump shot", starUpDoneEntity!.teamPlayerVO.jumpShot),
        UpgradeAdditional(
            "Inside defense", starUpDoneEntity!.teamPlayerVO.insideDefense),
        UpgradeAdditional(
            "Outside defense", starUpDoneEntity!.teamPlayerVO.outsideDefense),
      ];
    }
    List<UpgradeAdditional> data = [
      UpgradeAdditional("Layup", teamPlayerUpStarVoEntity.layup),
      UpgradeAdditional("Three shot", teamPlayerUpStarVoEntity.threeShot),
      UpgradeAdditional(
          "Midline defense", teamPlayerUpStarVoEntity.midlineDefense),
      UpgradeAdditional("Jump shot", teamPlayerUpStarVoEntity.jumpShot),
      UpgradeAdditional(
          "Inside defense", teamPlayerUpStarVoEntity.insideDefense),
      UpgradeAdditional(
          "Outside defense", teamPlayerUpStarVoEntity.outsideDefense),
    ];
    return data;
  }

  void setUpgradeResult(StarUpDoneEntity result) {
    starUpDoneEntity = result;
  }

  String getLastName() {
    return playerBaseInfo.elname;
  }

  String getFirstName() {
    return playerBaseInfo.elname;
  }

  void setBeforePlayerAbility() {
    var playerCapData = Utils.getPlayerCapData(player.playerId);
    for (int i = 0; i < upgradePlayerAbilityList.length; i++) {
      var upgradePlayerAbility = upgradePlayerAbilityList[i];
      var key = upgradePlayerAbility.name;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      num baseValue = playerCapData.getValue(proKey);
      num potentialValue = teamPlayerUpStarVoEntity.potential.toJson()[proKey];
      upgradePlayerAbility.maxValue =
      (teamPlayerUpStarVoEntity.maxAbility.toJson()[proKey] * 1.0);
      upgradePlayerAbility.baseValue = baseValue.toDouble();
      upgradePlayerAbility.beforeValue =
          baseValue * max(1.0, potentialValue.toDouble());
    }
  }

  void setAfterPlayerAbility() {
    var playerCapData = Utils.getPlayerCapData(player.playerId);
    for (int i = 0; i < upgradePlayerAbilityList.length; i++) {
      var upgradePlayerAbility = upgradePlayerAbilityList[i];
      var key = upgradePlayerAbility.name;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      num baseValue = playerCapData.getValue(proKey);
      num potentialValue = starUpDoneEntity!.addPotential.toJson()[proKey];
      upgradePlayerAbility.afterValue =
          baseValue * max(1.0, potentialValue.toDouble());
      upgradePlayerAbility.afterValue = Random().nextDouble()*upgradePlayerAbility.maxValue;
    }
  }

  void refreshPlayerAbilityUI() {
    setAfterPlayerAbility();
    update();
  }
}

class UpgradePlayerAbility {
  final String name;
  double maxValue = -1;
  double baseValue = -1;
  double beforeValue = -1;
  double afterValue = -1;

  UpgradePlayerAbility({
    required this.name,
    this.maxValue = -1,
    this.baseValue = -1,
    this.beforeValue = -1,
  });
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
