import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/pk_start_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';


PkStartUpdatedEntity $PkStartUpdatedEntityFromJson(Map<String, dynamic> json) {
  final PkStartUpdatedEntity pkStartUpdatedEntity = PkStartUpdatedEntity();
  final int? pokerWinner = jsonConvert.convert<int>(json['pokerWinner']);
  if (pokerWinner != null) {
    pkStartUpdatedEntity.pokerWinner = pokerWinner;
  }
  final List<
      TeamBuffer>? homeTeamWinPokers = (json['homeTeamWinPokers'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<TeamBuffer>(e) as TeamBuffer).toList();
  if (homeTeamWinPokers != null) {
    pkStartUpdatedEntity.homeTeamWinPokers = homeTeamWinPokers;
  }
  final List<
      TeamBuffer>? awayTeamWinPokers = (json['awayTeamWinPokers'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<TeamBuffer>(e) as TeamBuffer).toList();
  if (awayTeamWinPokers != null) {
    pkStartUpdatedEntity.awayTeamWinPokers = awayTeamWinPokers;
  }
  final double? pokerRate = jsonConvert.convert<double>(json['pokerRate']);
  if (pokerRate != null) {
    pkStartUpdatedEntity.pokerRate = pokerRate;
  }
  return pkStartUpdatedEntity;
}

Map<String, dynamic> $PkStartUpdatedEntityToJson(PkStartUpdatedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pokerWinner'] = entity.pokerWinner;
  data['homeTeamWinPokers'] =
      entity.homeTeamWinPokers.map((v) => v.toJson()).toList();
  data['awayTeamWinPokers'] =
      entity.awayTeamWinPokers.map((v) => v.toJson()).toList();
  data['pokerRate'] = entity.pokerRate;
  return data;
}

extension PkStartUpdatedEntityExtension on PkStartUpdatedEntity {
  PkStartUpdatedEntity copyWith({
    int? pokerWinner,
    List<TeamBuffer>? homeTeamWinPokers,
    List<TeamBuffer>? awayTeamWinPokers,
    double? pokerRate,
  }) {
    return PkStartUpdatedEntity()
      ..pokerWinner = pokerWinner ?? this.pokerWinner
      ..homeTeamWinPokers = homeTeamWinPokers ?? this.homeTeamWinPokers
      ..awayTeamWinPokers = awayTeamWinPokers ?? this.awayTeamWinPokers
      ..pokerRate = pokerRate ?? this.pokerRate;
  }
}