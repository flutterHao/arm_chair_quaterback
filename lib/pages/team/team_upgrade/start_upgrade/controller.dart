import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/grade.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/24/10:09

class StartUpgradeController extends GetxController {
  StartUpgradeController(this.player);

  final TeamPlayerUpStarVoEntity player;

  var loadStatus = LoadDataStatus.loading.obs;
  late NbaPlayerInfosPlayerBaseInfoList playerBaseInfo;
  late List<UpgradePlayer> allTeamPlayers;

  var slotIndex = 0.obs;

  /// -1 未排序 0 正序 1 倒序
  var starSort = RxInt(-1);

  /// -1 未排序 0 正序 1 倒序
  var gradeSort = RxInt(-1);

  var showFloatWidget = false.obs;

  late List<String> pps;

  late List<StarUpDefineEntity> starUpDefineList;

  late StarUpDefineEntity selfStarUpDefine;

  var upSuccessRate = 0.0.obs;
  var ppUpValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    List<String> propertys = [
      "FGM",
      "3PM",
      "FTM",
      "PASS",
      "REB",
      "BLK",
      "STL",
      "TECH",
    ];
    propertys.shuffle();
    pps = List.from(propertys);
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      CacheApi.getNBAPlayerInfo(),
      PicksApi.getAllTeamPlayersByUpStar(player.uuid),
      CacheApi.getStarUpDefine(),
      CacheApi.getGradeInStarDefine(),
    ]).then((result) {
      var allTeamPlayersByUpStarEntity =
          result[1] as List<AllTeamPlayersByUpStarEntity>;
      starUpDefineList = result[2] as List<StarUpDefineEntity>;
      var starUpDefineEntity = starUpDefineList
          .firstWhere((f) => f.starUp == (player.breakThroughGrade + 1));
      selfStarUpDefine = starUpDefineEntity;
      playerBaseInfo = Utils.getPlayBaseInfo(player.playerId);
      var gradeInStarDefineEntity = CacheApi.gradeInStars!
          .firstWhere((e) => e.playerGrade == playerBaseInfo.grade);
      double starUpBase = gradeInStarDefineEntity.starUpBase[player.breakThroughGrade];
      ppUpValue.value =
          starUpBase * (1 + starUpDefineEntity.getPotantialMax() / 100);
      var selfBaseInfo = Utils.getPlayBaseInfo(player.playerId);
      var value2 = Grade.getGradeByName(selfBaseInfo.grade);
      allTeamPlayers =
          allTeamPlayersByUpStarEntity.fold(<UpgradePlayer>[], (p, e) {
        var playBaseInfo = Utils.getPlayBaseInfo(e.playerId);
        var value3 = Grade.getGradeByName(playBaseInfo.grade);
        if (e.playerId != player.playerId &&
            (value2.grade == value3.grade ||
                (value2.grade - 1) == value3.grade)) {
          /// 筛选非自己，未上阵，等于自己品阶或低自己一阶的球员
          var firstWhere = CacheApi.starUpDefines!
              .firstWhere((f) => f.starUp == (e.breakThroughGrade));
          p.add(UpgradePlayer(e, firstWhere,starUpBase,ppUpValue.value));
        }
        return p;
      });
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  sortList() {
    if (starSort.value != -1) {
      allTeamPlayers.sort((a, b) {
        if (gradeSort.value == 0) {
          return a.teamPlayer.breakThroughGrade
              .compareTo(b.teamPlayer.breakThroughGrade);
        } else {
          return b.teamPlayer.breakThroughGrade
              .compareTo(a.teamPlayer.breakThroughGrade);
        }
      });
    } else {
      allTeamPlayers.sort((a, b) {
        if (gradeSort.value == 0) {
          return Grade.getGradeByName(
                  Utils.getPlayBaseInfo(a.teamPlayer.playerId).grade)
              .value
              .compareTo(Grade.getGradeByName(
                      Utils.getPlayBaseInfo(b.teamPlayer.playerId).grade)
                  .value);
        } else {
          return Grade.getGradeByName(
                  Utils.getPlayBaseInfo(b.teamPlayer.playerId).grade)
              .value
              .compareTo(Grade.getGradeByName(
                      Utils.getPlayBaseInfo(a.teamPlayer.playerId).grade)
                  .value);
        }
      });
    }
    update([idUpgradePlayers]);
  }

  List<UpgradePlayer> getSelectedPlayers() {
    return allTeamPlayers.where((e) => e.select.value).toList();
  }

  void onSelectTap() {
    List<UpgradePlayer> selectedPlayers = getSelectedPlayers();
    if (selectedPlayers.isNotEmpty) {
      if (!showFloatWidget.value) {
        showFloatWidget.value = true;
      }
    } else {
      if (showFloatWidget.value) {
        showFloatWidget.value = false;
      }
    }
    double propertyUp = selectedPlayers.fold(0, (p, e) {
      return p + e.getPropertyAddValue();
    });
    var starUpDefineEntity = starUpDefineList
        .firstWhere((f) => f.starUp == (player.breakThroughGrade));
    var gradeInStarDefineEntity = CacheApi.gradeInStars!
        .firstWhere((e) => e.playerGrade == playerBaseInfo.grade);
    double starUpBase = player.breakThroughGrade == 0
        ? 0 // 零星球员
        : gradeInStarDefineEntity.starUpBase[player.breakThroughGrade - 1];
    propertyUp = starUpBase * (1 + starUpDefineEntity.getPotantialMax() / 100) + propertyUp;
    var upSR = selectedPlayers.fold(0.0, (p, e) {
      return p + e.teamPlayer.probability;
    });
    print('propertyUp:$propertyUp,,,,,$upSR');

    ppUpValue.value = propertyUp;
    upSuccessRate.value = upSR;
  }

  void onDialogDelete() {
    onSelectTap();
    update([idAddSparringPlayers]);
  }

  double getCost() {
    var selfBaseInfo = Utils.getPlayBaseInfo(player.playerId);
    var value2 = Grade.getGradeByName(selfBaseInfo.grade);
    var where =
        CacheApi.gradeInStars!.firstWhere((e) => e.playerGrade == value2.name);
    var cost = where.starUpGradeCost[player.breakThroughGrade];
    return cost;
  }

  static String get idUpgradePlayers => "id_upgrade_players";

  static String get idAddSparringPlayers => "id_add_sparring_players";
}

class UpgradePlayer {
  final AllTeamPlayersByUpStarEntity teamPlayer;
  final StarUpDefineEntity starUpDefine;
  final double starUpBase;
  final double playerBaseValue;
  var select = false.obs;

  UpgradePlayer(this.teamPlayer, this.starUpDefine,this.starUpBase,this.playerBaseValue);

  double getPropertyAddValue() {
    if (starUpDefine.starUp == 0) {
      return 0;
    }
    double value = starUpBase*(1 +
        starUpDefine.getPotantialMax() / 100 +
        starUpDefine.starUpRange * 1) - playerBaseValue;
    return value;
  }
}
