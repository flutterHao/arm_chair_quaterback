import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/pk_event_updated_entity.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/16:00


class GameLeaderController extends GetxController with GetTickerProviderStateMixin{


  List<String> tabTitles = ["POINTS", "REBOUNGS", "ASSISTS"];
  late TabController tabController;

  GameEvent? event;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabTitles.length, vsync: this);
  }

  setEvent(GameEvent e){
    event = e;
    update();
  }

  /// tab取值范围：["pts","reb","ast"]
  List<PkEventUpdatedPlayerInfos> getTwoMaxByTab(String tab) {
    List<PkEventUpdatedPlayerInfos> list = [];
    if(event == null){
      return [];
    }
    List<PkEventUpdatedPlayerInfos> concatList = [
      ...event!.pkEventUpdatedEntity.homePlayerInfos,
      ...event!.pkEventUpdatedEntity.awayPlayerInfos,
    ];
    concatList.sort((a, b) => b.toJson()[tab]!.compareTo(a.toJson()[tab]));
    list = concatList.sublist(0, min(2, concatList.length));
    return list;
  }
}