/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-03-06 19:07:54
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-01-15 14:48:52
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustratiionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  IllustratiionsController();
  late AnimationController animationController;
  late Animation<double> progressAnimation;
  PlayerCollectEntity playerCollectEntity = PlayerCollectEntity();
  Duration rotateDuration = const Duration(milliseconds: 300);
  double _progress = 0;
  double rotateAngle = 0;
  int currentLevel = 0;
  final List<String> positions = ["ALL", "C", "SF", "PF", "SG", "PG"];
  final List<String> grades = [
    "ALL",
    "S+",
    "S",
    "S-",
    "A+",
    "A",
    "A-",
    "B+",
    "B",
    "B-",
    "C+",
    "C",
    "C-",
    "D+",
    "D",
    "D-"
  ];
  List<int> teams = [];

  List<RxBool> posiStatuList = [];
  List<RxBool> gradesStatuList = [];
  List<RxBool> teamStatuList = [];
  //球员基本信息
  late List<UpgradePlayerAbility> upgradePlayerAbilityList;

  //搜索条件
  var rangeValues = const RangeValues(1, 100).obs;

  ScrollController scrollController = ScrollController();
  var hasNewPlayer = false.obs;
  List<PlayerCardEntity> getPlayerCards = [];
  var isCollect = true.obs;

  @override
  void onInit() {
    super.onInit();
    initFilter();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    progressAnimation =
        Tween<double>(begin: 0.0, end: _progress).animate(animationController);
  }

  @override
  void onReady() {
    super.onReady();
    // getPlayerCollectInfo();
  }

  void initFilter() {
    for (int i = 0; i < positions.length; i++) {
      posiStatuList.add(i == 0 ? true.obs : false.obs);
    }

    for (int i = 0; i < grades.length; i++) {
      gradesStatuList.add(i == 0 ? true.obs : false.obs);
    }
    teams.add(0);
    teamStatuList.add(true.obs);
    for (int i = 101; i <= 130; i++) {
      teams.add(i);
      teamStatuList.add(false.obs);
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future getPlayerCollectInfo() async {
    await Future.wait([
      TeamApi.getPlayerCollect(),
      CacheApi.getPlayerBookRuleList(),
      CacheApi.getPlayerBookExpRuleList(),
    ]).then((v) async {
      double dy = 0;
      double height = (MediaQuery.of(Get.context!).size.width - 42.w - 24.w) /
          5 *
          (90 / 64);
      double vSpace = 15.5.w;
      var list = onfilter();
      var activeList = list.where((e) => e.isActive == 0).toList();
      var notActiveList = list.where((e) => e.isActive == 1).toList();
      playerCollectEntity = v[0] as PlayerCollectEntity;
      // double offset = ((300) ~/ 5) * (height + vSpace) + 12.w;
      // int t = ((offset - dy) * 0.5).ceil();
      // await scrollController.animateTo(offset,
      //     duration: Duration(milliseconds: t), curve: Curves.easeInOut);
      // return;

      /// activeList现役 notActiveList退役
      for (var item in activeList) {
        PlayerCollectCollects? myPlayer;
        if (hasNewPlayer.value) {
          myPlayer = playerCollectEntity.collects.firstWhereOrNull((e) =>
              e.playerId == item.playerId &&
              getPlayerCards
                  .where(((e) => e.playerId == item.playerId))
                  .isNotEmpty);

          if (myPlayer != null) {
            //如果是新获取的，添加获得动画
            int index = activeList.indexOf(item);
            if (index > 0) {
              double offset = ((index) ~/ 5) * (height + vSpace) + 12.w;
              int t = ((offset - dy) * 0.5).ceil();
              await scrollController.animateTo(offset,
                  duration: Duration(milliseconds: t), curve: Curves.easeInOut);
              item.fragmentNum = myPlayer.fragmentNum;
              item.isLight = myPlayer.isLight;
              item.isLightRx.value = myPlayer.isLight;
              update(["list"]);
              await Future.delayed(const Duration(milliseconds: 300));
              dy = offset;
            }
          }
        }

        myPlayer = playerCollectEntity.collects
            .firstWhereOrNull((e) => e.playerId == item.playerId);
        if (myPlayer != null) {
          item.fragmentNum = myPlayer.fragmentNum;
          item.isLight = myPlayer.isLight;
          item.isLightRx.value = myPlayer.isLight;
        }
      }
      double beginY =
          ((activeList.length) ~/ 5 + 1) * (height + vSpace) + 87.5.w + 25.w;
      for (var item in notActiveList) {
        PlayerCollectCollects? myPlayer;
        if (hasNewPlayer.value) {
          myPlayer = playerCollectEntity.collects.firstWhereOrNull((e) =>
              e.playerId == item.playerId &&
              getPlayerCards
                  .where(((e) => e.playerId == item.playerId))
                  .isNotEmpty);
          if (myPlayer != null) {
            if (hasNewPlayer.value) {
              int index = notActiveList.indexOf(item);
              if (index > 0) {
                double offset = beginY + ((index + 1) ~/ 5) * (height + 10.w);
                int t = ((offset - dy) * 0.5).ceil();
                offset = min(beginY, scrollController.position.maxScrollExtent);
                await scrollController.animateTo(offset,
                    duration: Duration(milliseconds: t),
                    curve: Curves.easeInOut);
                item.fragmentNum = myPlayer.fragmentNum;
                item.isLight = myPlayer.isLight;
                item.isLightRx.value = myPlayer.isLight;
                update(["list"]);
                await Future.delayed(const Duration(milliseconds: 300));
                dy = offset;
              }
            }
          }
        }
        //如果不是新获取的，直接赋值
        myPlayer = playerCollectEntity.collects
            .firstWhereOrNull((e) => e.playerId == item.playerId);
        if (myPlayer != null) {
          item.fragmentNum = myPlayer.fragmentNum;
          item.isLight = myPlayer.isLight;
          item.isLightRx.value = myPlayer.isLight;
        }
      }
      // update(["list"]);
      // await scrollController.animateTo(beginY,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

      //设置工资帽和升级经验
      var info = playerCollectEntity.teamBookPlayerCollect;
      for (var e in CacheApi.playerBookExpRuleList) {
        if (info.grade == e.grade) {
          int index = CacheApi.playerBookExpRuleList.indexOf(e);
          if (index + 1 < CacheApi.playerBookExpRuleList.length) {
            info.needExp = CacheApi.playerBookExpRuleList[index + 1].currExp;
          }
          // info.totalExp = e.totalExp;
          // info.needExp = e.currExp;
          info.addSalaryCap = e.addSalaryCap;
        }
      }

      // int diff = currentLevel != 0 ? info.grade - currentLevel : 0;
      if (info.grade > currentLevel) {
        currentLevel = info.grade;
        update(["list"]);
      }
      await updateProgress(info.grade, info.exp / info.needExp);
    });
  }

  /// 更新进度
  Future updateProgress(int newLevel, double newProgress) async {
    animationController.reset();
    progressAnimation = Tween<double>(begin: _progress, end: newProgress)
        .animate(animationController);
    _progress = newProgress;
    await animationController.forward().then((v) async {
      //升级旋转角度
      if (newLevel > currentLevel) {
        rotateDuration = 300.milliseconds;
        rotateAngle = -(newLevel - currentLevel) * 10 / 360;
        await Future.delayed(400.milliseconds, () {
          //更新界面
          currentLevel = newLevel;
          rotateAngle = 0;
          rotateDuration = 0.milliseconds;
        });
        update(["progress"]);
        update(["list"]);
      }
    });
  }

  ///筛选点击
  void onTapChange(List<RxBool> list, int index) {
    if (index != 0) {
      list[0].value = false;
      list[index].value = !list[index].value;
    } else {
      for (var i = 1; i < list.length; i++) {
        list[i].value = false;
      }
      list[0].value = !list[0].value;
      // list[index].value = !list[index].value;
    }
    // list[index].value = !list[index].value;
  }

  ///根据Position,Grade,Team等条件进行筛选
  List<PlayerCollectCollects> onfilter() {
    List<PlayerCollectCollects> list = List.from(CacheApi.playerBookRuleList);
    list = list.where((e) {
      //OVR
      bool isSelOvr = false;
      var ovr = Utils.getPlayBaseInfo(e.playerId).playerScore;
      if (rangeValues.value.start <= ovr && ovr <= rangeValues.value.end) {
        isSelOvr = true;
      }
      // 位置
      bool isSelPosition = false;
      var p = Utils.getPlayBaseInfo(e.playerId).position;

      // 如果第一个选项被选中，直接返回 true
      if (posiStatuList[0].value) {
        isSelPosition = true;
      } else {
        // 遍历所有的位置
        var isSelect = false;
        for (int i = 1; i < posiStatuList.length; i++) {
          // 找出选中的位置那些球员
          isSelect = isSelect || posiStatuList[i].value;
          if (posiStatuList[i].value && p.contains(positions[i])) {
            isSelPosition = true;
            break; // 找到一个匹配的位置即可退出循环
          }
        }
        // 如果没有选中的位置，则返回 true
        if (!isSelect) {
          isSelPosition = true;
        }
      }

      // 等级
      bool isSelGrade = false;
      var g = Utils.getPlayBaseInfo(e.playerId).grade;

      // 如果第一个选项被选中，直接返回 true
      if (gradesStatuList[0].value) {
        isSelGrade = true;
      } else {
        // 遍历所有的等级
        var isSelect = false;
        for (int i = 1; i < gradesStatuList.length; i++) {
          isSelect = isSelect || gradesStatuList[i].value;
          // 找出选中的等级那些球员
          if (gradesStatuList[i].value && g == grades[i]) {
            isSelGrade = true;
            break; // 找到一个匹配的等级即可退出循环
          }
        }
        if (!isSelect) {
          isSelGrade = true;
        }
      }

      // 球队
      bool isSelTeam = false;
      var t = Utils.getPlayBaseInfo(e.playerId).teamId;

      // 如果第一个选项被选中，直接返回 true
      if (teamStatuList[0].value) {
        isSelTeam = true;
      } else {
        // 遍历所有的球队
        var isSelect = false;

        for (int i = 1; i < teamStatuList.length; i++) {
          isSelect = isSelect || teamStatuList[i].value;
          // 找出选中的球队那些球员
          if (teamStatuList[i].value && t == teams[i]) {
            isSelTeam = true;
            break; // 找到一个匹配的球队即可退出循环
          }
        }
        if (!isSelect) {
          isSelTeam = true;
        }
      }

      return isSelPosition && isSelGrade && isSelTeam && isSelOvr;
    }).toList();
    return list;
  }

  void reset() {
    rangeValues.value = const RangeValues(1, 100);
    for (int i = 0; i < posiStatuList.length; i++) {
      posiStatuList[i].value = i == 0 ? true : false;
    }

    for (int i = 0; i < gradesStatuList.length; i++) {
      gradesStatuList[i].value = i == 0 ? true : false;
    }
    for (int i = 0; i < teamStatuList.length; i++) {
      teamStatuList[i].value = i == 0 ? true : false;
    }
  }

  void updateCollect() async {
    if (hasNewPlayer.value) {
      reset();
      await getPlayerCollectInfo();
      hasNewPlayer.value = false;
    } else {
      isCollect.value = true;
      await getPlayerCollectInfo();
    }
  }
}
