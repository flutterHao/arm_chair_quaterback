import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';

TradeInfoEntity $TradeInfoEntityFromJson(Map<String, dynamic> json) {
  final TradeInfoEntity tradeInfoEntity = TradeInfoEntity();
  final List<
      TradeInfoPlayerTrends>? playerTrends = (json['PlayerTrends'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<TradeInfoPlayerTrends>(e) as TradeInfoPlayerTrends)
      .toList();
  if (playerTrends != null) {
    tradeInfoEntity.playerTrends = playerTrends;
  }
  final TradeInfoTotalSalary? totalSalary = jsonConvert.convert<
      TradeInfoTotalSalary>(json['totalSalary']);
  if (totalSalary != null) {
    tradeInfoEntity.totalSalary = totalSalary;
  }
  final List<
      TradeInfoTradePlayers>? tradePlayers = (json['tradePlayers'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<TradeInfoTradePlayers>(e) as TradeInfoTradePlayers)
      .toList();
  if (tradePlayers != null) {
    tradeInfoEntity.tradePlayers = tradePlayers;
  }
  final TradeInfoTradeLogs? tradeLogs = jsonConvert.convert<TradeInfoTradeLogs>(
      json['tradeLogs']);
  if (tradeLogs != null) {
    tradeInfoEntity.tradeLogs = tradeLogs;
  }
  return tradeInfoEntity;
}

Map<String, dynamic> $TradeInfoEntityToJson(TradeInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['PlayerTrends'] = entity.playerTrends.map((v) => v.toJson()).toList();
  data['totalSalary'] = entity.totalSalary.toJson();
  data['tradePlayers'] = entity.tradePlayers.map((v) => v.toJson()).toList();
  data['tradeLogs'] = entity.tradeLogs.toJson();
  return data;
}

extension TradeInfoEntityExtension on TradeInfoEntity {
  TradeInfoEntity copyWith({
    List<TradeInfoPlayerTrends>? playerTrends,
    TradeInfoTotalSalary? totalSalary,
    List<TradeInfoTradePlayers>? tradePlayers,
    TradeInfoTradeLogs? tradeLogs,
  }) {
    return TradeInfoEntity()
      ..playerTrends = playerTrends ?? this.playerTrends
      ..totalSalary = totalSalary ?? this.totalSalary
      ..tradePlayers = tradePlayers ?? this.tradePlayers
      ..tradeLogs = tradeLogs ?? this.tradeLogs;
  }
}

TradeInfoPlayerTrends $TradeInfoPlayerTrendsFromJson(
    Map<String, dynamic> json) {
  final TradeInfoPlayerTrends tradeInfoPlayerTrends = TradeInfoPlayerTrends();
  final int? playerMarketPrice = jsonConvert.convert<int>(
      json['playerMarketPrice']);
  if (playerMarketPrice != null) {
    tradeInfoPlayerTrends.playerMarketPrice = playerMarketPrice;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    tradeInfoPlayerTrends.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    tradeInfoPlayerTrends.playerScore = playerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    tradeInfoPlayerTrends.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    tradeInfoPlayerTrends.playerStrength = playerStrength;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    tradeInfoPlayerTrends.playerId = playerId;
  }
  return tradeInfoPlayerTrends;
}

Map<String, dynamic> $TradeInfoPlayerTrendsToJson(
    TradeInfoPlayerTrends entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerMarketPrice'] = entity.playerMarketPrice;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['playerId'] = entity.playerId;
  return data;
}

extension TradeInfoPlayerTrendsExtension on TradeInfoPlayerTrends {
  TradeInfoPlayerTrends copyWith({
    int? playerMarketPrice,
    int? createTime,
    int? playerScore,
    int? updateTime,
    int? playerStrength,
    int? playerId,
  }) {
    return TradeInfoPlayerTrends()
      ..playerMarketPrice = playerMarketPrice ?? this.playerMarketPrice
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..playerId = playerId ?? this.playerId;
  }
}

TradeInfoTotalSalary $TradeInfoTotalSalaryFromJson(Map<String, dynamic> json) {
  final TradeInfoTotalSalary tradeInfoTotalSalary = TradeInfoTotalSalary();
  final double? other = jsonConvert.convert<double>(json['else']);
  if (other != null) {
    tradeInfoTotalSalary.other = other;
  }
  final double? main = jsonConvert.convert<double>(json['main']);
  if (main != null) {
    tradeInfoTotalSalary.main = main;
  }
  final double? substitute = jsonConvert.convert<double>(json['substitute']);
  if (substitute != null) {
    tradeInfoTotalSalary.substitute = substitute;
  }
  return tradeInfoTotalSalary;
}

Map<String, dynamic> $TradeInfoTotalSalaryToJson(TradeInfoTotalSalary entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['else'] = entity.other;
  data['main'] = entity.main;
  data['substitute'] = entity.substitute;
  return data;
}

extension TradeInfoTotalSalaryExtension on TradeInfoTotalSalary {
  TradeInfoTotalSalary copyWith({
    double? other,
    double? main,
    double? substitute,
  }) {
    return TradeInfoTotalSalary()
      ..other = other ?? this.other
      ..main = main ?? this.main
      ..substitute = substitute ?? this.substitute;
  }
}

TradeInfoTradePlayers $TradeInfoTradePlayersFromJson(
    Map<String, dynamic> json) {
  final TradeInfoTradePlayers tradeInfoTradePlayers = TradeInfoTradePlayers();
  final int? marketPrice = jsonConvert.convert<int>(json['marketPrice']);
  if (marketPrice != null) {
    tradeInfoTradePlayers.marketPrice = marketPrice;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    tradeInfoTradePlayers.espnId = espnId;
  }
  final bool? injuries = jsonConvert.convert<bool>(json['injuries']);
  if (injuries != null) {
    tradeInfoTradePlayers.injuries = injuries;
  }
  final int? beforeMarketPriceUpdateTime = jsonConvert.convert<int>(
      json['beforeMarketPriceUpdateTime']);
  if (beforeMarketPriceUpdateTime != null) {
    tradeInfoTradePlayers.beforeMarketPriceUpdateTime =
        beforeMarketPriceUpdateTime;
  }
  final int? birthTime = jsonConvert.convert<int>(json['birthTime']);
  if (birthTime != null) {
    tradeInfoTradePlayers.birthTime = birthTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    tradeInfoTradePlayers.playerStrength = playerStrength;
  }
  final String? elname = jsonConvert.convert<String>(json['elname']);
  if (elname != null) {
    tradeInfoTradePlayers.elname = elname;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    tradeInfoTradePlayers.salary = salary;
  }
  final int? minPlayerScore = jsonConvert.convert<int>(json['minPlayerScore']);
  if (minPlayerScore != null) {
    tradeInfoTradePlayers.minPlayerScore = minPlayerScore;
  }
  final int? nbaId = jsonConvert.convert<int>(json['nbaId']);
  if (nbaId != null) {
    tradeInfoTradePlayers.nbaId = nbaId;
  }
  final int? pos = jsonConvert.convert<int>(json['pos']);
  if (pos != null) {
    tradeInfoTradePlayers.pos = pos;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    tradeInfoTradePlayers.property = property;
  }
  final List<int>? tag = (json['tag'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (tag != null) {
    tradeInfoTradePlayers.tag = tag;
  }
  final int? beforeMarketPrice = jsonConvert.convert<int>(
      json['beforeMarketPrice']);
  if (beforeMarketPrice != null) {
    tradeInfoTradePlayers.beforeMarketPrice = beforeMarketPrice;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    tradeInfoTradePlayers.playerId = playerId;
  }
  final int? maxPlayerScore = jsonConvert.convert<int>(json['maxPlayerScore']);
  if (maxPlayerScore != null) {
    tradeInfoTradePlayers.maxPlayerScore = maxPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    tradeInfoTradePlayers.updateTime = updateTime;
  }
  final int? beforePlayerStrength = jsonConvert.convert<int>(
      json['beforePlayerStrength']);
  if (beforePlayerStrength != null) {
    tradeInfoTradePlayers.beforePlayerStrength = beforePlayerStrength;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    tradeInfoTradePlayers.ename = ename;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    tradeInfoTradePlayers.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    tradeInfoTradePlayers.playerScore = playerScore;
  }
  final String? sname = jsonConvert.convert<String>(json['sname']);
  if (sname != null) {
    tradeInfoTradePlayers.sname = sname;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    tradeInfoTradePlayers.grade = grade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    tradeInfoTradePlayers.teamId = teamId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    tradeInfoTradePlayers.name = name;
  }
  final int? basicMarketPrice = jsonConvert.convert<int>(
      json['basicMarketPrice']);
  if (basicMarketPrice != null) {
    tradeInfoTradePlayers.basicMarketPrice = basicMarketPrice;
  }
  final String? position = jsonConvert.convert<String>(json['position']);
  if (position != null) {
    tradeInfoTradePlayers.position = position;
  }
  return tradeInfoTradePlayers;
}

Map<String, dynamic> $TradeInfoTradePlayersToJson(
    TradeInfoTradePlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['marketPrice'] = entity.marketPrice;
  data['espnId'] = entity.espnId;
  data['injuries'] = entity.injuries;
  data['beforeMarketPriceUpdateTime'] = entity.beforeMarketPriceUpdateTime;
  data['birthTime'] = entity.birthTime;
  data['playerStrength'] = entity.playerStrength;
  data['elname'] = entity.elname;
  data['salary'] = entity.salary;
  data['minPlayerScore'] = entity.minPlayerScore;
  data['nbaId'] = entity.nbaId;
  data['pos'] = entity.pos;
  data['property'] = entity.property;
  data['tag'] = entity.tag;
  data['beforeMarketPrice'] = entity.beforeMarketPrice;
  data['playerId'] = entity.playerId;
  data['maxPlayerScore'] = entity.maxPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['beforePlayerStrength'] = entity.beforePlayerStrength;
  data['ename'] = entity.ename;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['sname'] = entity.sname;
  data['grade'] = entity.grade;
  data['teamId'] = entity.teamId;
  data['name'] = entity.name;
  data['basicMarketPrice'] = entity.basicMarketPrice;
  data['position'] = entity.position;
  return data;
}

extension TradeInfoTradePlayersExtension on TradeInfoTradePlayers {
  TradeInfoTradePlayers copyWith({
    int? marketPrice,
    int? espnId,
    bool? injuries,
    int? beforeMarketPriceUpdateTime,
    int? birthTime,
    int? playerStrength,
    String? elname,
    int? salary,
    int? minPlayerScore,
    int? nbaId,
    int? pos,
    int? property,
    List<int>? tag,
    int? beforeMarketPrice,
    int? playerId,
    int? maxPlayerScore,
    int? updateTime,
    int? beforePlayerStrength,
    String? ename,
    int? createTime,
    int? playerScore,
    String? sname,
    String? grade,
    int? teamId,
    String? name,
    int? basicMarketPrice,
    String? position,
  }) {
    return TradeInfoTradePlayers()
      ..marketPrice = marketPrice ?? this.marketPrice
      ..espnId = espnId ?? this.espnId
      ..injuries = injuries ?? this.injuries
      ..beforeMarketPriceUpdateTime = beforeMarketPriceUpdateTime ??
          this.beforeMarketPriceUpdateTime
      ..birthTime = birthTime ?? this.birthTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..elname = elname ?? this.elname
      ..salary = salary ?? this.salary
      ..minPlayerScore = minPlayerScore ?? this.minPlayerScore
      ..nbaId = nbaId ?? this.nbaId
      ..pos = pos ?? this.pos
      ..property = property ?? this.property
      ..tag = tag ?? this.tag
      ..beforeMarketPrice = beforeMarketPrice ?? this.beforeMarketPrice
      ..playerId = playerId ?? this.playerId
      ..maxPlayerScore = maxPlayerScore ?? this.maxPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..beforePlayerStrength = beforePlayerStrength ?? this.beforePlayerStrength
      ..ename = ename ?? this.ename
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..sname = sname ?? this.sname
      ..grade = grade ?? this.grade
      ..teamId = teamId ?? this.teamId
      ..name = name ?? this.name
      ..basicMarketPrice = basicMarketPrice ?? this.basicMarketPrice
      ..position = position ?? this.position;
  }
}

TradeInfoTradeLogs $TradeInfoTradeLogsFromJson(Map<String, dynamic> json) {
  final TradeInfoTradeLogs tradeInfoTradeLogs = TradeInfoTradeLogs();
  return tradeInfoTradeLogs;
}

Map<String, dynamic> $TradeInfoTradeLogsToJson(TradeInfoTradeLogs entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension TradeInfoTradeLogsExtension on TradeInfoTradeLogs {
}