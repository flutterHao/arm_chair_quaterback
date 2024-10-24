import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_reference_value.g.dart';

///
///@auther gejiahui
///created at 2024/10/24/16:57


@JsonSerializable()
class GuessReferenceValue {
  double? ast;
  double? pts;
  double? reb;
  double? threePm;

  GuessReferenceValue();

  factory GuessReferenceValue.fromJson(
      Map<String, dynamic> json) =>
      $GuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() =>
      $GuessReferenceValueToJson(this);

  double getValue(String key) {
    if (key.toLowerCase() == "reb") {
      return _getREB();
    }
    var json = toJson();
    for (var k in json.keys) {
      if (k.toLowerCase() == key.toLowerCase()) {
        return json[k];
      }
    }
    return 0;
  }

  double _getREB() {
    return reb ?? 0;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}