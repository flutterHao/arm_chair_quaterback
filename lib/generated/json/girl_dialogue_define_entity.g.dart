import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';

GirlDialogueDefineEntity $GirlDialogueDefineEntityFromJson(
    Map<String, dynamic> json) {
  final GirlDialogueDefineEntity girlDialogueDefineEntity = GirlDialogueDefineEntity();
  final List<String>? choices = (json['choices'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (choices != null) {
    girlDialogueDefineEntity.choices = choices;
  }
  final String? choicesStr = jsonConvert.convert<String>(json['choices']);
  if (choicesStr != null) {
    girlDialogueDefineEntity.choicesStr = choicesStr;
  }
  final String? dialogue = jsonConvert.convert<String>(json['dialogue']);
  if (dialogue != null) {
    girlDialogueDefineEntity.dialogue = dialogue;
  }
  final int? girlId = jsonConvert.convert<int>(json['girlId']);
  if (girlId != null) {
    girlDialogueDefineEntity.girlId = girlId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    girlDialogueDefineEntity.id = id;
  }
  final List<int>? nextDialogue = (json['nextDialogue'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (nextDialogue != null) {
    girlDialogueDefineEntity.nextDialogue = nextDialogue;
  }
  final int? storyLineId = jsonConvert.convert<int>(json['storyLineId']);
  if (storyLineId != null) {
    girlDialogueDefineEntity.storyLineId = storyLineId;
  }
  final int? textType = jsonConvert.convert<int>(json['textType']);
  if (textType != null) {
    girlDialogueDefineEntity.textType = textType;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    girlDialogueDefineEntity.type = type;
  }
  return girlDialogueDefineEntity;
}

Map<String, dynamic> $GirlDialogueDefineEntityToJson(
    GirlDialogueDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['choices'] = entity.choices;
  data['choices'] = entity.choicesStr;
  data['dialogue'] = entity.dialogue;
  data['girlId'] = entity.girlId;
  data['id'] = entity.id;
  data['nextDialogue'] = entity.nextDialogue;
  data['storyLineId'] = entity.storyLineId;
  data['textType'] = entity.textType;
  data['type'] = entity.type;
  return data;
}

extension GirlDialogueDefineEntityExtension on GirlDialogueDefineEntity {
  GirlDialogueDefineEntity copyWith({
    List<String>? choices,
    String? choicesStr,
    String? dialogue,
    int? girlId,
    int? id,
    List<int>? nextDialogue,
    int? storyLineId,
    int? textType,
    int? type,
  }) {
    return GirlDialogueDefineEntity()
      ..choices = choices ?? this.choices
      ..choicesStr = choicesStr ?? this.choicesStr
      ..dialogue = dialogue ?? this.dialogue
      ..girlId = girlId ?? this.girlId
      ..id = id ?? this.id
      ..nextDialogue = nextDialogue ?? this.nextDialogue
      ..storyLineId = storyLineId ?? this.storyLineId
      ..textType = textType ?? this.textType
      ..type = type ?? this.type;
  }
}