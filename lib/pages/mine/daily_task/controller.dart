import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/daily_task_wheel_entity.dart';
import 'package:arm_chair_quaterback/common/entities/mission_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';
import 'package:arm_chair_quaterback/common/entities/turn_table_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_prop_list.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/mine.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/award_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/success_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/wheel_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DailyTaskController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DailyTaskController();

  WheelController outerWheelController = WheelController();
  WheelController innerTopWheelController = WheelController();
  WheelController innerBottomWheelController = WheelController();

  var scrollController = ScrollController();
  PageController? btnPageController;

  PageController? centerPageController;
  PageController girlPageController =
      PageController(initialPage: 1, viewportFraction: 0.65);

  var loadStatus = LoadDataStatus.loading.obs;
  late TurnTableEntity turnTableEntity;
  late TeamPropList teamProp;
  List<DailyMissionItem> dailyMissionList = [];
  List<WeekMissionItem> weekMissionList = [];

  Timer? _dailyTimer;
  var dailyCountDown = 0.obs;
  var leftScore = 0.obs;
  var rightScore = 0.obs;
  var showRandomReward = false.obs;

  /// spin按钮是否可点击
  var isSpinBtnEnable = true.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    btnPageController?.dispose();
    centerPageController?.dispose();
    girlPageController.dispose();
    _dailyTimer?.cancel();
    super.dispose();
  }

  Future getDailyMissions() {
    return MineApi.getTeamMissionList(2).then((result) {
      var temp = result;
      final order = [2, 1, 3];
      temp.sort(
          (a, b) => order.indexOf(a.status).compareTo(order.indexOf(b.status)));
      dailyMissionList = temp.map((e) {
        var missionDefineEntity = CacheApi.missionDefineList
            .firstWhere((f) => e.missionDefineId == f.missionDefineId);
        return DailyMissionItem(e, missionDefineEntity);
      }).toList();
      startDailyTaskCountDown();
      update([idDailyMission]);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  Future getTeamProp() {
    return UserApi.getTeamProp(propId: 201).then((result) {
      teamProp = result[0];
      update([idLuckyCoin]);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  void initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      CacheApi.getDailyTaskWheel(),
      CacheApi.getWheelRewardType(),
      CacheApi.getPropDefine(),
      MineApi.getTurntableInfo(),
      getTeamProp(),
      MineApi.getTeamMissionList(3),
      CacheApi.getMissionDefine(),
      CacheApi.getGameConstant(),
      CacheApi.getWheelRandomReward(),
    ]).then((result) {
      turnTableEntity = result[3] as TurnTableEntity;
      if (turnTableEntity.currentLife == 0) {
        showReLifeDialog();
      }
      if (turnTableEntity.circle == 1) {
        outerWheelController.active(true);
      } else if (turnTableEntity.circle == 2) {
        innerTopWheelController.active(true);
      } else if (turnTableEntity.circle == 3) {
        innerBottomWheelController.active(true);
      }
      int initialPage = 0;
      if (turnTableEntity.isStart != 0 && btnPageController == null) {
        initialPage = 1;
      }
      centerPageController = PageController(initialPage: initialPage);
      btnPageController = PageController(initialPage: initialPage);
      var wml = result[5] as List<TeamMissionEntity>;
      wml.sort((a, b) => a.missionDefineId.compareTo(b.missionDefineId));
      weekMissionList = wml.map((e) {
        var missionDefineEntity = CacheApi.missionDefineList
            .firstWhere((f) => e.missionDefineId == f.missionDefineId);
        return WeekMissionItem(e, missionDefineEntity);
      }).toList();
      startDailyTaskCountDown();
      update([idDailyMission]);
      getDailyMissions();
      loadStatus.value = LoadDataStatus.success;
      update([idMain]);
    }, onError: (e) {
      print('error:$e');
      loadStatus.value = LoadDataStatus.error;
    });
  }

  Future reLife() {
    return MineApi.reLife().then((result) {
      turnTableEntity = result;
      outerWheelController.active(false);
      innerTopWheelController.active(false);
      innerBottomWheelController.active(false);
      if (turnTableEntity.circle == 1) {
        outerWheelController.active(true);
      } else if (turnTableEntity.circle == 2) {
        innerTopWheelController.active(true);
      } else if (turnTableEntity.circle == 3) {
        innerBottomWheelController.active(true);
      }
      Get.find<HomeController>().refreshMoneyCoinWidget();
      update([idSlotPan]);
    }, onError: (e) {
      // ErrorUtils.toast(e);
    });
  }

  Future giveUp() {
    return MineApi.giveUp().then((result) {
      Get.back();
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  Future showReLifeDialog() {
    return BottomTipDialog.show(
        context: Get.context!,
        height: 384.w,
        btnDirection: Axis.horizontal,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(
                iconWidth: 41.w, icon: Assets.managerUiManagerIconWheelHurt),
            13.hGap,
            IconWidget(
                iconWidth: 41.w, icon: Assets.managerUiManagerIconWheelHurt),
            13.hGap,
            IconWidget(
                iconWidth: 41.w, icon: Assets.managerUiManagerIconWheelHurt),
          ],
        ),
        title: "YOU’RE OUT",
        desc:
            "If you give up now,you’ll lose everything!Continue playing to keep your rewards and win some mor.",
        centerWidget: SizedBox(
          height: 97.w,
          child: Stack(
            children: [
              Positioned(
                  right: 51.w,
                  bottom: 9.w,
                  child: Row(
                    children: [
                      Text(
                        "COST:",
                        style: 16.w5(
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                      12.hGap,
                      IconWidget(
                          iconWidth: 24.w,
                          icon: getImageByAward(getReLifeCost())),
                      3.hGap,
                      Text(
                        getPropNum(getReLifeCost()),
                        style: 16.w5(
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        confirmStr: "PLAY ON",
        cancelStr: "GIVE UP",
        cancelBgColor: AppColors.cD60D20,
        onTap: () async {
          await reLife();
          Get.back();
        },
        cancelTap: () async {
          if (getTurnRewardList().isNotEmpty) {
            Get.back();
            showGiveUp2();
          } else {
            await giveUp();
            Get.back();
          }
        });
  }

  Future showGiveUp2() {
    return BottomTipDialog.show(
        context: Get.context!,
        height: 534.w,
        btnDirection: Axis.horizontal,
        cancelStr: "GIVE UP",
        confirmStr: "STAY",
        cancelBgColor: AppColors.cD60D20,
        title: "YOU’LL LOSE THESE REWARDS",
        desc:
            "If you give up now, you will lose all the rewards gathered so far!",
        centerWidget: Column(
          children: [
            27.vGap,
            Divider(
              color: AppColors.cD1D1D1,
              height: 1.w,
            ),
            Container(
              height: 190.w,
              margin: EdgeInsets.symmetric(horizontal: 59.w),
              child: GridView.builder(
                  itemCount: getTurnRewardList().length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    var item = getTurnRewardList()[index];
                    return Column(
                      children: [
                        SizedBox(
                          width: 41.w,
                          height: 41.w,
                          child: Center(
                            child: IconWidget(
                                iconWidth: 34.w,
                                icon: getImageByPath(
                                    item.propDefineEntity.propIcon)),
                          ),
                        ),
                        Text(
                          getPropNum(item.awardItem),
                          style: 14.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 44.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "COST:",
                    style: 16.w5(
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
                  ),
                  12.hGap,
                  IconWidget(
                      iconWidth: 24.w, icon: getImageByAward(getReLifeCost())),
                  3.hGap,
                  Text(
                    getPropNum(getReLifeCost()),
                    style: 16.w5(
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
                  ),
                  51.hGap,
                ],
              ),
            ),
          ],
        ),
        onTap: () async {
          await reLife();
          Get.back();
        },
        cancelTap: () async {
          print('give up 2 ----');
          await giveUp();
          Get.back();
        });
  }

  void spin({Function? onEnd}) {
    if (turnTableEntity.currentLife == 0) {
      showReLifeDialog();
      return;
    }
    if (!isSpinBtnEnable.value) {
      return;
    }
    showRandomReward.value = false;
    isSpinBtnEnable.value = false;
    MineApi.turntable().then((result) {
      var beforeTurnTableEntity =
          TurnTableEntity.fromJson(turnTableEntity.toJson());
      var awardItem = getAwardList(result.currentAward!)[0];
      List<DailyTaskWheelEntity> taskWheelList = [];
      if (result.circle == 1) {
        taskWheelList = getOutWheel();
      } else if (result.circle == 2) {
        taskWheelList = getInnerTopWheel();
      } else if (result.circle == 3) {
        taskWheelList = getInnerBottomWheel();
      } else {
        taskWheelList = getInnerCenterGirlWheel();
      }
      var index = taskWheelList.indexWhere((e) => e.id == result.currentId);
      if (result.circle == 4) {
        /// 抽到妹子碎片
        var random = Random().nextInt(3) + 3;
        var page = index + random;
        girlPageController
            .animateToPage(page,
                duration: const Duration(seconds: 4), curve: Curves.easeInOut)
            .then((_) {
          Future.delayed(const Duration(seconds: 2), () {
            /// 弹出成功弹框
            isSpinBtnEnable.value = true;
            claimRewards();
          });
        });
      } else {
        _startSpin(beforeTurnTableEntity, onEnd: () {
          /// 转盘转完之后再更新界面
          update([idSlotPan]);
          onEnd?.call();
          turnTableEntity = result;
          outerWheelController.active(false);
          innerTopWheelController.active(false);
          innerBottomWheelController.active(false);
          if (turnTableEntity.circle == 1) {
            outerWheelController.active(true);
          } else if (turnTableEntity.circle == 2) {
            innerTopWheelController.active(true);
          } else if (turnTableEntity.circle == 3) {
            innerBottomWheelController.active(true);
          }
          if (turnTableEntity.currentLife == 0) {
            showReLifeDialog();
          }
          if (awardItem.type == 0 && awardItem.id == 103) {
            ///抽中比赛类型
            centerPageController
                ?.animateToPage(2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut)
                .then((_) {
              leftScore.value = getLeftScore();
              rightScore.value = getRightScore();
            });
            Future.delayed(const Duration(seconds: 3), () {
              centerPageController
                  ?.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  .then((_) {
                leftScore.value = 0;
                rightScore.value = 0;
                isSpinBtnEnable.value = true;
              });
            });
          } else if (awardItem.type == 0 && awardItem.id == 104) {
            /// 抽中问号
            showRandomReward.value = true;
          } else {
            isSpinBtnEnable.value = true;
          }
        }, index: index);
      }
      if (btnPageController?.page == 0) {
        centerPageController?.animateToPage(1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
        btnPageController?.animateToPage(1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    }, onError: (e) {
      isSpinBtnEnable.value = true;
      ErrorUtils.toast(e);
    });
  }

  void _startSpin(TurnTableEntity temp, {Function? onEnd, int index = 0}) {
    WheelController wheelController;
    if (temp.circle == 1) {
      wheelController = outerWheelController;
    } else if (temp.circle == 2) {
      wheelController = innerTopWheelController;
    } else {
      wheelController = innerBottomWheelController;
    }
    if (scrollController.offset > 0) {
      scrollController
          .animateTo(0,
              duration: const Duration(milliseconds: 300), curve: Curves.linear)
          .then((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          wheelController.start(onEnd: onEnd, index: index);
        });
      });
    } else {
      wheelController.start(onEnd: onEnd, index: index);
    }
  }

  void claimRewards() {
    MineApi.claimRewards().then((result) async {
      var hasBall = result.where((e) => e.id == 306).isNotEmpty;
      var hasLuckyCoin = result.where((e) => e.id == 201).isNotEmpty;
      var hasMoneyOrBetCoin =
          result.where((e) => e.id == 102 || e.id == 103).isNotEmpty;
      if (hasBall) {
        try {
          Get.find<TrainingController>().getData();
        } catch (e) {
          print('TrainingController not init');
        }
      }
      if (hasMoneyOrBetCoin) {
        Get.find<HomeController>().refreshMoneyCoinWidget();
      }
      if (hasLuckyCoin) {
        getTeamProp();
      }
      Get.find<HomeController>().getOngoingDailyTaskList();

      await BottomTipDialog.showWithSound(
          isScrollControlled: true,
          isDismissible: false,
          backgroundColor: AppColors.cTransparent,
          context: Get.context!,
          builder: (context) {
            return const SuccessWidget();
          });
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  void getTeamMissionAward(int missionId) {
    MineApi.getTeamMissionAward(missionId).then((result) {
      getDailyMissions();
      var hasLuckyCoin = result.where((e) => e.id == 201).isNotEmpty;
      if (hasLuckyCoin) {
        getTeamProp();
      }
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  void startDailyTaskCountDown() {
    var time = getDailyEndTime();
    dailyCountDown.value = time;
    _dailyTimer?.cancel();
    _dailyTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      dailyCountDown.value = dailyCountDown.value - 1;
      if (dailyCountDown.value <= 0) {
        t.cancel();
      }
    });
  }

  /// 周未领奖任务
  List<WeekMissionItem> getNotGetMission() {
    return weekMissionList
        .where((e) => e.teamMissionEntity.status == 3)
        .toList();
  }

  /// 周已完成任务
  List<WeekMissionItem> getWeekFinishMission() {
    return weekMissionList
        .where((e) => e.teamMissionEntity.status == 2)
        .toList();
  }

  /// 当前进行的周任务
  MissionDefineEntity getCurrentWeekMission() {
    var lastWhere =
        weekMissionList.firstWhere((e) => e.teamMissionEntity.status == 1);
    var firstWhere = CacheApi.missionDefineList.firstWhere((e) =>
        lastWhere.teamMissionEntity.missionDefineId == e.missionDefineId);
    return firstWhere;
  }

  /// 获取当前电池数量
  int getBatteryCount() {
    if (turnTableEntity.functionAward.isEmpty) {
      return 0;
    }
    var split = turnTableEntity.functionAward.split("|");
    var fold = split.fold(0, (p, e) {
      var list = e.split("_");
      p += int.parse(list[2]);
      return p;
    });
    return fold;
  }

  /// 获取总电池数量
  int getBatteryTotalCount() {
    if (turnTableEntity.circle == 1) {
      return CacheApi.wheelRewardTypeList
          .firstWhere((e) => e.wheelRewardId == 105)
          .wheelRewardNum
          .toInt();
    }
    if (turnTableEntity.circle == 2 || turnTableEntity.circle == 3) {
      return CacheApi.wheelRewardTypeList
          .firstWhere((e) => e.wheelRewardId == 107)
          .wheelRewardNum
          .toInt();
    }
    return 0;
  }

  List<DailyTaskWheelEntity> getOutWheel() {
    var list = CacheApi.dailyTaskWheelList.where((e) => e.circle == 1).toList();
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  List<DailyTaskWheelEntity> getInnerTopWheel() {
    var list = CacheApi.dailyTaskWheelList.where((e) => e.circle == 2).toList();
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  List<DailyTaskWheelEntity> getInnerCenterGirlWheel() {
    var list = CacheApi.dailyTaskWheelList.where((e) => e.circle == 4).toList();
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  List<DailyTaskWheelEntity> getInnerBottomWheel() {
    var list = CacheApi.dailyTaskWheelList.where((e) => e.circle == 3).toList();
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  String getImage(DailyTaskWheelEntity item) {
    String url = "manager/ui_manager_gift_00";
    if (item.rewardType == 0) {
      var firstWhereOrNull = CacheApi.wheelRewardTypeList
          .firstWhereOrNull((e) => item.reward == e.wheelRewardId);
      if (firstWhereOrNull != null) {
        url = firstWhereOrNull.wheelRewardIcon;
      }
    } else {
      var firstWhereOrNull = CacheApi.propDefineList!
          .firstWhereOrNull((e) => item.reward == e.propId);
      if (firstWhereOrNull != null) {
        url = firstWhereOrNull.propIcon;
      }
    }
    return getImageByPath(url);
  }

  String getImageByAward(AwardItem item) {
    if (item.type == 0) {
      return Utils.getImageByWheelRewardId(item.id);
    } else {
      return Utils.getImageByPropId(item.id);
    }
  }

  String getImageByPath(String image) {
    return "assets/images/$image${Constant.imageSuffix}";
  }

  String getPropNum(AwardItem item) {
    if (item.id == 102) {
      return "${item.num}k";
    } else {
      return "${item.num}";
    }
  }

  /// 临时背包奖励
  List<TurnRewardItem> getTurnRewardList() {
    if (turnTableEntity.awardPool.isEmpty) {
      return [];
    }
    List<TurnRewardItem> list = [];

    /// 类型_id_数量 ，用 ｜ 分割；
    turnTableEntity.awardPool.split("|").forEach((element) {
      var split = element.split("_");
      var id = int.parse(split[1]);
      var propDefineEntity =
          CacheApi.propDefineList!.firstWhereOrNull((e) => e.propId == id);
      if (propDefineEntity != null) {
        list.add(TurnRewardItem(
            AwardItem(
                int.parse(split[1]), int.parse(split[2]), int.parse(split[0])),
            propDefineEntity));
      }
    });
    return list;
  }

  ///每日任务剩余倒计时时间（ms）
  int getDailyEndTime() {
    var dateTime = DateTime.now();
    var endTime =
        DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999);
    var difference = endTime.difference(dateTime);
    return difference.inSeconds;
  }

  String formatDailyTaskTime(int second) {
    int milliseconds = second * 1000; // 示例毫秒数

    // 创建一个 Duration 对象
    Duration duration = Duration(milliseconds: milliseconds);

    // 提取小时、分钟和秒
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    // 格式化输出
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  List<AwardItem> getAwardList(String str) {
    if (str.isEmpty) {
      return [];
    }
    List<AwardItem> list = [];
    var split = str.split('|');
    for (var element in split) {
      if (element.isEmpty) {
        continue;
      }
      var split2 = element.split("_");
      list.add(AwardItem(
          int.parse(split2[1]), int.parse(split2[2]), int.parse(split2[0])));
    }
    return list;
  }

  AwardItem getReLifeCost() {
    var gameConstant = Utils.getGameConstant(10015);
    var list = getAwardList(gameConstant?.constantStrVal ?? '');
    if (turnTableEntity.reLifeCount >= list.length) {
      return list.last;
    }
    return list[turnTableEntity.reLifeCount];
  }

  int getLeftScore() {
    return int.parse(turnTableEntity.matchScore?.split(':')[0] ?? "0");
  }

  int getRightScore() {
    return int.parse(turnTableEntity.matchScore?.split(':')[1] ?? "0");
  }

  /// 随机奖励抽奖结束
  onRandomAwardEnd() {
    isSpinBtnEnable.value = true;
  }

  TurnRewardItem? getGirlReward() {
    var turnRewardList = getTurnRewardList();
    var innerCenterGirlWheel = getInnerCenterGirlWheel();
    var list = turnRewardList.where((f) {
      var firstWhereOrNull = innerCenterGirlWheel.firstWhereOrNull((e) =>
          f.awardItem.type == e.rewardType && f.awardItem.id == e.reward);
      return firstWhereOrNull != null;
    }).toList();
    if (list.isEmpty) {
      return null;
    }
    return list.first;
  }

  /// 临时背包奖励
  List<TurnRewardItem> getSuccessTurnRewardList() {
    if (turnTableEntity.awardPool.isEmpty) {
      return [];
    }
    List<TurnRewardItem> list = [];

    /// 类型_id_数量 ，用 ｜ 分割；
    turnTableEntity.awardPool.split("|").forEach((element) {
      var split = element.split("_");
      var id = int.parse(split[1]);
      var propDefineEntity =
          CacheApi.propDefineList!.firstWhereOrNull((e) => e.propId == id);
      if (propDefineEntity != null) {
        list.add(TurnRewardItem(
            AwardItem(
                int.parse(split[1]), int.parse(split[2]), int.parse(split[0])),
            propDefineEntity));
      }
    });
    var girlReward = getGirlReward();
    if (girlReward != null) {
      list.removeWhere((e) =>
          e.awardItem.type == girlReward.awardItem.type &&
          e.awardItem.id == girlReward.awardItem.id);
    }
    return list;
  }

  static String get idMain => "id_main";

  static String get idDailyMission => "id_daily_mission";

  static String get idLuckyCoin => "id_lucky_coin";

  static String get idSlotPan => "id_slot_pan";
}

class AwardItem {
  ///数量
  final int num;

  ///id
  final int id;

  ///类型 0:WheelRewardType.json  非0:PropDefine.json
  final int type;

  AwardItem(this.id, this.num, this.type);

  factory AwardItem.fromJson(Map<String, dynamic> json) =>
      AwardItem(json["id"], json['num'], json["type"]);

  @override
  String toString() {
    return 'AwardItem{num: $num, id: $id, type: $type}';
  }
}

class TurnRewardItem {
  final AwardItem awardItem;

  final PropDefineEntity propDefineEntity;

  TurnRewardItem(this.awardItem, this.propDefineEntity);
}

class DailyMissionItem {
  final TeamMissionEntity teamMissionEntity;
  final MissionDefineEntity missionDefineEntity;

  DailyMissionItem(this.teamMissionEntity, this.missionDefineEntity);
}

class WeekMissionItem {
  final TeamMissionEntity teamMissionEntity;
  final MissionDefineEntity missionDefineEntity;

  WeekMissionItem(this.teamMissionEntity, this.missionDefineEntity);
}
