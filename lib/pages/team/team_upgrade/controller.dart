import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TeamUpgradeController extends GetxController {
  TeamUpgradeController(this.playerId);

  final int playerId;
  var loadStatus = LoadDataStatus.loading.obs;
  late TeamPlayerInfoEntity teamPlayerInfo;
  late NbaPlayerInfosPlayerBaseInfoList playerBaseInfo;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    var teamId =
        Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamId ?? 0;
    Future.wait([
      TeamApi.getMyTeamPlayer(teamId),
      CacheApi.getNBAPlayerInfo(),
    ]).then((result) {
      var where = (result[0] as MyTeamEntity)
          .teamPlayers
          .firstWhereOrNull((e) => e.playerId == playerId);
      if (where == null) {
        loadStatus.value = LoadDataStatus.error;
        EasyLoading.showToast("SERVER ERROR");
      } else {
        teamPlayerInfo = where;
      }
      playerBaseInfo = Utils.getPlayBaseInfo(playerId);
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  String getLastName(){
    return playerBaseInfo.elname;
  }

  String getFirstName(){
    return playerBaseInfo.elname;
  }
}
