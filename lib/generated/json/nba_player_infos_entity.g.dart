import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'dart:math';


NbaPlayerInfosEntity $NbaPlayerInfosEntityFromJson(Map<String, dynamic> json) {
  final NbaPlayerInfosEntity nbaPlayerInfosEntity = NbaPlayerInfosEntity();
  final List<
      NbaPlayerInfosPlayerDataAvgList>? playerDataAvgList = (json['playerDataAvgList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerInfosPlayerDataAvgList>(
          e) as NbaPlayerInfosPlayerDataAvgList).toList();
  if (playerDataAvgList != null) {
    nbaPlayerInfosEntity.playerDataAvgList = playerDataAvgList;
  }
  final List<
      NbaPlayerInfosPlayerDataCapList>? playerDataCapList = (json['playerDataCapList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerInfosPlayerDataCapList>(
          e) as NbaPlayerInfosPlayerDataCapList).toList();
  if (playerDataCapList != null) {
    nbaPlayerInfosEntity.playerDataCapList = playerDataCapList;
  }
  final List<
      NbaPlayerInfosPlayerBaseInfoList>? playerBaseInfoList = (json['playerBaseInfoList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerInfosPlayerBaseInfoList>(
          e) as NbaPlayerInfosPlayerBaseInfoList).toList();
  if (playerBaseInfoList != null) {
    nbaPlayerInfosEntity.playerBaseInfoList = playerBaseInfoList;
  }
  return nbaPlayerInfosEntity;
}

Map<String, dynamic> $NbaPlayerInfosEntityToJson(NbaPlayerInfosEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerDataAvgList'] =
      entity.playerDataAvgList.map((v) => v.toJson()).toList();
  data['playerDataCapList'] =
      entity.playerDataCapList.map((v) => v.toJson()).toList();
  data['playerBaseInfoList'] =
      entity.playerBaseInfoList.map((v) => v.toJson()).toList();
  data['dataAvgMap'] = entity.dataAvgMap;
  data['dataCapMap'] = entity.dataCapMap;
  data['baseInfoMap'] = entity.baseInfoMap;
  return data;
}

extension NbaPlayerInfosEntityExtension on NbaPlayerInfosEntity {
  NbaPlayerInfosEntity copyWith({
    List<NbaPlayerInfosPlayerDataAvgList>? playerDataAvgList,
    List<NbaPlayerInfosPlayerDataCapList>? playerDataCapList,
    List<NbaPlayerInfosPlayerBaseInfoList>? playerBaseInfoList,
    Map<int, NbaPlayerInfosPlayerDataAvgList>? dataAvgMap,
    Map<int, NbaPlayerInfosPlayerDataCapList>? dataCapMap,
    Map<int, NbaPlayerInfosPlayerBaseInfoList>? baseInfoMap,
  }) {
    return NbaPlayerInfosEntity()
      ..playerDataAvgList = playerDataAvgList ?? this.playerDataAvgList
      ..playerDataCapList = playerDataCapList ?? this.playerDataCapList
      ..playerBaseInfoList = playerBaseInfoList ?? this.playerBaseInfoList
      ..dataAvgMap = dataAvgMap ?? this.dataAvgMap
      ..dataCapMap = dataCapMap ?? this.dataCapMap
      ..baseInfoMap = baseInfoMap ?? this.baseInfoMap;
  }
}

