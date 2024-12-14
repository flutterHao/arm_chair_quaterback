import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/ColorString.dart';

ColorString $ColorStringFromJson(Map<String, dynamic> json) {
  final ColorString colorString = ColorString();
  final String? text = jsonConvert.convert<String>(json['text']);
  if (text != null) {
    colorString.text = text;
  }
  final bool? isMatch = jsonConvert.convert<bool>(json['isMatch']);
  if (isMatch != null) {
    colorString.isMatch = isMatch;
  }
  return colorString;
}

Map<String, dynamic> $ColorStringToJson(ColorString entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['text'] = entity.text;
  data['isMatch'] = entity.isMatch;
  return data;
}

extension ColorStringExtension on ColorString {
  ColorString copyWith({
    String? text,
    bool? isMatch,
  }) {
    return ColorString()
      ..text = text ?? this.text
      ..isMatch = isMatch ?? this.isMatch;
  }
}