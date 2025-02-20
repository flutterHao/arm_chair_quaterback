import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/new_test_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';


NewTestEntity $NewTestEntityFromJson(Map<String, dynamic> json) {
  final NewTestEntity newTestEntity = NewTestEntity();
  final List<NewTestAst>? ast = (json['ast'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewTestAst>(e) as NewTestAst).toList();
  if (ast != null) {
    newTestEntity.ast = ast;
  }
  final List<NewTest3pt>? tpt = (json['tpt'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewTest3pt>(e) as NewTest3pt).toList();
  if (tpt != null) {
    newTestEntity.tpt = tpt;
  }
  final List<NewTestPts>? pts = (json['pts'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewTestPts>(e) as NewTestPts).toList();
  if (pts != null) {
    newTestEntity.pts = pts;
  }
  return newTestEntity;
}

Map<String, dynamic> $NewTestEntityToJson(NewTestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast.map((v) => v.toJson()).toList();
  data['tpt'] = entity.tpt.map((v) => v.toJson()).toList();
  data['pts'] = entity.pts.map((v) => v.toJson()).toList();
  return data;
}

extension NewTestEntityExtension on NewTestEntity {
  NewTestEntity copyWith({
    List<NewTestAst>? ast,
    List<NewTest3pt>? tpt,
    List<NewTestPts>? pts,
  }) {
    return NewTestEntity()
      ..ast = ast ?? this.ast
      ..tpt = tpt ?? this.tpt
      ..pts = pts ?? this.pts;
  }
}

NewTestAst $NewTestAstFromJson(Map<String, dynamic> json) {
  final NewTestAst newTestAst = NewTestAst();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    newTestAst.gameId = gameId;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    newTestAst.newsId = newsId;
  }
  final int? gst = jsonConvert.convert<int>(json['gameStartTime']);
  if (gst != null) {
    newTestAst.gst = gst;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    newTestAst.teamId = teamId;
  }
  final List<dynamic>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (guessData != null) {
    newTestAst.guessData = guessData;
  }
  final NewTestAstGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<NewTestAstGuessReferenceValue>(json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    newTestAst.guessReferenceValue = guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    newTestAst.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    newTestAst.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    newTestAst.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    newTestAst.playerId = playerId;
  }
  return newTestAst;
}

Map<String, dynamic> $NewTestAstToJson(NewTestAst entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gst;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData;
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension NewTestAstExtension on NewTestAst {
  NewTestAst copyWith({
    int? gameId,
    int? newsId,
    int? gst,
    int? teamId,
    List<dynamic>? guessData,
    NewTestAstGuessReferenceValue? guessReferenceValue,
    int? id,
    int? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return NewTestAst()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gst = gst ?? this.gst
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}

NewTestAstGuessReferenceValue $NewTestAstGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final NewTestAstGuessReferenceValue newTestAstGuessReferenceValue = NewTestAstGuessReferenceValue();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    newTestAstGuessReferenceValue.ast = ast;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    newTestAstGuessReferenceValue.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    newTestAstGuessReferenceValue.reb = reb;
  }
  return newTestAstGuessReferenceValue;
}

Map<String, dynamic> $NewTestAstGuessReferenceValueToJson(
    NewTestAstGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension NewTestAstGuessReferenceValueExtension on NewTestAstGuessReferenceValue {
  NewTestAstGuessReferenceValue copyWith({
    int? ast,
    int? pts,
    double? reb,
  }) {
    return NewTestAstGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

NewTest3pt $NewTest3ptFromJson(Map<String, dynamic> json) {
  final NewTest3pt newTest3pt = NewTest3pt();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    newTest3pt.gameId = gameId;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    newTest3pt.newsId = newsId;
  }
  final int? gst = jsonConvert.convert<int>(json['gameStartTime']);
  if (gst != null) {
    newTest3pt.gst = gst;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    newTest3pt.teamId = teamId;
  }
  final List<dynamic>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (guessData != null) {
    newTest3pt.guessData = guessData;
  }
  final NewTest3ptGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<NewTest3ptGuessReferenceValue>(json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    newTest3pt.guessReferenceValue = guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    newTest3pt.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    newTest3pt.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    newTest3pt.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    newTest3pt.playerId = playerId;
  }
  return newTest3pt;
}

Map<String, dynamic> $NewTest3ptToJson(NewTest3pt entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gst;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData;
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension NewTest3ptExtension on NewTest3pt {
  NewTest3pt copyWith({
    int? gameId,
    int? newsId,
    int? gst,
    int? teamId,
    List<dynamic>? guessData,
    NewTest3ptGuessReferenceValue? guessReferenceValue,
    int? id,
    int? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return NewTest3pt()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gst = gst ?? this.gst
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}

NewTest3ptGuessReferenceValue $NewTest3ptGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final NewTest3ptGuessReferenceValue newTest3ptGuessReferenceValue = NewTest3ptGuessReferenceValue();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    newTest3ptGuessReferenceValue.ast = ast;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    newTest3ptGuessReferenceValue.threePm = threePm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    newTest3ptGuessReferenceValue.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    newTest3ptGuessReferenceValue.reb = reb;
  }
  return newTest3ptGuessReferenceValue;
}

Map<String, dynamic> $NewTest3ptGuessReferenceValueToJson(
    NewTest3ptGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['threePm'] = entity.threePm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension NewTest3ptGuessReferenceValueExtension on NewTest3ptGuessReferenceValue {
  NewTest3ptGuessReferenceValue copyWith({
    int? ast,
    double? threePm,
    double? pts,
    int? reb,
  }) {
    return NewTest3ptGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..threePm = threePm ?? this.threePm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

NewTestPts $NewTestPtsFromJson(Map<String, dynamic> json) {
  final NewTestPts newTestPts = NewTestPts();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    newTestPts.gameId = gameId;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    newTestPts.newsId = newsId;
  }
  final int? gst = jsonConvert.convert<int>(json['gameStartTime']);
  if (gst != null) {
    newTestPts.gst = gst;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    newTestPts.teamId = teamId;
  }
  final List<dynamic>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (guessData != null) {
    newTestPts.guessData = guessData;
  }
  final NewTestPtsGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<NewTestPtsGuessReferenceValue>(json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    newTestPts.guessReferenceValue = guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    newTestPts.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    newTestPts.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    newTestPts.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    newTestPts.playerId = playerId;
  }
  return newTestPts;
}

Map<String, dynamic> $NewTestPtsToJson(NewTestPts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gst;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData;
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension NewTestPtsExtension on NewTestPts {
  NewTestPts copyWith({
    int? gameId,
    int? newsId,
    int? gst,
    int? teamId,
    List<dynamic>? guessData,
    NewTestPtsGuessReferenceValue? guessReferenceValue,
    int? id,
    int? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return NewTestPts()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gst = gst ?? this.gst
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}

NewTestPtsGuessReferenceValue $NewTestPtsGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final NewTestPtsGuessReferenceValue newTestPtsGuessReferenceValue = NewTestPtsGuessReferenceValue();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    newTestPtsGuessReferenceValue.ast = ast;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    newTestPtsGuessReferenceValue.threePm = threePm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    newTestPtsGuessReferenceValue.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    newTestPtsGuessReferenceValue.reb = reb;
  }
  return newTestPtsGuessReferenceValue;
}

Map<String, dynamic> $NewTestPtsGuessReferenceValueToJson(
    NewTestPtsGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['threePm'] = entity.threePm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension NewTestPtsGuessReferenceValueExtension on NewTestPtsGuessReferenceValue {
  NewTestPtsGuessReferenceValue copyWith({
    int? ast,
    double? threePm,
    int? pts,
    int? reb,
  }) {
    return NewTestPtsGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..threePm = threePm ?? this.threePm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}