NbaPlayerInfosPlayerDataAvgList $NbaPlayerInfosPlayerDataAvgListFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosPlayerDataAvgList nbaPlayerInfosPlayerDataAvgList = NbaPlayerInfosPlayerDataAvgList();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    nbaPlayerInfosPlayerDataAvgList.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    nbaPlayerInfosPlayerDataAvgList.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerInfosPlayerDataAvgList.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    nbaPlayerInfosPlayerDataAvgList.dreb = dreb;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    nbaPlayerInfosPlayerDataAvgList.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    nbaPlayerInfosPlayerDataAvgList.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerInfosPlayerDataAvgList.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    nbaPlayerInfosPlayerDataAvgList.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    nbaPlayerInfosPlayerDataAvgList.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    nbaPlayerInfosPlayerDataAvgList.threePa = threePa;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    nbaPlayerInfosPlayerDataAvgList.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    nbaPlayerInfosPlayerDataAvgList.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    nbaPlayerInfosPlayerDataAvgList.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    nbaPlayerInfosPlayerDataAvgList.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerInfosPlayerDataAvgList.createTime = createTime;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    nbaPlayerInfosPlayerDataAvgList.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    nbaPlayerInfosPlayerDataAvgList.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerInfosPlayerDataAvgList.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    nbaPlayerInfosPlayerDataAvgList.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    nbaPlayerInfosPlayerDataAvgList.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerInfosPlayerDataAvgList.playerId = playerId;
  }
  return nbaPlayerInfosPlayerDataAvgList;
}

Map<String, dynamic> $NbaPlayerInfosPlayerDataAvgListToJson(
    NbaPlayerInfosPlayerDataAvgList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['playCount'] = entity.playCount;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['pf'] = entity.pf;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerInfosPlayerDataAvgListExtension on NbaPlayerInfosPlayerDataAvgList {
  NbaPlayerInfosPlayerDataAvgList copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    int? starterCount,
    double? stl,
    int? updateTime,
    double? fgm,
    double? pts,
    double? threePa,
    int? playCount,
    double? fta,
    double? min,
    double? oreb,
    int? createTime,
    int? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    int? playerId,
  }) {
    return NbaPlayerInfosPlayerDataAvgList()
      ..blk = blk ?? this.blk
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..playCount = playCount ?? this.playCount
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..pf = pf ?? this.pf
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

NbaPlayerInfosPlayerDataCapList $NbaPlayerInfosPlayerDataCapListFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosPlayerDataCapList nbaPlayerInfosPlayerDataCapList = NbaPlayerInfosPlayerDataCapList();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaPlayerInfosPlayerDataCapList.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaPlayerInfosPlayerDataCapList.ast = ast;
  }
  final int? beforeThreePm = jsonConvert.convert<int>(json['beforeThreePm']);
  if (beforeThreePm != null) {
    nbaPlayerInfosPlayerDataCapList.beforeThreePm = beforeThreePm;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaPlayerInfosPlayerDataCapList.dreb = dreb;
  }
  final int? beforeBlk = jsonConvert.convert<int>(json['beforeBlk']);
  if (beforeBlk != null) {
    nbaPlayerInfosPlayerDataCapList.beforeBlk = beforeBlk;
  }
  final int? defenseCap = jsonConvert.convert<int>(json['defenseCap']);
  if (defenseCap != null) {
    nbaPlayerInfosPlayerDataCapList.defenseCap = defenseCap;
  }
  final int? beforeStl = jsonConvert.convert<int>(json['beforeStl']);
  if (beforeStl != null) {
    nbaPlayerInfosPlayerDataCapList.beforeStl = beforeStl;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaPlayerInfosPlayerDataCapList.fgm = fgm;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaPlayerInfosPlayerDataCapList.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaPlayerInfosPlayerDataCapList.min = min;
  }
  final int? beforePts = jsonConvert.convert<int>(json['beforePts']);
  if (beforePts != null) {
    nbaPlayerInfosPlayerDataCapList.beforePts = beforePts;
  }
  final int? slamDunk = jsonConvert.convert<int>(json['slamDunk']);
  if (slamDunk != null) {
    nbaPlayerInfosPlayerDataCapList.slamDunk = slamDunk;
  }
  final int? attackCap = jsonConvert.convert<int>(json['attackCap']);
  if (attackCap != null) {
    nbaPlayerInfosPlayerDataCapList.attackCap = attackCap;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaPlayerInfosPlayerDataCapList.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerInfosPlayerDataCapList.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaPlayerInfosPlayerDataCapList.blk = blk;
  }
  final int? threePts = jsonConvert.convert<int>(json['threePts']);
  if (threePts != null) {
    nbaPlayerInfosPlayerDataCapList.threePts = threePts;
  }
  final int? beforeAst = jsonConvert.convert<int>(json['beforeAst']);
  if (beforeAst != null) {
    nbaPlayerInfosPlayerDataCapList.beforeAst = beforeAst;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaPlayerInfosPlayerDataCapList.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerInfosPlayerDataCapList.updateTime = updateTime;
  }
  final int? beforeDreb = jsonConvert.convert<int>(json['beforeDreb']);
  if (beforeDreb != null) {
    nbaPlayerInfosPlayerDataCapList.beforeDreb = beforeDreb;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerInfosPlayerDataCapList.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaPlayerInfosPlayerDataCapList.threePa = threePa;
  }
  final int? twoPts = jsonConvert.convert<int>(json['twoPts']);
  if (twoPts != null) {
    nbaPlayerInfosPlayerDataCapList.twoPts = twoPts;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaPlayerInfosPlayerDataCapList.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerInfosPlayerDataCapList.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaPlayerInfosPlayerDataCapList.pf = pf;
  }
  final int? beforeOreb = jsonConvert.convert<int>(json['beforeOreb']);
  if (beforeOreb != null) {
    nbaPlayerInfosPlayerDataCapList.beforeOreb = beforeOreb;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaPlayerInfosPlayerDataCapList.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaPlayerInfosPlayerDataCapList.to = to;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerInfosPlayerDataCapList.reb = reb;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    nbaPlayerInfosPlayerDataCapList.threePt = threePt;
  }
  return nbaPlayerInfosPlayerDataCapList;
}

