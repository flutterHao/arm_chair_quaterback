import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_book_rule_entity.dart';

PlayerBookRuleEntity $PlayerBookRuleEntityFromJson(Map<String, dynamic> json) {
  final PlayerBookRuleEntity playerBookRuleEntity = PlayerBookRuleEntity();
  final int? bookId = jsonConvert.convert<int>(json['bookId']);
  if (bookId != null) {
    playerBookRuleEntity.bookId = bookId;
  }
  final int? exp = jsonConvert.convert<int>(json['exp']);
  if (exp != null) {
    playerBookRuleEntity.exp = exp;
  }
  final int? isActive = jsonConvert.convert<int>(json['isActive']);
  if (isActive != null) {
    playerBookRuleEntity.isActive = isActive;
  }
  final int? needNum = jsonConvert.convert<int>(json['needNum']);
  if (needNum != null) {
    playerBookRuleEntity.needNum = needNum;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    playerBookRuleEntity.playerId = playerId;
  }
  final String? playerNumber = jsonConvert.convert<String>(
      json['playerNumber']);
  if (playerNumber != null) {
    playerBookRuleEntity.playerNumber = playerNumber;
  }
  return playerBookRuleEntity;
}

Map<String, dynamic> $PlayerBookRuleEntityToJson(PlayerBookRuleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bookId'] = entity.bookId;
  data['exp'] = entity.exp;
  data['isActive'] = entity.isActive;
  data['needNum'] = entity.needNum;
  data['playerId'] = entity.playerId;
  data['playerNumber'] = entity.playerNumber;
  return data;
}

extension PlayerBookRuleEntityExtension on PlayerBookRuleEntity {
  PlayerBookRuleEntity copyWith({
    int? bookId,
    int? exp,
    int? isActive,
    int? needNum,
    int? playerId,
    String? playerNumber,
  }) {
    return PlayerBookRuleEntity()
      ..bookId = bookId ?? this.bookId
      ..exp = exp ?? this.exp
      ..isActive = isActive ?? this.isActive
      ..needNum = needNum ?? this.needNum
      ..playerId = playerId ?? this.playerId
      ..playerNumber = playerNumber ?? this.playerNumber;
  }
}