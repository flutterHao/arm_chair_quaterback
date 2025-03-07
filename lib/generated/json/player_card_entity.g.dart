import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


PlayerCardEntity $PlayerCardEntityFromJson(Map<String, dynamic> json) {
  final PlayerCardEntity playerCardEntity = PlayerCardEntity();
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    playerCardEntity.playerId = playerId;
  }
  return playerCardEntity;
}

Map<String, dynamic> $PlayerCardEntityToJson(PlayerCardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerId'] = entity.playerId;
  return data;
}

extension PlayerCardEntityExtension on PlayerCardEntity {
  PlayerCardEntity copyWith({
    RxBool? isSelect,
    RxBool? isOpen,
    int? playerId,
    Rx<Offset>? offset,
    Rx<double>? rotation,
  }) {
    return PlayerCardEntity()
      ..isSelect = isSelect ?? this.isSelect
      ..isOpen = isOpen ?? this.isOpen
      ..playerId = playerId ?? this.playerId
      ..offset = offset ?? this.offset
      ..rotation = rotation ?? this.rotation;
  }
}