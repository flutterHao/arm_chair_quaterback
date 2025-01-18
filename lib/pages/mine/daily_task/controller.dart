import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
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
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/wheel_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DailyTaskController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DailyTaskController();

  late WheelController wheelController;

  var scrollController = ScrollController();
  PageController pageController = PageController();
  PageController centerPageController = PageController();
  PageController girlPageController =
      PageController(initialPage: 1, viewportFraction: 0.75);

  var loadStatus = LoadDataStatus.loading.obs;
  late TurnTableEntity turnTableEntity;
  late TeamPropList teamProp;
  List<DailyMissionItem> dailyMissionList = [];
  List<TeamMissionEntity> weekMissionList = [];

  Timer? _dailyTimer;
  var dailyCountDown = 0.obs;

  @override
  void onInit() {
    super.onInit();
    wheelController = WheelController();
    initData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    centerPageController.dispose();
    girlPageController.dispose();
    _dailyTimer?.cancel();
    super.dispose();
  }

  Future getDailyMissions() {
    return MineApi.getTeamMissionList(2).then((result) {
      var temp = result;
      temp.sort((a, b) => a.missionDefineId.compareTo(b.missionDefineId));
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
    ]).then((result) {
      turnTableEntity = result[3] as TurnTableEntity;
      if (turnTableEntity.isStart != 0) {
        centerPageController.jumpToPage(1);
        pageController.jumpToPage(1);
      }
      weekMissionList = result[5] as List<TeamMissionEntity>;
      weekMissionList
          .sort((a, b) => a.missionDefineId.compareTo(b.missionDefineId));
      getDailyMissions();
      loadStatus.value = LoadDataStatus.success;
      update([idMain]);
    }, onError: (e) {
      print('error:$e');
      loadStatus.value = LoadDataStatus.error;
    });
  }

  void spin() {
    MineApi.turntable().then((result) {
      turnTableEntity = result;
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  void getTeamMissionAward(int missionId) {
    MineApi.getTeamMissionAward(missionId).then((result) {
      getDailyMissions();
      var hasBall = result.where((e) => e.id == 306).isNotEmpty;
      var hasLuckyCoin = result.where((e) => e.id == 201).isNotEmpty;
      var hasMoneyOrBetCoin =
          result.where((e) => e.id == 102 || e.id == 103).isNotEmpty;
      if (hasBall) {
        try {
          Get.find<TrainingController>().getData();
        } finally {}
      }
      if (hasMoneyOrBetCoin) {
        Get.find<HomeController>().refreshMoneyCoinWidget();
      }
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
  List<TeamMissionEntity> getNotGetMission() {
    return weekMissionList.where((e) => e.status == 3).toList();
  }

  /// 周已完成任务
  List<TeamMissionEntity> getWeekFinishMission() {
    return weekMissionList.where((e) => e.status == 2).toList();
  }

  /// 当前进行的周任务
  MissionDefineEntity getCurrentWeekMission() {
    var lastWhere = weekMissionList.firstWhere((e) => e.status == 1);
    var firstWhere = CacheApi.missionDefineList
        .firstWhere((e) => lastWhere.missionDefineId == e.missionDefineId);
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
          CacheApi.propDefineList!.firstWhere((e) => e.propId == id);
      list.add(TurnRewardItem(
          AwardItem(
              int.parse(split[1]), int.parse(split[2]), int.parse(split[0])),
          propDefineEntity));
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
      var split2 = element.split("_");
      list.add(AwardItem(
          int.parse(split2[1]), int.parse(split2[2]), int.parse(split2[0])));
    }
    return list;
  }

  static String get idMain => "id_main";

  static String get idDailyMission => "id_daily_mission";

  static String get idLuckyCoin => "id_lucky_coin";
}

class AwardItem {
  ///数量
  final int num;

  ///id
  final int id;

  ///类型 0:WheelRewardType.json  非0:PropDefine.json
  final int type;

  AwardItem(this.id, this.num, this.type);
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
