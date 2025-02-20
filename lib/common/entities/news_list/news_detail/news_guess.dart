import 'package:arm_chair_quaterback/common/utils/utils.dart';

class NewsGuess {
  int? awayTeamId;
  int? gameId;
  int? gst;
  List<dynamic>? guessData;
  int? id;
  int? playerId;
  int? scId;
  int? teamId;
  int? type;

  NewsGuess({
    this.awayTeamId,
    this.gameId,
    this.gst,
    this.guessData,
    this.id,
    this.playerId,
    this.scId,
    this.teamId,
    this.type,
  });

  int get gameStartTime => (gst ?? 0) + Utils.getTimeZoneOffset().inMilliseconds;

  factory NewsGuess.fromJson(Map<String, dynamic> json) => NewsGuess(
        awayTeamId: json['awayTeamId'] as int?,
        gameId: json['gameId'] as int?,
        gst: json['gameStartTime'] as int?,
        guessData: json['guessData'] as List<dynamic>?,
        id: json['id'] as int?,
        playerId: json['playerId'] as int?,
        scId: json['scId'] as int?,
        teamId: json['teamId'] as int?,
        type: json['type'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'awayTeamId': awayTeamId,
        'gameId': gameId,
        'gameStartTime': gameStartTime,
        'guessData': guessData,
        'id': id,
        'playerId': playerId,
        'scId': scId,
        'teamId': teamId,
        'type': type,
      };
}
