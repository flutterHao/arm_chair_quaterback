import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/power_change_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/start_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/slot_list_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/25/10:52

class SlotDialogController extends GetxController
    with GetTickerProviderStateMixin {
  SlotDialogController(this.initSuccessRate);

  final double initSuccessRate;
  var loadStatus = LoadDataStatus.loading.obs;
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
    "GET ALL",
    "HURT",
    "EMPTY",
  ];

  late UpStarTeamPlayerV2Entity upStarTeamPlayerV2Entity;

  late AnimationController doorAnimationController;
  late Animation doorAnimation;
  late bool isDoorOpen = false;

  var doorOffset = 0.0.obs;

  var isGameOver = false.obs;

  var isSuccess = true;

  List<SlotMachineController> slotMachineControllers = [];
  int spinCount = 0; //正在跑的老虎机的数量

  List<int> selectIndexList = [];

  UpStarTeamPlayerV2StarUpList? startUpItem;

  ///continueStarUp接口报错
  bool isContinueStarUpError = false;

  /// 抽奖结果
  Map<String, List<Property>> slotResult = {};

  var btnPageController = PageController();

  Timer? timer;

  bool isSlotRunning = false;

  var successRate = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    successRate.value = initSuccessRate;
    doorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    doorAnimationController.addListener(doorAnimationListener);
    _initData();
  }

  @override
  void dispose() {
    doorAnimationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  openDoor() {
    doorAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: doorAnimationController, curve: Curves.bounceOut));
    doorAnimationController.forward(from: 0).then((r) {
      isDoorOpen = true;
      onOpenDoorEnd();
    });
  }

  closeDoor(Function onEnd) {
    doorAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: doorAnimationController, curve: Curves.bounceOut));
    doorAnimationController.forward(from: 0).then((r) {
      onEnd.call();
    });
    isDoorOpen = false;
  }

  void doorAnimationListener() {
    doorOffset.value = doorAnimation.value;
  }

  void _initData() {
    TeamUpgradeController teamUpgradeController = Get.find();
    if (teamUpgradeController.teamPlayerUpStarVoEntity.starUpDTO != null) {
      var result = teamUpgradeController.teamPlayerUpStarVoEntity.starUpDTO!;
      successRate.value =
          result.starUpList[result.starUpList.length - 1].successRate;
      slotResult = result.starUpList
          .sublist(0, result.starUpList.length - 1)
          .fold(slotResult, (p, e) {
        var selectIndexList = [];
        var startUpItem = e;
        if (startUpItem.type == 2) {
          selectIndexList = [9];
        } else if (startUpItem.type == 3) {
          selectIndexList = [10];
        } else {
          selectIndexList =
              startUpItem.attrCount.toJson().keys.fold([], (p, e) {
            var value = startUpItem.attrCount.toJson()[e];
            if (value > 0) {
              var key = e;
              key = key.replaceAll("three", "3");
              key = key.replaceAll("pts", "fgm");
              p.addAll(List.generate(
                  value, (index) => propertys.indexOf(key.toUpperCase())));
            }
            return p;
          });
          if (selectIndexList.length == 8) {
            selectIndexList = [8];
          }
        }
        var attrJson = startUpItem.attr.toJson();

        p = selectIndexList.fold(p, (pp, e) {
          var key = propertys[e];
          var attrKey = ParamUtils.getProKey(key.toLowerCase());
          if (attrKey == "fgm") {
            attrKey = "pts";
          }
          if (attrJson.containsKey(attrKey)) {
            pp[key] = [...(pp[key] ?? []), Property.green];
          }
          return pp;
        });

        var result = p.map((key, value) {
          var list2 = mergeItem(value.toList());
          return MapEntry(key, list2);
        });

        return result;
      });
      handlerInitData(result);
      result.starUpList = [];
      upStarTeamPlayerV2Entity = result;
      loadStatus.value = LoadDataStatus.success;
    } else {
      loadStatus.value = LoadDataStatus.loading;
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
        loadStatus.value = LoadDataStatus.success;
        handlerInitData(result);
      }, onError: (e) {
        ErrorUtils.toast(e);
        loadStatus.value = LoadDataStatus.error;
        Get.back();
      });
    }
  }

  void handlerInitData(UpStarTeamPlayerV2Entity result) {
    onResult(result);
    Future.delayed(const Duration(milliseconds: 300), () {
      tvShow.value = true;
    });
  }

  void onResult(UpStarTeamPlayerV2Entity result) {
    print('result:${result.toJson()}');
    upStarTeamPlayerV2Entity = result;
    setStarUpItem();
  }

  void setStarUpItem() {
    if (upStarTeamPlayerV2Entity.successRate <= 0) {
      /// 模拟第一次就抽到受伤结束游戏
      selectIndexList = [9];
      startUpItem = null;
    } else {
      startUpItem = upStarTeamPlayerV2Entity.starUpList.last;
      upStarTeamPlayerV2Entity.starUpList.removeAt(0);
      if (startUpItem?.type == 2) {
        selectIndexList = [9];
      } else if (startUpItem?.type == 3) {
        selectIndexList = [10];
      } else {
        selectIndexList = startUpItem!.attrCount.toJson().keys.fold([], (p, e) {
          var value = startUpItem!.attrCount.toJson()[e];
          if (value > 0) {
            var key = e;
            key = key.replaceAll("three", "3");
            key = key.replaceAll("pts", "fgm");
            p.addAll(List.generate(
                value, (index) => propertys.indexOf(key.toUpperCase())));
          }
          return p;
        });
        if (selectIndexList.length == 8) {
          selectIndexList = [8];
        }
      }
    }
    print('selectIndexList:$selectIndexList');
    print('successRate:${startUpItem?.successRate}');
    if (slotMachineControllers.length < selectIndexList.length) {
      for (int i = 0; i < selectIndexList.length; i++) {
        slotMachineControllers.add(SlotMachineController());
        if (slotMachineControllers.length == selectIndexList.length) {
          break;
        }
      }
    }
    update([idSlotDialogMain]);
  }

  startSlot() {
    if (doorAnimationController.isAnimating) return;
    if (spinCount != 0) return;
    if (isGameOver.value) return;
    if (isSlotRunning) return;
    if (!isDoorOpen) return;

    closeDoor(() {
      if (isContinueStarUpError) {
        continueStarUp();
      } else if (upStarTeamPlayerV2Entity.starUpList.isEmpty) {
        continueStarUp();
      } else {
        setStarUpItem();
        openDoor();
      }
    });
  }

  onOpenDoorEnd() {
    isSlotRunning = true;
    timer = Timer.periodic(const Duration(milliseconds: 300), (t) {
      if (spinCount >= slotMachineControllers.length) {
        t.cancel();
        return;
      }
      slotMachineControllers[spinCount].spin(index: selectIndexList[spinCount]);
      spinCount++;
      if (spinCount >= selectIndexList.length) {
        t.cancel();
      }
    });
  }

  continueStarUp() {
    TeamUpgradeController teamUpgradeController = Get.find();
    PicksApi.continueStarUp(teamUpgradeController.teamPlayerUpStarVoEntity.uuid).then((result) {
      onResult(result);
      openDoor();
    }, onError: (e) {
      isContinueStarUpError = true;
      ErrorUtils.toast(e);
    });
  }

  void onSpinEnd() {
    spinCount--;
    if (spinCount == 0) {
      /// 所有的老虎机都停了
      print('startUpItem:$startUpItem');
      if ((startUpItem?.successRate ?? 0) <= 0) {
        gameOver(false);
        return;
      }
      isSlotRunning = false;
      successRate.value = startUpItem?.successRate ?? 0;
      var attrJson = startUpItem!.attr.toJson();
      print('slotResult--before:$slotResult');
      slotResult = selectIndexList.fold(slotResult, (p, e) {
        var key = propertys[e];
        var attrKey = ParamUtils.getProKey(key.toLowerCase());
        if (attrKey == "fgm") {
          attrKey = "pts";
        }
        if (attrJson.containsKey(attrKey)) {
          p[key] = [...(p[key] ?? []), Property.green];
        }
        return p;
      });
      print('slotResult--aftter:$slotResult');
      startMerge();
      print('slotResult--aftter2222:$slotResult');
      update([idSparringResult]);
    }
  }

  done() {
    TeamUpgradeController teamUpgradeController = Get.find();
    PicksApi.starUpDone(teamUpgradeController.teamPlayerUpStarVoEntity.uuid).then((result) {
      TeamUpgradeController teamUpgradeController = Get.find();
      teamUpgradeController.setUpgradeResult(result);
      var success = result.success;
      showTopToastDialog(
          child: PowerChangeDialog(
              Get.find<TeamUpgradeController>()
                  .getPlayer()
                  .playerStrength
                  .toInt(),
              result.teamPlayerVO.playerStrength.toInt()));
      gameOver(success);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  void gameOver(bool success) {
    isGameOver.value = true;
    isSuccess = success;
    SoundServices.to
        .playSound(success ? Assets.soundStarupSuc : Assets.soundStarupFail);
    Future.delayed(const Duration(milliseconds: 300), () {
      btnPageController.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
    update([idSlotDialogMain]);
  }

  goBack() {
    Get.back(result: isSuccess);
  }

  startMerge() {
    var result = slotResult.map((key, value) {
      var list2 = mergeItem(value.toList());
      return MapEntry(key, list2);
    });
    slotResult = result;
  }

  List<Property> mergeItem(List<Property> items) {
    // 定义合并规则
    Map<Property, Property> mergeRules = {
      Property.green: Property.blue,
      Property.blue: Property.purple,
      Property.purple: Property.yellow,
    };

    // 合并逻辑
    Map<Property, int> itemCounts = {};

    // 统计初始数量
    for (var item in items) {
      itemCounts[item] = (itemCounts[item] ?? 0) + 1;
    }

    bool merged = true;

    // 持续检查是否需要合并
    while (merged) {
      merged = false;

      // 遍历当前统计结果
      for (var key in List.from(itemCounts.keys)) {
        // 如果数量大于等于 2 并且有合并规则
        if (itemCounts[key]! >= 2 && mergeRules.containsKey(key)) {
          // 减去两个当前物品
          itemCounts[key] = itemCounts[key]! - 2;

          // 获取合并后的新物品
          Property nextItem = mergeRules[key]!;

          // 添加到统计
          itemCounts[nextItem] = (itemCounts[nextItem] ?? 0) + 1;

          // 标记合并发生
          merged = true;

          // 如果当前物品数量为 0，移除它
          if (itemCounts[key] == 0) {
            itemCounts.remove(key);
          }
        }
      }
    }

    print('${itemCounts.keys.toList()}');
    return itemCounts.keys.toList();
  }

  static String get idSlotDialogMain => "id_slot_dialog_main";

  static String get idSparringResult => "id_sparring_result";
}

enum Property {
  green(1, AppColors.c67A517),
  blue(2.5, AppColors.c1F83C8),
  purple(5, AppColors.c9B62B9),
  yellow(10, AppColors.cCC3D20);

  final double bet;
  final Color color;

  const Property(this.bet, this.color);
}
