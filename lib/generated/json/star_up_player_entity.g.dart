import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_player_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';


StarUpPlayerEntity $StarUpPlayerEntityFromJson(Map<String, dynamic> json) {
  final StarUpPlayerEntity starUpPlayerEntity = StarUpPlayerEntity();
  final List<
      TeamPlayerInfoEntity>? starUpPlayers = (json['starUpPlayers'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<TeamPlayerInfoEntity>(e) as TeamPlayerInfoEntity)
      .toList();
  if (starUpPlayers != null) {
    starUpPlayerEntity.starUpPlayers = starUpPlayers;
  }
  final bool? more = jsonConvert.convert<bool>(json['more']);
  if (more != null) {
    starUpPlayerEntity.more = more;
  }
  return starUpPlayerEntity;
}

Map<String, dynamic> $StarUpPlayerEntityToJson(StarUpPlayerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['starUpPlayers'] = entity.starUpPlayers.map((v) => v.toJson()).toList();
  data['more'] = entity.more;
  return data;
}

extension StarUpPlayerEntityExtension on StarUpPlayerEntity {
  StarUpPlayerEntity copyWith({
    List<TeamPlayerInfoEntity>? starUpPlayers,
    bool? more,
  }) {
    return StarUpPlayerEntity()
      ..starUpPlayers = starUpPlayers ?? this.starUpPlayers
      ..more = more ?? this.more;
  }
}