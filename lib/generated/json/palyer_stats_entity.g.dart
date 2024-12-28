import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';

StatsEntity $StatsEntityFromJson(Map<String, dynamic> json) {
  final StatsEntity statsEntity = StatsEntity();
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    statsEntity.bLK = bLK;
  }
  final double? totalFg3Pct = jsonConvert.convert<double>(
      json['TOTAL_FG3_PCT']);
  if (totalFg3Pct != null) {
    statsEntity.totalFg3Pct = totalFg3Pct;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    statsEntity.fg3Pct = fg3Pct;
  }
  final double? totalAst = jsonConvert.convert<double>(json['TOTAL_AST']);
  if (totalAst != null) {
    statsEntity.totalAst = totalAst;
  }
  final double? totalFga = jsonConvert.convert<double>(json['TOTAL_FGA']);
  if (totalFga != null) {
    statsEntity.totalFga = totalFga;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    statsEntity.fgPct = fgPct;
  }
  final double? total3pa = jsonConvert.convert<double>(json['TOTAL_3PA']);
  if (total3pa != null) {
    statsEntity.total3pa = total3pa;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    statsEntity.pTS = pTS;
  }
  final double? totalFgm = jsonConvert.convert<double>(json['TOTAL_FGM']);
  if (totalFgm != null) {
    statsEntity.totalFgm = totalFgm;
  }
  final double? totalFtPct = jsonConvert.convert<double>(json['TOTAL_FT_PCT']);
  if (totalFtPct != null) {
    statsEntity.totalFtPct = totalFtPct;
  }
  final double? totalFgPct = jsonConvert.convert<double>(json['TOTAL_FG_PCT']);
  if (totalFgPct != null) {
    statsEntity.totalFgPct = totalFgPct;
  }
  final double? total3pm = jsonConvert.convert<double>(json['TOTAL_3PM']);
  if (total3pm != null) {
    statsEntity.total3pm = total3pm;
  }
  final double? totalReb = jsonConvert.convert<double>(json['TOTAL_REB']);
  if (totalReb != null) {
    statsEntity.totalReb = totalReb;
  }
  final double? totalFta = jsonConvert.convert<double>(json['TOTAL_FTA']);
  if (totalFta != null) {
    statsEntity.totalFta = totalFta;
  }
  final String? playerName = jsonConvert.convert<String>(json['PLAYER_NAME']);
  if (playerName != null) {
    statsEntity.playerName = playerName;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    statsEntity.fGA = fGA;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    statsEntity.aST = aST;
  }
  final double? totalTov = jsonConvert.convert<double>(json['TOTAL_TOV']);
  if (totalTov != null) {
    statsEntity.totalTov = totalTov;
  }
  final double? threePA = jsonConvert.convert<double>(json['threePA']);
  if (threePA != null) {
    statsEntity.threePA = threePA;
  }
  final double? totalBlk = jsonConvert.convert<double>(json['TOTAL_BLK']);
  if (totalBlk != null) {
    statsEntity.totalBlk = totalBlk;
  }
  final double? totalFtm = jsonConvert.convert<double>(json['TOTAL_FTM']);
  if (totalFtm != null) {
    statsEntity.totalFtm = totalFtm;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    statsEntity.fGM = fGM;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    statsEntity.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    statsEntity.ftPct = ftPct;
  }
  final double? threePM = jsonConvert.convert<double>(json['3PM']);
  if (threePM != null) {
    statsEntity.threePM = threePM;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    statsEntity.fTA = fTA;
  }
  final double? totalPts = jsonConvert.convert<double>(json['TOTAL_PTS']);
  if (totalPts != null) {
    statsEntity.totalPts = totalPts;
  }
  final int? playerId = jsonConvert.convert<int>(json['PLAYER_ID']);
  if (playerId != null) {
    statsEntity.playerId = playerId;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    statsEntity.tOV = tOV;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    statsEntity.fTM = fTM;
  }
  final String? teamName = jsonConvert.convert<String>(json['TEAM_NAME']);
  if (teamName != null) {
    statsEntity.teamName = teamName;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    statsEntity.teamId = teamId;
  }
  return statsEntity;
}

