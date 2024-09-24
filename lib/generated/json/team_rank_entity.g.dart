import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';

TeamRankEntity $TeamRankEntityFromJson(Map<String, dynamic> json) {
  final TeamRankEntity teamRankEntity = TeamRankEntity();
  final double? oppPointsPG = jsonConvert.convert<double>(json['OppPointsPG']);
  if (oppPointsPG != null) {
    teamRankEntity.oppPointsPG = oppPointsPG;
  }
  final String? oct = jsonConvert.convert<String>(json['Oct']);
  if (oct != null) {
    teamRankEntity.oct = oct;
  }
  final String? apr = jsonConvert.convert<String>(json['Apr']);
  if (apr != null) {
    teamRankEntity.apr = apr;
  }
  final int? divisionRank = jsonConvert.convert<int>(json['DivisionRank']);
  if (divisionRank != null) {
    teamRankEntity.divisionRank = divisionRank;
  }
  final int? leagueRank = jsonConvert.convert<int>(json['LeagueRank']);
  if (leagueRank != null) {
    teamRankEntity.leagueRank = leagueRank;
  }
  final String? rOAD = jsonConvert.convert<String>(json['ROAD']);
  if (rOAD != null) {
    teamRankEntity.rOAD = rOAD;
  }
  final String? strCurrentHomeStreak = jsonConvert.convert<String>(
      json['strCurrentHomeStreak']);
  if (strCurrentHomeStreak != null) {
    teamRankEntity.strCurrentHomeStreak = strCurrentHomeStreak;
  }
  final int? diffTotalPoints = jsonConvert.convert<int>(
      json['DiffTotalPoints']);
  if (diffTotalPoints != null) {
    teamRankEntity.diffTotalPoints = diffTotalPoints;
  }
  final String? strLongHomeStreak = jsonConvert.convert<String>(
      json['strLongHomeStreak']);
  if (strLongHomeStreak != null) {
    teamRankEntity.strLongHomeStreak = strLongHomeStreak;
  }
  final String? last10Road = jsonConvert.convert<String>(json['Last10Road']);
  if (last10Road != null) {
    teamRankEntity.last10Road = last10Road;
  }
  final String? aheadAtThird = jsonConvert.convert<String>(
      json['AheadAtThird']);
  if (aheadAtThird != null) {
    teamRankEntity.aheadAtThird = aheadAtThird;
  }
  final String? vsEast = jsonConvert.convert<String>(json['vsEast']);
  if (vsEast != null) {
    teamRankEntity.vsEast = vsEast;
  }
  final String? conference = jsonConvert.convert<String>(json['Conference']);
  if (conference != null) {
    teamRankEntity.conference = conference;
  }
  final String? behindAtHalf = jsonConvert.convert<String>(
      json['BehindAtHalf']);
  if (behindAtHalf != null) {
    teamRankEntity.behindAtHalf = behindAtHalf;
  }
  final int? totalPoints = jsonConvert.convert<int>(json['TotalPoints']);
  if (totalPoints != null) {
    teamRankEntity.totalPoints = totalPoints;
  }
  final int? playoffRank = jsonConvert.convert<int>(json['PlayoffRank']);
  if (playoffRank != null) {
    teamRankEntity.playoffRank = playoffRank;
  }
  final String? tenPTSOrMore = jsonConvert.convert<String>(
      json['TenPTSOrMore']);
  if (tenPTSOrMore != null) {
    teamRankEntity.tenPTSOrMore = tenPTSOrMore;
  }
  final int? eliminatedConference = jsonConvert.convert<int>(
      json['EliminatedConference']);
  if (eliminatedConference != null) {
    teamRankEntity.eliminatedConference = eliminatedConference;
  }
  final String? score80Plus = jsonConvert.convert<String>(
      json['Score_80_Plus']);
  if (score80Plus != null) {
    teamRankEntity.score80Plus = score80Plus;
  }
  final String? conferenceRecord = jsonConvert.convert<String>(
      json['ConferenceRecord']);
  if (conferenceRecord != null) {
    teamRankEntity.conferenceRecord = conferenceRecord;
  }
  final double? pointsPG = jsonConvert.convert<double>(json['PointsPG']);
  if (pointsPG != null) {
    teamRankEntity.pointsPG = pointsPG;
  }
  final int? currentRoadStreak = jsonConvert.convert<int>(
      json['CurrentRoadStreak']);
  if (currentRoadStreak != null) {
    teamRankEntity.currentRoadStreak = currentRoadStreak;
  }
  final String? score100PTS = jsonConvert.convert<String>(json['Score100PTS']);
  if (score100PTS != null) {
    teamRankEntity.score100PTS = score100PTS;
  }
  final int? oppTotalPoints = jsonConvert.convert<int>(json['OppTotalPoints']);
  if (oppTotalPoints != null) {
    teamRankEntity.oppTotalPoints = oppTotalPoints;
  }
  final String? nEUTRAL = jsonConvert.convert<String>(json['NEUTRAL']);
  if (nEUTRAL != null) {
    teamRankEntity.nEUTRAL = nEUTRAL;
  }
  final String? aheadAtHalf = jsonConvert.convert<String>(json['AheadAtHalf']);
  if (aheadAtHalf != null) {
    teamRankEntity.aheadAtHalf = aheadAtHalf;
  }
  final int? lOSSES = jsonConvert.convert<int>(json['LOSSES']);
  if (lOSSES != null) {
    teamRankEntity.lOSSES = lOSSES;
  }
  final String? strLongRoadStreak = jsonConvert.convert<String>(
      json['strLongRoadStreak']);
  if (strLongRoadStreak != null) {
    teamRankEntity.strLongRoadStreak = strLongRoadStreak;
  }
  final int? clinchedPlayoffBirth = jsonConvert.convert<int>(
      json['ClinchedPlayoffBirth']);
  if (clinchedPlayoffBirth != null) {
    teamRankEntity.clinchedPlayoffBirth = clinchedPlayoffBirth;
  }
  final String? clinchIndicator = jsonConvert.convert<String>(
      json['ClinchIndicator']);
  if (clinchIndicator != null) {
    teamRankEntity.clinchIndicator = clinchIndicator;
  }
  final String? leadInFGPCT = jsonConvert.convert<String>(json['LeadInFGPCT']);
  if (leadInFGPCT != null) {
    teamRankEntity.leadInFGPCT = leadInFGPCT;
  }
  final String? oppScoreBelow80 = jsonConvert.convert<String>(
      json['Opp_Score_Below_80']);
  if (oppScoreBelow80 != null) {
    teamRankEntity.oppScoreBelow80 = oppScoreBelow80;
  }
  final String? strCurrentRoadStreak = jsonConvert.convert<String>(
      json['strCurrentRoadStreak']);
  if (strCurrentRoadStreak != null) {
    teamRankEntity.strCurrentRoadStreak = strCurrentRoadStreak;
  }
  final String? strCurrentStreak = jsonConvert.convert<String>(
      json['strCurrentStreak']);
  if (strCurrentStreak != null) {
    teamRankEntity.strCurrentStreak = strCurrentStreak;
  }
  final String? teamSlug = jsonConvert.convert<String>(json['TeamSlug']);
  if (teamSlug != null) {
    teamRankEntity.teamSlug = teamSlug;
  }
  final int? clinchedPostSeason = jsonConvert.convert<int>(
      json['ClinchedPostSeason']);
  if (clinchedPostSeason != null) {
    teamRankEntity.clinchedPostSeason = clinchedPostSeason;
  }
  final double? conferenceGamesBack = jsonConvert.convert<double>(
      json['ConferenceGamesBack']);
  if (conferenceGamesBack != null) {
    teamRankEntity.conferenceGamesBack = conferenceGamesBack;
  }
  final String? nov = jsonConvert.convert<String>(json['Nov']);
  if (nov != null) {
    teamRankEntity.nov = nov;
  }
  final int? clinchedDivisionTitle = jsonConvert.convert<int>(
      json['ClinchedDivisionTitle']);
  if (clinchedDivisionTitle != null) {
    teamRankEntity.clinchedDivisionTitle = clinchedDivisionTitle;
  }
  final String? tiedAtThird = jsonConvert.convert<String>(json['TiedAtThird']);
  if (tiedAtThird != null) {
    teamRankEntity.tiedAtThird = tiedAtThird;
  }
  final String? vsNorthwest = jsonConvert.convert<String>(json['vsNorthwest']);
  if (vsNorthwest != null) {
    teamRankEntity.vsNorthwest = vsNorthwest;
  }
  final int? playoffSeeding = jsonConvert.convert<int>(json['PlayoffSeeding']);
  if (playoffSeeding != null) {
    teamRankEntity.playoffSeeding = playoffSeeding;
  }
  final String? seasonID = jsonConvert.convert<String>(json['SeasonID']);
  if (seasonID != null) {
    teamRankEntity.seasonID = seasonID;
  }
  final String? leagueID = jsonConvert.convert<String>(json['LeagueID']);
  if (leagueID != null) {
    teamRankEntity.leagueID = leagueID;
  }
  final int? longWinStreak = jsonConvert.convert<int>(json['LongWinStreak']);
  if (longWinStreak != null) {
    teamRankEntity.longWinStreak = longWinStreak;
  }
  final int? longHomeStreak = jsonConvert.convert<int>(json['LongHomeStreak']);
  if (longHomeStreak != null) {
    teamRankEntity.longHomeStreak = longHomeStreak;
  }
  final int? wINS = jsonConvert.convert<int>(json['WINS']);
  if (wINS != null) {
    teamRankEntity.wINS = wINS;
  }
  final String? mar = jsonConvert.convert<String>(json['Mar']);
  if (mar != null) {
    teamRankEntity.mar = mar;
  }
  final String? behindAtThird = jsonConvert.convert<String>(
      json['BehindAtThird']);
  if (behindAtThird != null) {
    teamRankEntity.behindAtThird = behindAtThird;
  }
  final String? scoreBelow80 = jsonConvert.convert<String>(
      json['Score_Below_80']);
  if (scoreBelow80 != null) {
    teamRankEntity.scoreBelow80 = scoreBelow80;
  }
  final String? vsSoutheast = jsonConvert.convert<String>(json['vsSoutheast']);
  if (vsSoutheast != null) {
    teamRankEntity.vsSoutheast = vsSoutheast;
  }
  final String? vsPacific = jsonConvert.convert<String>(json['vsPacific']);
  if (vsPacific != null) {
    teamRankEntity.vsPacific = vsPacific;
  }
  final String? vsAtlantic = jsonConvert.convert<String>(json['vsAtlantic']);
  if (vsAtlantic != null) {
    teamRankEntity.vsAtlantic = vsAtlantic;
  }
  final String? teamName = jsonConvert.convert<String>(json['TeamName']);
  if (teamName != null) {
    teamRankEntity.teamName = teamName;
  }
  final int? teamID = jsonConvert.convert<int>(json['TeamID']);
  if (teamID != null) {
    teamRankEntity.teamID = teamID;
  }
  final String? last10Home = jsonConvert.convert<String>(json['Last10Home']);
  if (last10Home != null) {
    teamRankEntity.last10Home = last10Home;
  }
  final String? leadInReb = jsonConvert.convert<String>(json['LeadInReb']);
  if (leadInReb != null) {
    teamRankEntity.leadInReb = leadInReb;
  }
  final int? eliminatedDivision = jsonConvert.convert<int>(
      json['EliminatedDivision']);
  if (eliminatedDivision != null) {
    teamRankEntity.eliminatedDivision = eliminatedDivision;
  }
  final int? longRoadStreak = jsonConvert.convert<int>(json['LongRoadStreak']);
  if (longRoadStreak != null) {
    teamRankEntity.longRoadStreak = longRoadStreak;
  }
  final String? vsWest = jsonConvert.convert<String>(json['vsWest']);
  if (vsWest != null) {
    teamRankEntity.vsWest = vsWest;
  }
  final String? teamCity = jsonConvert.convert<String>(json['TeamCity']);
  if (teamCity != null) {
    teamRankEntity.teamCity = teamCity;
  }
  final String? oppOver500 = jsonConvert.convert<String>(json['OppOver500']);
  if (oppOver500 != null) {
    teamRankEntity.oppOver500 = oppOver500;
  }
  final String? division = jsonConvert.convert<String>(json['Division']);
  if (division != null) {
    teamRankEntity.division = division;
  }
  final String? record = jsonConvert.convert<String>(json['Record']);
  if (record != null) {
    teamRankEntity.record = record;
  }
  final int? clinchedPlayIn = jsonConvert.convert<int>(json['ClinchedPlayIn']);
  if (clinchedPlayIn != null) {
    teamRankEntity.clinchedPlayIn = clinchedPlayIn;
  }
  final double? leagueGamesBack = jsonConvert.convert<double>(
      json['LeagueGamesBack']);
  if (leagueGamesBack != null) {
    teamRankEntity.leagueGamesBack = leagueGamesBack;
  }
  final double? divisionGamesBack = jsonConvert.convert<double>(
      json['DivisionGamesBack']);
  if (divisionGamesBack != null) {
    teamRankEntity.divisionGamesBack = divisionGamesBack;
  }
  final String? fewerTurnovers = jsonConvert.convert<String>(
      json['FewerTurnovers']);
  if (fewerTurnovers != null) {
    teamRankEntity.fewerTurnovers = fewerTurnovers;
  }
  final String? divisionRecord = jsonConvert.convert<String>(
      json['DivisionRecord']);
  if (divisionRecord != null) {
    teamRankEntity.divisionRecord = divisionRecord;
  }
  final int? currentStreak = jsonConvert.convert<int>(json['CurrentStreak']);
  if (currentStreak != null) {
    teamRankEntity.currentStreak = currentStreak;
  }
  final String? feb = jsonConvert.convert<String>(json['Feb']);
  if (feb != null) {
    teamRankEntity.feb = feb;
  }
  final String? dec = jsonConvert.convert<String>(json['Dec']);
  if (dec != null) {
    teamRankEntity.dec = dec;
  }
  final String? oT = jsonConvert.convert<String>(json['OT']);
  if (oT != null) {
    teamRankEntity.oT = oT;
  }
  final String? oppScore100PTS = jsonConvert.convert<String>(
      json['OppScore100PTS']);
  if (oppScore100PTS != null) {
    teamRankEntity.oppScore100PTS = oppScore100PTS;
  }
  final String? vsSouthwest = jsonConvert.convert<String>(json['vsSouthwest']);
  if (vsSouthwest != null) {
    teamRankEntity.vsSouthwest = vsSouthwest;
  }
  final int? clinchedConferenceTitle = jsonConvert.convert<int>(
      json['ClinchedConferenceTitle']);
  if (clinchedConferenceTitle != null) {
    teamRankEntity.clinchedConferenceTitle = clinchedConferenceTitle;
  }
  final String? vsCentral = jsonConvert.convert<String>(json['vsCentral']);
  if (vsCentral != null) {
    teamRankEntity.vsCentral = vsCentral;
  }
  final String? l10 = jsonConvert.convert<String>(json['L10']);
  if (l10 != null) {
    teamRankEntity.l10 = l10;
  }
  final String? oppScore80Plus = jsonConvert.convert<String>(
      json['Opp_Score_80_Plus']);
  if (oppScore80Plus != null) {
    teamRankEntity.oppScore80Plus = oppScore80Plus;
  }
  final double? winPCT = jsonConvert.convert<double>(json['WinPCT']);
  if (winPCT != null) {
    teamRankEntity.winPCT = winPCT;
  }
  final int? longLossStreak = jsonConvert.convert<int>(json['LongLossStreak']);
  if (longLossStreak != null) {
    teamRankEntity.longLossStreak = longLossStreak;
  }
  final int? currentHomeStreak = jsonConvert.convert<int>(
      json['CurrentHomeStreak']);
  if (currentHomeStreak != null) {
    teamRankEntity.currentHomeStreak = currentHomeStreak;
  }
  final String? jan = jsonConvert.convert<String>(json['Jan']);
  if (jan != null) {
    teamRankEntity.jan = jan;
  }
  final double? diffPointsPG = jsonConvert.convert<double>(
      json['DiffPointsPG']);
  if (diffPointsPG != null) {
    teamRankEntity.diffPointsPG = diffPointsPG;
  }
  final String? threePTSOrLess = jsonConvert.convert<String>(
      json['ThreePTSOrLess']);
  if (threePTSOrLess != null) {
    teamRankEntity.threePTSOrLess = threePTSOrLess;
  }
  final String? tiedAtHalf = jsonConvert.convert<String>(json['TiedAtHalf']);
  if (tiedAtHalf != null) {
    teamRankEntity.tiedAtHalf = tiedAtHalf;
  }
  final String? hOME = jsonConvert.convert<String>(json['HOME']);
  if (hOME != null) {
    teamRankEntity.hOME = hOME;
  }
  final String? shortEname = jsonConvert.convert<String>(json['shortEname']);
  if (shortEname != null) {
    teamRankEntity.shortEname = shortEname;
  }
  return teamRankEntity;
}

