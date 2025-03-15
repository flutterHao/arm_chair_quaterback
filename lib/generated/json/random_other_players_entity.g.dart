import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/random_other_players_entity.dart';

RandomOtherPlayersEntity $RandomOtherPlayersEntityFromJson(
    Map<String, dynamic> json) {
  final RandomOtherPlayersEntity randomOtherPlayersEntity = RandomOtherPlayersEntity();
  final int? marketPrice = jsonConvert.convert<int>(json['marketPrice']);
  if (marketPrice != null) {
    randomOtherPlayersEntity.marketPrice = marketPrice;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    randomOtherPlayersEntity.espnId = espnId;
  }
  final bool? injuries = jsonConvert.convert<bool>(json['injuries']);
  if (injuries != null) {
    randomOtherPlayersEntity.injuries = injuries;
  }
  final int? beforeMarketPriceUpdateTime = jsonConvert.convert<int>(
      json['beforeMarketPriceUpdateTime']);
  if (beforeMarketPriceUpdateTime != null) {
    randomOtherPlayersEntity.beforeMarketPriceUpdateTime =
        beforeMarketPriceUpdateTime;
  }
  final int? birthTime = jsonConvert.convert<int>(json['birthTime']);
  if (birthTime != null) {
    randomOtherPlayersEntity.birthTime = birthTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    randomOtherPlayersEntity.playerStrength = playerStrength;
  }
  final String? elname = jsonConvert.convert<String>(json['elname']);
  if (elname != null) {
    randomOtherPlayersEntity.elname = elname;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    randomOtherPlayersEntity.salary = salary;
  }
  final int? minPlayerScore = jsonConvert.convert<int>(json['minPlayerScore']);
  if (minPlayerScore != null) {
    randomOtherPlayersEntity.minPlayerScore = minPlayerScore;
  }
  final int? number = jsonConvert.convert<int>(json['number']);
  if (number != null) {
    randomOtherPlayersEntity.number = number;
  }
  final int? nbaId = jsonConvert.convert<int>(json['nbaId']);
  if (nbaId != null) {
    randomOtherPlayersEntity.nbaId = nbaId;
  }
  final int? pos = jsonConvert.convert<int>(json['pos']);
  if (pos != null) {
    randomOtherPlayersEntity.pos = pos;
  }
  final double? layupWeight = jsonConvert.convert<double>(json['layupWeight']);
  if (layupWeight != null) {
    randomOtherPlayersEntity.layupWeight = layupWeight;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    randomOtherPlayersEntity.property = property;
  }
  final double? threePointWeight = jsonConvert.convert<double>(
      json['threePointWeight']);
  if (threePointWeight != null) {
    randomOtherPlayersEntity.threePointWeight = threePointWeight;
  }
  final List<int>? tag = (json['tag'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (tag != null) {
    randomOtherPlayersEntity.tag = tag;
  }
  final int? beforeMarketPrice = jsonConvert.convert<int>(
      json['beforeMarketPrice']);
  if (beforeMarketPrice != null) {
    randomOtherPlayersEntity.beforeMarketPrice = beforeMarketPrice;
  }
  final double? perimeterShotWeight = jsonConvert.convert<double>(
      json['perimeterShotWeight']);
  if (perimeterShotWeight != null) {
    randomOtherPlayersEntity.perimeterShotWeight = perimeterShotWeight;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    randomOtherPlayersEntity.playerId = playerId;
  }
  final int? maxPlayerScore = jsonConvert.convert<int>(json['maxPlayerScore']);
  if (maxPlayerScore != null) {
    randomOtherPlayersEntity.maxPlayerScore = maxPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    randomOtherPlayersEntity.updateTime = updateTime;
  }
  final int? beforePlayerStrength = jsonConvert.convert<int>(
      json['beforePlayerStrength']);
  if (beforePlayerStrength != null) {
    randomOtherPlayersEntity.beforePlayerStrength = beforePlayerStrength;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    randomOtherPlayersEntity.ename = ename;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    randomOtherPlayersEntity.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    randomOtherPlayersEntity.playerScore = playerScore;
  }
  final String? sname = jsonConvert.convert<String>(json['sname']);
  if (sname != null) {
    randomOtherPlayersEntity.sname = sname;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    randomOtherPlayersEntity.grade = grade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    randomOtherPlayersEntity.teamId = teamId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    randomOtherPlayersEntity.name = name;
  }
  final int? basicMarketPrice = jsonConvert.convert<int>(
      json['basicMarketPrice']);
  if (basicMarketPrice != null) {
    randomOtherPlayersEntity.basicMarketPrice = basicMarketPrice;
  }
  final String? position = jsonConvert.convert<String>(json['position']);
  if (position != null) {
    randomOtherPlayersEntity.position = position;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    randomOtherPlayersEntity.age = age;
  }
  return randomOtherPlayersEntity;
}

Map<String, dynamic> $RandomOtherPlayersEntityToJson(
    RandomOtherPlayersEntity entity) {
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
  data['number'] = entity.number;
  data['nbaId'] = entity.nbaId;
  data['pos'] = entity.pos;
  data['layupWeight'] = entity.layupWeight;
  data['property'] = entity.property;
  data['threePointWeight'] = entity.threePointWeight;
  data['tag'] = entity.tag;
  data['beforeMarketPrice'] = entity.beforeMarketPrice;
  data['perimeterShotWeight'] = entity.perimeterShotWeight;
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
  data['age'] = entity.age;
  return data;
}

extension RandomOtherPlayersEntityExtension on RandomOtherPlayersEntity {
  RandomOtherPlayersEntity copyWith({
    int? marketPrice,
    int? espnId,
    bool? injuries,
    int? beforeMarketPriceUpdateTime,
    int? birthTime,
    int? playerStrength,
    String? elname,
    int? salary,
    int? minPlayerScore,
    int? number,
    int? nbaId,
    int? pos,
    double? layupWeight,
    int? property,
    double? threePointWeight,
    List<int>? tag,
    int? beforeMarketPrice,
    double? perimeterShotWeight,
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
    int? age,
  }) {
    return RandomOtherPlayersEntity()
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
      ..number = number ?? this.number
      ..nbaId = nbaId ?? this.nbaId
      ..pos = pos ?? this.pos
      ..layupWeight = layupWeight ?? this.layupWeight
      ..property = property ?? this.property
      ..threePointWeight = threePointWeight ?? this.threePointWeight
      ..tag = tag ?? this.tag
      ..beforeMarketPrice = beforeMarketPrice ?? this.beforeMarketPrice
      ..perimeterShotWeight = perimeterShotWeight ?? this.perimeterShotWeight
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
      ..position = position ?? this.position
      ..age = age ?? this.age;
  }
}