import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/girl_gift_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/girl_gift_define_entity.g.dart';

@JsonSerializable()
class GirlGiftDefineEntity {
	late List<String> addIntimacy = [];
	late List<String> addRate = [];
	late String cost = '';
	late String desc = '';
	late String id = '';

	GirlGiftDefineEntity();

	factory GirlGiftDefineEntity.fromJson(Map<String, dynamic> json) => $GirlGiftDefineEntityFromJson(json);

	Map<String, dynamic> toJson() => $GirlGiftDefineEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}