Map<String, dynamic> $StatsEntityToJson(StatsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['BLK'] = entity.bLK;
  data['TOTAL_FG3_PCT'] = entity.totalFg3Pct;
  data['FG3_PCT'] = entity.fg3Pct;
  data['TOTAL_AST'] = entity.totalAst;
  data['TOTAL_FGA'] = entity.totalFga;
  data['FG_PCT'] = entity.fgPct;
  data['TOTAL_3PA'] = entity.total3pa;
  data['PTS'] = entity.pTS;
  data['TOTAL_FGM'] = entity.totalFgm;
  data['TOTAL_FT_PCT'] = entity.totalFtPct;
  data['TOTAL_FG_PCT'] = entity.totalFgPct;
  data['TOTAL_3PM'] = entity.total3pm;
  data['TOTAL_REB'] = entity.totalReb;
  data['TOTAL_FTA'] = entity.totalFta;
  data['PLAYER_NAME'] = entity.playerName;
  data['FGA'] = entity.fGA;
  data['AST'] = entity.aST;
  data['TOTAL_TOV'] = entity.totalTov;
  data['threePA'] = entity.threePA;
  data['TOTAL_BLK'] = entity.totalBlk;
  data['TOTAL_FTM'] = entity.totalFtm;
  data['FGM'] = entity.fGM;
  data['REB'] = entity.rEB;
  data['FT_PCT'] = entity.ftPct;
  data['3PM'] = entity.threePM;
  data['FTA'] = entity.fTA;
  data['TOTAL_PTS'] = entity.totalPts;
  data['PLAYER_ID'] = entity.playerId;
  data['TOV'] = entity.tOV;
  data['FTM'] = entity.fTM;
  data['TEAM_NAME'] = entity.teamName;
  data['TEAM_ID'] = entity.teamId;
  return data;
}

extension StatsEntityExtension on StatsEntity {
  StatsEntity copyWith({
    double? bLK,
    double? totalFg3Pct,
    double? fg3Pct,
    double? totalAst,
    double? totalFga,
    double? fgPct,
    double? total3pa,
    double? pTS,
    double? totalFgm,
    double? totalFtPct,
    double? totalFgPct,
    double? total3pm,
    double? totalReb,
    double? totalFta,
    String? playerName,
    double? fGA,
    double? aST,
    double? totalTov,
    double? threePA,
    double? totalBlk,
    double? totalFtm,
    double? fGM,
    double? rEB,
    double? ftPct,
    double? threePM,
    double? fTA,
    double? totalPts,
    int? playerId,
    double? tOV,
    double? fTM,
    String? teamName,
    int? teamId,
  }) {
    return StatsEntity()
      ..bLK = bLK ?? this.bLK
      ..totalFg3Pct = totalFg3Pct ?? this.totalFg3Pct
      ..fg3Pct = fg3Pct ?? this.fg3Pct
      ..totalAst = totalAst ?? this.totalAst
      ..totalFga = totalFga ?? this.totalFga
      ..fgPct = fgPct ?? this.fgPct
      ..total3pa = total3pa ?? this.total3pa
      ..pTS = pTS ?? this.pTS
      ..totalFgm = totalFgm ?? this.totalFgm
      ..totalFtPct = totalFtPct ?? this.totalFtPct
      ..totalFgPct = totalFgPct ?? this.totalFgPct
      ..total3pm = total3pm ?? this.total3pm
      ..totalReb = totalReb ?? this.totalReb
      ..totalFta = totalFta ?? this.totalFta
      ..playerName = playerName ?? this.playerName
      ..fGA = fGA ?? this.fGA
      ..aST = aST ?? this.aST
      ..totalTov = totalTov ?? this.totalTov
      ..threePA = threePA ?? this.threePA
      ..totalBlk = totalBlk ?? this.totalBlk
      ..totalFtm = totalFtm ?? this.totalFtm
      ..fGM = fGM ?? this.fGM
      ..rEB = rEB ?? this.rEB
      ..ftPct = ftPct ?? this.ftPct
      ..threePM = threePM ?? this.threePM
      ..fTA = fTA ?? this.fTA
      ..totalPts = totalPts ?? this.totalPts
      ..playerId = playerId ?? this.playerId
      ..tOV = tOV ?? this.tOV
      ..fTM = fTM ?? this.fTM
      ..teamName = teamName ?? this.teamName
      ..teamId = teamId ?? this.teamId;
  }
}