import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/buble_box.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/start_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/slot_list_view_widget.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/25/10:52

class SlotDialogController extends GetxController
    with GetTickerProviderStateMixin {
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

  late UpStarTeamPlayerV2StarUpList startUpItem;

  /// 进行了多少次
  var slotCount = 0.obs;

  /// 显示slot结果中
  bool showSlotResult = false;

  ///continueStarUp接口报错
  bool isContinueStarUpError = false;

  /// 抽奖结果
  Map<String, List<Property>> slotResult = {};

  var btnPageController = PageController();

  @override
  void onInit() {
    super.onInit();
    doorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    doorAnimationController.addListener(doorAnimationListener);
    doorAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画结束
        print('doorAnimationController----completed----');
      }
    });
    _initData();
  }

  @override
  void dispose() {
    doorAnimationController.dispose();
    super.dispose();
  }

  openDoor() {
    doorAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: doorAnimationController, curve: Curves.bounceOut));
    doorAnimationController.forward(from: 0);
    isDoorOpen = true;
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
      handlerInitData(
          teamUpgradeController.teamPlayerUpStarVoEntity.starUpDTO!);
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

  void onResult(UpStarTeamPlayerV2Entity result, {bool needRefreshUI = true}) {
    upStarTeamPlayerV2Entity = result;
    if (needRefreshUI) {
      setStarUpItem();
    }
  }

  void setStarUpItem() {
    slotCount.value += 1;
    startUpItem = upStarTeamPlayerV2Entity.starUpList.first;
    if (startUpItem.successRate <= 0) {
      gameOver(false);
      return;
    }
    upStarTeamPlayerV2Entity.starUpList.removeAt(0);
    if (startUpItem.type == 2) {
      selectIndexList = [9];
    } else if (startUpItem.type == 3) {
      selectIndexList = [10];
    } else {
      selectIndexList = startUpItem.attrCount.toJson().keys.fold([], (p, e) {
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
    print('selectIndexList:$selectIndexList');
    print('successRate:${startUpItem.successRate}');
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
    if (!isDoorOpen) {
      if (isContinueStarUpError) {
        continueStarUp(isRetry: true);
      }
      return;
    }
    if (doorAnimationController.isAnimating) return;
    if (spinCount != 0) return;
    if (selectIndexList.isEmpty) return;
    if (isGameOver.value) return;
    if (showSlotResult) return;
    for (int i = 0; i < selectIndexList.length; i++) {
      Future.delayed(const Duration(milliseconds: 300), () {
        slotMachineControllers[i].spin(index: selectIndexList[i]);
        spinCount++;
      });
    }
  }

  continueStarUp({bool isRetry = false}) {
    TeamUpgradeController teamUpgradeController = Get.find();
    PicksApi.continueStarUp(teamUpgradeController.player.uuid).then((result) {
      onResult(result, needRefreshUI: isRetry);
      if (isRetry) {
        openDoor();
      }
    }, onError: (e) {
      isContinueStarUpError = true;
      ErrorUtils.toast(e);
    });
  }

  void onSpinEnd() {
    spinCount--;
    if (spinCount == 0) {
      showSlotResult = true;
      var attrJson = startUpItem.attr.toJson();
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

      /// 所有的老虎机都停了
      if (upStarTeamPlayerV2Entity.starUpList.isEmpty) {
        continueStarUp();
      }
      Future.delayed(const Duration(milliseconds: 1000), () {
        showSlotResult = false;
        closeDoor(() {
          if (upStarTeamPlayerV2Entity.starUpList.isNotEmpty) {
            setStarUpItem();
            Future.delayed(const Duration(milliseconds: 300), () {
              openDoor();
            });
          }
        });
      });
    }
  }

  done() {
    if (slotCount.value < 8) return;
    if (isGameOver.value) return;
    TeamUpgradeController teamUpgradeController = Get.find();
    PicksApi.starUpDone(teamUpgradeController.player.uuid).then((result) {
      TeamUpgradeController teamUpgradeController = Get.find();
      teamUpgradeController.setUpgradeResult(result);
      var success = result.success;
      gameOver(success);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  void gameOver(bool success) {
    isGameOver.value = true;
    isSuccess = success;
    btnPageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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
  purple(4.5, AppColors.c9B62B9),
  yellow(9, AppColors.cCC3D20);

  final double bet;
  final Color color;

  const Property(this.bet, this.color);
}
