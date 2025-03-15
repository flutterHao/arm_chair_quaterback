import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/14/17:50

class StealPlayerController extends GetxController {
  late StealTeamEntity stealTeamEntity;
  var loadStatus = LoadDataStatus.loading.obs;
  /// 偷球员状态：0 未选择 1 成功 2 失败
  var stealStatus = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TeamApi.getStealTeam(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(),
      CacheApi.getStealPlayerRate(),
    ]).then((result) {
      stealTeamEntity = result[0] as StealTeamEntity;
      loadStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
      Get.back();
    });
  }

  onItemTap(
      StealTeamPlayers player, NbaPlayerInfosPlayerBaseInfoList playBaseInfo) {
    TeamApi.steal(player.playerId).then((res){

    },onError: (e){
      ErrorUtils.toast(e);
    });
  }

  String getTextByGrade(String grade){
    print('grade:$grade');
    var firstWhereOrNull = CacheApi.stealPlayerRateList.firstWhereOrNull((e)=> e.quality==grade);
    if(firstWhereOrNull != null){
      return firstWhereOrNull.difficulty.tr;
    }
    return "prop";
  }

  Color getColorByGrade(String grade){
    var firstWhereOrNull = CacheApi.stealPlayerRateList.firstWhereOrNull((e)=> e.quality==grade);
    if(firstWhereOrNull != null){
      if(firstWhereOrNull.difficulty.contains("easy")){
        return AppColors.c10A86A;
      }else if(firstWhereOrNull.difficulty.contains("normal")){
        return AppColors.cDEA325;
      }else{
        return AppColors.cD60D20;
      }
    }
    return AppColors.c10A86A;
  }
}
