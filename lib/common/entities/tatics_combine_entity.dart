import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/tatics_combine_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/tatics_combine_entity.g.dart';

@JsonSerializable()
class TaticsCombineEntity {
	late int suit = 1;
	late List<double> suitAdd = [];
	late String taticsuit = '';

	TaticsCombineEntity();

	factory TaticsCombineEntity.fromJson(Map<String, dynamic> json) => $TaticsCombineEntityFromJson(json);

	Map<String, dynamic> toJson() => $TaticsCombineEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}