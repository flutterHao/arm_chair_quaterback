import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';

NbaPlayerInfosEntity $NbaPlayerInfosEntityFromJson(Map<String, dynamic> json) {
  final NbaPlayerInfosEntity nbaPlayerInfosEntity = NbaPlayerInfosEntity();
  final NbaPlayerInfosNBAPlayerInfos? nBAPlayerInfos = jsonConvert.convert<
      NbaPlayerInfosNBAPlayerInfos>(json['NBAPlayerInfos']);
  if (nBAPlayerInfos != null) {
    nbaPlayerInfosEntity.nBAPlayerInfos = nBAPlayerInfos;
  }
  return nbaPlayerInfosEntity;
}

Map<String, dynamic> $NbaPlayerInfosEntityToJson(NbaPlayerInfosEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['NBAPlayerInfos'] = entity.nBAPlayerInfos.toJson();
  return data;
}

extension NbaPlayerInfosEntityExtension on NbaPlayerInfosEntity {
  NbaPlayerInfosEntity copyWith({
    NbaPlayerInfosNBAPlayerInfos? nBAPlayerInfos,
  }) {
    return NbaPlayerInfosEntity()
      ..nBAPlayerInfos = nBAPlayerInfos ?? this.nBAPlayerInfos;
  }
}

NbaPlayerInfosNBAPlayerInfos $NbaPlayerInfosNBAPlayerInfosFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosNBAPlayerInfos nbaPlayerInfosNBAPlayerInfos = NbaPlayerInfosNBAPlayerInfos();
  final List<
      NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList>? playerBaseInfoList = (json['playerBaseInfoList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList>(
          e) as NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList).toList();
  if (playerBaseInfoList != null) {
    nbaPlayerInfosNBAPlayerInfos.playerBaseInfoList = playerBaseInfoList;
  }
  final List<
      NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList>? playerDataAvgList = (json['playerDataAvgList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList>(
          e) as NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList).toList();
  if (playerDataAvgList != null) {
    nbaPlayerInfosNBAPlayerInfos.playerDataAvgList = playerDataAvgList;
  }
  final List<
      NbaPlayerInfosNBAPlayerInfosPlayerDataCapList>? playerDataCapList = (json['playerDataCapList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          NbaPlayerInfosNBAPlayerInfosPlayerDataCapList>(
          e) as NbaPlayerInfosNBAPlayerInfosPlayerDataCapList).toList();
  if (playerDataCapList != null) {
    nbaPlayerInfosNBAPlayerInfos.playerDataCapList = playerDataCapList;
  }
  return nbaPlayerInfosNBAPlayerInfos;
}

Map<String, dynamic> $NbaPlayerInfosNBAPlayerInfosToJson(
    NbaPlayerInfosNBAPlayerInfos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerBaseInfoList'] =
      entity.playerBaseInfoList.map((v) => v.toJson()).toList();
  data['playerDataAvgList'] =
      entity.playerDataAvgList.map((v) => v.toJson()).toList();
  data['playerDataCapList'] =
      entity.playerDataCapList.map((v) => v.toJson()).toList();
  return data;
}

extension NbaPlayerInfosNBAPlayerInfosExtension on NbaPlayerInfosNBAPlayerInfos {
  NbaPlayerInfosNBAPlayerInfos copyWith({
    List<NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList>? playerBaseInfoList,
    List<NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList>? playerDataAvgList,
    List<NbaPlayerInfosNBAPlayerInfosPlayerDataCapList>? playerDataCapList,
  }) {
    return NbaPlayerInfosNBAPlayerInfos()
      ..playerBaseInfoList = playerBaseInfoList ?? this.playerBaseInfoList
      ..playerDataAvgList = playerDataAvgList ?? this.playerDataAvgList
      ..playerDataCapList = playerDataCapList ?? this.playerDataCapList;
  }
}

NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList $NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoListFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList = NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList();
  final int? beforeMarketPrice = jsonConvert.convert<int>(
      json['beforeMarketPrice']);
  if (beforeMarketPrice != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.beforeMarketPrice =
        beforeMarketPrice;
  }
  final int? beforePlayerStrength = jsonConvert.convert<int>(
      json['beforePlayerStrength']);
  if (beforePlayerStrength != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.beforePlayerStrength =
        beforePlayerStrength;
  }
  final int? birthTime = jsonConvert.convert<int>(json['birthTime']);
  if (birthTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.birthTime = birthTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.createTime = createTime;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.ename = ename;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.espnId = espnId;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.grade = grade;
  }
  final bool? injuries = jsonConvert.convert<bool>(json['injuries']);
  if (injuries != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.injuries = injuries;
  }
  final int? marketPrice = jsonConvert.convert<int>(json['marketPrice']);
  if (marketPrice != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.marketPrice = marketPrice;
  }
  final int? maxPlayerScore = jsonConvert.convert<int>(json['maxPlayerScore']);
  if (maxPlayerScore != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.maxPlayerScore =
        maxPlayerScore;
  }
  final int? minPlayerScore = jsonConvert.convert<int>(json['minPlayerScore']);
  if (minPlayerScore != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.minPlayerScore =
        minPlayerScore;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.name = name;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.playerId = playerId;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.playerScore = playerScore;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.playerStrength =
        playerStrength;
  }
  final int? pos = jsonConvert.convert<int>(json['pos']);
  if (pos != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.pos = pos;
  }
  final String? position = jsonConvert.convert<String>(json['position']);
  if (position != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.position = position;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.property = property;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.salary = salary;
  }
  final String? sname = jsonConvert.convert<String>(json['sname']);
  if (sname != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.sname = sname;
  }
  final List<int>? tag = (json['tag'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (tag != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.tag = tag;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.updateTime = updateTime;
  }
  return nbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList;
}

Map<String, dynamic> $NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoListToJson(
    NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['beforeMarketPrice'] = entity.beforeMarketPrice;
  data['beforePlayerStrength'] = entity.beforePlayerStrength;
  data['birthTime'] = entity.birthTime;
  data['createTime'] = entity.createTime;
  data['ename'] = entity.ename;
  data['espnId'] = entity.espnId;
  data['grade'] = entity.grade;
  data['injuries'] = entity.injuries;
  data['marketPrice'] = entity.marketPrice;
  data['maxPlayerScore'] = entity.maxPlayerScore;
  data['minPlayerScore'] = entity.minPlayerScore;
  data['name'] = entity.name;
  data['playerId'] = entity.playerId;
  data['playerScore'] = entity.playerScore;
  data['playerStrength'] = entity.playerStrength;
  data['pos'] = entity.pos;
  data['position'] = entity.position;
  data['property'] = entity.property;
  data['salary'] = entity.salary;
  data['sname'] = entity.sname;
  data['tag'] = entity.tag;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoListExtension on NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList {
  NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList copyWith({
    int? beforeMarketPrice,
    int? beforePlayerStrength,
    int? birthTime,
    int? createTime,
    String? ename,
    int? espnId,
    String? grade,
    bool? injuries,
    int? marketPrice,
    int? maxPlayerScore,
    int? minPlayerScore,
    String? name,
    int? playerId,
    int? playerScore,
    int? playerStrength,
    int? pos,
    String? position,
    int? property,
    int? salary,
    String? sname,
    List<int>? tag,
    int? teamId,
    int? updateTime,
  }) {
    return NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList()
      ..beforeMarketPrice = beforeMarketPrice ?? this.beforeMarketPrice
      ..beforePlayerStrength = beforePlayerStrength ?? this.beforePlayerStrength
      ..birthTime = birthTime ?? this.birthTime
      ..createTime = createTime ?? this.createTime
      ..ename = ename ?? this.ename
      ..espnId = espnId ?? this.espnId
      ..grade = grade ?? this.grade
      ..injuries = injuries ?? this.injuries
      ..marketPrice = marketPrice ?? this.marketPrice
      ..maxPlayerScore = maxPlayerScore ?? this.maxPlayerScore
      ..minPlayerScore = minPlayerScore ?? this.minPlayerScore
      ..name = name ?? this.name
      ..playerId = playerId ?? this.playerId
      ..playerScore = playerScore ?? this.playerScore
      ..playerStrength = playerStrength ?? this.playerStrength
      ..pos = pos ?? this.pos
      ..position = position ?? this.position
      ..property = property ?? this.property
      ..salary = salary ?? this.salary
      ..sname = sname ?? this.sname
      ..tag = tag ?? this.tag
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime;
  }
}

NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList $NbaPlayerInfosNBAPlayerInfosPlayerDataAvgListFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList = NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.ast = ast;
  }
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.blk = blk;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.createTime = createTime;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.dreb = dreb;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.fga = fga;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.fgm = fgm;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.fta = fta;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.ftm = ftm;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.oreb = oreb;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.pf = pf;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.playCount = playCount;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.playerId = playerId;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.pts = pts;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.seasonId = seasonId;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.stl = stl;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.threePa = threePa;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.to = to;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.updateTime = updateTime;
  }
  return nbaPlayerInfosNBAPlayerInfosPlayerDataAvgList;
}

