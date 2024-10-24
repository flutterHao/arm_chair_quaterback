import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
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

  /// 对手队伍信息
  late NbaTeamEntity awayTeamInfo;

  /// 自己队伍信息
  late NbaTeamEntity selfTeamInfo;

  /// 竞猜信息
  late GuessGameInfoEntity guessInfo;

  late ReciveAwardEntity reciveAwardInfo;
}

class PicksPlayerV2{
  /// 基础数据
  late NbaPlayerInfosPlayerBaseInfoList baseInfoList;

  /// 数值
  late NbaPlayerInfosPlayerDataAvgList dataAvgList;

  /// 对手队伍信息
  late NbaTeamEntity? awayTeamInfo;

  /// 竞猜信息
  late GuessGameInfoEntity guessInfo;

  /// tab的下标
  late String tabStr;

  /// 选中状态 -1 未选 0 more 1 less
  int status;

  PicksPlayerV2({this.status = -1});

}
