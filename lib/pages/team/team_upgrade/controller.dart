import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TeamUpgradeController extends GetxController {
  TeamUpgradeController(this.player);

  final TeamPlayerInfoEntity player;

  late TeamPlayerInfoEntity teamPlayerInfo;
  late NbaPlayerInfosPlayerBaseInfoList playerBaseInfo;
  var loadStatus = LoadDataStatus.loading.obs;
  late TeamPlayerUpStarVoEntity teamPlayerUpStarVoEntity;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TeamApi.getMyTeamPlayer(player.teamId),
      TeamApi.getTeamPlayerUpStarVO(player.uuid),
      CacheApi.getNBAPlayerInfo(),
    ]).then((result) {
      var where = ((result[0]) as MyTeamEntity)
          .teamPlayers
          .firstWhereOrNull((e) => e.playerId == player.playerId);
      teamPlayerUpStarVoEntity = result[1] as TeamPlayerUpStarVoEntity;
      if (where == null) {
        loadStatus.value = LoadDataStatus.error;
        EasyLoading.showToast("SERVER ERROR");
      } else {
        teamPlayerInfo = where;
      }
      playerBaseInfo = Utils.getPlayBaseInfo(player.playerId);
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  List<UpgradePlayerAbility> getPlayerAbility() {
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
    var playerCapData = Utils.getPlayerCapData(player.playerId);
    var list = names.map((e) {
      var key = e;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      print('e:$e');
      num baseValue = playerCapData.getValue(proKey);
      num potentialValue = teamPlayerUpStarVoEntity.potential.toJson()[proKey];
      return UpgradePlayerAbility(
          name: e,
          maxValue: (teamPlayerUpStarVoEntity.maxAbility.toJson()[proKey]*1.0),
          baseValue: baseValue.toDouble(),
          beforeValue: baseValue * max(1.0, potentialValue.toDouble()));
    }).toList();
    return list;
  }

  List<UpgradeOffensive> getOffensive(){
    var playBaseInfo = Utils.getPlayBaseInfo(player.playerId);
    List<UpgradeOffensive> data = [
      UpgradeOffensive("LAYUP",playBaseInfo.layupWeight),
      UpgradeOffensive("MID-RANGE",playBaseInfo.perimeterShotWeight),
      UpgradeOffensive("3-POINT",playBaseInfo.threePointWeight),
    ];
    return data;
  }

  List<UpgradeAdditional> getAdditional(){
    List<UpgradeAdditional> data = [
      UpgradeAdditional("Layup",teamPlayerUpStarVoEntity.layup),
      UpgradeAdditional("Three shot",teamPlayerUpStarVoEntity.threeShot),
      UpgradeAdditional("Midline defense",teamPlayerUpStarVoEntity.midlineDefense),
      UpgradeAdditional("Jump shot",teamPlayerUpStarVoEntity.jumpShot),
      UpgradeAdditional("Inside defense",teamPlayerUpStarVoEntity.insideDefense),
      UpgradeAdditional("Outside defense",teamPlayerUpStarVoEntity.outsideDefense),
    ];
    return data;
  }

  String getLastName() {
    return playerBaseInfo.elname;
  }

  String getFirstName() {
    return playerBaseInfo.elname;
  }
}

class UpgradePlayerAbility {
  final String name;
  final double maxValue;
  final double baseValue;
  final double beforeValue;
  double afterValue = -1;

  UpgradePlayerAbility({
    required this.name,
    required this.maxValue,
    required this.baseValue,
    required this.beforeValue,
  });
}

class UpgradeOffensive{
  final String name;
  final double progress;

  UpgradeOffensive(this.name, this.progress);
}


class UpgradeAdditional{
  final String name;
  final double value;

  UpgradeAdditional(this.name, this.value);
}
