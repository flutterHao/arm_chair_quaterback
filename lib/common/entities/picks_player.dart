import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';

import 'guess_infos_entity.dart';
import 'nba_player_infos_entity.dart';

///
///@auther gejiahui
///created at 2024/9/20/15:09

class PicksPlayer {
  /// 基础数据
  late NbaPlayerInfosPlayerBaseInfoList baseInfoList;

  /// 数值
  late NbaPlayerInfosPlayerDataAvgList dataAvgList;

  /// 竞猜数据
  late List<String> betData;

  ///串联放大K值
  late String betMutOdds;

  ///倍率极值
  late String betCost;

  ///下注赔率
  late String betOdds;

  /// 对手队伍信息
  late NbaTeamEntity awayTeamInfo;

  /// 自己队伍信息
  late NbaTeamEntity selfTeamInfo;

  /// 竞猜信息
  late GuessInfosEntity guessInfo;

  late ReciveAwardEntity reciveAwardInfo;
}
