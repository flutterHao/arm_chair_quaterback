import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/dan_ma_ku_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/dan_ma_ku_entity.g.dart';

@JsonSerializable()
class DanMaKuEntity {
	late String hudDes;
	late int hudId ;
	late List<int> hudNum;
	late List<int> hudTrigger;

	DanMaKuEntity();

	factory DanMaKuEntity.fromJson(Map<String, dynamic> json) => $DanMaKuEntityFromJson(json);

	Map<String, dynamic> toJson() => $DanMaKuEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}