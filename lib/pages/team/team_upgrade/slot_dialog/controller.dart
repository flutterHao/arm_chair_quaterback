import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/start_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/slot_list_view_widget.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/25/10:52

class SlotDialogController extends GetxController
    with GetTickerProviderStateMixin {
  var tvShow = false.obs;
  var isInBackStatus = false;
  List<String> propertys = [
    "FGM",
    "3PM",
    "FTM",
    "PASS",
    "REB",
    "BLK",
    "STL",
    "TECH",
  ];

  late UpStarTeamPlayerV2Entity upStarTeamPlayerV2Entity;

  late EasyAnimationController doorAnimationController;

  var isGameOver = false.obs;

  late SlotMachineController slotMachineController;

  @override
  void onInit() {
    super.onInit();
    doorAnimationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 700));
    _initData();
    slotMachineController = SlotMachineController();
  }

  @override
  void onReady() {
    super.onReady();
    tvShow.value = true;
  }

  void _initData() {
    StartUpgradeController startUpgradeController = Get.find();
    var selectedPlayers = startUpgradeController.getSelectedPlayers();
    var uuids = selectedPlayers.fold([], (p, e) {
      p.add(e.teamPlayer.uuid);
      return p;
    });
    var materialScienceUUID = uuids.join(",");
    PicksApi.upStarTeamPlayerV2(
            startUpgradeController.player.uuid, materialScienceUUID)
        .then((result) {
      upStarTeamPlayerV2Entity = result;
    }, onError: (e) {
      // Get.back();
    });
  }
}
