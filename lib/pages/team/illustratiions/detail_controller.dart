import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/grade_in_star_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_power_rate_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_done_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IlluSctrationDtlCtrl extends GetxController {
  IlluSctrationDtlCtrl(this.player);

  final NbaPlayerInfosPlayerBaseInfoList player;
  //当前位置
  double currentY = 437.w;
  double scale = 1;
  double cardPosition = 97.w;
  ScrollController scrollController = ScrollController();

  late NbaPlayerInfosPlayerBaseInfoList playerBaseInfo;
  var loadStatus = LoadDataStatus.loading.obs;
  // late TeamPlayerUpStarVoEntity teamPlayerUpStarVoEntity;
  late List<UpgradePlayerAbility> upgradePlayerAbilityList;
  static const String layup = "攻框系数";
  static const String threeShot = "外线系数";
  static const String jumpShot = "中投系数";
  static const String midlineDefense = "中防系数";
  static const String insideDefense = "内防系数";
  static const String outsideDefense = "外防系数";

  /// 升星点击done结束的返回值
  // StarUpDoneEntity? starUpDoneEntity;

  var isInit = false;

  // late StarUpDefineEntity selfStarUpDefine;

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
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getStarUpDefine(),
      CacheApi.getGradeInStarDefine(),
      CacheApi.playerPowerRateDefine()
    ]).then((result) {
      isInit = true;
      playerBaseInfo = Utils.getPlayBaseInfo(player.playerId);
      setBeforePlayerAbility();
      loadStatus.value = LoadDataStatus.success;
      update(["detail"]);
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
      UpgradeOffensive(LangKey.gameMeanLayUp, playBaseInfo.layupWeight),
      UpgradeOffensive(
          LangKey.gameMeanMidRange, playBaseInfo.perimeterShotWeight),
      UpgradeOffensive(
          LangKey.gameMeanThreePoint, playBaseInfo.threePointWeight),
    ];
    return data;
  }

  List<UpgradeAdditional> getAdditional() {
    return [
      UpgradeAdditional(LangKey.gameMeanLayUp, getAdditionalAbility(layup)),
      UpgradeAdditional(
          LangKey.gameMeanThreePoint, getAdditionalAbility(threeShot)),
      UpgradeAdditional(
          LangKey.gameMeanMidRange, getAdditionalAbility(midlineDefense)),
      UpgradeAdditional(
          LangKey.gameMeanJumpShot, getAdditionalAbility(jumpShot)),
      UpgradeAdditional(
          LangKey.gameMeanPaintDefence, getAdditionalAbility(insideDefense)),
      UpgradeAdditional(
          LangKey.gameMeanOutsideDefence, getAdditionalAbility(outsideDefense)),
    ];
  }

  double getAdditionalAbility(String type) {
    var cap = Utils.getPlayerCapData(player.playerId);
    if (CacheApi.playerPowerRateDefineMap.isEmpty) {
      return 0;
    }
    PlayerPowerRateDefineEntity config;
    switch (type) {
      case layup:
        config = CacheApi.playerPowerRateDefineMap[layup]!;
        break;
      case threeShot:
        config = CacheApi.playerPowerRateDefineMap[threeShot]!;
        break;
      case jumpShot:
        config = CacheApi.playerPowerRateDefineMap[jumpShot]!;
        break;
      case insideDefense:
        config = CacheApi.playerPowerRateDefineMap[insideDefense]!;
        break;
      case outsideDefense:
        config = CacheApi.playerPowerRateDefineMap[outsideDefense]!;
        break;
      default:
        config = CacheApi.playerPowerRateDefineMap[layup]!;
        break;
    }
    double ability = cap.pts * config.pts +
        cap.threePm * config.threePm +
        cap.ftm * config.ftm +
        cap.pass * config.pass +
        (cap.oreb + cap.dreb) * config.reb +
        cap.blk * config.blk +
        cap.stl * config.stl +
        cap.tech * config.tech;
    return ability;
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
    var playerCapData = Utils.getPlayerCapData(player.playerId);
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
    var playerCapData = Utils.getPlayerCapData(player.playerId);
    for (int i = 0; i < upgradePlayerAbilityList.length; i++) {
      var upgradePlayerAbility = upgradePlayerAbilityList[i];
      var key = upgradePlayerAbility.name;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      num baseValue = playerCapData.getValue(proKey);
      upgradePlayerAbility.sGradeLevel1PlayerMaxValue = getBestOneStarAbility();
      upgradePlayerAbility.baseValue = baseValue.toDouble();
      upgradePlayerAbility.selfLevel10Value = getLevel10Ability(key);
      upgradePlayerAbility.totalValue = getBest10StarAbility();
    }
  }

  //摧毁获得金币 = 球员初始薪资*销毁系数 + 球员初始薪资*销毁系数/*合成球员需要数量*拥有球员碎片
  int countDestoryCash(PlayerCollectCollects item) {
    double destroyValue = 0.2;
    var player = Utils.getPlayBaseInfo(item.playerId);
    double cash = 0;
    if (item.isActive == 0) {
      cash = player.salary * destroyValue +
          (player.salary * destroyValue * item.fragmentNum / item.needNum);
    } else {
      cash = (player.salary * destroyValue * item.fragmentNum / item.needNum);
    }

    return cash.round();
  }

  void composeTeamPlayer(PlayerCollectCollects item) async {
    TeamApi.composeTeamPlayer(playerId: item.playerId).then((v) {
      // getPlayerCollectInfo();
      item.isLight = 1;
      item.fragmentNum -= item.needNum;
      update(["detail"]);
      IllustratiionsController ctrl = Get.find();
      ctrl.hasChange.value = true;
    });
  }

  void destroyTeamPlayer(PlayerCollectCollects item) async {
    TeamApi.destroyTeamPlayer(playerId: item.playerId).then((v) {
      // getPlayerCollectInfo();
      item.fragmentNum = 0;
      item.isLight = 0;
      HomeController.to.updateMoney();
      update(["detail"]);
      Get.back();
      Get.back(result: true);
    });
  }

  Color getTeamColor(int teamId) {
    if (CacheApi.teamDefineMap != null) {
      var archiveColors = CacheApi.teamDefineMap![teamId]!.archiveColors;
      String colorStr = "0xFF$archiveColors";
      int? color = int.tryParse(colorStr);
      if (color != null && ObjectUtil.isNotEmpty(archiveColors)) {
        return Color(color);
      }
    }
    return AppColors.c2DE298;
  }
}
