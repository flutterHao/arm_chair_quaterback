import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:get/get.dart';

class PicksHistoryController extends GetxController {
  PicksHistoryController();

  var loadStatus = LoadDataStatus.loading.obs;
  List<String> tabs = [LangKey.userNamePickHistory, LangKey.uesrNameNewsPick];

  late TeamSimpleEntity teamSimpleEntity;

  late ReciveAwardV2Entity reciveAwardV2Entity;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    HomeController homeController = Get.find();
    var teamId = homeController.userEntiry.teamLoginInfo?.team?.teamId ?? 0;
    Future.wait([
      PicksApi.getTeamSimple(teamId),
      PicksApi.getGuessInfos(teamId),
      CacheApi.getNBATeamDefine(getList: true),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getPickDefine(),
    ]).then((result) {
      teamSimpleEntity = result[0];
      reciveAwardV2Entity = result[1];
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  Map<String, List<ReciveAwardV2GuessInfo>> getOpenList() {
    List<ReciveAwardV2GuessInfo> all = [
      ...reciveAwardV2Entity.pointGuessing,
      ...reciveAwardV2Entity.newsGuessing,
    ];
    List<ReciveAwardV2GuessInfo> list =
        all.where((e) => e.status == 1).toList();
    var map = list.fold(<String, List<ReciveAwardV2GuessInfo>>{}, (p, e) {
      var dateTimeByMs = MyDateUtils.getDateTimeByMs(e.createTime);
      var key = MyDateUtils.getEnMMDDYYYY(dateTimeByMs, short: true);
      if (p.containsKey(key)) {
        p[key]!.add(e);
      } else {
        p[key] = [e];
      }
      return p;
    });
    return map;
  }

  Map<String, List<ReciveAwardV2GuessInfo>> getCloseList() {
    List<ReciveAwardV2GuessInfo> all = [
      ...reciveAwardV2Entity.pointGuessing,
      ...reciveAwardV2Entity.newsGuessing,
    ];
    List<ReciveAwardV2GuessInfo> list =
        all.where((e) => e.status != 1).toList();
    var map = list.fold(<String, List<ReciveAwardV2GuessInfo>>{}, (p, e) {
      var dateTimeByMs = MyDateUtils.getDateTimeByMs(e.createTime);
      var key = MyDateUtils.getEnMMDDYYYY(dateTimeByMs, short: true);
      if (p.containsKey(key)) {
        p[key]!.add(e);
      } else {
        p[key] = [e];
      }
      return p;
    });
    return map;
  }
}
