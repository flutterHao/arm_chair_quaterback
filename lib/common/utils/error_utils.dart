/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-26 18:42:28
 * @LastEditTime: 2025-01-08 14:54:28
 */
import 'dart:convert';

import 'package:arm_chair_quaterback/common/entities/api_error_code_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/base/error_entity.dart';
import 'package:arm_chair_quaterback/common/net/base/result_entity.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/18/11:53

class ErrorUtils {
  static void toast(dynamic e) {
    var str = _DEFAULTERRORSTRING;
    if (e is DioException) {
      if (!kReleaseMode) {
        print('$e\n${e.stackTrace}');
      }
      var result = _getResultByDioException(e);
      str = _getErrorDesc((result?.code ?? -1).toString());
    } else if (e is Map) {
      var result = _getResultByMap(e);
      str = _getErrorDesc((result?.code ?? -1).toString());
    }
    EasyLoading.showToast(str);
    Log.e(e.toString());
  }

  static Result? _getResultByDioException(DioException e) {
    try {
      var data = e.response?.data is String
          ? json.decode(e.response?.data)
          : e.response?.data;
      return Result.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  static Result? _getResultByMap(Map e) {
    try {
      return Result.fromJson(e as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  static String _getErrorDesc(String errorCode,
      {String language = "en",
      String defaultErrorString = _DEFAULTERRORSTRING}) {
    var firstWhereOrNull =
        CacheApi.apiErrorCode?.firstWhereOrNull((e) => e.id == errorCode);
    firstWhereOrNull ??= ((jsonDecode(_defaultErrorCodeJsonString) as List)
            .map((e) => ApiErrorCodeEntity.fromJson(e)))
        .toList()
        .firstWhereOrNull((e) => e.id == errorCode);
    if (firstWhereOrNull != null) {
      switch (language) {
        case "en":
          return firstWhereOrNull.enDesc;
        case "zh":
          return firstWhereOrNull.desc;
        default:
          return firstWhereOrNull.enDesc;
      }
    }
    return defaultErrorString;
  }

  static const String _DEFAULTERRORSTRING = "SERVER ERROR";

  static const String _defaultErrorCodeJsonString = '''[
	{
		"desc": "帐号数据错误",
		"enDesc": "Account data error",
		"id": "100000"
	},
	{
		"desc": "账号已使用过识别码",
		"enDesc": "Account already taken verification code",
		"id": "100011"
	},
	{
		"desc": "识别码不存在",
		"enDesc": "verification code does not exist",
		"id": "100012"
	},
	{
		"desc": "不能重复绑定邀请码",
		"enDesc": "verification code is used",
		"id": "100004"
	},
	{
		"desc": "邀请码不存在",
		"enDesc": "invitation code does not exist",
		"id": "100005"
	},
	{
		"desc": "二级密码已锁定，请10分钟后再试",
		"enDesc": "Secondary password is locked. Please try again in 10 minutes",
		"id": "100006"
	},
	{
		"desc": "二级密码错误",
		"enDesc": "Secondary password error",
		"id": "100007"
	},
	{
		"desc": "你输入的旧二级密码错误",
		"enDesc": "Your old secondary password is incorrect",
		"id": "100008"
	},
	{
		"desc": "该平台已停止注册新号",
		"enDesc": "The platform has stopped registering new accounts.",
		"id": "100009"
	},
	{
		"desc": "涉嫌违规，帐号已被封停",
		"enDesc": "The account has been suspended for suspected violations.",
		"id": "100010"
	},
	{
		"desc": "道具数量不足",
		"enDesc": "Not enough resource.",
		"id": "110001"
	},
	{
		"desc": "球队正在比赛中",
		"enDesc": "The team is gaming",
		"id": "120002"
	},
	{
		"desc": "准备中",
		"enDesc": "Preparing",
		"id": "120003"
	},
	{
		"desc": "匹配中",
		"enDesc": "Matching.",
		"id": "120004"
	},
	{
		"desc": "比赛不存在",
		"enDesc": "The match does not exist.",
		"id": "120005"
	},
	{
		"desc": "比赛房间不存在",
		"enDesc": "The room does not exist.",
		"id": "120006"
	},
	{
		"desc": "比赛房间已满员",
		"enDesc": "The room is full.",
		"id": "120009"
	},
	{
		"desc": "战术点不足",
		"enDesc": "Not enough Tatics Points",
		"id": "120012"
	},
	{
		"desc": "更换战术过于频繁",
		"enDesc": "Changing tactics is too fast",
		"id": "120013"
	},
	{
		"desc": "PK球队不存在",
		"enDesc": "Team does not exist.",
		"id": "120014"
	},
	{
		"desc": "换人失败球星冷却时间未到",
		"enDesc": "Exchange player CD  has not arrived.",
		"id": "120015"
	},
	{
		"desc": "球队已报名连胜挑战赛",
		"enDesc": "The team has already signed up",
		"id": "120016"
	},
	{
		"desc": "现在不是报名时间",
		"enDesc": "The is not the registration time.",
		"id": "120023"
	},
	{
		"desc": "赛季已经报过名",
		"enDesc": "The season has already registered",
		"id": "120024"
	},
	{
		"desc": "赛季报名人数已达上限",
		"enDesc": "Registration has reached the limit",
		"id": "120025"
	},
	{
		"desc": "即时PK赛匹配中",
		"enDesc": "Online PK is matching",
		"id": "120026"
	},
	{
		"desc": "俱乐部争霸赛海选赛匹配中",
		"enDesc": "Club championship is matching",
		"id": "120027"
	},
	{
		"desc": "竞技赛匹配中",
		"enDesc": "Competitive match is matching",
		"id": "120028"
	},
	{
		"desc": "换人失败球星已6犯下场",
		"enDesc": "player with 6 fouls out of the game",
		"id": "120010"
	},
	{
		"desc": "挑战已结束",
		"enDesc": "The challenge has ended",
		"id": "120029"
	},
	{
		"desc": "对方球队正在比赛中",
		"enDesc": "The opposing team is in a match",
		"id": "120030"
	},
	{
		"desc": "球队超帽不能参加比赛",
		"enDesc": "The team's salary caps exceeded, cannot join the match",
		"id": "120031"
	},
	{
		"desc": "该比赛不能挑战",
		"enDesc": "The match cannot be challenged",
		"id": "120032"
	},
	{
		"desc": "禁止换人",
		"enDesc": "No substitutions allowed",
		"id": "120033"
	},
	{
		"desc": "禁止使用战术",
		"enDesc": "No tactics allowed",
		"id": "120034"
	},
	{
		"desc": "禁止使用教练技能",
		"enDesc": "No use of coach skills",
		"id": "120035"
	},
	{
		"desc": "该竞技赛房间不能助威",
		"enDesc": "The competitive match room cannot assist",
		"id": "120036"
	},
	{
		"desc": "巨星boss已被击败",
		"enDesc": "Boss defeated",
		"id": "120037"
	},
	{
		"desc": "球队已被击败",
		"enDesc": "The team has been defeated",
		"id": "120038"
	},
	{
		"desc": "竞拍的奖品不存在",
		"enDesc": "The prize from the auction does not exist",
		"id": "120039"
	},
	{
		"desc": "竞拍时间已过期",
		"enDesc": "Auction time has expired",
		"id": "120040"
	},
	{
		"desc": "球队正在进行考核赛",
		"enDesc": "The team is undergoing assessment",
		"id": "120041"
	},
	{
		"desc": "挑战时间未开始",
		"enDesc": "Challenge time has not started",
		"id": "120042"
	},
	{
		"desc": "跨服排位赛未开始",
		"enDesc": "The cross-server ranking has not started",
		"id": "120043"
	},
	{
		"desc": "该比赛不能快速结束比赛",
		"enDesc": "The match cannot be quickly ended",
		"id": "120045"
	},
	{
		"desc": "该位置已有球员",
		"enDesc": "There is a player in the position",
		"id": "120046"
	},
	{
		"desc": "行动力不足",
		"enDesc": "Insufficient action power",
		"id": "120048"
	},
	{
		"desc": "比赛中，稍后再试",
		"enDesc": "Try again later in the match",
		"id": "120049"
	},
	{
		"desc": "球馆不存在",
		"enDesc": "The match does not exist",
		"id": "120050"
	},
	{
		"desc": "邀请好友助威次数已达上限",
		"enDesc": "The limit for inviting friends to cheer has been reached",
		"id": "120051"
	},
	{
		"desc": "球队不存在",
		"enDesc": "The team does not exist",
		"id": "130000"
	},
	{
		"desc": "球队名称不符合要求",
		"enDesc": "The team name does not meet the requirements",
		"id": "130001"
	},
	{
		"desc": "参数错误",
		"enDesc": "Parameter error",
		"id": "130002"
	},
	{
		"desc": "该帐号已创建球队不能重复创建",
		"enDesc": "The account has already created a team",
		"id": "130003"
	},
	{
		"desc": "球队名已经存在",
		"enDesc": "The team name already exists",
		"id": "130004"
	},
	{
		"desc": "球队封号",
		"enDesc": "The team is banned",
		"id": "130005"
	},
	{
		"desc": "球队VIP等级不够",
		"enDesc": "VIP level of the team is not enough",
		"id": "130006"
	},
	{
		"desc": "球队等级不够",
		"enDesc": "The team's level is too low",
		"id": "130007"
	},
	{
		"desc": "巡回赛未开启",
		"enDesc": "The tour has not started",
		"id": "130008"
	},
	{
		"desc": "试炼赛未开启",
		"enDesc": "The trial match has not started",
		"id": "130009"
	},
	{
		"desc": "战术不存在",
		"enDesc": "Tactics do not exist",
		"id": "130010"
	},
	{
		"desc": "球队威名经验不足",
		"enDesc": "Team experience is insufficient",
		"id": "130011"
	},
	{
		"desc": "好友不存在",
		"enDesc": "Friends do not exist",
		"id": "130012"
	},
	{
		"desc": "不能加自己为好友",
		"enDesc": "Cannot add self as a friend",
		"id": "130013"
	},
	{
		"desc": "不能重复添加好友",
		"enDesc": "Cannot add duplicate friends",
		"id": "130014"
	},
	{
		"desc": "好友数量达到上限",
		"enDesc": "Friend quantity reaches the limit",
		"id": "130015"
	},
	{
		"desc": "不能添加黑名单中的好友",
		"enDesc": "Friends in blacklist",
		"id": "130016"
	},
	{
		"desc": "对方好友数量达到上限",
		"enDesc": "The player's friend list is full",
		"id": "130017"
	},
	{
		"desc": "球队不在线",
		"enDesc": "The team is offline",
		"id": "130034"
	},
	{
		"desc": "挑战次数已经用完",
		"enDesc": "Challenge times used up",
		"id": "130040"
	},
	{
		"desc": "精力不足",
		"enDesc": "Active is insufficient",
		"id": "130041"
	},
	{
		"desc": "冷却时间未到",
		"enDesc": "Cooldown time not arrived",
		"id": "130042"
	},
	{
		"desc": "次数已经用完",
		"enDesc": "Receiving times reached the limit",
		"id": "130043"
	},
	{
		"desc": "接收次数已达上限",
		"enDesc": "Receive times is max",
		"id": "130044"
	},
	{
		"desc": "该名次正在被挑战中",
		"enDesc": "The name is being challenged",
		"id": "130050"
	},
	{
		"desc": "该名次你无权挑战",
		"enDesc": "You can't challenge the rank",
		"id": "130051"
	},
	{
		"desc": "对方接收道具数量达到上限",
		"enDesc": "The opponent player has maxed out their receive times",
		"id": "130052"
	},
	{
		"desc": "星级已达上限",
		"enDesc": "Star is max",
		"id": "130053"
	},
	{
		"desc": "条件未达到指定要求",
		"enDesc": "Conditions do not met",
		"id": "130054"
	},
	{
		"desc": "自己在对方的黑名单中",
		"enDesc": "The player is in the black list",
		"id": "130055"
	},
	{
		"desc": "暂无可挑战的对手",
		"enDesc": "No available opponents",
		"id": "130056"
	},
	{
		"desc": "对方拒绝非好友的比赛邀请",
		"enDesc": "The opponent refuses the match invitation",
		"id": "130057"
	},
	{
		"desc": "购买次数已达上限",
		"enDesc": "Purchase times reached the limit",
		"id": "130059"
	},
	{
		"desc": "训练时间未结束",
		"enDesc": "Training time not over",
		"id": "130064"
	},
	{
		"desc": "暂无可挑战的对手",
		"enDesc": "No available opponents to challenge",
		"id": "130065"
	},
	{
		"desc": "您正在交易中",
		"enDesc": "You are in a trade",
		"id": "130066"
	},
	{
		"desc": "对方正在交易中",
		"enDesc": "The opponent is in a trade",
		"id": "130067"
	},
	{
		"desc": "战术已达最高等级",
		"enDesc": "Tactics reached the highest level",
		"id": "130068"
	},
	{
		"desc": "教练星级已达最高",
		"enDesc": "Coach star level reached the highest level",
		"id": "130069"
	},
	{
		"desc": "教练数量已满",
		"enDesc": "Coach quantity is full",
		"id": "130070"
	},
	{
		"desc": "教练不存在",
		"enDesc": "Coaches do not exist",
		"id": "130071"
	},
	{
		"desc": "教练已存在",
		"enDesc": "You had same coache",
		"id": "130072"
	},
	{
		"desc": "兑换次数已达上限",
		"enDesc": "Exchange times reached the limit",
		"id": "130073"
	},
	{
		"desc": "交易不存在",
		"enDesc": "Trade does not exist",
		"id": "130074"
	},
	{
		"desc": "交易次数不足",
		"enDesc": "Trade times are insufficient",
		"id": "130075"
	},
	{
		"desc": "交易不合法",
		"enDesc": "Trade is not legal",
		"id": "130076"
	},
	{
		"desc": "对方交易次数不足",
		"enDesc": "The other party has insufficient trade times",
		"id": "130077"
	},
	{
		"desc": "教练羁绊等级已达上限",
		"enDesc": "Coach bond level reached the limit",
		"id": "130078"
	},
	{
		"desc": "教练星级不足",
		"enDesc": "Coach star level is not enough",
		"id": "130079"
	},
	{
		"desc": "教练深造等级不足",
		"enDesc": "Coach training level is not enough",
		"id": "130080"
	},
	{
		"desc": "球星不存在",
		"enDesc": "Star player does not exist",
		"id": "140000"
	},
	{
		"desc": "球队少于7人",
		"enDesc": "Team has less than 7 players",
		"id": "140001"
	},
	{
		"desc": "球星等级达到上限",
		"enDesc": "Star level reached the limit",
		"id": "140002"
	},
	{
		"desc": "球星等级不足",
		"enDesc": "Player level is not enough",
		"id": "140003"
	},
	{
		"desc": "球员不符合要求",
		"enDesc": "Player does not meet the requirements",
		"id": "140004"
	},
	{
		"desc": "转生球星装备不符合要求",
		"enDesc": "Player transformation equipment does not meet the requirements",
		"id": "140005"
	},
	{
		"desc": "球星训练不符合要求",
		"enDesc": "Star player training does not meet the requirements",
		"id": "140006"
	},
	{
		"desc": "球星正在训练",
		"enDesc": "Player is in training",
		"id": "140007"
	},
	{
		"desc": "球星陪练达到上限",
		"enDesc": "Player training reaches the limit",
		"id": "140008"
	},
	{
		"desc": "球星正在陪练",
		"enDesc": "The star player is in training",
		"id": "140009"
	},
	{
		"desc": "特训等级不能超过球队等级",
		"enDesc": "Special training level cannot exceed the team level",
		"id": "140017"
	},
	{
		"desc": "球星特训等级上限",
		"enDesc": "Special training max level",
		"id": "140018"
	},
	{
		"desc": "这个位置已经有陪练球星了",
		"enDesc": "This position already has a player",
		"id": "140019"
	},
	{
		"desc": "球队有相同球星",
		"enDesc": "Team has the same player",
		"id": "140020"
	},
	{
		"desc": "此球星已经是当家球星",
		"enDesc": "This star is already the main star",
		"id": "140023"
	},
	{
		"desc": "助阵槽位未开启",
		"enDesc": "Assisted formation slot not open",
		"id": "140024"
	},
	{
		"desc": "球员背包已满",
		"enDesc": "team player pack is full",
		"id": "140025"
	},
	{
		"desc": "交易信息不存在",
		"enDesc": "Trade information does not exist",
		"id": "150000"
	},
	{
		"desc": "不能多次发布交易信息",
		"enDesc": "Cannot post multiple trade messages",
		"id": "150001"
	},
	{
		"desc": "交易已取消",
		"enDesc": "Trade canceled",
		"id": "150002"
	},
	{
		"desc": "交易已成交",
		"enDesc": "Trade completed",
		"id": "150003"
	},
	{
		"desc": "建筑等级已达上限",
		"enDesc": "Building level reached the limit",
		"id": "150004"
	},
	{
		"desc": "俱乐部名字已存在",
		"enDesc": "Club name already exists",
		"id": "160000"
	},
	{
		"desc": "球队已加入俱乐部",
		"enDesc": "Team has joined the club",
		"id": "160001"
	},
	{
		"desc": "俱乐部不存在",
		"enDesc": "Club does not exist",
		"id": "160002"
	},
	{
		"desc": "您不是主席",
		"enDesc": "You are not the chairman",
		"id": "160003"
	},
	{
		"desc": "俱乐部成员数已满",
		"enDesc": "Club member count is full",
		"id": "160004"
	},
	{
		"desc": "球队未加入俱乐部",
		"enDesc": "Team has not joined the club",
		"id": "160005"
	},
	{
		"desc": "您没有权限做此操作",
		"enDesc": "You do not have the authority to do this operation",
		"id": "160006"
	},
	{
		"desc": "俱乐部该职位已满",
		"enDesc": "Club position is full",
		"id": "160007"
	},
	{
		"desc": "俱乐部不能进行升级",
		"enDesc": "Club cannot be upgraded",
		"id": "160008"
	},
	{
		"desc": "俱乐部名称不符合要求",
		"enDesc": "Club name does not meet the requirements",
		"id": "160009"
	},
	{
		"desc": "球队职位不符合要求",
		"enDesc": "Team position does not meet the requirements",
		"id": "160010"
	},
	{
		"desc": "退出俱乐部未满2小时",
		"enDesc": "Club exit time not yet",
		"id": "160011"
	},
	{
		"desc": "俱乐部等级不足",
		"enDesc": "Club level is not enough",
		"id": "160012"
	},
	{
		"desc": "俱乐部BOSS不符合要求",
		"enDesc": "BOSS does not meet the requirements",
		"id": "160013"
	},
	{
		"desc": "俱乐部还有其他成员，不能解散",
		"enDesc": "Club has other members, cannot be dissolved",
		"id": "160014"
	},
	{
		"desc": "球队今日贡献次数已满",
		"enDesc": "Today's contribution times are full",
		"id": "160015"
	},
	{
		"desc": "俱乐部今日贡献次数已满",
		"enDesc": "Today's contribution times are full",
		"id": "160018"
	},
	{
		"desc": "被绑定的球星不能交易",
		"enDesc": "The bound player cannot be traded",
		"id": "160019"
	},
	{
		"desc": "俱乐部资金不足",
		"enDesc": "Club funds are insufficient",
		"id": "160020"
	},
	{
		"desc": "周六20点至22点不能退出俱乐部",
		"enDesc": "Saturday 20:00 to 2:00 cannot exit the club",
		"id": "160021"
	},
	{
		"desc": "不在操作时间",
		"enDesc": "Not within operating hours",
		"id": "160022"
	},
	{
		"desc": "俱乐部活跃度需要达到100",
		"enDesc": "Club activity needs to reach 100",
		"id": "160023"
	},
	{
		"desc": "装备不存在",
		"enDesc": "Equipment does not exist",
		"id": "170000"
	},
	{
		"desc": "装备不是您的",
		"enDesc": "Equipment is not yours",
		"id": "170001"
	},
	{
		"desc": "装备不能升级",
		"enDesc": "Equipment can not level up",
		"id": "170002"
	},
	{
		"desc": "非专属球星不能穿戴",
		"enDesc": "Non-exclusive player's equipment cannot be worn",
		"id": "170003"
	},
	{
		"desc": "装备等级不足",
		"enDesc": "Level is insufficient",
		"id": "170004"
	},
	{
		"desc": "非专属球队球星不能穿戴",
		"enDesc": "Non-exclusive team cannot be worn",
		"id": "170005"
	},
	{
		"desc": "装备阶级已达最高",
		"enDesc": "Equipment class is the highest",
		"id": "170006"
	},
	{
		"desc": "装备升星条件不足",
		"enDesc": "Equipment star level is the highest",
		"id": "170007"
	},
	{
		"desc": "0星装备无法分解",
		"enDesc": "0-star equipment cannot be decomposed",
		"id": "170008"
	},
	{
		"desc": "技能不存在",
		"enDesc": "Skills do not exist",
		"id": "170009"
	},
	{
		"desc": "技能点不足",
		"enDesc": "Skill points are insufficient",
		"id": "170010"
	},
	{
		"desc": "技能等级已达最高",
		"enDesc": "Skills have reached the highest level",
		"id": "170011"
	},
	{
		"desc": "技能使用次数已达到上限",
		"enDesc": "Skills use times have reached the limit",
		"id": "170012"
	},
	{
		"desc": "球队荣耀不存在",
		"enDesc": "Team glory does not exist",
		"id": "170013"
	},
	{
		"desc": "球队印记不存在",
		"enDesc": "Team mark does not exist",
		"id": "170014"
	},
	{
		"desc": "球队印记等级已达最高",
		"enDesc": "Team level has reached the highest level",
		"id": "170015"
	},
	{
		"desc": "成就等级已达最高",
		"enDesc": "Achievement has reached the highest level",
		"id": "170016"
	},
	{
		"desc": "活动未开始",
		"enDesc": "The event has not started",
		"id": "190000"
	},
	{
		"desc": "活动已结束",
		"enDesc": "The event has ended",
		"id": "190001"
	},
	{
		"desc": "该奖励已领取过",
		"enDesc": "This reward has already been claimed",
		"id": "190002"
	},
	{
		"desc": "条件未达到不能领取奖励",
		"enDesc": "Conditions not met, cannot claim the reward",
		"id": "190003"
	},
	{
		"desc": "领奖次数已达上限",
		"enDesc": "You have reached the maximum number of rewards that can be claimed",
		"id": "190004"
	},
	{
		"desc": "今日已签到",
		"enDesc": "You have already checked in today",
		"id": "190007"
	},
	{
		"desc": "激活码不可用",
		"enDesc": "The activation code is invalid",
		"id": "190012"
	},
	{
		"desc": "已使用过激活码",
		"enDesc": "The activation code has already been used",
		"id": "190013"
	},
	{
		"desc": "不能多次参与竞猜",
		"enDesc": "You cannot participate in the bet multiple times",
		"id": "190014"
	},
	{
		"desc": "参与人数达到上限",
		"enDesc": "The maximum number of participants has been reached",
		"id": "190015"
	},
	{
		"desc": "您还未参与竞猜",
		"enDesc": "You have not participated in the bet yet",
		"id": "190016"
	},
	{
		"desc": "系统繁忙，请您稍后再来领取特权！",
		"enDesc": "The system is busy, please try to claim your privileges later",
		"id": "190017"
	},
	{
		"desc": "请先登录安全卫士，领取对应特权，获得礼包领取资格",
		"enDesc": "Please log in to Security Guard first, claim the corresponding privileges, and obtain the qualification to receive the gift package",
		"id": "190018"
	},
	{
		"desc": "您的安全卫士等级不满足领取条件，请提升卫士等级",
		"enDesc": "Your Security Guard level does not meet the requirements for claiming, please upgrade your level",
		"id": "190019"
	},
	{
		"desc": "特权活动未上线，请等待上线后再来领取",
		"enDesc": "The privilege activity is not online yet, please wait until it is online to claim",
		"id": "190020"
	},
	{
		"desc": "很遗憾！360卫士特权活动已结束，敬请期待下次活动！",
		"enDesc": "Unfortunately! The 360 Security Guard privilege activity has ended, please look forward to the next event",
		"id": "190021"
	},
	{
		"desc": "请先登录安全卫士，领取对应特权，分享特权活动到指定社交平台获得分享礼包",
		"enDesc": "Please log in to Security Guard first, claim the corresponding privileges, and share the privilege activity on the specified social platform to get the shared gift package",
		"id": "190022"
	},
	{
		"desc": "礼包审核中，我们将于您分享特权活动48小时之后给您发送礼包，请耐心等待！",
		"enDesc": "The gift package is under review, we will send you the gift package 48 hours after you share the privilege activity, please wait patiently",
		"id": "190023"
	},
	{
		"desc": "该礼包已购买过",
		"enDesc": "This gift package has already been purchased",
		"id": "190024"
	},
	{
		"desc": "该红包已发放",
		"enDesc": "This red envelope has already been distributed",
		"id": "190025"
	},
	{
		"desc": "红包不存在",
		"enDesc": "The red envelope does not exist",
		"id": "190026"
	},
	{
		"desc": "红包已抢完",
		"enDesc": "The red envelope has been claimed",
		"id": "190027"
	},
	{
		"desc": "你已领取过该红包",
		"enDesc": "You have already claimed this red envelope",
		"id": "190028"
	},
	{
		"desc": "不能重复签约",
		"enDesc": "You cannot sign up repeatedly",
		"id": "190029"
	},
	{
		"desc": "奖励已领完",
		"enDesc": "The rewards have been claimed",
		"id": "190030"
	},
	{
		"desc": "探险未结束",
		"enDesc": "The adventure is not over",
		"id": "190031"
	},
	{
		"desc": "球员探险中",
		"enDesc": "The player is on an adventure",
		"id": "190032"
	},
	{
		"desc": "球员锁定，请先解锁",
		"enDesc": "The player is locked, please unlock first",
		"id": "190033"
	},
	{
		"desc": "选秀房间类型错误",
		"enDesc": "The draft room type is incorrect",
		"id": "200000"
	},
	{
		"desc": "您的球队正在等待或已经在进行选秀",
		"enDesc": "Your team is waiting or already in the draft process",
		"id": "200001"
	},
	{
		"desc": "还没有轮到您挑选球星",
		"enDesc": "It's not your turn to pick a star player yet",
		"id": "200002"
	},
	{
		"desc": "您还没有进入选秀房间",
		"enDesc": "You have not entered the draft room yet",
		"id": "200003"
	},
	{
		"desc": "选秀还没到挑选球星的状态",
		"enDesc": "The draft has not reached the stage of picking star players",
		"id": "200004"
	},
	{
		"desc": "球星不在选秀的列表中",
		"enDesc": "The star player is not in the draft list",
		"id": "200005"
	},
	{
		"desc": "选秀球星已被选择",
		"enDesc": "The drafted star player has already been chosen",
		"id": "200006"
	},
	{
		"desc": "此房间现在不能进入",
		"enDesc": "This room cannot be entered at the moment",
		"id": "200007"
	},
	{
		"desc": "选秀房间未开启不能进入",
		"enDesc": "The draft room is not open and cannot be entered",
		"id": "200008"
	},
	{
		"desc": "选秀次数已用完",
		"enDesc": "The draft attempts have been used up",
		"id": "200009"
	},
	{
		"desc": "选秀卡号错误",
		"enDesc": "The draft card number is incorrect",
		"id": "200010"
	},
	{
		"desc": "现在不是选择顺位的状态",
		"enDesc": "It is not the state of choosing the draft order",
		"id": "200011"
	},
	{
		"desc": "顺位卡已被选择",
		"enDesc": "The draft order card has already been chosen",
		"id": "200012"
	},
	{
		"desc": "您已经选择了顺位卡",
		"enDesc": "You have already chosen the draft order card",
		"id": "200013"
	},
	{
		"desc": "任务定义不存在",
		"enDesc": "The task definition does not exist",
		"id": "210000"
	},
	{
		"desc": "任务未完成",
		"enDesc": "The task is not completed",
		"id": "210001"
	},
	{
		"desc": "任务已结束",
		"enDesc": "The task has ended",
		"id": "210002"
	},
	{
		"desc": "任务状态错误",
		"enDesc": "The task status is incorrect",
		"id": "210003"
	},
	{
		"desc": "球衣等级已达到满级",
		"enDesc": "The jersey level has reached the maximum level",
		"id": "220001"
	},
	{
		"desc": "球衣已满阶",
		"enDesc": "The jersey is at the maximum rank",
		"id": "220002"
	},
	{
		"desc": "球衣进阶条件未达到",
		"enDesc": "The conditions for jersey advancement have not been met",
		"id": "220003"
	},
	{
		"desc": "训练服不能脱下",
		"enDesc": "The training uniform cannot be taken off",
		"id": "220004"
	},
	{
		"desc": "球衣不存在",
		"enDesc": "The jersey does not exist",
		"id": "220005"
	},
	{
		"desc": "吉祥物不存在",
		"enDesc": "The mascot does not exist",
		"id": "220006"
	},
	{
		"desc": "吉祥物仓库数量已达上限",
		"enDesc": "The mascot warehouse quantity has reached the maximum limit",
		"id": "220007"
	},
	{
		"desc": "篮球宝贝不存在",
		"enDesc": "The basketball girl does not exist",
		"id": "220008"
	},
	{
		"desc": "宝贝房间数量达到上限",
		"enDesc": "The number of rooms for the basketball girl has reached the maximum limit",
		"id": "220009"
	},
	{
		"desc": "天赋不存在",
		"enDesc": "The talent does not exist",
		"id": "230000"
	},
	{
		"desc": "该天赋正在穿戴不能融合",
		"enDesc": "The talent is being worn and cannot be fused",
		"id": "230001"
	},
	{
		"desc": "品质不同不可融合",
		"enDesc": "Different qualities cannot be fused",
		"id": "230002"
	},
	{
		"desc": "该天赋和该球星不匹配",
		"enDesc": "The talent does not match the star player",
		"id": "230005"
	},
	{
		"desc": "同类型的天赋不能重复穿戴",
		"enDesc": "The same type of talent cannot be worn repeatedly",
		"id": "230006"
	},
	{
		"desc": "不能用同一个天赋来融合",
		"enDesc": "The same talent cannot be used for fusion",
		"id": "230007"
	},
	{
		"desc": "特性不存在",
		"enDesc": "The characteristic does not exist",
		"id": "230008"
	},
	{
		"desc": "皮肤不存在",
		"enDesc": "The skin does not exist",
		"id": "230009"
	},
	{
		"desc": "绰号不存在",
		"enDesc": "The nickname does not exist",
		"id": "230010"
	},
	{
		"desc": "皮肤等级不够",
		"enDesc": "The skin level is not high enough",
		"id": "230011"
	},
	{
		"desc": "皮肤突破等级不足",
		"enDesc": "The skin breakthrough level is insufficient",
		"id": "230012"
	},
	{
		"desc": "此战区席位不存在",
		"enDesc": "This battle zone seat does not exist",
		"id": "220010"
	},
	{
		"desc": "你已入席其他席位",
		"enDesc": "You have already taken another seat",
		"id": "220011"
	},
	{
		"desc": "席位已占用",
		"enDesc": "The seat is occupied",
		"id": "220012"
	},
	{
		"desc": "Configuration error",
		"enDesc": "Configuration error",
		"id": "23014"
	},
	{
		"desc": "sales demand has reached its limit",
		"enDesc": "sales demand has reached its limit",
		"id": "23015"
	},
	{
		"desc": "transaction did not meet the requirements",
		"enDesc": "transaction did not meet the requirements",
		"id": "23016"
	},
	{
		"desc": "transaction did not meet the requirements",
		"enDesc": "transaction did not meet the requirements",
		"id": "23017"
	},
	{
		"desc": "transaction has been delisted",
		"enDesc": "transaction has been delisted",
		"id": "23018"
	},
	{
		"desc": "The current lineup is already the best",
		"enDesc": "The current lineup is already the best",
		"id": "23019"
	},
	{
		"desc": "the waiting list for signing is full.",
		"enDesc": "the waiting list for signing is full.",
		"id": "23020"
	},
	{
		"desc": "the player to be signed has expired",
		"enDesc": "the player to be signed has expired",
		"id": "23021"
	},
	{
		"desc": "insufficient slots to be signed",
		"enDesc": "insufficient slots to be signed",
		"id": "23022"
	},
	{
		"desc": "player has been bound",
		"enDesc": "player has been bound",
		"id": "23023"
	},
	{
		"desc": "contains memorable characters",
		"enDesc": "contains memorable characters",
		"id": "23024"
	},
	{
		"desc": "comment too long",
		"enDesc": "comment too long",
		"id": "23025"
	},
	{
		"desc": "cannot place duplicate bets",
		"enDesc": "cannot place duplicate bets",
		"id": "23026"
	},
	{
		"desc": "the betting amount does not comply with the rules",
		"enDesc": "the betting amount does not comply with the rules",
		"id": "23027"
	},
	{
		"desc": "no permission to delete",
		"enDesc": "no permission to delete",
		"id": "23028"
	},
	{
		"desc": "the match has ended",
		"enDesc": "the match has ended",
		"id": "23029"
	},
	{
		"desc": "请求过于频繁",
		"enDesc": "Clik too fast,please wait",
		"id": "23030"
	},
	{
		"desc": "客户端没有带token",
		"enDesc": "Client did not provide a token",
		"id": "23034"
	},
	{
		"desc": "材料数量超过上限",
		"enDesc": "Material quantity exceeds the limit",
		"id": "23035"
	},
	{
		"desc": "个性签名不符合要求",
		"enDesc": "Personal signature does not meet the requirements",
		"id": "23036"
	},
	{
		"desc": "比赛已开始",
		"enDesc": "The match has started",
		"id": "23037"
	},
	{
		"desc": "球员不在交易列表中",
		"enDesc": "Player is not on the trade list",
		"id": "23038"
	},
	{
		"desc": "球员体力不足",
		"enDesc": "Player's stamina is insufficient",
		"id": "23039"
	},
	{
		"desc": "已经有卡包正在开启中",
		"enDesc": "There is already a card pack being opened",
		"id": "23040"
	},
	{
		"desc": "EXCE_服务器繁忙",
		"enDesc": "Server is busy，please wait",
		"id": "23041"
	},
	{
		"desc": "EXCE_球队薪资过高",
		"enDesc": "Team salary has exceeded the salary cap",
		"id": "23042"
	},
	{
		"desc": "EXCE_图鉴未点亮",
		"enDesc": "Player Atlas inactive",
		"id": "23043"
	},
	{
		"desc": "EXCE_升星失败",
		"enDesc": "Player upgrade star failed",
		"id": "23044"
	},
	{
		"desc": "当前不存在你的战术卡牌",
		"enDesc": "there is no tactical card of yours at the moment",
		"id": "23045"
	}
]''';
}
