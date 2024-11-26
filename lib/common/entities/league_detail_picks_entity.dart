import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';

///
///@auther gejiahui
///created at 2024/11/26/10:48

class LeagueDetailPicksEntity{

  final Map<String,List<GuessGameInfoEntity>> guessDataInfo;

  final List<ScoresEntity> scheduleData;

  LeagueDetailPicksEntity(this.guessDataInfo, this.scheduleData);
}