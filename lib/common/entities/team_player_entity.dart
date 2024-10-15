import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_player_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_player_entity.g.dart';

@JsonSerializable()
class TeamPlayerEntity {
	late double buyPrice;
	late double buyPlayerScore;
	late double updateTime;
	late String uuid;
	late double gradeExp;
	late double fromType;
	late double createTime;
	late double playerGrade;
	late double teamId;
	late double id;
	late double position;
	late double power;
	late TeamPlayerPotential potential;
	late bool bindStatus;
	late double breakThroughGrade;
	late double playerId;

	TeamPlayerEntity();

	factory TeamPlayerEntity.fromJson(Map<String, dynamic> json) => $TeamPlayerEntityFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerEntityToJson(this);

	//替补
	bool isSubstitute(){
		return position == 0;
	}

	String getPosition(){
		switch(position){
			case 1:
				return "C";
			case 2:
				return "PF";
			case 3:
				return "SF";
			case 4:
				return "SG";
			case 5:
				return "PG";
		}
		return "";
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TeamPlayerPotential {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	TeamPlayerPotential();

	factory TeamPlayerPotential.fromJson(Map<String, dynamic> json) => $TeamPlayerPotentialFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}