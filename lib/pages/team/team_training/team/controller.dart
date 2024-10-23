import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/line_up_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_bag_tab.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamController extends GetxController with GetTickerProviderStateMixin {
  final random = Random();
  late TabController tabController;
  RxInt current = 0.obs;
  // double turns = 0;
  final List<String> tabs = ["Line-up", "Player bag"];
  final List<Widget> pages = [
    LineUpTab(),
    PlayerBagTab(),
  ];
  // RxBool isRecovering = false.obs;
  RxBool showThirdCard = true.obs;

  MyTeamEntity myTeamEntity = MyTeamEntity();
  List<TeamPlayerInfoEntity> myBagList = [];
  late Timer _timer;
  late int _recoverSeconds;
  RxString remainString = "00:00".obs;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    getMyTeamPlayer();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void getMyTeamPlayer() async {
    if (HomeController.to.userEntiry.teamLoginInfo == null) {
      await HomeController.to.refreshUserEntity();
    }
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;
    TeamApi.getMyTeamPlayer(teamId).then((v) {
      myTeamEntity = v;
      recoverTimeAndCountDown();
      var homeCtrl = Get.find<HomeController>();
      myBagList = List.from(homeCtrl.userEntiry.teamLoginInfo!.teamPlayerList!);
      Log.d(
          "上阵队伍: ${myTeamEntity.teamPlayers.map((e) => e.playerId).toList()}");
      Log.d("所有队伍: ${myBagList.map((e) => e.playerId).toList()}");
      update();
    });
  }

  void recoverPower({int type = 1, String? uuid}) {
    TeamApi.recoverPower(type: type, uuid: uuid).then((v) {
      myTeamEntity.powerReplyTime = v.powerReplyTime;
      if (type == 1) {
        for (var e in myTeamEntity.teamPlayers) {
          if (e.uuid == uuid) {
            int pw = v.teamPlayers.firstWhere((e) => e.uuid == uuid).power;
            e.power = pw;
          }
        }
      } else {
        myTeamEntity = v;
      }
      update();
    });
  }

  void onTabChange(v) {
    current.value = v;
    tabController.animateTo(v);
  }

  ///计算体力回复时间
  void recoverTimeAndCountDown() {
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(myTeamEntity.powerReplyTime);
    _recoverSeconds = recoverTime.difference(DateTime.now()).inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      _recoverSeconds--;
      // final hours = _recoverSeconds ~/ 3600;
      final minutes = (_recoverSeconds) ~/ 60;
      final remainingSeconds = _recoverSeconds % 60;
      remainString.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (_recoverSeconds == 0) {
        _timer.cancel();
      }
    });
  }

  Color getProgressColor(progress) {
    return progress > 0.5
        ? AppColors.c10A86A
        : progress > 0.2
            ? AppColors.cDFB523
            : AppColors.cE72646;
  }
}
