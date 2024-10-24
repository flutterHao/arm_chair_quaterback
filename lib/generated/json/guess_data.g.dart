import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_data.dart';

GuessData $GuessDataFromJson(Map<String, dynamic> json) {
  final GuessData guessData = GuessData();
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessData.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    guessData.guessChoice = guessChoice;
  }
  final int? guessTime = jsonConvert.convert<int>(json['guessTime']);
  if (guessTime != null) {
    guessData.guessTime = guessTime;
  }
  final List<Awards>? awards = (json['awards'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Awards>(e) as Awards).toList();
  if (awards != null) {
    guessData.awards = awards;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    guessData.success = success;
  }
  final int? guessReferenceValue = jsonConvert.convert<int>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessData.guessReferenceValue = guessReferenceValue;
  }
  final int? guessGameAttrValue = jsonConvert.convert<int>(
      json['guessGameAttrValue']);
  if (guessGameAttrValue != null) {
    guessData.guessGameAttrValue = guessGameAttrValue;
  }
  final int? winPro = jsonConvert.convert<int>(json['winPro']);
  if (winPro != null) {
    guessData.winPro = winPro;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    guessData.status = status;
  }
  return guessData;
}

Map<String, dynamic> $GuessDataToJson(GuessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessTime'] = entity.guessTime;
  data['awards'] = entity.awards.map((v) => v.toJson()).toList();
  data['success'] = entity.success;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['guessGameAttrValue'] = entity.guessGameAttrValue;
  data['winPro'] = entity.winPro;
  data['status'] = entity.status;
  return data;
}

extension GuessDataExtension on GuessData {
  GuessData copyWith({
    String? guessAttr,
    int? guessChoice,
    int? guessTime,
    List<Awards>? awards,
    bool? success,
    int? guessReferenceValue,
    int? guessGameAttrValue,
    int? winPro,
    int? status,
  }) {
    return GuessData()
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessTime = guessTime ?? this.guessTime
      ..awards = awards ?? this.awards
      ..success = success ?? this.success
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..guessGameAttrValue = guessGameAttrValue ?? this.guessGameAttrValue
      ..winPro = winPro ?? this.winPro
      ..status = status ?? this.status;
  }
}

Awards $AwardsFromJson(Map<String, dynamic> json) {
  final Awards awards = Awards();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    awards.id = id;
  }
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    awards.num = num;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    awards.type = type;
  }
  return awards;
}

Map<String, dynamic> $AwardsToJson(Awards entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['num'] = entity.num;
  data['type'] = entity.type;
  return data;
}

extension AwardsExtension on Awards {
  Awards copyWith({
    int? id,
    int? num,
    int? type,
  }) {
    return Awards()
      ..id = id ?? this.id
      ..num = num ?? this.num
      ..type = type ?? this.type;
  }
}