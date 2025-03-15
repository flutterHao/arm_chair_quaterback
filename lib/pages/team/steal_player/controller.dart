import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/14/17:50

class StealPlayerController extends GetxController {
  late StealTeamEntity stealTeamEntity;
  var loadStatus = LoadDataStatus.loading.obs;
  /// 偷球员状态：0 未选择 1 成功 2 失败
  var stealStatus = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TeamApi.getStealTeam(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(),
    ]).then((result) {
      stealTeamEntity = result[0] as StealTeamEntity;
      loadStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
      Get.back();
    });
  }

  onItemTap(
      StealTeamPlayers player, NbaPlayerInfosPlayerBaseInfoList playBaseInfo) {
    TeamApi.steal(player.playerId).then((res){

    },onError: (e){
      ErrorUtils.toast(e);
    });
  }
}
