/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-19 15:45:08
 * @LastEditTime: 2024-09-24 18:04:05
 */
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PlayerDetailController extends GetxController
    with GetTickerProviderStateMixin {
  PlayerDetailController(this.arguments);

  final PlayerDetailPageArguments arguments;

  NbaTeamEntity? teamInfo;
  NbaPlayerInfosPlayerBaseInfoList? baseInfo;
  List<String> tabs = ["SUMMARY", "STATS", "LOG"];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  reloadData() {
    _initData();
  }

  _initData() {
    Future.wait([
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(getList: true),
    ]).then((result) {
      baseInfo = (result[0] as NbaPlayerInfosEntity)
          .playerBaseInfoList
          .firstWhere((e) => e.playerId == arguments.playerId);
      teamInfo = (result[1] as List<NbaTeamEntity>)
          .firstWhere((e) => e.id == baseInfo?.teamId);
      update([idMain]);
    });
  }

  static get idMain => "player_detail_main";

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
