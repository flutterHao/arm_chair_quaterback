import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/steal_response_entity.dart';
import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/14/17:50

class StealPlayerController extends GetxController
    with GetTickerProviderStateMixin {
  late StealTeamEntity stealTeamEntity;
  var loadStatus = LoadDataStatus.loading.obs;
  ScrollController scrollController = ScrollController();
  bool ready = false;

  /// 偷球员状态：0 未选择 1 成功 2 失败
  var stealStatus = 0.obs;

  late AnimationController animationController;
  late Animation hiddenOldWidgetAnimation;
  late Animation shakeAnimation;
  late Animation<Offset> translateAnimation;
  late Animation scaleAnimation;
  late Animation showAnimation;
  late Animation lastTextAnimation;

  late AnimationController failedAnimationController;
  late Animation flipAnimation;
  late Animation failedScaleAnimation;
  late Animation failedShowAnimation;

  int chooseIndex = -1;
  var milliseconds = 1300;
  var failedAnimationStart = false;

  late StealResponseEntity stealResponseEntity;

  @override
  void onInit() {
    super.onInit();
    _initData();
    failedAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    flipAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: failedAnimationController, curve: Interval(0.0, 100 / 300)));
    failedScaleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: failedAnimationController,
        curve: Interval(100 / 500, 300 / 300)));
    failedShowAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: failedAnimationController,
        curve: Interval(100 / 500, 300 / 300)));

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    animationController.addListener(() {
      if (animationController.value >= 800 / milliseconds &&
          stealStatus.value == 2) {
        failedAnimationStart = true;
        animationController.stop();
        failedAnimationController.forward();
      }
    });
    hiddenOldWidgetAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 100 / milliseconds)));
    scaleAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 148 / 108 + 0.5), weight: 800 / 900),
      TweenSequenceItem(
          tween: Tween(begin: 148 / 108 + 0.5, end: 148 / 108),
          weight: 100 / 900),
    ]).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(100 / milliseconds, 1000 / milliseconds)));
    shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(200 / milliseconds, 700 / milliseconds)),
    );
    showAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(1000 / milliseconds, 1100 / milliseconds)));
    lastTextAnimation = Tween(begin: 2.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(1100 / milliseconds, 1300 / milliseconds)));
  }

  translationPageEnd() {
    ready = true;
    update();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TeamApi.getStealTeam(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(),
      CacheApi.getStealPlayerRate(),
    ]).then((result) {
      stealTeamEntity = result[0] as StealTeamEntity;
      loadStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
      Get.back(result: false);
    });
  }

  onItemTap(
      StealTeamPlayers player,
      NbaPlayerInfosPlayerBaseInfoList playBaseInfo,
      int index,
      GlobalKey<State<StatefulWidget>> itemKey,
      Size screenSize) async {
    if (!Utils.canOperate()) return;
    await scrollController.animateTo(0,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    //点击之后不看再次点击
    if (chooseIndex != -1) {
      return;
    }
    chooseIndex = index;
    TeamApi.steal(player.uuid).then((res) {
      stealResponseEntity = res;
      if (res.stealPlayer != null) {
        /// success
        stealStatus.value = 1;
      } else {
        ///failed
        stealStatus.value = 2;
      }
      // 获取被点击 item 的 RenderBox 与全局位置
      final RenderBox renderBox =
          itemKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;
      var tappedItemRect = position & size;

      // 屏幕中心坐标
      final screenCenter = Offset(screenSize.width / 2, screenSize.height / 2);
      // 计算需要平移的偏移量：目标中心 - 当前中心
      translateAnimation = Tween<Offset>(
              begin: Offset.zero,
              end: Offset((screenCenter.dx - size.width / 2), screenCenter.dy) -
                  tappedItemRect.topLeft)
          .animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0 / milliseconds, 200 / milliseconds)),
      );
      animationController.forward();
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  String getTextByGrade(String grade) {
    // print('grade:$grade');
    var firstWhereOrNull =
        CacheApi.stealPlayerRateList.firstWhereOrNull((e) => e.grade == grade);
    if (firstWhereOrNull != null) {
      return firstWhereOrNull.difficulty.tr;
    }
    return "prop";
  }

  Color getColorByGrade(String grade) {
    var firstWhereOrNull =
        CacheApi.stealPlayerRateList.firstWhereOrNull((e) => e.grade == grade);
    if (firstWhereOrNull != null) {
      if (firstWhereOrNull.difficulty.toLowerCase().contains("easy")) {
        return AppColors.c10A86A;
      } else if (firstWhereOrNull.difficulty.toLowerCase().contains("normal")) {
        return AppColors.cDEA325;
      } else {
        return AppColors.cD60D20;
      }
    }
    return AppColors.c10A86A;
  }

  @override
  void onClose() {
    animationController.dispose();
    failedAnimationController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

class ShakeCurve extends Curve {
  final int shakes;

  const ShakeCurve({this.shakes = 3});

  @override
  double transform(double t) {
    // 使用正弦函数产生多次震动效果
    return sin(shakes * 2 * pi * t) * (1 - t);
  }
}
