import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/grade_in_stamina_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/grade_in_stamina_entity.g.dart';

@JsonSerializable()
class GradeInStaminaEntity {
	late String gradeDes = '';
	late int gradeId = 0;
	late double recoverStaminaValue;

	GradeInStaminaEntity();

	factory GradeInStaminaEntity.fromJson(Map<String, dynamic> json) => $GradeInStaminaEntityFromJson(json);

	Map<String, dynamic> toJson() => $GradeInStaminaEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}