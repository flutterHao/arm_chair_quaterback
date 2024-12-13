import 'dart:async';
import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/3/12:06

class TacticalContrastController extends GetxController
    with GetTickerProviderStateMixin {
  TacticalContrastController(this.context);

  final BuildContext context;

  List<EasyAnimationController> animationList = [];

  Timer? timer;

  late BattleEntity battleEntity;

  var showBorder = false.obs;


  @override
  void onInit() {
    super.onInit();
    battleEntity = Get.find<TeamBattleController>().battleEntity;
    var homeTeamBuff = battleEntity.homeTeamBuff;
    var d =
        MediaQuery.of(context).size.width - (16.w * 2) - (43.w * 5 + 12.w * 4);
    var left = d / 2;
    print('left:$left');
    for (int index = 0; index < homeTeamBuff.length; index++) {
      var item = homeTeamBuff[index];
      var startY = item.takeEffectGameCount == 1 ? (269.w + 3.w) : 269.w;
      var easyAnimationController = EasyAnimationController(
          vsync: this,
          begin: Offset(left + (43.w + 12.w) * index, startY),
          end: Offset(60.w + 16.w + 50.w * index, 95.w),
          duration: const Duration(milliseconds: 300));
      if (index == homeTeamBuff.length - 1) {
        easyAnimationController.controller
            .addStatusListener(lastAnimationStatusListener);
      }
      animationList.add(easyAnimationController);
    }
  }

  lastAnimationStatusListener(status) {
    if (status == AnimationStatus.completed) {
      print('completed--------');
      showBorder.value = true;
      update([idAwayCards]);
      Get.find<TeamBattleV2Controller>().changeBuff();
    }
  }

  static String get idAwayCards=>"id_away_cards";

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 100), () {
      forward();
    });
  }

  forward() {
    if (animationList.isEmpty) {
      showBorder.value = true;
      update([idAwayCards]);
      Get.find<TeamBattleV2Controller>().changeBuff();
      return;
    }
    int count = 0;
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      animationList[count].forward(from: 0);
      count++;
      if (count >= animationList.length) {
        t.cancel();
      }
    });
  }

  List<TrainingInfoBuff> getHomeTeamBuff() {
    List<TrainingInfoBuff> list = List.from(battleEntity.homeTeamBuff);
    list.sort((a, b) => a.face.compareTo(b.face));
    return list;
  }

  List<TrainingInfoBuff> getAwayTeamBuff() {
    List<TrainingInfoBuff> list = List.from(battleEntity.awayTeamBuff);
    list.sort((a, b) => a.face.compareTo(b.face));
    return list;
  }

  @override
  void dispose() {
    for (int index = 0; index < animationList.length; index++) {
      animationList[index].dispose();
    }
    timer?.cancel();
    super.dispose();
  }
}
