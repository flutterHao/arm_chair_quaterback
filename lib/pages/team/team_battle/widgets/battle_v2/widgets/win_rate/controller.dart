import 'dart:math';

import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
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

  late EasyAnimationController easyAnimationController;
  int pointIndex = 0;

  List<Offset> stepNewList = [];
  late Size size;

  //游戏速度 默认 1
  double gameSpeed = 1;

  var isHomeWin = true;

  @override
  void onInit() {
    super.onInit();
    size = Size(getWidth(), getHeight());
    easyAnimationController = EasyAnimationController(
        vsync: this,
        begin: 0,
        end: 1,
        duration: const Duration(milliseconds: 1000));
    easyAnimationController.controller.addListener(animationListener);
  }

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
    easyAnimationController.dispose();
    super.onClose();
  }

  void addLast() {
    Offset offset = getLastOffset();
    addOffset(offset);
  }

  Offset getLastOffset() {
    var offset = Offset(size.width, isHomeWin ? 0 : size.height);
    return offset;
  }

  double getWidth() {
    return Utils.getMaxWidth(Get.context!) - 62.w;
  }

  double getHeight() {
    return 164.h;
  }

  setGameSpeed(double speed) {
    gameSpeed = speed;
  }

  jumpGame(List<OffsetEvent> oe) {
    easyAnimationController.stop();
    List<Offset> oldList = List.from(pointData);
    var newList = oe.map((e) => handlerOffset(e)).toList();
    var where = newList.where((e)=> e.dx>oldList.last.dx).toList();
    List<Offset> allList = [];
    allList.addAll(where);
    isHomeWin = oe.isNotEmpty ? oe.last.homeWin : true;
    allList.add(getLastOffset());
    chartPoints.addAll(allList);
    pointOffset.value = chartPoints.last;
  }

  addPoint(OffsetEvent oe) {
    ///计算每个点的位置
    Offset offset = handlerOffset(oe);
    isHomeWin = oe.homeWin;
    addOffset(offset);
  }

  void addOffset(Offset offset) {
    Offset preview = Offset.zero;
    if (pointData.isNotEmpty) {
      preview = pointData.last;
    }
    pointData.add(offset);
    if (pointData.length > 1) {
      var current = pointData.last;
      easyAnimationController.stop();
      easyAnimationController.set(preview, current,
          duration: Duration(milliseconds: (1000 / gameSpeed).toInt()));
      easyAnimationController.forward(from: 0);
    }
  }

  Offset handlerOffset(OffsetEvent oe) {
    TeamBattleV2Controller teamBattleV2Controller = Get.find();
    var totalCount = teamBattleV2Controller
        .getQuarterAvailableEventTotalCount(oe.event.quarter);
    var beforeQuarterEventCount =
        teamBattleV2Controller.getBeforeQuarterEventCount();

    ///计算每个点的位置
    var quarterWidth = size.width / 4;
    var beforeQuarterWidth = quarterWidth * (oe.event.quarter - 1);
    var stepX = quarterWidth / totalCount;
    double dy = 0;
    var halfHeight = size.height / 2;
    if (oe.offset.dy < 0) {
      /// away
      dy = halfHeight + oe.offset.dy.abs() * halfHeight;
    } else {
      /// home
      dy = halfHeight - oe.offset.dy.abs() * halfHeight;
    }
    // print('dy:$dy');
    var offset = Offset(
        beforeQuarterWidth +
            (oe.offset.dx - beforeQuarterEventCount + 1) * stepX,
        max(0, dy));
    return offset;
  }

  void animationListener() {
    pointOffset.value = easyAnimationController.animation.value;
    chartPoints.add(pointOffset.value);
    chartPoints.refresh();
  }

  double getWinRate() {
    var dy = pointOffset.value.dy;
    var halfHeight = size.height / 2;
    double value = 0;
    if (dy > size.height / 2) {
      ///away
      value = ((dy - halfHeight) / halfHeight) * 100;
    } else {
      ///home
      value = (halfHeight - dy) / halfHeight * 100;
    }
    value = min(100, max(0, value));
    return value;
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