Map<String, dynamic> $NbaPlayerInfosPlayerDataCapListToJson(
    NbaPlayerInfosPlayerDataCapList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['beforeThreePm'] = entity.beforeThreePm;
  data['dreb'] = entity.dreb;
  data['beforeBlk'] = entity.beforeBlk;
  data['defenseCap'] = entity.defenseCap;
  data['beforeStl'] = entity.beforeStl;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['beforePts'] = entity.beforePts;
  data['slamDunk'] = entity.slamDunk;
  data['attackCap'] = entity.attackCap;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['threePts'] = entity.threePts;
  data['beforeAst'] = entity.beforeAst;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['beforeDreb'] = entity.beforeDreb;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['twoPts'] = entity.twoPts;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['beforeOreb'] = entity.beforeOreb;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['reb'] = entity.reb;
  data['threePt'] = entity.threePt;
  return data;
}

extension NbaPlayerInfosPlayerDataCapListExtension on NbaPlayerInfosPlayerDataCapList {
  NbaPlayerInfosPlayerDataCapList copyWith({
    int? fga,
    int? ast,
    int? beforeThreePm,
    int? dreb,
    int? beforeBlk,
    int? defenseCap,
    int? beforeStl,
    int? fgm,
    int? fta,
    int? min,
    int? beforePts,
    int? slamDunk,
    int? attackCap,
    int? ftm,
    int? playerId,
    int? blk,
    int? threePts,
    int? beforeAst,
    int? stl,
    int? updateTime,
    int? beforeDreb,
    int? pts,
    int? threePa,
    int? twoPts,
    int? oreb,
    int? createTime,
    int? pf,
    int? beforeOreb,
    int? threePm,
    int? to,
    int? reb,
    int? threePt,
  }) {
    return NbaPlayerInfosPlayerDataCapList()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..beforeThreePm = beforeThreePm ?? this.beforeThreePm
      ..dreb = dreb ?? this.dreb
      ..beforeBlk = beforeBlk ?? this.beforeBlk
      ..defenseCap = defenseCap ?? this.defenseCap
      ..beforeStl = beforeStl ?? this.beforeStl
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..beforePts = beforePts ?? this.beforePts
      ..slamDunk = slamDunk ?? this.slamDunk
      ..attackCap = attackCap ?? this.attackCap
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..threePts = threePts ?? this.threePts
      ..beforeAst = beforeAst ?? this.beforeAst
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..beforeDreb = beforeDreb ?? this.beforeDreb
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..twoPts = twoPts ?? this.twoPts
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..beforeOreb = beforeOreb ?? this.beforeOreb
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..reb = reb ?? this.reb
      ..threePt = threePt ?? this.threePt;
  }
}

