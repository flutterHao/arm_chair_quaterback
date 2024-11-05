import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/new_test_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/new_test_entity.g.dart';

@JsonSerializable()
class NewTestEntity {
  late List<NewTestAst> ast;
  late List<NewTest3pt> tpt;
  late List<NewTestPts> pts;

  NewTestEntity();

  factory NewTestEntity.fromJson(Map<String, dynamic> json) =>
      $NewTestEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewTestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewTestAst {
  late int gameId;
  late int newsId;
  late int gameStartTime;
  late int teamId;
  late List<dynamic> guessData;
  late NewTestAstGuessReferenceValue guessReferenceValue;
  late int id;
  late int type;
  late int awayTeamId;
  late int playerId;

  NewTestAst();

  factory NewTestAst.fromJson(Map<String, dynamic> json) =>
      $NewTestAstFromJson(json);

  Map<String, dynamic> toJson() => $NewTestAstToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewTestAstGuessReferenceValue {
  late int ast;
  late int pts;
  late double reb;

  NewTestAstGuessReferenceValue();

  factory NewTestAstGuessReferenceValue.fromJson(Map<String, dynamic> json) =>
      $NewTestAstGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() => $NewTestAstGuessReferenceValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewTest3pt {
  late int gameId;
  late int newsId;
  late int gameStartTime;
  late int teamId;
  late List<dynamic> guessData;
  late NewTest3ptGuessReferenceValue guessReferenceValue;
  late int id;
  late int type;
  late int awayTeamId;
  late int playerId;

  NewTest3pt();

  factory NewTest3pt.fromJson(Map<String, dynamic> json) =>
      $NewTest3ptFromJson(json);

  Map<String, dynamic> toJson() => $NewTest3ptToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewTest3ptGuessReferenceValue {
  late int ast;
  late double threePm;
  late double pts;
  late int reb;

  NewTest3ptGuessReferenceValue();

  factory NewTest3ptGuessReferenceValue.fromJson(Map<String, dynamic> json) =>
      $NewTest3ptGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() => $NewTest3ptGuessReferenceValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewTestPts {
  late int gameId;
  late int newsId;
  late int gameStartTime;
  late int teamId;
  late List<dynamic> guessData;
  late NewTestPtsGuessReferenceValue guessReferenceValue;
  late int id;
  late int type;
  late int awayTeamId;
  late int playerId;

  NewTestPts();

  factory NewTestPts.fromJson(Map<String, dynamic> json) =>
      $NewTestPtsFromJson(json);

  Map<String, dynamic> toJson() => $NewTestPtsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewTestPtsGuessReferenceValue {
  late int ast;
  late double threePm;
  late int pts;
  late int reb;

  NewTestPtsGuessReferenceValue();

  factory NewTestPtsGuessReferenceValue.fromJson(Map<String, dynamic> json) =>
      $NewTestPtsGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() => $NewTestPtsGuessReferenceValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
