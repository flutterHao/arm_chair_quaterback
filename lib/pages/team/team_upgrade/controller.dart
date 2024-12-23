import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TeamUpgradeController extends GetxController {
  TeamUpgradeController(this.player);

  final TeamPlayerInfoEntity player;
  var loadStatus = LoadDataStatus.loading.obs;
  late TeamPlayerInfoEntity teamPlayerInfo;
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
    var teamId =
        Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamId ?? 0;
    Future.wait([
      TeamApi.getMyTeamPlayer(teamId),
      CacheApi.getNBAPlayerInfo(),
      PicksApi.getAllTeamPlayersByUpStar(player.uuid),
      CacheApi.getStarUpDefine(),
    ]).then((result) {
      var where = (result[0] as MyTeamEntity)
          .teamPlayers
          .firstWhereOrNull((e) => e.playerId == player.playerId);
      var allTeamPlayersByUpStarEntity =
          result[2] as List<AllTeamPlayersByUpStarEntity>;
      allTeamPlayers =
          allTeamPlayersByUpStarEntity.fold(<UpgradePlayer>[], (p, e) {
        if (e.playerId != player.playerId &&
            e.position < 0 &&
            (e.breakThroughGrade == player.breakThroughGrade ||
                e.breakThroughGrade == (player.breakThroughGrade + 1))) {
          /// 剔除自己，上阵，小于自己星级或大于自己一级以上的球员
          p.add(UpgradePlayer(e));
        }
        return p;
      });
      starUpDefineList = result[3] as List<StarUpDefineEntity>;
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

  sortList() {
    if (starSort.value != -1) {
      allTeamPlayers.sort((a, b) {
        if (gradeSort.value == 0) {
          return a.item.breakThroughGrade.compareTo(b.item.breakThroughGrade);
        } else {
          return b.item.breakThroughGrade.compareTo(a.item.breakThroughGrade);
        }
      });
    } else {
      allTeamPlayers.sort((a, b) {
        if (gradeSort.value == 0) {
          return Utils.getPlayBaseInfo(a.item.playerId)
              .grade
              .compareTo(Utils.getPlayBaseInfo(b.item.playerId).grade);
        } else {
          return Utils.getPlayBaseInfo(b.item.playerId)
              .grade
              .compareTo(Utils.getPlayBaseInfo(a.item.playerId).grade);
        }
      });
    }
    update([idUpgradePlayers]);
  }

  static String get idUpgradePlayers => "id_upgrade_players";

  String getLastName() {
    return playerBaseInfo.elname;
  }

  String getFirstName() {
    return playerBaseInfo.elname;
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
    var starUpDefineEntity = starUpDefineList
        .firstWhere((f) => f.starUp == (player.breakThroughGrade + 1));
    double propertyUp = selectedPlayers.fold(0, (p, e) {
      return p + starUpDefineEntity.starUpRange;
    });
    propertyUp = 1 + starUpDefineEntity.getPotantialMax()/100 + propertyUp;
    var upSR = selectedPlayers.fold(0.0, (p, e) {
      return p + e.item.probability;
    });
    print('propertyUp:$propertyUp,,,,,$upSR');

    ppUpValue.value = propertyUp;
    upSuccessRate.value = upSR;
  }
}

class UpgradePlayer {
  final AllTeamPlayersByUpStarEntity item;
  var select = false.obs;

  UpgradePlayer(this.item);
}
