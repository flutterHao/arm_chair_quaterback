import 'dart:async';
import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/battle_pass_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/battle_pass_reward_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/now_season_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/battle_pass.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:get/get.dart';

class SeasonPassController extends GetxController {
  SeasonPassController();
  Rx<BattlePassInfoEntity> battlePassInfo = BattlePassInfoEntity().obs;
  NowSeasonEntity nowSeasonEntity = NowSeasonEntity();
  List<BattlePassRewardEntity> battleRewardList = [];
  List<NbaTeamEntity> teamDefine = [];

  int teamId = 101;
  initData() async {
    updateBattlePassInfo();
    teamId = battlePassInfo.value.hostTeam;
    await Future.wait(
      [
        CacheApi.getBattlePassReward(),
        PicksApi.getNowSeason(),
      ],
    ).then((result) {
      battleRewardList = result[0] as List<BattlePassRewardEntity>;
      nowSeasonEntity = result[1] as NowSeasonEntity;
    });

    _updateRemainingTime();
    // 每秒更新一次剩余时间
    _timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => _updateRemainingTime());
    print(battlePassInfo.value.hostTeam);
    CacheApi.getBattlePassUdfReward();
    teamDefine = await CacheApi.getNBATeamDefine(getList: true);
    teamDefine.removeWhere((item) => item.id == 0);
    // battleUdfRewardList = await CacheApi.getBattlePassUdfReward();
  }

  ///更新通行证信息
  Future updateBattlePassInfo() async {
    battlePassInfo.value = await BattlePassApi.getBattlePassInfo();
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  /// 使用队伍id 获取队伍的颜色
  Color getTeamColor(int teamId) {
    if (CacheApi.teamDefineMap != null) {
      String colorStr = "0xFF${CacheApi.teamDefineMap![teamId]!.teamColors}";
      int? color = int.tryParse(colorStr);
      if (color != null) {
        return Color(color);
      }
    }
    return AppColors.c404040;
  }

  late Timer _timer;
  Rx<Duration> remaining = Duration(microseconds: 0).obs;
  String days = '';
  String hours = ''; // 获取除去整天后的小时数
  String twoDigitMinutes = '';
  String twoDigitSeconds = '';
  void formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    // 计算天数、剩余的小时数、分钟数和秒数
    days = twoDigits(d.inDays);
    hours = twoDigits(d.inHours.remainder(24)); // 获取除去整天后的小时数
    twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
  }

  void _updateRemainingTime() {
    DateTime now = DateTime.now();
    // 赛季结束时间
    DateTime endTime =
        DateTime.fromMillisecondsSinceEpoch(nowSeasonEntity.seasonEndTime)
            .toLocal();
    remaining.value = endTime.difference(now);
    formatDuration(remaining.value);
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }
}