Map<String, dynamic> $TeamRankEntityToJson(TeamRankEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['OppPointsPG'] = entity.oppPointsPG;
  data['Oct'] = entity.oct;
  data['Apr'] = entity.apr;
  data['DivisionRank'] = entity.divisionRank;
  data['LeagueRank'] = entity.leagueRank;
  data['ROAD'] = entity.rOAD;
  data['strCurrentHomeStreak'] = entity.strCurrentHomeStreak;
  data['DiffTotalPoints'] = entity.diffTotalPoints;
  data['strLongHomeStreak'] = entity.strLongHomeStreak;
  data['Last10Road'] = entity.last10Road;
  data['AheadAtThird'] = entity.aheadAtThird;
  data['vsEast'] = entity.vsEast;
  data['Conference'] = entity.conference;
  data['BehindAtHalf'] = entity.behindAtHalf;
  data['TotalPoints'] = entity.totalPoints;
  data['PlayoffRank'] = entity.playoffRank;
  data['TenPTSOrMore'] = entity.tenPTSOrMore;
  data['EliminatedConference'] = entity.eliminatedConference;
  data['Score_80_Plus'] = entity.score80Plus;
  data['ConferenceRecord'] = entity.conferenceRecord;
  data['PointsPG'] = entity.pointsPG;
  data['CurrentRoadStreak'] = entity.currentRoadStreak;
  data['Score100PTS'] = entity.score100PTS;
  data['OppTotalPoints'] = entity.oppTotalPoints;
  data['NEUTRAL'] = entity.nEUTRAL;
  data['AheadAtHalf'] = entity.aheadAtHalf;
  data['LOSSES'] = entity.lOSSES;
  data['strLongRoadStreak'] = entity.strLongRoadStreak;
  data['ClinchedPlayoffBirth'] = entity.clinchedPlayoffBirth;
  data['ClinchIndicator'] = entity.clinchIndicator;
  data['LeadInFGPCT'] = entity.leadInFGPCT;
  data['Opp_Score_Below_80'] = entity.oppScoreBelow80;
  data['strCurrentRoadStreak'] = entity.strCurrentRoadStreak;
  data['strCurrentStreak'] = entity.strCurrentStreak;
  data['TeamSlug'] = entity.teamSlug;
  data['ClinchedPostSeason'] = entity.clinchedPostSeason;
  data['ConferenceGamesBack'] = entity.conferenceGamesBack;
  data['Nov'] = entity.nov;
  data['ClinchedDivisionTitle'] = entity.clinchedDivisionTitle;
  data['TiedAtThird'] = entity.tiedAtThird;
  data['vsNorthwest'] = entity.vsNorthwest;
  data['PlayoffSeeding'] = entity.playoffSeeding;
  data['SeasonID'] = entity.seasonID;
  data['LeagueID'] = entity.leagueID;
  data['LongWinStreak'] = entity.longWinStreak;
  data['LongHomeStreak'] = entity.longHomeStreak;
  data['WINS'] = entity.wINS;
  data['Mar'] = entity.mar;
  data['BehindAtThird'] = entity.behindAtThird;
  data['Score_Below_80'] = entity.scoreBelow80;
  data['vsSoutheast'] = entity.vsSoutheast;
  data['vsPacific'] = entity.vsPacific;
  data['vsAtlantic'] = entity.vsAtlantic;
  data['TeamName'] = entity.teamName;
  data['TeamID'] = entity.teamID;
  data['Last10Home'] = entity.last10Home;
  data['LeadInReb'] = entity.leadInReb;
  data['EliminatedDivision'] = entity.eliminatedDivision;
  data['LongRoadStreak'] = entity.longRoadStreak;
  data['vsWest'] = entity.vsWest;
  data['TeamCity'] = entity.teamCity;
  data['OppOver500'] = entity.oppOver500;
  data['Division'] = entity.division;
  data['Record'] = entity.record;
  data['ClinchedPlayIn'] = entity.clinchedPlayIn;
  data['LeagueGamesBack'] = entity.leagueGamesBack;
  data['DivisionGamesBack'] = entity.divisionGamesBack;
  data['FewerTurnovers'] = entity.fewerTurnovers;
  data['DivisionRecord'] = entity.divisionRecord;
  data['CurrentStreak'] = entity.currentStreak;
  data['Feb'] = entity.feb;
  data['Dec'] = entity.dec;
  data['OT'] = entity.oT;
  data['OppScore100PTS'] = entity.oppScore100PTS;
  data['vsSouthwest'] = entity.vsSouthwest;
  data['ClinchedConferenceTitle'] = entity.clinchedConferenceTitle;
  data['vsCentral'] = entity.vsCentral;
  data['L10'] = entity.l10;
  data['Opp_Score_80_Plus'] = entity.oppScore80Plus;
  data['WinPCT'] = entity.winPCT;
  data['LongLossStreak'] = entity.longLossStreak;
  data['CurrentHomeStreak'] = entity.currentHomeStreak;
  data['Jan'] = entity.jan;
  data['DiffPointsPG'] = entity.diffPointsPG;
  data['ThreePTSOrLess'] = entity.threePTSOrLess;
  data['TiedAtHalf'] = entity.tiedAtHalf;
  data['HOME'] = entity.hOME;
  data['shortEname'] = entity.shortEname;
  return data;
}

