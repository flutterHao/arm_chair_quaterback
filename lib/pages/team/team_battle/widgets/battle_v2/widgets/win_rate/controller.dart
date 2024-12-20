import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/14:34

class WinRateController extends GetxController
    with GetTickerProviderStateMixin {
  var pointOffset = Offset.zero.obs;
  RxList<Offset> chartPoints = RxList();

  /// y：取值范围（-50，50）
  List<Offset> pointData = [
    // const Offset(0, 20), //0 90
    // const Offset(1, -20),
    // const Offset(2, 30),
    // const Offset(3, 10),
    // const Offset(4, 40),
    // const Offset(5, -30),
    // const Offset(6, -16),
    // const Offset(7, -20),
    // const Offset(8, -45),
    // const Offset(9, 40),
    // const Offset(10, 50),
  ];

  EasyAnimationController? easyAnimationController;
  int pointIndex = 0;

  List<Offset> stepNewList = [];
  Size size = Size(313.w, 164.h);

  //游戏速度 默认 1
  double gameSpeed = 1;

  @override
  void onReady() {
    super.onReady();
    var pkStartUpdatedEntity =
        Get.find<TeamBattleController>().pkStartUpdatedEntity;
    // 初始化 训练程度差值
    var abs = (pkStartUpdatedEntity?.homeTeamStrength ??
            0 - (pkStartUpdatedEntity?.awayTeamStrength ?? 0))
        .abs();
    abs = abs == 0 ? size.height / 2 : abs;
    pointData.add(Offset(0, abs));
  }

  @override
  void onClose() {
    easyAnimationController?.dispose();
    super.onClose();
  }

  setGameSpeed(double speed) {
    gameSpeed = speed;
  }

  jumpGame(List<OffsetEvent> oe) {
    easyAnimationController?.stop();
    List<Offset> oldList = List.from(pointData);
    var newList = oe.map((e) => handlerOffset(e)).toList();
    var sublist = newList.sublist(oldList.length);
    List<Offset> allList = [];
    // allList.addAll(oldList);
    allList.addAll(sublist);
    chartPoints.addAll(allList);
    pointOffset.value = chartPoints.last;
  }

  addPoint(OffsetEvent oe) {
    ///计算每个点的位置
    Offset offset = handlerOffset(oe);
    Offset preview = Offset.zero;
    if (pointData.isNotEmpty) {
      preview = pointData.last;
    }
    pointData.add(offset);
    if (pointData.length <= 1) {
      return;
    }
    var current = pointData.last;
    easyAnimationController?.controller.removeListener(animationListener);
    easyAnimationController = EasyAnimationController(
        vsync: this,
        begin: preview,
        end: current,
        duration: Duration(milliseconds: (1000 / gameSpeed).toInt()))
      ..controller.addListener(animationListener);
    easyAnimationController?.forward(from: 0);
  }

  Offset handlerOffset(OffsetEvent oe) {
    TeamBattleV2Controller teamBattleV2Controller = Get.find();
    var totalCount = teamBattleV2Controller
        .getQuarterAvailableEventTotalCount(oe.event.quarter);

    ///计算每个点的位置
    var stepX = size.width / 4 / totalCount;
    var dy = (size.height - oe.offset.dy * size.height);
    // print('dy:$dy');
    var offset = Offset((oe.offset.dx + 1) * stepX, max(0, dy));
    return offset;
  }

  void animationListener() {
    pointOffset.value = easyAnimationController?.animation.value;
    chartPoints.add(pointOffset.value);
    chartPoints.refresh();
  }

  String getWinRate() {
    var dy = pointOffset.value.dy;
    var value = (((size.height - dy) / size.height) * 100);
    value = value > 100 ? 100 : value;
    return "${value.toStringAsFixed(0)}%";
  }

  reStart() {
    pointData.clear();
    chartPoints.clear();
    pointOffset.value == Offset.zero;
  }

  List<Offset> list = [];

  List<Offset> _buildPath() {
    // var temp = Offset.zero;
    ///计算每个点的位置
    var stepY = size.height / 100;
    var stepX = size.width / 160;
    var points = List.generate(pointData.length, (index) {
      double dy = 0;
      if (pointData[index].dy < 0) {
        dy = pointData[index].dy.abs() * stepY + size.height / 2;
      } else {
        dy = size.height / 2 - pointData[index].dy;
      }
      return Offset(pointData[index].dx * stepX, dy);
    });
    final spline = CatmullRomSpline(points, tension: 1.0);
    return spline.generateSamples().map((e) => e.value).toList();
  }

  void calculate(double value) {
    print('value:$value');
    var index = (value * (stepNewList.length - 1)).toInt();
    var item = stepNewList[index];
    if (pointOffset.value.dx != item.dx) {
      pointOffset.value = item;
      print(
          'chartPoints.length:${stepNewList.length},${list.length},${chartPoints.length},$index');
      chartPoints.addAll(stepNewList.getRange(
          stepNewList.length - (list.length - chartPoints.length), index));
      chartPoints.refresh();
    }
  }
}
