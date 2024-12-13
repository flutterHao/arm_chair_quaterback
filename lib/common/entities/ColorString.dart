import 'package:arm_chair_quaterback/generated/json/ColorString.g.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';

///
///@auther gejiahui
///created at 2024/12/13/17:28
@JsonSerializable()
class ColorString {
  late String text;
  late bool isMatch;

  ColorString();

  factory ColorString.fromJson(Map<String, dynamic> json) =>
      $ColorStringFromJson(json);

  Map<String, dynamic> toJson() => $ColorStringToJson(this);
}