extension TeamRankEntityExtension on TeamRankEntity {
  TeamRankEntity copyWith({
    double? oppPointsPG,
    String? oct,
    String? apr,
    int? divisionRank,
    int? leagueRank,
    String? rOAD,
    String? strCurrentHomeStreak,
    int? diffTotalPoints,
    String? strLongHomeStreak,
    String? last10Road,
    String? aheadAtThird,
    String? vsEast,
    String? conference,
    String? behindAtHalf,
    int? totalPoints,
    int? playoffRank,
    String? tenPTSOrMore,
    int? eliminatedConference,
    String? score80Plus,
    String? conferenceRecord,
    double? pointsPG,
    int? currentRoadStreak,
    String? score100PTS,
    int? oppTotalPoints,
    String? nEUTRAL,
    String? aheadAtHalf,
    int? lOSSES,
    String? strLongRoadStreak,
    int? clinchedPlayoffBirth,
    String? clinchIndicator,
    String? leadInFGPCT,
    String? oppScoreBelow80,
    String? strCurrentRoadStreak,
    String? strCurrentStreak,
    String? teamSlug,
    int? clinchedPostSeason,
    double? conferenceGamesBack,
    String? nov,
    int? clinchedDivisionTitle,
    String? tiedAtThird,
    String? vsNorthwest,
    int? playoffSeeding,
    String? seasonID,
    String? leagueID,
    int? longWinStreak,
    int? longHomeStreak,
    int? wINS,
    String? mar,
    String? behindAtThird,
    String? scoreBelow80,
    String? vsSoutheast,
    String? vsPacific,
    String? vsAtlantic,
    String? teamName,
    int? teamID,
    String? last10Home,
    String? leadInReb,
    int? eliminatedDivision,
    int? longRoadStreak,
    String? vsWest,
    String? teamCity,
    String? oppOver500,
    String? division,
    String? record,
    int? clinchedPlayIn,
    double? leagueGamesBack,
    double? divisionGamesBack,
    String? fewerTurnovers,
    String? divisionRecord,
    int? currentStreak,
    String? feb,
    String? dec,
    String? oT,
    String? oppScore100PTS,
    String? vsSouthwest,
    int? clinchedConferenceTitle,
    String? vsCentral,
    String? l10,
    String? oppScore80Plus,
    double? winPCT,
    int? longLossStreak,
    int? currentHomeStreak,
    String? jan,
    double? diffPointsPG,
    String? threePTSOrLess,
    String? tiedAtHalf,
    String? hOME,
    String? shortEname,
  }) {
    return TeamRankEntity()
      ..oppPointsPG = oppPointsPG ?? this.oppPointsPG
      ..oct = oct ?? this.oct
      ..apr = apr ?? this.apr
      ..divisionRank = divisionRank ?? this.divisionRank
      ..leagueRank = leagueRank ?? this.leagueRank
      ..rOAD = rOAD ?? this.rOAD
      ..strCurrentHomeStreak = strCurrentHomeStreak ?? this.strCurrentHomeStreak
      ..diffTotalPoints = diffTotalPoints ?? this.diffTotalPoints
      ..strLongHomeStreak = strLongHomeStreak ?? this.strLongHomeStreak
      ..last10Road = last10Road ?? this.last10Road
      ..aheadAtThird = aheadAtThird ?? this.aheadAtThird
      ..vsEast = vsEast ?? this.vsEast
      ..conference = conference ?? this.conference
      ..behindAtHalf = behindAtHalf ?? this.behindAtHalf
      ..totalPoints = totalPoints ?? this.totalPoints
      ..playoffRank = playoffRank ?? this.playoffRank
      ..tenPTSOrMore = tenPTSOrMore ?? this.tenPTSOrMore
      ..eliminatedConference = eliminatedConference ?? this.eliminatedConference
      ..score80Plus = score80Plus ?? this.score80Plus
      ..conferenceRecord = conferenceRecord ?? this.conferenceRecord
      ..pointsPG = pointsPG ?? this.pointsPG
      ..currentRoadStreak = currentRoadStreak ?? this.currentRoadStreak
      ..score100PTS = score100PTS ?? this.score100PTS
      ..oppTotalPoints = oppTotalPoints ?? this.oppTotalPoints
      ..nEUTRAL = nEUTRAL ?? this.nEUTRAL
      ..aheadAtHalf = aheadAtHalf ?? this.aheadAtHalf
      ..lOSSES = lOSSES ?? this.lOSSES
      ..strLongRoadStreak = strLongRoadStreak ?? this.strLongRoadStreak
      ..clinchedPlayoffBirth = clinchedPlayoffBirth ?? this.clinchedPlayoffBirth
      ..clinchIndicator = clinchIndicator ?? this.clinchIndicator
      ..leadInFGPCT = leadInFGPCT ?? this.leadInFGPCT
      ..oppScoreBelow80 = oppScoreBelow80 ?? this.oppScoreBelow80
      ..strCurrentRoadStreak = strCurrentRoadStreak ?? this.strCurrentRoadStreak
      ..strCurrentStreak = strCurrentStreak ?? this.strCurrentStreak
      ..teamSlug = teamSlug ?? this.teamSlug
      ..clinchedPostSeason = clinchedPostSeason ?? this.clinchedPostSeason
      ..conferenceGamesBack = conferenceGamesBack ?? this.conferenceGamesBack
      ..nov = nov ?? this.nov
      ..clinchedDivisionTitle = clinchedDivisionTitle ??
          this.clinchedDivisionTitle
      ..tiedAtThird = tiedAtThird ?? this.tiedAtThird
      ..vsNorthwest = vsNorthwest ?? this.vsNorthwest
      ..playoffSeeding = playoffSeeding ?? this.playoffSeeding
      ..seasonID = seasonID ?? this.seasonID
      ..leagueID = leagueID ?? this.leagueID
      ..longWinStreak = longWinStreak ?? this.longWinStreak
      ..longHomeStreak = longHomeStreak ?? this.longHomeStreak
      ..wINS = wINS ?? this.wINS
      ..mar = mar ?? this.mar
      ..behindAtThird = behindAtThird ?? this.behindAtThird
      ..scoreBelow80 = scoreBelow80 ?? this.scoreBelow80
      ..vsSoutheast = vsSoutheast ?? this.vsSoutheast
      ..vsPacific = vsPacific ?? this.vsPacific
      ..vsAtlantic = vsAtlantic ?? this.vsAtlantic
      ..teamName = teamName ?? this.teamName
      ..teamID = teamID ?? this.teamID
      ..last10Home = last10Home ?? this.last10Home
      ..leadInReb = leadInReb ?? this.leadInReb
      ..eliminatedDivision = eliminatedDivision ?? this.eliminatedDivision
      ..longRoadStreak = longRoadStreak ?? this.longRoadStreak
      ..vsWest = vsWest ?? this.vsWest
      ..teamCity = teamCity ?? this.teamCity
      ..oppOver500 = oppOver500 ?? this.oppOver500
      ..division = division ?? this.division
      ..record = record ?? this.record
      ..clinchedPlayIn = clinchedPlayIn ?? this.clinchedPlayIn
      ..leagueGamesBack = leagueGamesBack ?? this.leagueGamesBack
      ..divisionGamesBack = divisionGamesBack ?? this.divisionGamesBack
      ..fewerTurnovers = fewerTurnovers ?? this.fewerTurnovers
      ..divisionRecord = divisionRecord ?? this.divisionRecord
      ..currentStreak = currentStreak ?? this.currentStreak
      ..feb = feb ?? this.feb
      ..dec = dec ?? this.dec
      ..oT = oT ?? this.oT
      ..oppScore100PTS = oppScore100PTS ?? this.oppScore100PTS
      ..vsSouthwest = vsSouthwest ?? this.vsSouthwest
      ..clinchedConferenceTitle = clinchedConferenceTitle ??
          this.clinchedConferenceTitle
      ..vsCentral = vsCentral ?? this.vsCentral
      ..l10 = l10 ?? this.l10
      ..oppScore80Plus = oppScore80Plus ?? this.oppScore80Plus
      ..winPCT = winPCT ?? this.winPCT
      ..longLossStreak = longLossStreak ?? this.longLossStreak
      ..currentHomeStreak = currentHomeStreak ?? this.currentHomeStreak
      ..jan = jan ?? this.jan
      ..diffPointsPG = diffPointsPG ?? this.diffPointsPG
      ..threePTSOrLess = threePTSOrLess ?? this.threePTSOrLess
      ..tiedAtHalf = tiedAtHalf ?? this.tiedAtHalf
      ..hOME = hOME ?? this.hOME
      ..shortEname = shortEname ?? this.shortEname;
  }
}