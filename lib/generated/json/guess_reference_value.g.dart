import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_reference_value.dart';

GuessReferenceValue $GuessReferenceValueFromJson(Map<String, dynamic> json) {
  final GuessReferenceValue guessReferenceValue = GuessReferenceValue();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    guessReferenceValue.ast = ast;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    guessReferenceValue.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    guessReferenceValue.reb = reb;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    guessReferenceValue.threePm = threePm;
  }
  return guessReferenceValue;
}

Map<String, dynamic> $GuessReferenceValueToJson(GuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['threePm'] = entity.threePm;
  return data;
}

extension GuessReferenceValueExtension on GuessReferenceValue {
  GuessReferenceValue copyWith({
    double? ast,
    double? pts,
    double? reb,
    double? threePm,
  }) {
    return GuessReferenceValue()
      ..ast = ast ?? this.ast
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..threePm = threePm ?? this.threePm;
  }
}