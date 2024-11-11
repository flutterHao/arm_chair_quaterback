import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';


BattleEntity $BattleEntityFromJson(Map<String, dynamic> json) {
  final BattleEntity battleEntity = BattleEntity();
  final int? awayTeamPower = jsonConvert.convert<int>(json['awayTeamPower']);
  if (awayTeamPower != null) {
    battleEntity.awayTeamPower = awayTeamPower;
  }
  final BattleNew? news = jsonConvert.convert<BattleNew>(json['news']);
  if (news != null) {
    battleEntity.news = news;
  }
  final List<
      TeamPlayerList>? homeTeamPlayerList = (json['homeTeamPlayerList'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TeamPlayerList>(e) as TeamPlayerList)
      .toList();
  if (homeTeamPlayerList != null) {
    battleEntity.homeTeamPlayerList = homeTeamPlayerList;
  }
  final BattleTeam? awayTeam = jsonConvert.convert<BattleTeam>(
      json['awayTeam']);
  if (awayTeam != null) {
    battleEntity.awayTeam = awayTeam;
  }
  final AbilityValue? awayAbilityValue = jsonConvert.convert<AbilityValue>(
      json['awayAbilityValue']);
  if (awayAbilityValue != null) {
    battleEntity.awayAbilityValue = awayAbilityValue;
  }
  final List<
      TeamPlayerList>? awayTeamPlayerList = (json['awayTeamPlayerList'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TeamPlayerList>(e) as TeamPlayerList)
      .toList();
  if (awayTeamPlayerList != null) {
    battleEntity.awayTeamPlayerList = awayTeamPlayerList;
  }
  final List<TeamBuffer>? awayTeamBuff = (json['awayTeamBuff'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<TeamBuffer>(e) as TeamBuffer).toList();
  if (awayTeamBuff != null) {
    battleEntity.awayTeamBuff = awayTeamBuff;
  }
  final int? homeTeamPower = jsonConvert.convert<int>(json['homeTeamPower']);
  if (homeTeamPower != null) {
    battleEntity.homeTeamPower = homeTeamPower;
  }
  final List<TeamBuffer>? homeTeamBuff = (json['homeTeamBuff'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<TeamBuffer>(e) as TeamBuffer).toList();
  if (homeTeamBuff != null) {
    battleEntity.homeTeamBuff = homeTeamBuff;
  }
  final BattleTeam? homeTeam = jsonConvert.convert<BattleTeam>(
      json['homeTeam']);
  if (homeTeam != null) {
    battleEntity.homeTeam = homeTeam;
  }
  final BattleGameData? gameData = jsonConvert.convert<BattleGameData>(
      json['gameData']);
  if (gameData != null) {
    battleEntity.gameData = gameData;
  }
  final AbilityValue? homeAbilityValue = jsonConvert.convert<AbilityValue>(
      json['homeAbilityValue']);
  if (homeAbilityValue != null) {
    battleEntity.homeAbilityValue = homeAbilityValue;
  }
  final double? newsBuffAdd = jsonConvert.convert<double>(json['newsBuffAdd']);
  if (newsBuffAdd != null) {
    battleEntity.newsBuffAdd = newsBuffAdd;
  }
  final int? newsBuffPlayerId = jsonConvert.convert<int>(
      json['newsBuffPlayerId']);
  if (newsBuffPlayerId != null) {
    battleEntity.newsBuffPlayerId = newsBuffPlayerId;
  }
  return battleEntity;
}

Map<String, dynamic> $BattleEntityToJson(BattleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTeamPower'] = entity.awayTeamPower;
  data['news'] = entity.news?.toJson();
  data['homeTeamPlayerList'] =
      entity.homeTeamPlayerList.map((v) => v.toJson()).toList();
  data['awayTeam'] = entity.awayTeam.toJson();
  data['awayAbilityValue'] = entity.awayAbilityValue.toJson();
  data['awayTeamPlayerList'] =
      entity.awayTeamPlayerList.map((v) => v.toJson()).toList();
  data['awayTeamBuff'] = entity.awayTeamBuff.map((v) => v.toJson()).toList();
  data['homeTeamPower'] = entity.homeTeamPower;
  data['homeTeamBuff'] = entity.homeTeamBuff.map((v) => v.toJson()).toList();
  data['homeTeam'] = entity.homeTeam.toJson();
  data['gameData'] = entity.gameData.toJson();
  data['homeAbilityValue'] = entity.homeAbilityValue.toJson();
  data['newsBuffAdd'] = entity.newsBuffAdd;
  data['newsBuffPlayerId'] = entity.newsBuffPlayerId;
  return data;
}

extension BattleEntityExtension on BattleEntity {
  BattleEntity copyWith({
    int? awayTeamPower,
    BattleNew? news,
    List<TeamPlayerList>? homeTeamPlayerList,
    BattleTeam? awayTeam,
    AbilityValue? awayAbilityValue,
    List<TeamPlayerList>? awayTeamPlayerList,
    List<TeamBuffer>? awayTeamBuff,
    int? homeTeamPower,
    List<TeamBuffer>? homeTeamBuff,
    BattleTeam? homeTeam,
    BattleGameData? gameData,
    AbilityValue? homeAbilityValue,
    double? newsBuffAdd,
    int? newsBuffPlayerId,
  }) {
    return BattleEntity()
      ..awayTeamPower = awayTeamPower ?? this.awayTeamPower
      ..news = news ?? this.news
      ..homeTeamPlayerList = homeTeamPlayerList ?? this.homeTeamPlayerList
      ..awayTeam = awayTeam ?? this.awayTeam
      ..awayAbilityValue = awayAbilityValue ?? this.awayAbilityValue
      ..awayTeamPlayerList = awayTeamPlayerList ?? this.awayTeamPlayerList
      ..awayTeamBuff = awayTeamBuff ?? this.awayTeamBuff
      ..homeTeamPower = homeTeamPower ?? this.homeTeamPower
      ..homeTeamBuff = homeTeamBuff ?? this.homeTeamBuff
      ..homeTeam = homeTeam ?? this.homeTeam
      ..gameData = gameData ?? this.gameData
      ..homeAbilityValue = homeAbilityValue ?? this.homeAbilityValue
      ..newsBuffAdd = newsBuffAdd ?? this.newsBuffAdd
      ..newsBuffPlayerId = newsBuffPlayerId ?? this.newsBuffPlayerId;
  }
}

BattleNew $BattleNewFromJson(Map<String, dynamic> json) {
  final BattleNew battleNew = BattleNew();
  final int? isLike = jsonConvert.convert<int>(json['isLike']);
  if (isLike != null) {
    battleNew.isLike = isLike;
  }
  final int? isView = jsonConvert.convert<int>(json['isView']);
  if (isView != null) {
    battleNew.isView = isView;
  }
  final String? dataLabel = jsonConvert.convert<String>(json['dataLabel']);
  if (dataLabel != null) {
    battleNew.dataLabel = dataLabel;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    battleNew.updateTime = updateTime;
  }
  final int? reviewsCount = jsonConvert.convert<int>(json['reviewsCount']);
  if (reviewsCount != null) {
    battleNew.reviewsCount = reviewsCount;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    battleNew.source = source;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    battleNew.title = title;
  }
  final int? unLikes = jsonConvert.convert<int>(json['unLikes']);
  if (unLikes != null) {
    battleNew.unLikes = unLikes;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    battleNew.content = content;
  }
  final List<dynamic>? reviewsList = (json['reviewsList'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (reviewsList != null) {
    battleNew.reviewsList = reviewsList;
  }
  final int? postTime = jsonConvert.convert<int>(json['postTime']);
  if (postTime != null) {
    battleNew.postTime = postTime;
  }
  final int? award = jsonConvert.convert<int>(json['award']);
  if (award != null) {
    battleNew.award = award;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    battleNew.createTime = createTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    battleNew.id = id;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    battleNew.views = views;
  }
  final int? likes = jsonConvert.convert<int>(json['likes']);
  if (likes != null) {
    battleNew.likes = likes;
  }
  return battleNew;
}

Map<String, dynamic> $BattleNewToJson(BattleNew entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isLike'] = entity.isLike;
  data['isView'] = entity.isView;
  data['dataLabel'] = entity.dataLabel;
  data['updateTime'] = entity.updateTime;
  data['reviewsCount'] = entity.reviewsCount;
  data['source'] = entity.source;
  data['title'] = entity.title;
  data['unLikes'] = entity.unLikes;
  data['content'] = entity.content;
  data['reviewsList'] = entity.reviewsList;
  data['postTime'] = entity.postTime;
  data['award'] = entity.award;
  data['createTime'] = entity.createTime;
  data['id'] = entity.id;
  data['views'] = entity.views;
  data['likes'] = entity.likes;
  return data;
}

extension BattleNewExtension on BattleNew {
  BattleNew copyWith({
    int? isLike,
    int? isView,
    String? dataLabel,
    int? updateTime,
    int? reviewsCount,
    String? source,
    String? title,
    int? unLikes,
    String? content,
    List<dynamic>? reviewsList,
    int? postTime,
    int? award,
    int? createTime,
    int? id,
    int? views,
    int? likes,
  }) {
    return BattleNew()
      ..isLike = isLike ?? this.isLike
      ..isView = isView ?? this.isView
      ..dataLabel = dataLabel ?? this.dataLabel
      ..updateTime = updateTime ?? this.updateTime
      ..reviewsCount = reviewsCount ?? this.reviewsCount
      ..source = source ?? this.source
      ..title = title ?? this.title
      ..unLikes = unLikes ?? this.unLikes
      ..content = content ?? this.content
      ..reviewsList = reviewsList ?? this.reviewsList
      ..postTime = postTime ?? this.postTime
      ..award = award ?? this.award
      ..createTime = createTime ?? this.createTime
      ..id = id ?? this.id
      ..views = views ?? this.views
      ..likes = likes ?? this.likes;
  }
}

TeamBuffer $TeamBufferFromJson(Map<String, dynamic> json) {
  final TeamBuffer teamBuffer = TeamBuffer();
  final double? buffValue = jsonConvert.convert<double>(json['buffValue']);
  if (buffValue != null) {
    teamBuffer.buffValue = buffValue;
  }
  final int? buffId = jsonConvert.convert<int>(json['buffId']);
  if (buffId != null) {
    teamBuffer.buffId = buffId;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamBuffer.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamBuffer.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamBuffer.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    teamBuffer.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    teamBuffer.position = position;
  }
  final int? takeEffectGameCount = jsonConvert.convert<int>(
      json['takeEffectGameCount']);
  if (takeEffectGameCount != null) {
    teamBuffer.takeEffectGameCount = takeEffectGameCount;
  }
  return teamBuffer;
}

Map<String, dynamic> $TeamBufferToJson(TeamBuffer entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buffValue'] = entity.buffValue;
  data['buffId'] = entity.buffId;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['position'] = entity.position;
  data['takeEffectGameCount'] = entity.takeEffectGameCount;
  return data;
}

extension TeamBufferExtension on TeamBuffer {
  TeamBuffer copyWith({
    double? buffValue,
    int? buffId,
    int? createTime,
    int? teamId,
    int? updateTime,
    int? id,
    int? position,
    int? takeEffectGameCount,
  }) {
    return TeamBuffer()
      ..buffValue = buffValue ?? this.buffValue
      ..buffId = buffId ?? this.buffId
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..position = position ?? this.position
      ..takeEffectGameCount = takeEffectGameCount ?? this.takeEffectGameCount;
  }
}

TeamPlayerList $TeamPlayerListFromJson(Map<String, dynamic> json) {
  final TeamPlayerList teamPlayerList = TeamPlayerList();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    teamPlayerList.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    teamPlayerList.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamPlayerList.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    teamPlayerList.uuid = uuid;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    teamPlayerList.playerReadiness = playerReadiness;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    teamPlayerList.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    teamPlayerList.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamPlayerList.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    teamPlayerList.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamPlayerList.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    teamPlayerList.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    teamPlayerList.position = position;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    teamPlayerList.power = power;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    teamPlayerList.playerStatus = playerStatus;
  }
  final Potential? potential = jsonConvert.convert<Potential>(
      json['potential']);
  if (potential != null) {
    teamPlayerList.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    teamPlayerList.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    teamPlayerList.breakThroughGrade = breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamPlayerList.playerId = playerId;
  }
  final UpStarBase? upStarBase = jsonConvert.convert<UpStarBase>(
      json['upStarBase']);
  if (upStarBase != null) {
    teamPlayerList.upStarBase = upStarBase;
  }
  return teamPlayerList;
}

Map<String, dynamic> $TeamPlayerListToJson(TeamPlayerList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buyPrice'] = entity.buyPrice;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['uuid'] = entity.uuid;
  data['playerReadiness'] = entity.playerReadiness;
  data['gradeExp'] = entity.gradeExp;
  data['fromType'] = entity.fromType;
  data['createTime'] = entity.createTime;
  data['playerGrade'] = entity.playerGrade;
  data['teamId'] = entity.teamId;
  data['id'] = entity.id;
  data['position'] = entity.position;
  data['power'] = entity.power;
  data['playerStatus'] = entity.playerStatus;
  data['potential'] = entity.potential.toJson();
  data['bindStatus'] = entity.bindStatus;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['playerId'] = entity.playerId;
  data['upStarBase'] = entity.upStarBase.toJson();
  return data;
}

extension TeamPlayerListExtension on TeamPlayerList {
  TeamPlayerList copyWith({
    int? buyPrice,
    int? buyPlayerScore,
    int? updateTime,
    String? uuid,
    double? playerReadiness,
    int? gradeExp,
    int? fromType,
    int? createTime,
    int? playerGrade,
    int? teamId,
    int? id,
    int? position,
    int? power,
    int? playerStatus,
    Potential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    UpStarBase? upStarBase,
  }) {
    return TeamPlayerList()
      ..buyPrice = buyPrice ?? this.buyPrice
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..uuid = uuid ?? this.uuid
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..gradeExp = gradeExp ?? this.gradeExp
      ..fromType = fromType ?? this.fromType
      ..createTime = createTime ?? this.createTime
      ..playerGrade = playerGrade ?? this.playerGrade
      ..teamId = teamId ?? this.teamId
      ..id = id ?? this.id
      ..position = position ?? this.position
      ..power = power ?? this.power
      ..playerStatus = playerStatus ?? this.playerStatus
      ..potential = potential ?? this.potential
      ..bindStatus = bindStatus ?? this.bindStatus
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase;
  }
}

Potential $PotentialFromJson(Map<String, dynamic> json) {
  final Potential potential = Potential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    potential.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    potential.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    potential.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    potential.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    potential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    potential.reb = reb;
  }
  return potential;
}

Map<String, dynamic> $PotentialToJson(Potential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension PotentialExtension on Potential {
  Potential copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return Potential()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

UpStarBase $UpStarBaseFromJson(Map<String, dynamic> json) {
  final UpStarBase upStarBase = UpStarBase();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    upStarBase.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    upStarBase.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    upStarBase.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    upStarBase.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    upStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    upStarBase.reb = reb;
  }
  return upStarBase;
}

Map<String, dynamic> $UpStarBaseToJson(UpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStarBaseExtension on UpStarBase {
  UpStarBase copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return UpStarBase()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

BattleTeam $BattleTeamFromJson(Map<String, dynamic> json) {
  final BattleTeam battleTeam = BattleTeam();
  final int? joinLeagueTime = jsonConvert.convert<int>(json['joinLeagueTime']);
  if (joinLeagueTime != null) {
    battleTeam.joinLeagueTime = joinLeagueTime;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    battleTeam.teamName = teamName;
  }
  final int? leagueRole = jsonConvert.convert<int>(json['leagueRole']);
  if (leagueRole != null) {
    battleTeam.leagueRole = leagueRole;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    battleTeam.salary = salary;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    battleTeam.serverId = serverId;
  }
  final int? totalOnlineTime = jsonConvert.convert<int>(
      json['totalOnlineTime']);
  if (totalOnlineTime != null) {
    battleTeam.totalOnlineTime = totalOnlineTime;
  }
  final String? leagueName = jsonConvert.convert<String>(json['leagueName']);
  if (leagueName != null) {
    battleTeam.leagueName = leagueName;
  }
  final int? leagueId = jsonConvert.convert<int>(json['leagueId']);
  if (leagueId != null) {
    battleTeam.leagueId = leagueId;
  }
  final int? maxGuessWinningStreak = jsonConvert.convert<int>(
      json['maxGuessWinningStreak']);
  if (maxGuessWinningStreak != null) {
    battleTeam.maxGuessWinningStreak = maxGuessWinningStreak;
  }
  final int? totalLoginDays = jsonConvert.convert<int>(json['totalLoginDays']);
  if (totalLoginDays != null) {
    battleTeam.totalLoginDays = totalLoginDays;
  }
  final int? dailyLeagueContributValue = jsonConvert.convert<int>(
      json['dailyLeagueContributValue']);
  if (dailyLeagueContributValue != null) {
    battleTeam.dailyLeagueContributValue = dailyLeagueContributValue;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    battleTeam.teamLogo = teamLogo;
  }
  final int? powerReplyTime = jsonConvert.convert<int>(json['powerReplyTime']);
  if (powerReplyTime != null) {
    battleTeam.powerReplyTime = powerReplyTime;
  }
  final int? currentGuessWinningStreak = jsonConvert.convert<int>(
      json['currentGuessWinningStreak']);
  if (currentGuessWinningStreak != null) {
    battleTeam.currentGuessWinningStreak = currentGuessWinningStreak;
  }
  final int? currentGameWinningStreak = jsonConvert.convert<int>(
      json['currentGameWinningStreak']);
  if (currentGameWinningStreak != null) {
    battleTeam.currentGameWinningStreak = currentGameWinningStreak;
  }
  final int? playerReadiness = jsonConvert.convert<int>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    battleTeam.playerReadiness = playerReadiness;
  }
  final int? accountId = jsonConvert.convert<int>(json['accountId']);
  if (accountId != null) {
    battleTeam.accountId = accountId;
  }
  final int? maxCup = jsonConvert.convert<int>(json['maxCup']);
  if (maxCup != null) {
    battleTeam.maxCup = maxCup;
  }
  final int? firstLoginTime = jsonConvert.convert<int>(json['firstLoginTime']);
  if (firstLoginTime != null) {
    battleTeam.firstLoginTime = firstLoginTime;
  }
  final int? secretaryId = jsonConvert.convert<int>(json['secretaryId']);
  if (secretaryId != null) {
    battleTeam.secretaryId = secretaryId;
  }
  final int? teamExp = jsonConvert.convert<int>(json['teamExp']);
  if (teamExp != null) {
    battleTeam.teamExp = teamExp;
  }
  final Preference? teamPreference = jsonConvert.convert<Preference>(
      json['teamPreference']);
  if (teamPreference != null) {
    battleTeam.teamPreference = teamPreference;
  }
  final int? logoBoxId = jsonConvert.convert<int>(json['logoBoxId']);
  if (logoBoxId != null) {
    battleTeam.logoBoxId = logoBoxId;
  }
  final int? lastOffLineTime = jsonConvert.convert<int>(
      json['lastOffLineTime']);
  if (lastOffLineTime != null) {
    battleTeam.lastOffLineTime = lastOffLineTime;
  }
  final int? beforeGuessWinningStreak = jsonConvert.convert<int>(
      json['beforeGuessWinningStreak']);
  if (beforeGuessWinningStreak != null) {
    battleTeam.beforeGuessWinningStreak = beforeGuessWinningStreak;
  }
  final int? totalChargeNum = jsonConvert.convert<int>(json['totalChargeNum']);
  if (totalChargeNum != null) {
    battleTeam.totalChargeNum = totalChargeNum;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    battleTeam.cup = cup;
  }
  final int? helpStep = jsonConvert.convert<int>(json['helpStep']);
  if (helpStep != null) {
    battleTeam.helpStep = helpStep;
  }
  final String? createIp = jsonConvert.convert<String>(json['createIp']);
  if (createIp != null) {
    battleTeam.createIp = createIp;
  }
  final int? totalGames = jsonConvert.convert<int>(json['totalGames']);
  if (totalGames != null) {
    battleTeam.totalGames = totalGames;
  }
  final String? accountName = jsonConvert.convert<String>(json['accountName']);
  if (accountName != null) {
    battleTeam.accountName = accountName;
  }
  final String? signature = jsonConvert.convert<String>(json['signature']);
  if (signature != null) {
    battleTeam.signature = signature;
  }
  final int? teamGrade = jsonConvert.convert<int>(json['teamGrade']);
  if (teamGrade != null) {
    battleTeam.teamGrade = teamGrade;
  }
  final int? businessCardId = jsonConvert.convert<int>(json['businessCardId']);
  if (businessCardId != null) {
    battleTeam.businessCardId = businessCardId;
  }
  final String? lastLoginIp = jsonConvert.convert<String>(json['lastLoginIp']);
  if (lastLoginIp != null) {
    battleTeam.lastLoginIp = lastLoginIp;
  }
  final int? vipGrade = jsonConvert.convert<int>(json['vipGrade']);
  if (vipGrade != null) {
    battleTeam.vipGrade = vipGrade;
  }
  final int? leagueContributValue = jsonConvert.convert<int>(
      json['leagueContributValue']);
  if (leagueContributValue != null) {
    battleTeam.leagueContributValue = leagueContributValue;
  }
  final int? maxGameWinningStreak = jsonConvert.convert<int>(
      json['maxGameWinningStreak']);
  if (maxGameWinningStreak != null) {
    battleTeam.maxGameWinningStreak = maxGameWinningStreak;
  }
  final int? cupRankId = jsonConvert.convert<int>(json['cupRankId']);
  if (cupRankId != null) {
    battleTeam.cupRankId = cupRankId;
  }
  final int? serviceId = jsonConvert.convert<int>(json['serviceId']);
  if (serviceId != null) {
    battleTeam.serviceId = serviceId;
  }
  final int? unforBidTime = jsonConvert.convert<int>(json['unforBidTime']);
  if (unforBidTime != null) {
    battleTeam.unforBidTime = unforBidTime;
  }
  final int? currentWinGames = jsonConvert.convert<int>(
      json['currentWinGames']);
  if (currentWinGames != null) {
    battleTeam.currentWinGames = currentWinGames;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    battleTeam.updateTime = updateTime;
  }
  final int? currentContinuousLoss = jsonConvert.convert<int>(
      json['currentContinuousLoss']);
  if (currentContinuousLoss != null) {
    battleTeam.currentContinuousLoss = currentContinuousLoss;
  }
  final String? systemSteps = jsonConvert.convert<String>(json['systemSteps']);
  if (systemSteps != null) {
    battleTeam.systemSteps = systemSteps;
  }
  final int? lastLoginTime = jsonConvert.convert<int>(json['lastLoginTime']);
  if (lastLoginTime != null) {
    battleTeam.lastLoginTime = lastLoginTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    battleTeam.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    battleTeam.teamId = teamId;
  }
  final int? currTeamStrength = jsonConvert.convert<int>(
      json['currTeamStrength']);
  if (currTeamStrength != null) {
    battleTeam.currTeamStrength = currTeamStrength;
  }
  final bool? online = jsonConvert.convert<bool>(json['online']);
  if (online != null) {
    battleTeam.online = online;
  }
  final int? wearNicknameId = jsonConvert.convert<int>(json['wearNicknameId']);
  if (wearNicknameId != null) {
    battleTeam.wearNicknameId = wearNicknameId;
  }
  final int? lastAreaId = jsonConvert.convert<int>(json['lastAreaId']);
  if (lastAreaId != null) {
    battleTeam.lastAreaId = lastAreaId;
  }
  final int? gameWinRate = jsonConvert.convert<int>(json['gameWinRate']);
  if (gameWinRate != null) {
    battleTeam.gameWinRate = gameWinRate;
  }
  final int? benchCount = jsonConvert.convert<int>(json['benchCount']);
  if (benchCount != null) {
    battleTeam.benchCount = benchCount;
  }
  final int? rankProtect = jsonConvert.convert<int>(json['rankProtect']);
  if (rankProtect != null) {
    battleTeam.rankProtect = rankProtect;
  }
  return battleTeam;
}

Map<String, dynamic> $BattleTeamToJson(BattleTeam entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['joinLeagueTime'] = entity.joinLeagueTime;
  data['teamName'] = entity.teamName;
  data['leagueRole'] = entity.leagueRole;
  data['salary'] = entity.salary;
  data['serverId'] = entity.serverId;
  data['totalOnlineTime'] = entity.totalOnlineTime;
  data['leagueName'] = entity.leagueName;
  data['leagueId'] = entity.leagueId;
  data['maxGuessWinningStreak'] = entity.maxGuessWinningStreak;
  data['totalLoginDays'] = entity.totalLoginDays;
  data['dailyLeagueContributValue'] = entity.dailyLeagueContributValue;
  data['teamLogo'] = entity.teamLogo;
  data['powerReplyTime'] = entity.powerReplyTime;
  data['currentGuessWinningStreak'] = entity.currentGuessWinningStreak;
  data['currentGameWinningStreak'] = entity.currentGameWinningStreak;
  data['playerReadiness'] = entity.playerReadiness;
  data['accountId'] = entity.accountId;
  data['maxCup'] = entity.maxCup;
  data['firstLoginTime'] = entity.firstLoginTime;
  data['secretaryId'] = entity.secretaryId;
  data['teamExp'] = entity.teamExp;
  data['teamPreference'] = entity.teamPreference.toJson();
  data['logoBoxId'] = entity.logoBoxId;
  data['lastOffLineTime'] = entity.lastOffLineTime;
  data['beforeGuessWinningStreak'] = entity.beforeGuessWinningStreak;
  data['totalChargeNum'] = entity.totalChargeNum;
  data['cup'] = entity.cup;
  data['helpStep'] = entity.helpStep;
  data['createIp'] = entity.createIp;
  data['totalGames'] = entity.totalGames;
  data['accountName'] = entity.accountName;
  data['signature'] = entity.signature;
  data['teamGrade'] = entity.teamGrade;
  data['businessCardId'] = entity.businessCardId;
  data['lastLoginIp'] = entity.lastLoginIp;
  data['vipGrade'] = entity.vipGrade;
  data['leagueContributValue'] = entity.leagueContributValue;
  data['maxGameWinningStreak'] = entity.maxGameWinningStreak;
  data['cupRankId'] = entity.cupRankId;
  data['serviceId'] = entity.serviceId;
  data['unforBidTime'] = entity.unforBidTime;
  data['currentWinGames'] = entity.currentWinGames;
  data['updateTime'] = entity.updateTime;
  data['currentContinuousLoss'] = entity.currentContinuousLoss;
  data['systemSteps'] = entity.systemSteps;
  data['lastLoginTime'] = entity.lastLoginTime;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['currTeamStrength'] = entity.currTeamStrength;
  data['online'] = entity.online;
  data['wearNicknameId'] = entity.wearNicknameId;
  data['lastAreaId'] = entity.lastAreaId;
  data['gameWinRate'] = entity.gameWinRate;
  data['benchCount'] = entity.benchCount;
  data['rankProtect'] = entity.rankProtect;
  return data;
}

extension BattleTeamExtension on BattleTeam {
  BattleTeam copyWith({
    int? joinLeagueTime,
    String? teamName,
    int? leagueRole,
    int? salary,
    String? serverId,
    int? totalOnlineTime,
    String? leagueName,
    int? leagueId,
    int? maxGuessWinningStreak,
    int? totalLoginDays,
    int? dailyLeagueContributValue,
    int? teamLogo,
    int? powerReplyTime,
    int? currentGuessWinningStreak,
    int? currentGameWinningStreak,
    int? playerReadiness,
    int? accountId,
    int? maxCup,
    int? firstLoginTime,
    int? secretaryId,
    int? teamExp,
    Preference? teamPreference,
    int? logoBoxId,
    int? lastOffLineTime,
    int? beforeGuessWinningStreak,
    int? totalChargeNum,
    int? cup,
    int? helpStep,
    String? createIp,
    int? totalGames,
    String? accountName,
    String? signature,
    int? teamGrade,
    int? businessCardId,
    String? lastLoginIp,
    int? vipGrade,
    int? leagueContributValue,
    int? maxGameWinningStreak,
    int? cupRankId,
    int? serviceId,
    int? unforBidTime,
    int? currentWinGames,
    int? updateTime,
    int? currentContinuousLoss,
    String? systemSteps,
    int? lastLoginTime,
    int? createTime,
    int? teamId,
    int? currTeamStrength,
    bool? online,
    int? wearNicknameId,
    int? lastAreaId,
    int? gameWinRate,
    int? benchCount,
    int? rankProtect,
  }) {
    return BattleTeam()
      ..joinLeagueTime = joinLeagueTime ?? this.joinLeagueTime
      ..teamName = teamName ?? this.teamName
      ..leagueRole = leagueRole ?? this.leagueRole
      ..salary = salary ?? this.salary
      ..serverId = serverId ?? this.serverId
      ..totalOnlineTime = totalOnlineTime ?? this.totalOnlineTime
      ..leagueName = leagueName ?? this.leagueName
      ..leagueId = leagueId ?? this.leagueId
      ..maxGuessWinningStreak = maxGuessWinningStreak ??
          this.maxGuessWinningStreak
      ..totalLoginDays = totalLoginDays ?? this.totalLoginDays
      ..dailyLeagueContributValue = dailyLeagueContributValue ??
          this.dailyLeagueContributValue
      ..teamLogo = teamLogo ?? this.teamLogo
      ..powerReplyTime = powerReplyTime ?? this.powerReplyTime
      ..currentGuessWinningStreak = currentGuessWinningStreak ??
          this.currentGuessWinningStreak
      ..currentGameWinningStreak = currentGameWinningStreak ??
          this.currentGameWinningStreak
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..accountId = accountId ?? this.accountId
      ..maxCup = maxCup ?? this.maxCup
      ..firstLoginTime = firstLoginTime ?? this.firstLoginTime
      ..secretaryId = secretaryId ?? this.secretaryId
      ..teamExp = teamExp ?? this.teamExp
      ..teamPreference = teamPreference ?? this.teamPreference
      ..logoBoxId = logoBoxId ?? this.logoBoxId
      ..lastOffLineTime = lastOffLineTime ?? this.lastOffLineTime
      ..beforeGuessWinningStreak = beforeGuessWinningStreak ??
          this.beforeGuessWinningStreak
      ..totalChargeNum = totalChargeNum ?? this.totalChargeNum
      ..cup = cup ?? this.cup
      ..helpStep = helpStep ?? this.helpStep
      ..createIp = createIp ?? this.createIp
      ..totalGames = totalGames ?? this.totalGames
      ..accountName = accountName ?? this.accountName
      ..signature = signature ?? this.signature
      ..teamGrade = teamGrade ?? this.teamGrade
      ..businessCardId = businessCardId ?? this.businessCardId
      ..lastLoginIp = lastLoginIp ?? this.lastLoginIp
      ..vipGrade = vipGrade ?? this.vipGrade
      ..leagueContributValue = leagueContributValue ?? this.leagueContributValue
      ..maxGameWinningStreak = maxGameWinningStreak ?? this.maxGameWinningStreak
      ..cupRankId = cupRankId ?? this.cupRankId
      ..serviceId = serviceId ?? this.serviceId
      ..unforBidTime = unforBidTime ?? this.unforBidTime
      ..currentWinGames = currentWinGames ?? this.currentWinGames
      ..updateTime = updateTime ?? this.updateTime
      ..currentContinuousLoss = currentContinuousLoss ??
          this.currentContinuousLoss
      ..systemSteps = systemSteps ?? this.systemSteps
      ..lastLoginTime = lastLoginTime ?? this.lastLoginTime
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..currTeamStrength = currTeamStrength ?? this.currTeamStrength
      ..online = online ?? this.online
      ..wearNicknameId = wearNicknameId ?? this.wearNicknameId
      ..lastAreaId = lastAreaId ?? this.lastAreaId
      ..gameWinRate = gameWinRate ?? this.gameWinRate
      ..benchCount = benchCount ?? this.benchCount
      ..rankProtect = rankProtect ?? this.rankProtect;
  }
}

Preference $PreferenceFromJson(Map<String, dynamic> json) {
  final Preference preference = Preference();
  final int? speakOpenTime = jsonConvert.convert<int>(json['speakOpenTime']);
  if (speakOpenTime != null) {
    preference.speakOpenTime = speakOpenTime;
  }
  final bool? startFirstQuarter = jsonConvert.convert<bool>(
      json['startFirstQuarter']);
  if (startFirstQuarter != null) {
    preference.startFirstQuarter = startFirstQuarter;
  }
  final bool? closeFriendlyMessage = jsonConvert.convert<bool>(
      json['closeFriendlyMessage']);
  if (closeFriendlyMessage != null) {
    preference.closeFriendlyMessage = closeFriendlyMessage;
  }
  final bool? changeTactics = jsonConvert.convert<bool>(json['changeTactics']);
  if (changeTactics != null) {
    preference.changeTactics = changeTactics;
  }
  final bool? closeGuessStartRemind = jsonConvert.convert<bool>(
      json['closeGuessStartRemind']);
  if (closeGuessStartRemind != null) {
    preference.closeGuessStartRemind = closeGuessStartRemind;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    preference.version = version;
  }
  final bool? closeGuessEndRemind = jsonConvert.convert<bool>(
      json['closeGuessEndRemind']);
  if (closeGuessEndRemind != null) {
    preference.closeGuessEndRemind = closeGuessEndRemind;
  }
  final int? gameSpeedIndex = jsonConvert.convert<int>(json['gameSpeedIndex']);
  if (gameSpeedIndex != null) {
    preference.gameSpeedIndex = gameSpeedIndex;
  }
  final bool? changePlayer = jsonConvert.convert<bool>(json['changePlayer']);
  if (changePlayer != null) {
    preference.changePlayer = changePlayer;
  }
  final bool? useSkill = jsonConvert.convert<bool>(json['useSkill']);
  if (useSkill != null) {
    preference.useSkill = useSkill;
  }
  final bool? closeFriendlyMatch = jsonConvert.convert<bool>(
      json['closeFriendlyMatch']);
  if (closeFriendlyMatch != null) {
    preference.closeFriendlyMatch = closeFriendlyMatch;
  }
  final int? musicEffectVolume = jsonConvert.convert<int>(
      json['musicEffectVolume']);
  if (musicEffectVolume != null) {
    preference.musicEffectVolume = musicEffectVolume;
  }
  final bool? closeSecondaryPass = jsonConvert.convert<bool>(
      json['closeSecondaryPass']);
  if (closeSecondaryPass != null) {
    preference.closeSecondaryPass = closeSecondaryPass;
  }
  final int? musicVolume = jsonConvert.convert<int>(json['musicVolume']);
  if (musicVolume != null) {
    preference.musicVolume = musicVolume;
  }
  return preference;
}

Map<String, dynamic> $PreferenceToJson(Preference entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['speakOpenTime'] = entity.speakOpenTime;
  data['startFirstQuarter'] = entity.startFirstQuarter;
  data['closeFriendlyMessage'] = entity.closeFriendlyMessage;
  data['changeTactics'] = entity.changeTactics;
  data['closeGuessStartRemind'] = entity.closeGuessStartRemind;
  data['version'] = entity.version;
  data['closeGuessEndRemind'] = entity.closeGuessEndRemind;
  data['gameSpeedIndex'] = entity.gameSpeedIndex;
  data['changePlayer'] = entity.changePlayer;
  data['useSkill'] = entity.useSkill;
  data['closeFriendlyMatch'] = entity.closeFriendlyMatch;
  data['musicEffectVolume'] = entity.musicEffectVolume;
  data['closeSecondaryPass'] = entity.closeSecondaryPass;
  data['musicVolume'] = entity.musicVolume;
  return data;
}

extension PreferenceExtension on Preference {
  Preference copyWith({
    int? speakOpenTime,
    bool? startFirstQuarter,
    bool? closeFriendlyMessage,
    bool? changeTactics,
    bool? closeGuessStartRemind,
    String? version,
    bool? closeGuessEndRemind,
    int? gameSpeedIndex,
    bool? changePlayer,
    bool? useSkill,
    bool? closeFriendlyMatch,
    int? musicEffectVolume,
    bool? closeSecondaryPass,
    int? musicVolume,
  }) {
    return Preference()
      ..speakOpenTime = speakOpenTime ?? this.speakOpenTime
      ..startFirstQuarter = startFirstQuarter ?? this.startFirstQuarter
      ..closeFriendlyMessage = closeFriendlyMessage ?? this.closeFriendlyMessage
      ..changeTactics = changeTactics ?? this.changeTactics
      ..closeGuessStartRemind = closeGuessStartRemind ??
          this.closeGuessStartRemind
      ..version = version ?? this.version
      ..closeGuessEndRemind = closeGuessEndRemind ?? this.closeGuessEndRemind
      ..gameSpeedIndex = gameSpeedIndex ?? this.gameSpeedIndex
      ..changePlayer = changePlayer ?? this.changePlayer
      ..useSkill = useSkill ?? this.useSkill
      ..closeFriendlyMatch = closeFriendlyMatch ?? this.closeFriendlyMatch
      ..musicEffectVolume = musicEffectVolume ?? this.musicEffectVolume
      ..closeSecondaryPass = closeSecondaryPass ?? this.closeSecondaryPass
      ..musicVolume = musicVolume ?? this.musicVolume;
  }
}

AbilityValue $AbilityValueFromJson(Map<String, dynamic> json) {
  final AbilityValue abilityValue = AbilityValue();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    abilityValue.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    abilityValue.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    abilityValue.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    abilityValue.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    abilityValue.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    abilityValue.reb = reb;
  }
  return abilityValue;
}

Map<String, dynamic> $AbilityValueToJson(AbilityValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension AbilityValueExtension on AbilityValue {
  AbilityValue copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return AbilityValue()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

BattleGameData $BattleGameDataFromJson(Map<String, dynamic> json) {
  final BattleGameData battleGameData = BattleGameData();
  final List<
      ScoreBoardDetails>? awayScoreBoardDetails = (json['awayScoreBoardDetails'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ScoreBoardDetails>(e) as ScoreBoardDetails)
      .toList();
  if (awayScoreBoardDetails != null) {
    battleGameData.awayScoreBoardDetails = awayScoreBoardDetails;
  }
  final ScoreBoard? homeScoreBoard = jsonConvert.convert<ScoreBoard>(
      json['homeScoreBoard']);
  if (homeScoreBoard != null) {
    battleGameData.homeScoreBoard = homeScoreBoard;
  }
  final List<
      ScoreBoardDetails>? homeScoreBoardDetails = (json['homeScoreBoardDetails'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ScoreBoardDetails>(e) as ScoreBoardDetails)
      .toList();
  if (homeScoreBoardDetails != null) {
    battleGameData.homeScoreBoardDetails = homeScoreBoardDetails;
  }
  final ScoreBoard? awayScoreBoard = jsonConvert.convert<ScoreBoard>(
      json['awayScoreBoard']);
  if (awayScoreBoard != null) {
    battleGameData.awayScoreBoard = awayScoreBoard;
  }
  final GameSchedule? gameSchedule = jsonConvert.convert<GameSchedule>(
      json['gameSchedule']);
  if (gameSchedule != null) {
    battleGameData.gameSchedule = gameSchedule;
  }
  final TestDataMap? testDataMap = jsonConvert.convert<TestDataMap>(
      json['testDataMap']);
  if (testDataMap != null) {
    battleGameData.testDataMap = testDataMap;
  }
  return battleGameData;
}

Map<String, dynamic> $BattleGameDataToJson(BattleGameData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayScoreBoardDetails'] =
      entity.awayScoreBoardDetails.map((v) => v.toJson()).toList();
  data['homeScoreBoard'] = entity.homeScoreBoard.toJson();
  data['homeScoreBoardDetails'] =
      entity.homeScoreBoardDetails.map((v) => v.toJson()).toList();
  data['awayScoreBoard'] = entity.awayScoreBoard.toJson();
  data['gameSchedule'] = entity.gameSchedule.toJson();
  data['testDataMap'] = entity.testDataMap.toJson();
  return data;
}

extension BattleGameDataExtension on BattleGameData {
  BattleGameData copyWith({
    List<ScoreBoardDetails>? awayScoreBoardDetails,
    ScoreBoard? homeScoreBoard,
    List<ScoreBoardDetails>? homeScoreBoardDetails,
    ScoreBoard? awayScoreBoard,
    GameSchedule? gameSchedule,
    TestDataMap? testDataMap,
  }) {
    return BattleGameData()
      ..awayScoreBoardDetails = awayScoreBoardDetails ??
          this.awayScoreBoardDetails
      ..homeScoreBoard = homeScoreBoard ?? this.homeScoreBoard
      ..homeScoreBoardDetails = homeScoreBoardDetails ??
          this.homeScoreBoardDetails
      ..awayScoreBoard = awayScoreBoard ?? this.awayScoreBoard
      ..gameSchedule = gameSchedule ?? this.gameSchedule
      ..testDataMap = testDataMap ?? this.testDataMap;
  }
}

ScoreBoardDetails $ScoreBoardDetailsFromJson(Map<String, dynamic> json) {
  final ScoreBoardDetails scoreBoardDetails = ScoreBoardDetails();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    scoreBoardDetails.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    scoreBoardDetails.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    scoreBoardDetails.dreb = dreb;
  }
  final int? starterPos = jsonConvert.convert<int>(json['starterPos']);
  if (starterPos != null) {
    scoreBoardDetails.starterPos = starterPos;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    scoreBoardDetails.fgm = fgm;
  }
  final int? ptsPoint = jsonConvert.convert<int>(json['ptsPoint']);
  if (ptsPoint != null) {
    scoreBoardDetails.ptsPoint = ptsPoint;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    scoreBoardDetails.reb = reb;
  }
  final int? mvpPoint = jsonConvert.convert<int>(json['mvpPoint']);
  if (mvpPoint != null) {
    scoreBoardDetails.mvpPoint = mvpPoint;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    scoreBoardDetails.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    scoreBoardDetails.min = min;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    scoreBoardDetails.property = property;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    scoreBoardDetails.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    scoreBoardDetails.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    scoreBoardDetails.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    scoreBoardDetails.gameId = gameId;
  }
  final int? astPoint = jsonConvert.convert<int>(json['astPoint']);
  if (astPoint != null) {
    scoreBoardDetails.astPoint = astPoint;
  }
  final bool? starter = jsonConvert.convert<bool>(json['starter']);
  if (starter != null) {
    scoreBoardDetails.starter = starter;
  }
  final int? blkPoint = jsonConvert.convert<int>(json['blkPoint']);
  if (blkPoint != null) {
    scoreBoardDetails.blkPoint = blkPoint;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    scoreBoardDetails.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    scoreBoardDetails.updateTime = updateTime;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    scoreBoardDetails.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    scoreBoardDetails.threePa = threePa;
  }
  final int? rebPoint = jsonConvert.convert<int>(json['rebPoint']);
  if (rebPoint != null) {
    scoreBoardDetails.rebPoint = rebPoint;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    scoreBoardDetails.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    scoreBoardDetails.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    scoreBoardDetails.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    scoreBoardDetails.teamId = teamId;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    scoreBoardDetails.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    scoreBoardDetails.to = to;
  }
  return scoreBoardDetails;
}

Map<String, dynamic> $ScoreBoardDetailsToJson(ScoreBoardDetails entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterPos'] = entity.starterPos;
  data['fgm'] = entity.fgm;
  data['ptsPoint'] = entity.ptsPoint;
  data['reb'] = entity.reb;
  data['mvpPoint'] = entity.mvpPoint;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['property'] = entity.property;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['astPoint'] = entity.astPoint;
  data['starter'] = entity.starter;
  data['blkPoint'] = entity.blkPoint;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['rebPoint'] = entity.rebPoint;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  return data;
}

extension ScoreBoardDetailsExtension on ScoreBoardDetails {
  ScoreBoardDetails copyWith({
    int? fga,
    int? ast,
    int? dreb,
    int? starterPos,
    int? fgm,
    int? ptsPoint,
    int? reb,
    int? mvpPoint,
    int? fta,
    int? min,
    int? property,
    int? ftm,
    int? playerId,
    int? blk,
    int? gameId,
    int? astPoint,
    bool? starter,
    int? blkPoint,
    int? stl,
    int? updateTime,
    int? pts,
    int? threePa,
    int? rebPoint,
    int? oreb,
    int? createTime,
    int? pf,
    int? teamId,
    int? threePm,
    int? to,
  }) {
    return ScoreBoardDetails()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterPos = starterPos ?? this.starterPos
      ..fgm = fgm ?? this.fgm
      ..ptsPoint = ptsPoint ?? this.ptsPoint
      ..reb = reb ?? this.reb
      ..mvpPoint = mvpPoint ?? this.mvpPoint
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..property = property ?? this.property
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..astPoint = astPoint ?? this.astPoint
      ..starter = starter ?? this.starter
      ..blkPoint = blkPoint ?? this.blkPoint
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..rebPoint = rebPoint ?? this.rebPoint
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to;
  }
}

ScoreBoard $ScoreBoardFromJson(Map<String, dynamic> json) {
  final ScoreBoard scoreBoard = ScoreBoard();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    scoreBoard.gameId = gameId;
  }
  final int? quarter1 = jsonConvert.convert<int>(json['quarter1']);
  if (quarter1 != null) {
    scoreBoard.quarter1 = quarter1;
  }
  final int? quarter2 = jsonConvert.convert<int>(json['quarter2']);
  if (quarter2 != null) {
    scoreBoard.quarter2 = quarter2;
  }
  final int? quarter3 = jsonConvert.convert<int>(json['quarter3']);
  if (quarter3 != null) {
    scoreBoard.quarter3 = quarter3;
  }
  final int? quarter4 = jsonConvert.convert<int>(json['quarter4']);
  if (quarter4 != null) {
    scoreBoard.quarter4 = quarter4;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    scoreBoard.updateTime = updateTime;
  }
  final int? ot2 = jsonConvert.convert<int>(json['ot2']);
  if (ot2 != null) {
    scoreBoard.ot2 = ot2;
  }
  final int? ot1 = jsonConvert.convert<int>(json['ot1']);
  if (ot1 != null) {
    scoreBoard.ot1 = ot1;
  }
  final int? ot4 = jsonConvert.convert<int>(json['ot4']);
  if (ot4 != null) {
    scoreBoard.ot4 = ot4;
  }
  final int? ot3 = jsonConvert.convert<int>(json['ot3']);
  if (ot3 != null) {
    scoreBoard.ot3 = ot3;
  }
  final int? ot6 = jsonConvert.convert<int>(json['ot6']);
  if (ot6 != null) {
    scoreBoard.ot6 = ot6;
  }
  final int? ot5 = jsonConvert.convert<int>(json['ot5']);
  if (ot5 != null) {
    scoreBoard.ot5 = ot5;
  }
  final int? ot8 = jsonConvert.convert<int>(json['ot8']);
  if (ot8 != null) {
    scoreBoard.ot8 = ot8;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    scoreBoard.total = total;
  }
  final int? ot7 = jsonConvert.convert<int>(json['ot7']);
  if (ot7 != null) {
    scoreBoard.ot7 = ot7;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    scoreBoard.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    scoreBoard.teamId = teamId;
  }
  return scoreBoard;
}

Map<String, dynamic> $ScoreBoardToJson(ScoreBoard entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['quarter1'] = entity.quarter1;
  data['quarter2'] = entity.quarter2;
  data['quarter3'] = entity.quarter3;
  data['quarter4'] = entity.quarter4;
  data['updateTime'] = entity.updateTime;
  data['ot2'] = entity.ot2;
  data['ot1'] = entity.ot1;
  data['ot4'] = entity.ot4;
  data['ot3'] = entity.ot3;
  data['ot6'] = entity.ot6;
  data['ot5'] = entity.ot5;
  data['ot8'] = entity.ot8;
  data['total'] = entity.total;
  data['ot7'] = entity.ot7;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  return data;
}

extension ScoreBoardExtension on ScoreBoard {
  ScoreBoard copyWith({
    int? gameId,
    int? quarter1,
    int? quarter2,
    int? quarter3,
    int? quarter4,
    int? updateTime,
    int? ot2,
    int? ot1,
    int? ot4,
    int? ot3,
    int? ot6,
    int? ot5,
    int? ot8,
    int? total,
    int? ot7,
    int? createTime,
    int? teamId,
  }) {
    return ScoreBoard()
      ..gameId = gameId ?? this.gameId
      ..quarter1 = quarter1 ?? this.quarter1
      ..quarter2 = quarter2 ?? this.quarter2
      ..quarter3 = quarter3 ?? this.quarter3
      ..quarter4 = quarter4 ?? this.quarter4
      ..updateTime = updateTime ?? this.updateTime
      ..ot2 = ot2 ?? this.ot2
      ..ot1 = ot1 ?? this.ot1
      ..ot4 = ot4 ?? this.ot4
      ..ot3 = ot3 ?? this.ot3
      ..ot6 = ot6 ?? this.ot6
      ..ot5 = ot5 ?? this.ot5
      ..ot8 = ot8 ?? this.ot8
      ..total = total ?? this.total
      ..ot7 = ot7 ?? this.ot7
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId;
  }
}

GameSchedule $GameScheduleFromJson(Map<String, dynamic> json) {
  final GameSchedule gameSchedule = GameSchedule();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameSchedule.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    gameSchedule.gameType = gameType;
  }
  final int? homeScore = jsonConvert.convert<int>(json['homeScore']);
  if (homeScore != null) {
    gameSchedule.homeScore = homeScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameSchedule.updateTime = updateTime;
  }
  final int? awayScore = jsonConvert.convert<int>(json['awayScore']);
  if (awayScore != null) {
    gameSchedule.awayScore = awayScore;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameSchedule.createTime = createTime;
  }
  final String? awayTeamName = jsonConvert.convert<String>(
      json['awayTeamName']);
  if (awayTeamName != null) {
    gameSchedule.awayTeamName = awayTeamName;
  }
  final int? homeLeagueId = jsonConvert.convert<int>(json['homeLeagueId']);
  if (homeLeagueId != null) {
    gameSchedule.homeLeagueId = homeLeagueId;
  }
  final int? awayLeagueId = jsonConvert.convert<int>(json['awayLeagueId']);
  if (awayLeagueId != null) {
    gameSchedule.awayLeagueId = awayLeagueId;
  }
  final int? awayTeamLogo = jsonConvert.convert<int>(json['awayTeamLogo']);
  if (awayTeamLogo != null) {
    gameSchedule.awayTeamLogo = awayTeamLogo;
  }
  final int? homeTeamLogo = jsonConvert.convert<int>(json['homeTeamLogo']);
  if (homeTeamLogo != null) {
    gameSchedule.homeTeamLogo = homeTeamLogo;
  }
  final String? homeTeamName = jsonConvert.convert<String>(
      json['homeTeamName']);
  if (homeTeamName != null) {
    gameSchedule.homeTeamName = homeTeamName;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    gameSchedule.homeTeamId = homeTeamId;
  }
  final String? awayLeagueName = jsonConvert.convert<String>(
      json['awayLeagueName']);
  if (awayLeagueName != null) {
    gameSchedule.awayLeagueName = awayLeagueName;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    gameSchedule.awayTeamId = awayTeamId;
  }
  final String? homeLeagueName = jsonConvert.convert<String>(
      json['homeLeagueName']);
  if (homeLeagueName != null) {
    gameSchedule.homeLeagueName = homeLeagueName;
  }
  return gameSchedule;
}

Map<String, dynamic> $GameScheduleToJson(GameSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['homeScore'] = entity.homeScore;
  data['updateTime'] = entity.updateTime;
  data['awayScore'] = entity.awayScore;
  data['createTime'] = entity.createTime;
  data['awayTeamName'] = entity.awayTeamName;
  data['homeLeagueId'] = entity.homeLeagueId;
  data['awayLeagueId'] = entity.awayLeagueId;
  data['awayTeamLogo'] = entity.awayTeamLogo;
  data['homeTeamLogo'] = entity.homeTeamLogo;
  data['homeTeamName'] = entity.homeTeamName;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayLeagueName'] = entity.awayLeagueName;
  data['awayTeamId'] = entity.awayTeamId;
  data['homeLeagueName'] = entity.homeLeagueName;
  return data;
}

extension GameScheduleExtension on GameSchedule {
  GameSchedule copyWith({
    int? gameId,
    int? gameType,
    int? homeScore,
    int? updateTime,
    int? awayScore,
    int? createTime,
    String? awayTeamName,
    int? homeLeagueId,
    int? awayLeagueId,
    int? awayTeamLogo,
    int? homeTeamLogo,
    String? homeTeamName,
    int? homeTeamId,
    String? awayLeagueName,
    int? awayTeamId,
    String? homeLeagueName,
  }) {
    return GameSchedule()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..homeScore = homeScore ?? this.homeScore
      ..updateTime = updateTime ?? this.updateTime
      ..awayScore = awayScore ?? this.awayScore
      ..createTime = createTime ?? this.createTime
      ..awayTeamName = awayTeamName ?? this.awayTeamName
      ..homeLeagueId = homeLeagueId ?? this.homeLeagueId
      ..awayLeagueId = awayLeagueId ?? this.awayLeagueId
      ..awayTeamLogo = awayTeamLogo ?? this.awayTeamLogo
      ..homeTeamLogo = homeTeamLogo ?? this.homeTeamLogo
      ..homeTeamName = homeTeamName ?? this.homeTeamName
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayLeagueName = awayLeagueName ?? this.awayLeagueName
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..homeLeagueName = homeLeagueName ?? this.homeLeagueName;
  }
}

TestDataMap $TestDataMapFromJson(Map<String, dynamic> json) {
  final TestDataMap testDataMap = TestDataMap();
  final String? awayTotalAttackRound = jsonConvert.convert<String>(
      json['awayTotalAttackRound']);
  if (awayTotalAttackRound != null) {
    testDataMap.awayTotalAttackRound = awayTotalAttackRound;
  }
  final String? awayAttackCap = jsonConvert.convert<String>(
      json['awayAttackCap']);
  if (awayAttackCap != null) {
    testDataMap.awayAttackCap = awayAttackCap;
  }
  final String? awayDefenseCap = jsonConvert.convert<String>(
      json['awayDefenseCap']);
  if (awayDefenseCap != null) {
    testDataMap.awayDefenseCap = awayDefenseCap;
  }
  final String? homeRound = jsonConvert.convert<String>(json['homeRound']);
  if (homeRound != null) {
    testDataMap.homeRound = homeRound;
  }
  final String? awayRound = jsonConvert.convert<String>(json['awayRound']);
  if (awayRound != null) {
    testDataMap.awayRound = awayRound;
  }
  final String? homeAttackCap = jsonConvert.convert<String>(
      json['homeAttackCap']);
  if (homeAttackCap != null) {
    testDataMap.homeAttackCap = homeAttackCap;
  }
  final String? homeTotalAttackRound = jsonConvert.convert<String>(
      json['homeTotalAttackRound']);
  if (homeTotalAttackRound != null) {
    testDataMap.homeTotalAttackRound = homeTotalAttackRound;
  }
  final String? homeDefenseCap = jsonConvert.convert<String>(
      json['homeDefenseCap']);
  if (homeDefenseCap != null) {
    testDataMap.homeDefenseCap = homeDefenseCap;
  }
  return testDataMap;
}

Map<String, dynamic> $TestDataMapToJson(TestDataMap entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTotalAttackRound'] = entity.awayTotalAttackRound;
  data['awayAttackCap'] = entity.awayAttackCap;
  data['awayDefenseCap'] = entity.awayDefenseCap;
  data['homeRound'] = entity.homeRound;
  data['awayRound'] = entity.awayRound;
  data['homeAttackCap'] = entity.homeAttackCap;
  data['homeTotalAttackRound'] = entity.homeTotalAttackRound;
  data['homeDefenseCap'] = entity.homeDefenseCap;
  return data;
}

extension TestDataMapExtension on TestDataMap {
  TestDataMap copyWith({
    String? awayTotalAttackRound,
    String? awayAttackCap,
    String? awayDefenseCap,
    String? homeRound,
    String? awayRound,
    String? homeAttackCap,
    String? homeTotalAttackRound,
    String? homeDefenseCap,
  }) {
    return TestDataMap()
      ..awayTotalAttackRound = awayTotalAttackRound ?? this.awayTotalAttackRound
      ..awayAttackCap = awayAttackCap ?? this.awayAttackCap
      ..awayDefenseCap = awayDefenseCap ?? this.awayDefenseCap
      ..homeRound = homeRound ?? this.homeRound
      ..awayRound = awayRound ?? this.awayRound
      ..homeAttackCap = homeAttackCap ?? this.homeAttackCap
      ..homeTotalAttackRound = homeTotalAttackRound ?? this.homeTotalAttackRound
      ..homeDefenseCap = homeDefenseCap ?? this.homeDefenseCap;
  }
}