import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/last5_avg_entity.dart';

Last5AvgEntity $Last5AvgEntityFromJson(Map<String, dynamic> json) {
  final Last5AvgEntity last5AvgEntity = Last5AvgEntity();
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    last5AvgEntity.bLK = bLK;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    last5AvgEntity.fGA = fGA;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    last5AvgEntity.aST = aST;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    last5AvgEntity.fg3Pct = fg3Pct;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    last5AvgEntity.oREB = oREB;
  }
  final String? gameId = jsonConvert.convert<String>(json['Game_ID']);
  if (gameId != null) {
    last5AvgEntity.gameId = gameId;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    last5AvgEntity.sTL = sTL;
  }
  final String? mATCHUP = jsonConvert.convert<String>(json['MATCHUP']);
  if (mATCHUP != null) {
    last5AvgEntity.mATCHUP = mATCHUP;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    last5AvgEntity.fgPct = fgPct;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    last5AvgEntity.dREB = dREB;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    last5AvgEntity.fGM = fGM;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    last5AvgEntity.pTS = pTS;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    last5AvgEntity.rEB = rEB;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    last5AvgEntity.fG3A = fG3A;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    last5AvgEntity.ftPct = ftPct;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    last5AvgEntity.fTA = fTA;
  }
  final int? teamId = jsonConvert.convert<int>(json['Team_ID']);
  if (teamId != null) {
    last5AvgEntity.teamId = teamId;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    last5AvgEntity.mIN = mIN;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    last5AvgEntity.pF = pF;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    last5AvgEntity.tOV = tOV;
  }
  final String? gameDate = jsonConvert.convert<String>(json['GAME_DATE']);
  if (gameDate != null) {
    last5AvgEntity.gameDate = gameDate;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    last5AvgEntity.fG3M = fG3M;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    last5AvgEntity.fTM = fTM;
  }
  final int? gameDateMs = jsonConvert.convert<int>(json['gameDateMs']);
  if (gameDateMs != null) {
    last5AvgEntity.gameDateMs = gameDateMs;
  }
  return last5AvgEntity;
}

Map<String, dynamic> $Last5AvgEntityToJson(Last5AvgEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['BLK'] = entity.bLK;
  data['FGA'] = entity.fGA;
  data['AST'] = entity.aST;
  data['FG3_PCT'] = entity.fg3Pct;
  data['OREB'] = entity.oREB;
  data['Game_ID'] = entity.gameId;
  data['STL'] = entity.sTL;
  data['MATCHUP'] = entity.mATCHUP;
  data['FG_PCT'] = entity.fgPct;
  data['DREB'] = entity.dREB;
  data['FGM'] = entity.fGM;
  data['PTS'] = entity.pTS;
  data['REB'] = entity.rEB;
  data['FG3A'] = entity.fG3A;
  data['FT_PCT'] = entity.ftPct;
  data['FTA'] = entity.fTA;
  data['Team_ID'] = entity.teamId;
  data['MIN'] = entity.mIN;
  data['PF'] = entity.pF;
  data['TOV'] = entity.tOV;
  data['GAME_DATE'] = entity.gameDate;
  data['FG3M'] = entity.fG3M;
  data['FTM'] = entity.fTM;
  data['gameDateMs'] = entity.gameDateMs;
  return data;
}

extension Last5AvgEntityExtension on Last5AvgEntity {
  Last5AvgEntity copyWith({
    double? bLK,
    double? fGA,
    double? aST,
    double? fg3Pct,
    double? oREB,
    String? gameId,
    double? sTL,
    String? mATCHUP,
    double? fgPct,
    double? dREB,
    double? fGM,
    double? pTS,
    double? rEB,
    double? fG3A,
    double? ftPct,
    double? fTA,
    int? teamId,
    double? mIN,
    double? pF,
    double? tOV,
    String? gameDate,
    double? fG3M,
    double? fTM,
    int? gameDateMs,
  }) {
    return Last5AvgEntity()
      ..bLK = bLK ?? this.bLK
      ..fGA = fGA ?? this.fGA
      ..aST = aST ?? this.aST
      ..fg3Pct = fg3Pct ?? this.fg3Pct
      ..oREB = oREB ?? this.oREB
      ..gameId = gameId ?? this.gameId
      ..sTL = sTL ?? this.sTL
      ..mATCHUP = mATCHUP ?? this.mATCHUP
      ..fgPct = fgPct ?? this.fgPct
      ..dREB = dREB ?? this.dREB
      ..fGM = fGM ?? this.fGM
      ..pTS = pTS ?? this.pTS
      ..rEB = rEB ?? this.rEB
      ..fG3A = fG3A ?? this.fG3A
      ..ftPct = ftPct ?? this.ftPct
      ..fTA = fTA ?? this.fTA
      ..teamId = teamId ?? this.teamId
      ..mIN = mIN ?? this.mIN
      ..pF = pF ?? this.pF
      ..tOV = tOV ?? this.tOV
      ..gameDate = gameDate ?? this.gameDate
      ..fG3M = fG3M ?? this.fG3M
      ..fTM = fTM ?? this.fTM
      ..gameDateMs = gameDateMs ?? this.gameDateMs;
  }
}