Map<String, dynamic> $NbaPlayerInfosNBAPlayerInfosPlayerDataAvgListToJson(
    NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['createTime'] = entity.createTime;
  data['dreb'] = entity.dreb;
  data['fga'] = entity.fga;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['ftm'] = entity.ftm;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['playCount'] = entity.playCount;
  data['playerId'] = entity.playerId;
  data['pts'] = entity.pts;
  data['seasonId'] = entity.seasonId;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['threePa'] = entity.threePa;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension NbaPlayerInfosNBAPlayerInfosPlayerDataAvgListExtension on NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList {
  NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList copyWith({
    double? ast,
    double? blk,
    int? createTime,
    double? dreb,
    double? fga,
    double? fgm,
    double? fta,
    double? ftm,
    double? min,
    double? oreb,
    double? pf,
    int? playCount,
    int? playerId,
    double? pts,
    int? seasonId,
    int? starterCount,
    double? stl,
    double? threePa,
    double? threePm,
    double? to,
    int? updateTime,
  }) {
    return NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..createTime = createTime ?? this.createTime
      ..dreb = dreb ?? this.dreb
      ..fga = fga ?? this.fga
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..ftm = ftm ?? this.ftm
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..playCount = playCount ?? this.playCount
      ..playerId = playerId ?? this.playerId
      ..pts = pts ?? this.pts
      ..seasonId = seasonId ?? this.seasonId
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..threePa = threePa ?? this.threePa
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..updateTime = updateTime ?? this.updateTime;
  }
}

NbaPlayerInfosNBAPlayerInfosPlayerDataCapList $NbaPlayerInfosNBAPlayerInfosPlayerDataCapListFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosNBAPlayerInfosPlayerDataCapList nbaPlayerInfosNBAPlayerInfosPlayerDataCapList = NbaPlayerInfosNBAPlayerInfosPlayerDataCapList();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.ast = ast;
  }
  final int? attackCap = jsonConvert.convert<int>(json['attackCap']);
  if (attackCap != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.attackCap = attackCap;
  }
  final int? beforeAst = jsonConvert.convert<int>(json['beforeAst']);
  if (beforeAst != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforeAst = beforeAst;
  }
  final int? beforeBlk = jsonConvert.convert<int>(json['beforeBlk']);
  if (beforeBlk != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforeBlk = beforeBlk;
  }
  final int? beforeDreb = jsonConvert.convert<int>(json['beforeDreb']);
  if (beforeDreb != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforeDreb = beforeDreb;
  }
  final int? beforeOreb = jsonConvert.convert<int>(json['beforeOreb']);
  if (beforeOreb != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforeOreb = beforeOreb;
  }
  final int? beforePts = jsonConvert.convert<int>(json['beforePts']);
  if (beforePts != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforePts = beforePts;
  }
  final int? beforeStl = jsonConvert.convert<int>(json['beforeStl']);
  if (beforeStl != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforeStl = beforeStl;
  }
  final int? beforeThreePm = jsonConvert.convert<int>(json['beforeThreePm']);
  if (beforeThreePm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.beforeThreePm = beforeThreePm;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.blk = blk;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.createTime = createTime;
  }
  final int? defenseCap = jsonConvert.convert<int>(json['defenseCap']);
  if (defenseCap != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.defenseCap = defenseCap;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.dreb = dreb;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.fga = fga;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.fgm = fgm;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.fta = fta;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.ftm = ftm;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.oreb = oreb;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.pf = pf;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.playerId = playerId;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.pts = pts;
  }
  final int? slamDunk = jsonConvert.convert<int>(json['slamDunk']);
  if (slamDunk != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.slamDunk = slamDunk;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.stl = stl;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.threePa = threePa;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.threePm = threePm;
  }
  final int? threePts = jsonConvert.convert<int>(json['threePts']);
  if (threePts != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.threePts = threePts;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.to = to;
  }
  final int? twoPts = jsonConvert.convert<int>(json['twoPts']);
  if (twoPts != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.twoPts = twoPts;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerInfosNBAPlayerInfosPlayerDataCapList.updateTime = updateTime;
  }
  return nbaPlayerInfosNBAPlayerInfosPlayerDataCapList;
}