NbaPlayerInfosPlayerBaseInfoList $NbaPlayerInfosPlayerBaseInfoListFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerInfosPlayerBaseInfoList nbaPlayerInfosPlayerBaseInfoList = NbaPlayerInfosPlayerBaseInfoList();
  final int? marketPrice = jsonConvert.convert<int>(json['marketPrice']);
  if (marketPrice != null) {
    nbaPlayerInfosPlayerBaseInfoList.marketPrice = marketPrice;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaPlayerInfosPlayerBaseInfoList.espnId = espnId;
  }
  final bool? injuries = jsonConvert.convert<bool>(json['injuries']);
  if (injuries != null) {
    nbaPlayerInfosPlayerBaseInfoList.injuries = injuries;
  }
  final int? maxPlayerScore = jsonConvert.convert<int>(json['maxPlayerScore']);
  if (maxPlayerScore != null) {
    nbaPlayerInfosPlayerBaseInfoList.maxPlayerScore = maxPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerInfosPlayerBaseInfoList.updateTime = updateTime;
  }
  final int? beforePlayerStrength = jsonConvert.convert<int>(
      json['beforePlayerStrength']);
  if (beforePlayerStrength != null) {
    nbaPlayerInfosPlayerBaseInfoList.beforePlayerStrength =
        beforePlayerStrength;
  }
  final int? birthTime = jsonConvert.convert<int>(json['birthTime']);
  if (birthTime != null) {
    nbaPlayerInfosPlayerBaseInfoList.birthTime = birthTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    nbaPlayerInfosPlayerBaseInfoList.playerStrength = playerStrength;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    nbaPlayerInfosPlayerBaseInfoList.salary = salary;
  }
  final int? minPlayerScore = jsonConvert.convert<int>(json['minPlayerScore']);
  if (minPlayerScore != null) {
    nbaPlayerInfosPlayerBaseInfoList.minPlayerScore = minPlayerScore;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerInfosPlayerBaseInfoList.ename = ename;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerInfosPlayerBaseInfoList.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    nbaPlayerInfosPlayerBaseInfoList.playerScore = playerScore;
  }
  final int? pos = jsonConvert.convert<int>(json['pos']);
  if (pos != null) {
    nbaPlayerInfosPlayerBaseInfoList.pos = pos;
  }
  final String? sname = jsonConvert.convert<String>(json['sname']);
  if (sname != null) {
    nbaPlayerInfosPlayerBaseInfoList.sname = sname;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    nbaPlayerInfosPlayerBaseInfoList.grade = grade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerInfosPlayerBaseInfoList.teamId = teamId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    nbaPlayerInfosPlayerBaseInfoList.name = name;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    nbaPlayerInfosPlayerBaseInfoList.property = property;
  }
  final String? position = jsonConvert.convert<String>(json['position']);
  if (position != null) {
    nbaPlayerInfosPlayerBaseInfoList.position = position;
  }
  final List<int>? tag = (json['tag'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (tag != null) {
    nbaPlayerInfosPlayerBaseInfoList.tag = tag;
  }
  final int? beforeMarketPrice = jsonConvert.convert<int>(
      json['beforeMarketPrice']);
  if (beforeMarketPrice != null) {
    nbaPlayerInfosPlayerBaseInfoList.beforeMarketPrice = beforeMarketPrice;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerInfosPlayerBaseInfoList.playerId = playerId;
  }
  final int? basicMarketPrice = jsonConvert.convert<int>(
      json['basicMarketPrice']);
  if (basicMarketPrice != null) {
    nbaPlayerInfosPlayerBaseInfoList.basicMarketPrice = basicMarketPrice;
  }
  final int? beforeMarketPriceUpdateTime = jsonConvert.convert<int>(
      json['beforeMarketPriceUpdateTime']);
  if (beforeMarketPriceUpdateTime != null) {
    nbaPlayerInfosPlayerBaseInfoList.beforeMarketPriceUpdateTime =
        beforeMarketPriceUpdateTime;
  }
  final String? elname = jsonConvert.convert<String>(json['elname']);
  if (elname != null) {
    nbaPlayerInfosPlayerBaseInfoList.elname = elname;
  }
  return nbaPlayerInfosPlayerBaseInfoList;
}

Map<String, dynamic> $NbaPlayerInfosPlayerBaseInfoListToJson(
    NbaPlayerInfosPlayerBaseInfoList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['marketPrice'] = entity.marketPrice;
  data['espnId'] = entity.espnId;
  data['injuries'] = entity.injuries;
  data['maxPlayerScore'] = entity.maxPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['beforePlayerStrength'] = entity.beforePlayerStrength;
  data['birthTime'] = entity.birthTime;
  data['playerStrength'] = entity.playerStrength;
  data['salary'] = entity.salary;
  data['minPlayerScore'] = entity.minPlayerScore;
  data['ename'] = entity.ename;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['pos'] = entity.pos;
  data['sname'] = entity.sname;
  data['grade'] = entity.grade;
  data['teamId'] = entity.teamId;
  data['name'] = entity.name;
  data['property'] = entity.property;
  data['position'] = entity.position;
  data['tag'] = entity.tag;
  data['beforeMarketPrice'] = entity.beforeMarketPrice;
  data['playerId'] = entity.playerId;
  data['basicMarketPrice'] = entity.basicMarketPrice;
  data['beforeMarketPriceUpdateTime'] = entity.beforeMarketPriceUpdateTime;
  data['elname'] = entity.elname;
  return data;
}

extension NbaPlayerInfosPlayerBaseInfoListExtension on NbaPlayerInfosPlayerBaseInfoList {
  NbaPlayerInfosPlayerBaseInfoList copyWith({
    int? marketPrice,
    int? espnId,
    bool? injuries,
    int? maxPlayerScore,
    int? updateTime,
    int? beforePlayerStrength,
    int? birthTime,
    int? playerStrength,
    int? salary,
    int? minPlayerScore,
    String? ename,
    int? createTime,
    int? playerScore,
    int? pos,
    String? sname,
    String? grade,
    int? teamId,
    String? name,
    int? property,
    String? position,
    List<int>? tag,
    int? beforeMarketPrice,
    int? playerId,
    int? basicMarketPrice,
    int? beforeMarketPriceUpdateTime,
    String? elname,
  }) {
    return NbaPlayerInfosPlayerBaseInfoList()
      ..marketPrice = marketPrice ?? this.marketPrice
      ..espnId = espnId ?? this.espnId
      ..injuries = injuries ?? this.injuries
      ..maxPlayerScore = maxPlayerScore ?? this.maxPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..beforePlayerStrength = beforePlayerStrength ?? this.beforePlayerStrength
      ..birthTime = birthTime ?? this.birthTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..salary = salary ?? this.salary
      ..minPlayerScore = minPlayerScore ?? this.minPlayerScore
      ..ename = ename ?? this.ename
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..pos = pos ?? this.pos
      ..sname = sname ?? this.sname
      ..grade = grade ?? this.grade
      ..teamId = teamId ?? this.teamId
      ..name = name ?? this.name
      ..property = property ?? this.property
      ..position = position ?? this.position
      ..tag = tag ?? this.tag
      ..beforeMarketPrice = beforeMarketPrice ?? this.beforeMarketPrice
      ..playerId = playerId ?? this.playerId
      ..basicMarketPrice = basicMarketPrice ?? this.basicMarketPrice
      ..beforeMarketPriceUpdateTime = beforeMarketPriceUpdateTime ??
          this.beforeMarketPriceUpdateTime
      ..elname = elname ?? this.elname;
  }
}