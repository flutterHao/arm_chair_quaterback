import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:get/get.dart';

class PlayerDetailController extends GetxController
    with GetTickerProviderStateMixin {
  PlayerDetailController(this.arguments);

  final PlayerDetailPageArguments arguments;

  NbaTeamEntity? teamInfo;
  NbaPlayerInfosPlayerBaseInfoList? baseInfo;
  List<String> tabs = [
    LangKey.nbaTeamMeanOverview,
    LangKey.nbaTeamMeanStats,
    LangKey.nbaTeamMeanLog
  ];

  NbaPlayerBaseInfoEntity? nbaPlayerBaseInfoEntity;

  var loadStatus = LoadDataStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  reloadData() {
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(getList: true),
      CacheApi.getPickType(),
      PicksApi.getNBAPlayerBaseInfo(arguments.playerId),
    ]).then((result) {
      baseInfo = (result[0] as NbaPlayerInfosEntity)
          .playerBaseInfoList
          .firstWhere((e) => e.playerId == arguments.playerId);
      teamInfo = (result[1] as List<NbaTeamEntity>)
          .firstWhere((e) => e.id == baseInfo?.teamId);
      NbaPlayerBaseInfoEntity result2 = result[3];
      result2.l5GameData.sort((a, b) {
        return a.updateTime.compareTo(b.updateTime);
      });
      Map<String, NbaPlayerBaseInfoGuessInfosProperty> guessInfos =
          (CacheApi.pickType ?? []).fold({}, (p, e) {
        var contains =
            result2.guessInfos.keys.toList().contains(e.pickTypeName);
        if (contains) {
          p[e.pickTypeName] = result2.guessInfos[e.pickTypeName]!;
        }
        return p;
      });
      result2.guessInfos = guessInfos;
      nbaPlayerBaseInfoEntity = result2;
      loadStatus.value = LoadDataStatus.success;
      update([idMain]);
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  static get idMain => "player_detail_main";
}
