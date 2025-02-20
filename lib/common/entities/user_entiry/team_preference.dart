import 'dart:convert';

class TeamPreference {
  bool? changePlayer;
  bool? changeTactics;
  bool? closeFriendlyMatch;
  bool? closeFriendlyMessage;
  bool? closeGuessEndRemind;
  bool? closeGuessStartRemind;
  bool? closeSecondaryPass;
  int? gameSpeedIndex;
  int? musicEffectVolume;
  int? musicVolume;
  int? speakOpenTime;
  bool? startFirstQuarter;
  bool? useSkill;
  String? version;
  List<int>? likePlayers;
  List<int>? likeTeams;

  TeamPreference({
    this.changePlayer,
    this.changeTactics,
    this.closeFriendlyMatch,
    this.closeFriendlyMessage,
    this.closeGuessEndRemind,
    this.closeGuessStartRemind,
    this.closeSecondaryPass,
    this.gameSpeedIndex,
    this.musicEffectVolume,
    this.musicVolume,
    this.speakOpenTime,
    this.startFirstQuarter,
    this.useSkill,
    this.version,
    this.likePlayers,
    this.likeTeams,
  });

  factory TeamPreference.fromMap(Map<String, dynamic> data) {
    return TeamPreference(
      changePlayer: data['changePlayer'] as bool?,
      changeTactics: data['changeTactics'] as bool?,
      closeFriendlyMatch: data['closeFriendlyMatch'] as bool?,
      closeFriendlyMessage: data['closeFriendlyMessage'] as bool?,
      closeGuessEndRemind: data['closeGuessEndRemind'] as bool?,
      closeGuessStartRemind: data['closeGuessStartRemind'] as bool?,
      closeSecondaryPass: data['closeSecondaryPass'] as bool?,
      gameSpeedIndex: data['gameSpeedIndex'] as int?,
      musicEffectVolume: data['musicEffectVolume'] as int?,
      musicVolume: data['musicVolume'] as int?,
      speakOpenTime: data['speakOpenTime'] as int?,
      startFirstQuarter: data['startFirstQuarter'] as bool?,
      useSkill: data['useSkill'] as bool?,
      version: data['version'] as String?,
      likePlayers: (data['likePlayers'] as List?)?.map((e) => e as int).toList(),
      likeTeams: (data['likeTeams'] as List?)?.map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'changePlayer': changePlayer,
        'changeTactics': changeTactics,
        'closeFriendlyMatch': closeFriendlyMatch,
        'closeFriendlyMessage': closeFriendlyMessage,
        'closeGuessEndRemind': closeGuessEndRemind,
        'closeGuessStartRemind': closeGuessStartRemind,
        'closeSecondaryPass': closeSecondaryPass,
        'gameSpeedIndex': gameSpeedIndex,
        'musicEffectVolume': musicEffectVolume,
        'musicVolume': musicVolume,
        'speakOpenTime': speakOpenTime,
        'startFirstQuarter': startFirstQuarter,
        'useSkill': useSkill,
        'version': version,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TeamPreference].
  factory TeamPreference.fromJson(String data) {
    return TeamPreference.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TeamPreference] to a JSON string.
  String toJson() => json.encode(toMap());
}
