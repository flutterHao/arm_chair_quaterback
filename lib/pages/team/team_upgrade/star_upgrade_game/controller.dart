import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_num_defined_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/slot_dialog/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/widget/star_upgrade_game_turntable.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/slot_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/27/15:33

class StarUpgradeGameController extends GetxController
    with GetTickerProviderStateMixin {
  StarUpgradeGameController(this.playerUuid);

  final String playerUuid;

  List<String> propertyList = [
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

  late TeamPlayerUpStarVoEntity teamPlayerUpStarVoEntity;
  var loadStatus = LoadDataStatus.loading.obs;

  UpStarTeamPlayerV2Entity? upStarTeamPlayerV2Entity;
  var nowCount = 0.obs;
  var successRate = 0.0.obs;
  UpStarTeamPlayerV2StarUpList? startUpItem;
  List<int> selectIndexList = [];

  List<SlotMachineController> slotMachineControllers = [];

  /// 抽奖结果
  Map<String, List<Property>> slotResult = {};
  bool isSlotRunning = false;
  Timer? timer;
  int spinCount = 0; //正在跑的老虎机的数量

  var isGameOver = false;

  var isSuccess = true;

  late AnimationController repeatAnimationController;
  late Animation<double> repeatAnimation;
  late AnimationController endAnimationController;
  late Animation<double> endAnimation;
  bool repeatAtEdge = false;

  @override
  void onInit() {
    super.onInit();
    repeatAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300))
      ..addListener(() {
        var width = 319.w;
        if ((repeatAnimationController.value == 0 || repeatAnimationController.value == 1) &&
            repeatAtEdge) {
          repeatAnimationController.stop();
          double end = 0;
          if (successRate.value != 0) {
            end = width / 2;
          } else {
            end = Random().nextDouble() * width;
          }
          endAnimation = Tween<double>(
                  begin: repeatAnimation.value == width ? width : 0, end: end)
              .animate(CurvedAnimation(
                  parent: endAnimationController, curve: Curves.easeOutBack));
          endAnimationController.forward();
        }
      });
    repeatAnimation = Tween<double>(begin: 0.0, end: 319.w)
        .animate(repeatAnimationController);
    endAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    endAnimation = Tween<double>(begin: 319.w / 2, end: 319.w / 2)
        .animate(endAnimationController);
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TeamApi.getTeamPlayerUpStarVO(playerUuid),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getStarUpNumDefine(),
      CacheApi.getGameConstant(),
    ]).then((result) {
      teamPlayerUpStarVoEntity = result[0] as TeamPlayerUpStarVoEntity;
      if (teamPlayerUpStarVoEntity.starUpDTO != null) {
        var result = teamPlayerUpStarVoEntity.starUpDTO!;
        upStarTeamPlayerV2Entity = result;
        successRate.value = result.starUpList.last.successRate;
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
                    value, (index) => propertyList.indexOf(key.toUpperCase())));
              }
              return p;
            });
            if (selectIndexList.length == 8) {
              selectIndexList = [8];
            }
          }
          var attrJson = startUpItem.attr.toJson();

          p = selectIndexList.fold(p, (pp, e) {
            var key = propertyList[e];
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
        nowCount.value = teamPlayerUpStarVoEntity.starUpDTO?.nowCount ?? 0;
      } else {
        successRate.value =
            Get.find<StarUpgradeNewController>().upSuccessRate.value / 100;
      }
      loadStatus.value = LoadDataStatus.success;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  void finish() {
    if (!Utils.canOperate()) return;
    if (isGameOver) {
      Get.back();
      return;
    }
    if (getNowCount() <= 0) {
      return;
    }
    done();
  }

  done() {
    PicksApi.starUpDone(teamPlayerUpStarVoEntity.uuid).then((result) {
      var success = result.success;
      gameOver(success);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  /// slot
  void drill() {
    if (!Utils.canOperate()) return;
    if (isGameOver) {
      gameOver(isSuccess);
      return;
    }
    isSlotRunning = true;
    if (upStarTeamPlayerV2Entity == null) {
      StarUpgradeNewController startUpgradeController = Get.find();
      var selectedPlayers = startUpgradeController.getSelectedPlayers();
      var uuids = selectedPlayers.fold([], (p, e) {
        p.add(e.teamPlayer.uuid);
        return p;
      });
      var materialScienceUUID = uuids.join(",");
      PicksApi.upStarTeamPlayerV2(playerUuid, materialScienceUUID)
          .then(onRequestSuccess, onError: (e) {
        isSlotRunning = false;
        ErrorUtils.toast(e);
      });
    } else {
      PicksApi.continueStarUp(playerUuid).then(onRequestSuccess, onError: (e) {
        ErrorUtils.toast(e);
        isSlotRunning = false;
      });
    }
  }

  onRequestSuccess(result) {
    upStarTeamPlayerV2Entity = result;
    setStarUpItem();
  }

  void setStarUpItem() {
    if (upStarTeamPlayerV2Entity!.successRate <= 0) {
      /// 模拟第一次就抽到受伤结束游戏
      selectIndexList = [9];
      startUpItem = null;
    } else {
      startUpItem = upStarTeamPlayerV2Entity!.starUpList.last;
      upStarTeamPlayerV2Entity!.starUpList.removeAt(0);
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
                value, (index) => propertyList.indexOf(key.toUpperCase())));
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
    update();
    Future.delayed(Duration(milliseconds: 300), running);
  }

  running() {
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
    repeatAnimation = Tween<double>(begin: 0.0, end: 319.w).animate(
        CurvedAnimation(
            parent: repeatAnimationController, curve: Curves.easeInOut));
    repeatAtEdge = false;
    repeatAnimationController.repeat(reverse: true);
  }

  onSpinEnd(index) {
    spinCount--;
    if (spinCount == 0) {
      /// 所有的老虎机都停了
      print('startUpItem:$startUpItem');
      isSlotRunning = false;
      repeatAtEdge = true;
      successRate.value = startUpItem?.successRate ?? 0;
      if ((startUpItem?.successRate ?? 0) <= 0) {
        gameOver(false);
        return;
      }
      nowCount.value = upStarTeamPlayerV2Entity!.nowCount;
      if (getBonusList().contains(nowCount.value)) {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: AppColors.cTransparent,
            context: Get.context!,
            builder: (context) {
              return StarUpgradeGameTurntable();
            });
      }
      var attrJson = startUpItem!.attr.toJson();
      print('slotResult--before:$slotResult');
      slotResult = selectIndexList.fold(slotResult, (p, e) {
        var key = propertyList[e];
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
      update();
    }
  }

  void gameOver(bool success) {
    print('gameOver----success:$success');
    isGameOver = true;
    isSuccess = success;
    SoundServices.to
        .playSound(success ? Assets.soundStarupSuc : Assets.soundStarupFail);
    if (success) {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: AppColors.cTransparent,
          context: Get.context!,
          builder: (context) {
            return Column(
              children: [
                Expanded(
                    child:
                        InkWell(onTap: () => Get.back(), child: Container())),
                Container(
                  height: 467.h,
                  width: Utils.getMaxWidth(context),
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(9.w))),
                  child: Column(
                    children: [
                      DialogTopBtn(),
                      35.vGap,
                      SizedBox(
                        width: 144.w,
                        height: 144.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 144.w,
                              height: 144.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(72.w),
                                  color: AppColors.c53CF8A.withOpacity(0.19)),
                            ),
                            Container(
                              width: 114.w,
                              height: 114.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(57.w),
                                  color: AppColors.c10A86A),
                            ),
                            Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.w),
                                  color: AppColors.cFFFFFF),
                            ),
                            IconWidget(
                              iconWidth: 23.w,
                              icon: Assets.iconUiIconRuidgt,
                              iconColor: AppColors.c10A86A,
                            )
                          ],
                        ),
                      ),
                      17.vGap,
                      Text(
                        "SUCCESS",
                        style: 27.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                      30.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 31 / 18.5,
                            alignment: Alignment.centerRight,
                            child: PlayerStartWidget(
                                grade:
                                    teamPlayerUpStarVoEntity.breakThroughGrade),
                          ),
                          21.hGap,
                          IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.managerUiManagerTacticsArrow,
                            iconColor: AppColors.c10A86A,
                            rotateAngle: 90,
                          ),
                          21.hGap,
                          Transform.scale(
                            scale: 31 / 18.5,
                            alignment: Alignment.centerLeft,
                            child: PlayerStartWidget(
                                grade:
                                    teamPlayerUpStarVoEntity.breakThroughGrade +
                                        1),
                          ),
                        ],
                      ),
                      80.vGap,
                      MtInkWell(
                        onTap: () {
                          /// 退出弹框
                          Get.back();

                          /// 退出升星
                          Get.back();
                        },
                        child: Container(
                          height: 51.h,
                          width: Utils.getMaxWidth(context) - 32.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.w),
                              border: Border.all(
                                color: AppColors.c666666,
                                width: 1.w,
                              )),
                          child: Center(
                            child: Text(
                              "GO BACK",
                              style: 23.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          });
    } else {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: AppColors.cTransparent,
          context: Get.context!,
          builder: (context) {
            return Column(
              children: [
                Expanded(
                    child:
                        InkWell(onTap: () => Get.back(), child: Container())),
                Container(
                  height: 467.h,
                  width: Utils.getMaxWidth(context),
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(9.w))),
                  child: Column(
                    children: [
                      DialogTopBtn(),
                      35.vGap,
                      SizedBox(
                        width: 144.w,
                        height: 144.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 144.w,
                              height: 144.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(72.w),
                                  color: AppColors.cFF9191.withOpacity(0.19)),
                            ),
                            Container(
                              width: 114.w,
                              height: 114.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(57.w),
                                  color: AppColors.cD60D20),
                            ),
                            Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.w),
                                  color: AppColors.cFFFFFF),
                            ),
                            IconWidget(
                              iconWidth: 23.w,
                              icon: Assets.iconIconClose,
                              iconColor: AppColors.cD60D20,
                            )
                          ],
                        ),
                      ),
                      17.vGap,
                      Text(
                        "FAILURE",
                        style: 27.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                      142.vGap,
                      MtInkWell(
                        onTap: () {
                          /// 退出弹框
                          Get.back();

                          /// 退出升星
                          Get.back();
                        },
                        child: Container(
                          height: 51.h,
                          width: Utils.getMaxWidth(context) - 32.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.w),
                              border: Border.all(
                                color: AppColors.c666666,
                                width: 1.w,
                              )),
                          child: Center(
                            child: Text(
                              "GO BACK",
                              style: 23.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          });
    }

    update();
  }

  /// 获取最大升星次数
  int getMaxStarTimes() {
    List<StarUpNumDefinedEntity> list =
        List.from(CacheApi.starUpNumDefinedList);
    list.sort((a, b) {
      return a.starUpNum.compareTo(b.starUpNum);
    });
    return list.last.starUpNum;
  }

  /// 获取bonus 的下标列表
  List<int> getBonusList() {
    List<StarUpNumDefinedEntity> list =
        List.from(CacheApi.starUpNumDefinedList);
    list.sort((a, b) {
      return a.starUpNum.compareTo(b.starUpNum);
    });
    List<int> result = list.map((e) => e.starUpNum).toList();
    return result;
  }

  /// 低成功率弹警告框要求
  double getLowSuccessRate() {
    return Utils.getGameConstant(Constant.propBallId)
            ?.constantValue
            .toDouble() ??
        0;
  }

  /// 获取球员属性
  List<NewUpGradePlayer> getPropertyList() {
    var playerCapData =
        Utils.getPlayerCapData(teamPlayerUpStarVoEntity.playerId);
    var list = propertyList.sublist(0, 8).map((e) {
      var key = e;
      if (key == "FGM") {
        key = "PTS";
      }
      var proKey = ParamUtils.getProKey(key.toLowerCase());
      num baseValue = playerCapData.getValue(proKey);
      double potentialValue =
          teamPlayerUpStarVoEntity.potential.toJson()[proKey] ?? 0;
      return NewUpGradePlayer(e, baseValue.toDouble(), potentialValue);
    }).toList();
    return list;
  }

  /// 获取旋转次数
  int getNowCount() {
    return nowCount.value;
  }

  /// 成功率
  double getSuccessRate() {
    return startUpItem == null
        ? upStarTeamPlayerV2Entity == null
            ? Get.find<StarUpgradeNewController>().upSuccessRate.value
            : upStarTeamPlayerV2Entity!.successRate
        : startUpItem!.successRate * 100;
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

  @override
  void onClose() {
    repeatAnimationController.dispose();
    endAnimationController.dispose();
    slotMachineControllers.map((e) => e.dispose());
    super.onClose();
  }
}

class NewUpGradePlayer {
  final String propertyName;
  final double baseValue;
  final double beforePotential;

  NewUpGradePlayer(this.propertyName, this.baseValue, this.beforePotential);
}