Map<String, dynamic> $NbaPlayerInfosNBAPlayerInfosPlayerDataCapListToJson(
    NbaPlayerInfosNBAPlayerInfosPlayerDataCapList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['attackCap'] = entity.attackCap;
  data['beforeAst'] = entity.beforeAst;
  data['beforeBlk'] = entity.beforeBlk;
  data['beforeDreb'] = entity.beforeDreb;
  data['beforeOreb'] = entity.beforeOreb;
  data['beforePts'] = entity.beforePts;
  data['beforeStl'] = entity.beforeStl;
  data['beforeThreePm'] = entity.beforeThreePm;
  data['blk'] = entity.blk;
  data['createTime'] = entity.createTime;
  data['defenseCap'] = entity.defenseCap;
  data['dreb'] = entity.dreb;
  data['fga'] = entity.fga;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['ftm'] = entity.ftm;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['playerId'] = entity.playerId;
  data['pts'] = entity.pts;
  data['slamDunk'] = entity.slamDunk;
  data['stl'] = entity.stl;
  data['threePa'] = entity.threePa;
  data['threePm'] = entity.threePm;
  data['threePts'] = entity.threePts;
  data['to'] = entity.to;
  data['twoPts'] = entity.twoPts;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension NbaPlayerInfosNBAPlayerInfosPlayerDataCapListExtension on NbaPlayerInfosNBAPlayerInfosPlayerDataCapList {
  NbaPlayerInfosNBAPlayerInfosPlayerDataCapList copyWith({
    int? ast,
    int? attackCap,
    int? beforeAst,
    int? beforeBlk,
    int? beforeDreb,
    int? beforeOreb,
    int? beforePts,
    int? beforeStl,
    int? beforeThreePm,
    int? blk,
    int? createTime,
    int? defenseCap,
    int? dreb,
    int? fga,
    int? fgm,
    int? fta,
    int? ftm,
    int? min,
    int? oreb,
    int? pf,
    int? playerId,
    int? pts,
    int? slamDunk,
    int? stl,
    int? threePa,
    int? threePm,
    int? threePts,
    int? to,
    int? twoPts,
    int? updateTime,
  }) {
    return NbaPlayerInfosNBAPlayerInfosPlayerDataCapList()
      ..ast = ast ?? this.ast
      ..attackCap = attackCap ?? this.attackCap
      ..beforeAst = beforeAst ?? this.beforeAst
      ..beforeBlk = beforeBlk ?? this.beforeBlk
      ..beforeDreb = beforeDreb ?? this.beforeDreb
      ..beforeOreb = beforeOreb ?? this.beforeOreb
      ..beforePts = beforePts ?? this.beforePts
      ..beforeStl = beforeStl ?? this.beforeStl
      ..beforeThreePm = beforeThreePm ?? this.beforeThreePm
      ..blk = blk ?? this.blk
      ..createTime = createTime ?? this.createTime
      ..defenseCap = defenseCap ?? this.defenseCap
      ..dreb = dreb ?? this.dreb
      ..fga = fga ?? this.fga
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..ftm = ftm ?? this.ftm
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..playerId = playerId ?? this.playerId
      ..pts = pts ?? this.pts
      ..slamDunk = slamDunk ?? this.slamDunk
      ..stl = stl ?? this.stl
      ..threePa = threePa ?? this.threePa
      ..threePm = threePm ?? this.threePm
      ..threePts = threePts ?? this.threePts
      ..to = to ?? this.to
      ..twoPts = twoPts ?? this.twoPts
      ..updateTime = updateTime ?? this.updateTime;
  }
}