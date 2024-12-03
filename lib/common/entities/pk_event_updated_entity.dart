import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pk_event_updated_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pk_event_updated_entity.g.dart';

@JsonSerializable()
class PkEventUpdatedEntity {
	late List<dynamic> alertList = [];
	late int allGameRound = 0;
	late int awayFuryValue = 0;
	late PkEventUpdatedAwayInfo awayInfo;
	late List<PkEventUpdatedAwayPlayerInfos> awayPlayerInfos = [];
	late int awayScore = 0;
	late int awayStrength = 0;
	late int currRound = 0;
	late int eventId = 0;
	late int homeFuryValue = 0;
	late PkEventUpdatedHomeInfo homeInfo;
	late List<PkEventUpdatedHomePlayerInfos> homePlayerInfos = [];
	late int homeScore = 0;
	late int homeStrength = 0;
	late String parameter = '';
	late int receivePlayerId = 0;
	late int receiveTeamId = 0;
	late int senderOtherPlayerId = 0;
	late int senderPlayerId = 0;
	late int senderTeamId = 0;
	late int state = 0;
	late int stepAwayScore = 0;
	late int stepHomeScore = 0;
	late int stepId = 0;
	late bool useSkillSuccess = false;

	PkEventUpdatedEntity();

	factory PkEventUpdatedEntity.fromJson(Map<String, dynamic> json) => $PkEventUpdatedEntityFromJson(json);

	Map<String, dynamic> toJson() => $PkEventUpdatedEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkEventUpdatedAwayInfo {
	late int ast = 0;
	late int astPoint = 0;
	late int blk = 0;
	late int blkPoint = 0;
	late int dreb = 0;
	late int fga = 0;
	late int fgm = 0;
	late int fta = 0;
	late int ftm = 0;
	late int gameId = 0;
	late int min = 0;
	late int mvpPoint = 0;
	late int oreb = 0;
	late int pass = 0;
	late int pf = 0;
	late int playerId = 0;
	late int property = 0;
	late int pts = 0;
	late int ptsPoint = 0;
	late int reb = 0;
	late int rebPoint = 0;
	late bool starter = false;
	late int starterPos = 0;
	late int stl = 0;
	late int teamId = 0;
	late int tech = 0;
	late int threePa = 0;
	late int threePm = 0;
	late int to = 0;

	PkEventUpdatedAwayInfo();

	factory PkEventUpdatedAwayInfo.fromJson(Map<String, dynamic> json) => $PkEventUpdatedAwayInfoFromJson(json);

	Map<String, dynamic> toJson() => $PkEventUpdatedAwayInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkEventUpdatedAwayPlayerInfos {
	late int ast = 0;
	late int blk = 0;
	late int dreb = 0;
	late int fga = 0;
	late int fgm = 0;
	late int fta = 0;
	late int ftm = 0;
	late int furyValue = 0;
	late int maxPower = 0;
	late int min = 0;
	late int oreb = 0;
	late int pass = 0;
	late int pf = 0;
	late int pkPlayerStrength = 0;
	late int playerId = 0;
	late int power = 0;
	late int pts = 0;
	late int reb = 0;
	late int skillEffectRound = 0;
	late int stl = 0;
	late int tech = 0;
	late int threePa = 0;
	late int threePm = 0;
	late int to = 0;

	PkEventUpdatedAwayPlayerInfos();

	factory PkEventUpdatedAwayPlayerInfos.fromJson(Map<String, dynamic> json) => $PkEventUpdatedAwayPlayerInfosFromJson(json);

	Map<String, dynamic> toJson() => $PkEventUpdatedAwayPlayerInfosToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkEventUpdatedHomeInfo {
	late int ast = 0;
	late int astPoint = 0;
	late int blk = 0;
	late int blkPoint = 0;
	late int dreb = 0;
	late int fga = 0;
	late int fgm = 0;
	late int fta = 0;
	late int ftm = 0;
	late int gameId = 0;
	late int min = 0;
	late int mvpPoint = 0;
	late int oreb = 0;
	late int pass = 0;
	late int pf = 0;
	late int playerId = 0;
	late int property = 0;
	late int pts = 0;
	late int ptsPoint = 0;
	late int reb = 0;
	late int rebPoint = 0;
	late bool starter = false;
	late int starterPos = 0;
	late int stl = 0;
	late int teamId = 0;
	late int tech = 0;
	late int threePa = 0;
	late int threePm = 0;
	late int to = 0;

	PkEventUpdatedHomeInfo();

	factory PkEventUpdatedHomeInfo.fromJson(Map<String, dynamic> json) => $PkEventUpdatedHomeInfoFromJson(json);

	Map<String, dynamic> toJson() => $PkEventUpdatedHomeInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkEventUpdatedHomePlayerInfos {
	late int ast = 0;
	late int blk = 0;
	late int dreb = 0;
	late int fga = 0;
	late int fgm = 0;
	late int fta = 0;
	late int ftm = 0;
	late int furyValue = 0;
	late int maxPower = 0;
	late int min = 0;
	late int oreb = 0;
	late int pass = 0;
	late int pf = 0;
	late int pkPlayerStrength = 0;
	late int playerId = 0;
	late int power = 0;
	late int pts = 0;
	late int reb = 0;
	late int skillEffectRound = 0;
	late int stl = 0;
	late int tech = 0;
	late int threePa = 0;
	late int threePm = 0;
	late int to = 0;

	PkEventUpdatedHomePlayerInfos();

	factory PkEventUpdatedHomePlayerInfos.fromJson(Map<String, dynamic> json) => $PkEventUpdatedHomePlayerInfosFromJson(json);

	Map<String, dynamic> toJson() => $PkEventUpdatedHomePlayerInfosToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}