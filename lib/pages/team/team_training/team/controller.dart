import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
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
    const LineUpTab(),
    const PlayerBagTab(),
  ];
  // RxBool isRecovering = false.obs;
  RxBool showThirdCard = true.obs;

  MyTeamEntity myTeamEntity = MyTeamEntity();
  List<TeamPlayerInfoEntity> myBagList = [];
  Timer? _timer;
  late int _recoverSeconds;
  RxString remainString = "00:00".obs;

  TeamPlayerInfoEntity item1 = TeamPlayerInfoEntity();
  TeamPlayerInfoEntity item2 = TeamPlayerInfoEntity();
  bool isAdd = false;

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
    initData();
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
    _timer?.cancel();
  }

  Future initData() async {
    if (HomeController.to.userEntiry.teamLoginInfo == null) {
      await HomeController.to.refreshUserEntity();
    }
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;

    await Future.wait([
      TeamApi.getMyTeamPlayer(teamId),
      TeamApi.getMyBagPlayers(),
      CacheApi.getPlayerStatusConfig(),
    ]).then((v) {
      myTeamEntity = v[0] as MyTeamEntity;
      myBagList = v[1] as List<TeamPlayerInfoEntity>;
      recoverTimeAndCountDown();
      update();
    });
  }

  // List<TeamPlayerInfoEntity> get getBagPlayers {
  //   var canSelect = myBagList.where((e) => canChange(true, e)).toList();
  //   var cantSelect = myBagList.where((e) => !canChange(true, e)).toList();
  //   canSelect.sort((a, b) => a.position.compareTo(b.position));
  //   cantSelect.sort((a, b) => a.position.compareTo(b.position));
  //   List<TeamPlayerInfoEntity> list = List.from(canSelect)..addAll(cantSelect);
  //   // var canSelect = myBagList.where((e) => e.position == -1).toList();
  //   // var cantSelect = myBagList.where((e) => e.position != -1).toList();
  //   // List<TeamPlayerInfoEntity> list = List.from(canSelect)..addAll(cantSelect);

  //   return list;
  // }

  void recoverPower({int type = 1, String? uuid}) {
    TeamApi.recoverPower(type: type, uuid: uuid).then((v) {
      myTeamEntity.powerReplyTime = v.powerReplyTime;
      if (type == 1) {
        if (v.teamPlayers.isEmpty) return;
        int totalPw = 0;
        for (var e in myTeamEntity.teamPlayers) {
          if (e.uuid == uuid) {
            int pw = v.teamPlayers.firstWhere((e) => e.uuid == uuid).power;
            e.power = pw;
          }
          totalPw += e.power;
        }
        myTeamEntity.powerP = (totalPw ~/ myTeamEntity.teamPlayers.length);
      } else {
        myTeamEntity = v;
      }
      update();
    });
  }

  ///添加球员
  void addPlay() {
    if (item2.isChange.value) {
      ///选了获取背包已经选择的直接添加
      item1 = item2;
      changeTeamPlayer();
    } else {
      ///如果之前没选跳转到背包选择
      isAdd = true;
      onTabChange(1);
    }
  }

  ///点击更换球员
  void playerItemOnTap(bool isBag, TeamPlayerInfoEntity item) {
    /// 如果是上阵
    if (!isBag) {
      item1 = TeamPlayerInfoEntity.fromJson(item.toJson());
      item1.isChange.value = true;
      if (item2.isChange.value == true) {
        ///已经选择了背包直接替换
        changeTeamPlayer();
      } else {
        onTabChange(1);
      }
    }

    /// 如果是背包
    else {
      item2 = TeamPlayerInfoEntity.fromJson(item.toJson());
      item2.isChange.value = true;
      if (isAdd) {
        ///如果选择了添加直接添加
        addPlay();
      } else if (item1.isChange.value == true) {
        ///已经选择了上阵直接替换
        changeTeamPlayer();
      }
      onTabChange(0);
    }
  }

//是否能够切换
  // bool canChange0(bool isBag, TeamPlayerInfoEntity item) {
  //   bool canSelect = true;
  //   if (!item1.isChange.value && !item2.isChange.value && !isAdd) {
  //     return canSelect;
  //   }
  //   String thisPos = Utils.getPlayBaseInfo(item.playerId).position;

  //   if (isBag) {
  //     String pos = Utils.getPlayBaseInfo(item1.playerId).position;
  //     canSelect = isAdd
  //         ? item.position == -1
  //         : item.position == -1 &&
  //             thisPos == pos &&
  //             item.playerId != item1.playerId;
  //   } else {
  //     String pos = Utils.getPlayBaseInfo(item2.playerId).position;
  //     canSelect = thisPos == pos && item.playerId != item2.playerId;
  //   }
  //   return canSelect;
  // }

  //是否能够切换
  bool canChange(bool isBag, TeamPlayerInfoEntity item) {
    bool canSelect = true;

    if (!item1.isChange.value && !item2.isChange.value && !isAdd) {
      return canSelect;
    }
    if (isBag) {
      canSelect = isAdd
          ? item.position <= 0
          : item.position <= 0 && item.playerId != item1.playerId;
      canSelect = canSelect &&
          !myTeamEntity.teamPlayers
              .map((e) => e.playerId)
              .contains(item.playerId);
    } else {
      canSelect = item.playerId != item2.playerId;
    }
    return canSelect;
  }

  bool isSame(TeamPlayerInfoEntity item) {
    // String thisPos = Utils.getPlayBaseInfo(item.playerId).position;
    if (!item1.isChange.value && !item2.isChange.value && !isAdd) {
      return true;
    }
    NbaPlayerInfosPlayerBaseInfoList player =
        Utils.getPlayBaseInfo(item.playerId);
    var isSame = isAdd
        ? item.position == -1
        : item.position == -1 &&
            player.position.contains(Utils.getPosition(item1.position)) &&
            item.playerId != item1.playerId;
    return isSame;
  }

  void changeTeamPlayer() async {
    myTeamEntity =
        await TeamApi.changeTeamPlayer(item1.uuid, isAdd ? null : item2.uuid);
    myBagList = await TeamApi.getMyBagPlayers();
    item1.isChange.value = false;
    item2.isChange.value = false;
    isAdd = false;
    update();
  }

  void onTabChange(v) {
    current.value = v;
    tabController.animateTo(v);
    update();
  }

  ///计算体力回复时间
  void recoverTimeAndCountDown() {
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(myTeamEntity.powerReplyTime);
    _recoverSeconds = recoverTime.difference(DateTime.now()).inSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      _recoverSeconds--;
      // final hours = _recoverSeconds ~/ 3600;
      final minutes = (_recoverSeconds) ~/ 60;
      final remainingSeconds = _recoverSeconds % 60;
      remainString.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (_recoverSeconds <= 0) {
        _timer?.cancel();

        /// 恢复体力刷新数据
        int teamId =
            HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;
        myTeamEntity = await TeamApi.getMyTeamPlayer(teamId);
        // initData();
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
