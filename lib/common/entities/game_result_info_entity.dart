import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/game_result_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/game_result_info_entity.g.dart';

@JsonSerializable()
class GameResultInfoEntity {
  late int gameId = 0;
  late int gameType = 0;
  late GameResultInfoHomeTeamResult homeTeamResult;
  late GameResultInfoAwayTeamResult awayTeamResult;
  late List<GameResultInfoGameScoreBoard> gameScoreBoard = [];
  late List<GameResultInfoPlayerResults> playerResults = [];
  late List<GameResultInfoGameScoreBoardDetail> gameScoreBoardDetail = [];
  late GameResultInfoGsGameSchedule gsGameSchedule;

  GameResultInfoEntity();

  factory GameResultInfoEntity.fromJson(Map<String, dynamic> json) =>
      $GameResultInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $GameResultInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoHomeTeamResult {
  late int gameId = 0;
  late int teamLogo = 0;
  late String teamName = '';
  late List<dynamic> otherAwardData = [];
  late bool ast = false;
  late List<GameResultInfoHomeTeamResultTeamPlayers> teamPlayers = [];
  late int strength = 0;
  late bool mvp = false;
  late bool cardBoxIsFull = false;
  late List<dynamic> vipAwardData = [];
  late int updateTime = 0;
  late String serverId = '';
  late bool pts = false;
  late bool reb = false;
  late int score = 0;
  late int createTime = 0;
  late int teamId = 0;
  late int cupDiff = 0;
  late int cardBoxId = 0;
  late bool win = false;
  late int cup = 0;
  late List<GameResultInfoHomeTeamResultDropAwardData> dropAwardData = [];

  GameResultInfoHomeTeamResult();

  factory GameResultInfoHomeTeamResult.fromJson(Map<String, dynamic> json) =>
      $GameResultInfoHomeTeamResultFromJson(json);

  Map<String, dynamic> toJson() => $GameResultInfoHomeTeamResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoHomeTeamResultTeamPlayers {
  late int buyPrice = 0;
  late int buyPlayerScore = 0;
  late int updateTime = 0;
  late int playerStrength = 0;
  late String uuid = '';
  late double playerReadiness;
  late int gradeExp = 0;
  late int fromType = 0;
  late int createTime = 0;
  late int playerGrade = 0;
  late int teamId = 0;
  late int id = 0;
  late int position = 0;
  late double power = 0;
  late int playerStatus = 0;
  late int playerStatusValue = 0;
  late GameResultInfoHomeTeamResultTeamPlayersPotential potential;
  late bool bindStatus = false;
  late int breakThroughGrade = 0;
  late int playerId = 0;
  late GameResultInfoHomeTeamResultTeamPlayersUpStarBase upStarBase;

  GameResultInfoHomeTeamResultTeamPlayers();

  factory GameResultInfoHomeTeamResultTeamPlayers.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoHomeTeamResultTeamPlayersFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoHomeTeamResultTeamPlayersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoHomeTeamResultTeamPlayersPotential {
  late int blk = 0;
  late int tech = 0;
  late int pass = 0;
  late int stl = 0;
  late int threePm = 0;
  late int ftm = 0;
  late int pts = 0;
  late int reb = 0;

  GameResultInfoHomeTeamResultTeamPlayersPotential();

  factory GameResultInfoHomeTeamResultTeamPlayersPotential.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoHomeTeamResultTeamPlayersPotentialFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoHomeTeamResultTeamPlayersPotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoHomeTeamResultTeamPlayersUpStarBase {
  late int blk = 0;
  late int tech = 0;
  late int pass = 0;
  late int stl = 0;
  late int threePm = 0;
  late int ftm = 0;
  late int pts = 0;
  late int reb = 0;

  GameResultInfoHomeTeamResultTeamPlayersUpStarBase();

  factory GameResultInfoHomeTeamResultTeamPlayersUpStarBase.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoHomeTeamResultTeamPlayersUpStarBaseFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoHomeTeamResultTeamPlayersUpStarBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoHomeTeamResultDropAwardData {
  late int num = 0;
  late int id = 0;
  late int type = 0;

  GameResultInfoHomeTeamResultDropAwardData();

  factory GameResultInfoHomeTeamResultDropAwardData.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoHomeTeamResultDropAwardDataFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoHomeTeamResultDropAwardDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoAwayTeamResult {
  late int gameId = 0;
  late int teamLogo = 0;
  late String teamName = '';
  late List<dynamic> otherAwardData = [];
  late bool ast = false;
  late List<GameResultInfoAwayTeamResultTeamPlayers> teamPlayers = [];
  late int strength = 0;
  late bool mvp = false;
  late bool cardBoxIsFull = false;
  late List<dynamic> vipAwardData = [];
  late int updateTime = 0;
  late String serverId = '';
  late bool pts = false;
  late bool reb = false;
  late int score = 0;
  late int createTime = 0;
  late int teamId = 0;
  late int cupDiff = 0;
  late int cardBoxId = 0;
  late bool win = false;
  late int cup = 0;
  late List<GameResultInfoAwayTeamResultDropAwardData> dropAwardData = [];

  GameResultInfoAwayTeamResult();

  factory GameResultInfoAwayTeamResult.fromJson(Map<String, dynamic> json) =>
      $GameResultInfoAwayTeamResultFromJson(json);

  Map<String, dynamic> toJson() => $GameResultInfoAwayTeamResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoAwayTeamResultTeamPlayers {
  late int buyPrice = 0;
  late int buyPlayerScore = 0;
  late int updateTime = 0;
  late int playerStrength = 0;
  late String uuid = '';
  late double playerReadiness;
  late int gradeExp = 0;
  late int fromType = 0;
  late int createTime = 0;
  late int playerGrade = 0;
  late int teamId = 0;
  late int id = 0;
  late int position = 0;
  late int power = 0;
  late int playerStatus = 0;
  late int playerStatusValue = 0;
  late GameResultInfoAwayTeamResultTeamPlayersPotential potential;
  late bool bindStatus = false;
  late int breakThroughGrade = 0;
  late int playerId = 0;
  late GameResultInfoAwayTeamResultTeamPlayersUpStarBase upStarBase;

  GameResultInfoAwayTeamResultTeamPlayers();

  factory GameResultInfoAwayTeamResultTeamPlayers.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoAwayTeamResultTeamPlayersFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoAwayTeamResultTeamPlayersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoAwayTeamResultTeamPlayersPotential {
  late int blk = 0;
  late int tech = 0;
  late int pass = 0;
  late int stl = 0;
  late int threePm = 0;
  late int ftm = 0;
  late int pts = 0;
  late int reb = 0;

  GameResultInfoAwayTeamResultTeamPlayersPotential();

  factory GameResultInfoAwayTeamResultTeamPlayersPotential.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoAwayTeamResultTeamPlayersPotentialFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoAwayTeamResultTeamPlayersPotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoAwayTeamResultTeamPlayersUpStarBase {
  late int blk = 0;
  late int tech = 0;
  late int pass = 0;
  late int stl = 0;
  late int threePm = 0;
  late int ftm = 0;
  late int pts = 0;
  late int reb = 0;

  GameResultInfoAwayTeamResultTeamPlayersUpStarBase();

  factory GameResultInfoAwayTeamResultTeamPlayersUpStarBase.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoAwayTeamResultTeamPlayersUpStarBaseFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoAwayTeamResultTeamPlayersUpStarBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoAwayTeamResultDropAwardData {
  late int num = 0;
  late int id = 0;
  late int type = 0;

  GameResultInfoAwayTeamResultDropAwardData();

  factory GameResultInfoAwayTeamResultDropAwardData.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoAwayTeamResultDropAwardDataFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoAwayTeamResultDropAwardDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoGameScoreBoard {
  late int gameId = 0;
  late int quarter1 = 0;
  late int quarter2 = 0;
  late int quarter3 = 0;
  late int quarter4 = 0;
  late int updateTime = 0;
  late int ot2 = 0;
  late int ot1 = 0;
  late int ot4 = 0;
  late int ot3 = 0;
  late int ot6 = 0;
  late int ot5 = 0;
  late int ot8 = 0;
  late int total = 0;
  late int ot7 = 0;
  late int createTime = 0;
  late int teamId = 0;

  GameResultInfoGameScoreBoard();

  factory GameResultInfoGameScoreBoard.fromJson(Map<String, dynamic> json) =>
      $GameResultInfoGameScoreBoardFromJson(json);

  Map<String, dynamic> toJson() => $GameResultInfoGameScoreBoardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoPlayerResults {
  late int blk = 0;
  late int gameId = 0;
  late int ast = 0;
  late int createTime = 0;
  late int teamId = 0;
  late int stl = 0;
  late int updateTime = 0;
  late int type = 0;
  late int pts = 0;
  late int reb = 0;
  late int playerId = 0;

  GameResultInfoPlayerResults();

  factory GameResultInfoPlayerResults.fromJson(Map<String, dynamic> json) =>
      $GameResultInfoPlayerResultsFromJson(json);

  Map<String, dynamic> toJson() => $GameResultInfoPlayerResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoGameScoreBoardDetail {
  late int fga = 0;
  late int ast = 0;
  late int dreb = 0;
  late int starterPos = 0;
  late int fgm = 0;
  late int ptsPoint = 0;
  late int reb = 0;
  late int mvpPoint = 0;
  late double score = 0;
  late int fta = 0;
  late int min = 0;
  late int property = 0;
  late int ftm = 0;
  late int playerId = 0;
  late int blk = 0;
  late int gameId = 0;
  late int tech = 0;
  late int astPoint = 0;
  late bool starter = false;
  late int pass = 0;
  late int blkPoint = 0;
  late int stl = 0;
  late int updateTime = 0;
  late int pts = 0;
  late int threePa = 0;
  late int rebPoint = 0;
  late int oreb = 0;
  late int createTime = 0;
  late int pf = 0;
  late int teamId = 0;
  late int threePm = 0;
  late int to = 0;

  GameResultInfoGameScoreBoardDetail();

  factory GameResultInfoGameScoreBoardDetail.fromJson(
          Map<String, dynamic> json) =>
      $GameResultInfoGameScoreBoardDetailFromJson(json);

  Map<String, dynamic> toJson() =>
      $GameResultInfoGameScoreBoardDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameResultInfoGsGameSchedule {
  late int gameId = 0;
  late int gameType = 0;
  late int finishTime = 0;
  late int homeScore = 0;
  late int updateTime = 0;
  late int gameTime = 0;
  late int awayScore = 0;
  late int createTime = 0;
  late String awayTeamName = '';
  late int homeLeagueId = 0;
  late int awayLeagueId = 0;
  late int startTime = 0;
  late int awayTeamLogo = 0;
  late int homeTeamLogo = 0;
  late String homeTeamName = '';
  late int homeTeamId = 0;
  late String awayLeagueName = '';
  late int awayTeamId = 0;
  late String homeLeagueName = '';

  GameResultInfoGsGameSchedule();

  factory GameResultInfoGsGameSchedule.fromJson(Map<String, dynamic> json) =>
      $GameResultInfoGsGameScheduleFromJson(json);

  Map<String, dynamic> toJson() => $GameResultInfoGsGameScheduleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
