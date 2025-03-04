import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/enums/grade.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/26/16:26

class StarUpgradeNewController extends GetxController {
  StarUpgradeNewController(this.playerUuid);

  final String playerUuid;

  var loadStatus = LoadDataStatus.loading.obs;
  late NbaPlayerInfosPlayerBaseInfoList playerBaseInfo;
  late List<UpgradePlayer> allTeamPlayers;

  /// -1 未排序 0 正序 1 倒序
  var starSort = RxInt(-1);

  /// -1 未排序 0 正序 1 倒序
  var gradeSort = RxInt(-1);
  late List<String> pps;

  late List<StarUpDefineEntity> starUpDefineList;

  late StarUpDefineEntity selfStarUpDefine;

  var upSuccessRate = 0.0.obs;
  var ppUpValue = 0.0.obs;

  late TeamPlayerUpStarVoEntity player;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TeamApi.getTeamPlayerUpStarVO(playerUuid),
      CacheApi.getNBAPlayerInfo(),
      PicksApi.getAllTeamPlayersByUpStar(playerUuid),
      CacheApi.getStarUpDefine(),
      CacheApi.getGradeInStarDefine(),
    ]).then((result) {
      player = result[0] as TeamPlayerUpStarVoEntity;
      var allTeamPlayersByUpStarEntity =
          result[2] as List<AllTeamPlayersByUpStarEntity>;
      starUpDefineList = result[3] as List<StarUpDefineEntity>;
      var starUpDefineEntity = starUpDefineList
          .firstWhere((f) => f.starUp == (player.breakThroughGrade + 1));
      selfStarUpDefine = starUpDefineEntity;
      playerBaseInfo = Utils.getPlayBaseInfo(player.playerId);
      var gradeInStarDefineEntity = CacheApi.gradeInStars!
          .firstWhere((e) => e.playerGrade == playerBaseInfo.grade);
      double starUpBase =
          gradeInStarDefineEntity.starUpBase[player.breakThroughGrade];
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
          p.add(UpgradePlayer(e, firstWhere, starUpBase, ppUpValue.value));
        }
        return p;
      });
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
      Get.back();
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
    update();
  }

  List<UpgradePlayer> getSelectedPlayers() {
    return allTeamPlayers.where((e) => e.select.value).toList();
  }

  void onSelectTap() {
    List<UpgradePlayer> selectedPlayers = getSelectedPlayers();
    double propertyUp = selectedPlayers.fold(0, (p, e) {
      return p + e.getPropertyAddValue();
    });
    var starUpDefineEntity = starUpDefineList
        .firstWhere((f) => f.starUp == (player.breakThroughGrade + 1));
    var gradeInStarDefineEntity = CacheApi.gradeInStars!
        .firstWhere((e) => e.playerGrade == playerBaseInfo.grade);
    double starUpBase =
        gradeInStarDefineEntity.starUpBase[player.breakThroughGrade];
    propertyUp = starUpBase * (1 + starUpDefineEntity.getPotantialMax() / 100) +
        propertyUp;
    var upSR = selectedPlayers.fold(0.0, (p, e) {
      return p + e.teamPlayer.probability;
    });
    print('propertyUp:$propertyUp,,,,,$upSR');

    ppUpValue.value = propertyUp;
    upSuccessRate.value = upSR;
  }

  double getCost() {
    var selfBaseInfo = Utils.getPlayBaseInfo(player.playerId);
    var value2 = Grade.getGradeByName(selfBaseInfo.grade);
    var where =
        CacheApi.gradeInStars!.firstWhere((e) => e.playerGrade == value2.name);
    var cost = where.starUpGradeCost[player.breakThroughGrade];
    return cost;
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class UpgradePlayer {
  final AllTeamPlayersByUpStarEntity teamPlayer;
  final StarUpDefineEntity starUpDefine;
  final double starUpBase;
  final double playerBaseValue;
  var select = false.obs;

  UpgradePlayer(this.teamPlayer, this.starUpDefine, this.starUpBase,
      this.playerBaseValue);

  double getPropertyAddValue() {
    if (starUpDefine.starUp == 0) {
      return 0;
    }
    double value = starUpBase *
            (1 +
                starUpDefine.getPotantialMax() / 100 +
                starUpDefine.starUpRange * 1) -
        playerBaseValue;
    return value;
  }
}
