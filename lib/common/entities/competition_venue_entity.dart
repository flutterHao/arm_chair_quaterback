import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/competition_venue_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/competition_venue_entity.g.dart';

@JsonSerializable()
class CompetitionVenueEntity {
	@JSONField(name: "Actor")
	late String actor;
	@JSONField(name: "Assist")
	late String assist;
	@JSONField(name: "AwayC")
	late List<String> awayC;
	@JSONField(name: "AwayPF")
	late List<String> awayPF;
	@JSONField(name: "AwayPG")
	late List<String> awayPG;
	@JSONField(name: "AwaySF")
	late List<String> awaySF;
	@JSONField(name: "AwaySG")
	late List<String> awaySG;
	@JSONField(name: "GameEventType")
	late List<String> gameEventType;
	@JSONField(name: "HomeC")
	late List<String> homeC;
	@JSONField(name: "HomePF")
	late List<String> homePF;
	@JSONField(name: "HomePG")
	late List<String> homePG;
	@JSONField(name: "HomeSF")
	late List<String> homeSF;
	@JSONField(name: "HomeSG")
	late List<String> homeSG;
	@JSONField(name: "PosID")
	late String posID;
	@JSONField(name: "Time")
	late String time;
	late String desc;

	CompetitionVenueEntity();

	factory CompetitionVenueEntity.fromJson(Map<String, dynamic> json) => $CompetitionVenueEntityFromJson(json);

	Map<String, dynamic> toJson() => $CompetitionVenueEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}