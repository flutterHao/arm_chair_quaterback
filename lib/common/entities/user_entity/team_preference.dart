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
  });

  factory TeamPreference.fromJson(Map<String, dynamic> json) {
    return TeamPreference(
      changePlayer: json['changePlayer'] as bool?,
      changeTactics: json['changeTactics'] as bool?,
      closeFriendlyMatch: json['closeFriendlyMatch'] as bool?,
      closeFriendlyMessage: json['closeFriendlyMessage'] as bool?,
      closeGuessEndRemind: json['closeGuessEndRemind'] as bool?,
      closeGuessStartRemind: json['closeGuessStartRemind'] as bool?,
      closeSecondaryPass: json['closeSecondaryPass'] as bool?,
      gameSpeedIndex: json['gameSpeedIndex'] as int?,
      musicEffectVolume: json['musicEffectVolume'] as int?,
      musicVolume: json['musicVolume'] as int?,
      speakOpenTime: json['speakOpenTime'] as int?,
      startFirstQuarter: json['startFirstQuarter'] as bool?,
      useSkill: json['useSkill'] as bool?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
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
}
