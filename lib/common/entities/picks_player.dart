import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';

import 'guess_infos_entity.dart';
import 'nba_player_infos_entity.dart';

///
///@auther gejiahui
///created at 2024/9/20/15:09

class PicksPlayer {
  late NbaPlayerInfosPlayerBaseInfoList baseInfoList;/// 基础数据
  late NbaPlayerInfosPlayerDataAvgList dataAvgList; /// 数值
  late List<String> betData;/// 竞猜数据
  late String betMutOdds;///串联放大K值
  late String betCost;///倍率极值
  late String betOdds;///下注赔率
  late NbaTeamEntity awayTeamInfo; /// 对手队伍信息
  late NbaTeamEntity selfTeamInfo; /// 自己队伍信息
  late GuessInfosEntity guessInfo; /// 竞猜信息
}