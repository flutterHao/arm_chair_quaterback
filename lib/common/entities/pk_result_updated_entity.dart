import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pk_result_updated_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pk_result_updated_entity.g.dart';

@JsonSerializable()
class PkResultUpdatedEntity {
  late PkResultUpdatedTeamResult awayTeamResult;
  late int gameType = 0;
  late PkResultUpdatedTeamResult homeTeamResult;
  late List<PkResultUpdatedPlayerResults> playerResults = [];
  @JSONField(name: "news_title")
  String newsTitle = "";
  @JSONField(name: "news_content")
  String newsContent = "";
  /// eventType : 1 偷钱 2 偷球员
  @JSONField(name: "event_type")
  int eventType = 0;
  @JSONField(name: "event_value")
  String eventValue = "";

  PkResultUpdatedEntity();

  factory PkResultUpdatedEntity.fromJson(Map<String, dynamic> json) =>
      $PkResultUpdatedEntityFromJson(json);

  Map<String, dynamic> toJson() => $PkResultUpdatedEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkResultUpdatedTeamResult {
  late bool ast = false;
  late int cardBoxId = 0;
  late bool cardBoxIsFull = false;
  late int cup = 0;
  late List<DropAwardData> dropAwardData = [];
  late bool mvp = false;
  late List<dynamic> otherAwardData = [];
  late String parameter = '';
  late bool pts = false;
  late bool reb = false;
  late int score = 0;
  late List<ScoreBoardDetailList> scoreBoardDetailList = [];
  late PkResultUpdatedAwayTeamResultScoreBoards scoreBoards;
  late String serverId = '';
  late int starNum = 0;
  late int teamId = 0;
  late int teamLogo = 0;
  late String teamName = '';
  late List<PkResultUpdatedAwayTeamResultTeamPlayers> teamPlayers = [];
  late List<dynamic> vipAwardData = [];
  late bool win = false;

  PkResultUpdatedTeamResult();

  factory PkResultUpdatedTeamResult.fromJson(Map<String, dynamic> json) =>
      $PkResultUpdatedTeamResultFromJson(json);

  Map<String, dynamic> toJson() => $PkResultUpdatedTeamResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ScoreBoardDetailList {
  late int ast = 0;
  late int astPoint = 0;
  late int blk = 0;
  late int blkPoint = 0;
  @JSONField(name: 'createTime')
  late int ct = 0;
  late int dreb = 0;
  late int fga = 0;
  late int fgm = 0;
  late int fta = 0;
  late int ftm = 0;
  late int gameId = 0;
  late int min = 0;
  late int mvpPoint = 0;
  late int oreb = 0;
  late int pass = 0;
  late int pf = 0;
  late int playerId = 0;
  late int property = 0;
  late int pts = 0;
  late int ptsPoint = 0;
  late int reb = 0;
  late int rebPoint = 0;
  late double score = 0;
  late bool starter = false;
  late int starterPos = 0;
  late int stl = 0;
  late int teamId = 0;
  late int tech = 0;
  late int threePa = 0;
  late int threePm = 0;
  late int to = 0;

  ScoreBoardDetailList();

  int get createTime =>
      ct + Utils.getTimeZoneOffset().inMilliseconds;

  factory ScoreBoardDetailList.fromJson(Map<String, dynamic> json) =>
      $ScoreBoardDetailListFromJson(json);

  Map<String, dynamic> toJson() => $ScoreBoardDetailListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  // 方法：将另一个 ScoreBoardDetailList 的值累加到当前实例上
  // 累加方法，忽略 teamId 字段
  void add(ScoreBoardDetailList other) {
    ast += other.ast;
    astPoint += other.astPoint;
    blk += other.blk;
    blkPoint += other.blkPoint;
    ct += other.ct;
    dreb += other.dreb;
    fga += other.fga;
    fgm += other.fgm;
    fta += other.fta;
    ftm += other.ftm;
    gameId += other.gameId;
    min += other.min;
    mvpPoint += other.mvpPoint;
    oreb += other.oreb;
    pass += other.pass;
    pf += other.pf;
    playerId += other.playerId;
    property += other.property;
    pts += other.pts;
    ptsPoint += other.ptsPoint;
    reb += other.reb;
    rebPoint += other.rebPoint;
    score += other.score;
    // starter 字段为布尔值，根据业务逻辑决定是否需要处理
    starterPos += other.starterPos;
    stl += other.stl;
    // teamId 字段不进行累加
    tech += other.tech;
    threePa += other.threePa;
    threePm += other.threePm;
    to += other.to;
  }
}

@JsonSerializable()
class PkResultUpdatedAwayTeamResultScoreBoards {
  late int createTime = 0;
  late int gameId = 0;
  late int ot1 = 0;
  late int ot2 = 0;
  late int ot3 = 0;
  late int ot4 = 0;
  late int ot5 = 0;
  late int ot6 = 0;
  late int ot7 = 0;
  late int ot8 = 0;
  late int quarter1 = 0;
  late int quarter2 = 0;
  late int quarter3 = 0;
  late int quarter4 = 0;
  late int teamId = 0;
  late int total = 0;
  late int updateTime = 0;

  PkResultUpdatedAwayTeamResultScoreBoards();

  factory PkResultUpdatedAwayTeamResultScoreBoards.fromJson(
          Map<String, dynamic> json) =>
      $PkResultUpdatedAwayTeamResultScoreBoardsFromJson(json);

  Map<String, dynamic> toJson() =>
      $PkResultUpdatedAwayTeamResultScoreBoardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkResultUpdatedAwayTeamResultTeamPlayers {
  late bool bindStatus = false;
  late int breakThroughGrade = 0;
  late int buyPlayerScore = 0;
  late int buyPrice = 0;
  late int createTime = 0;
  late int fromType = 0;
  late int gradeExp = 0;
  late int id = 0;
  late int playerGrade = 0;
  late int playerId = 0;
  late double playerReadiness;
  late int playerStatus = 0;
  late int playerStatusValue = 0;
  late int position = 0;
  late PkResultUpdatedAwayTeamResultTeamPlayersPotential potential;
  late double power = 0;
  late int teamId = 0;
  late PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase upStarBase;
  late int updateTime = 0;
  late String uuid = '';

  PkResultUpdatedAwayTeamResultTeamPlayers();

  factory PkResultUpdatedAwayTeamResultTeamPlayers.fromJson(
          Map<String, dynamic> json) =>
      $PkResultUpdatedAwayTeamResultTeamPlayersFromJson(json);

  Map<String, dynamic> toJson() =>
      $PkResultUpdatedAwayTeamResultTeamPlayersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkResultUpdatedAwayTeamResultTeamPlayersPotential {
  late int ast = 0;
  late int blk = 0;
  late int pass = 0;
  late int pts = 0;
  late int reb = 0;
  late int stl = 0;
  late int tech = 0;
  late int threePm = 0;

  PkResultUpdatedAwayTeamResultTeamPlayersPotential();

  factory PkResultUpdatedAwayTeamResultTeamPlayersPotential.fromJson(
          Map<String, dynamic> json) =>
      $PkResultUpdatedAwayTeamResultTeamPlayersPotentialFromJson(json);

  Map<String, dynamic> toJson() =>
      $PkResultUpdatedAwayTeamResultTeamPlayersPotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase {
  late int ast = 0;
  late int blk = 0;
  late int pass = 0;
  late int pts = 0;
  late int reb = 0;
  late int stl = 0;
  late int tech = 0;
  late int threePm = 0;

  PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase();

  factory PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.fromJson(
          Map<String, dynamic> json) =>
      $PkResultUpdatedAwayTeamResultTeamPlayersUpStarBaseFromJson(json);

  Map<String, dynamic> toJson() =>
      $PkResultUpdatedAwayTeamResultTeamPlayersUpStarBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkResultUpdatedPlayerResults {
  late int ast = 0;
  late int blk = 0;
  late int playerId = 0;
  late int pts = 0;
  late int reb = 0;
  late int stl = 0;
  late int teamId = 0;

  /// 1 mvp 2 reb 3 pts 4 ast
  late int type = 0;

  PkResultUpdatedPlayerResults();

  factory PkResultUpdatedPlayerResults.fromJson(Map<String, dynamic> json) =>
      $PkResultUpdatedPlayerResultsFromJson(json);

  Map<String, dynamic> toJson() => $PkResultUpdatedPlayerResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DropAwardData {
  late int id;
  late int num;
  late int type;

  DropAwardData();

  factory DropAwardData.fromJson(Map<String, dynamic> json) =>
      $DropAwardDataFromJson(json);

  Map<String, dynamic> toJson() => $DropAwardDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
