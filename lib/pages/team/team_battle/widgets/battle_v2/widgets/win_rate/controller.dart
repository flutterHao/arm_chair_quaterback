import 'dart:async';

import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
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
    const Offset(0, 20), //0 90
    const Offset(1, -20),
    const Offset(2, 30),
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

  @override
  void onInit() {
    super.onInit();
    easyAnimationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        duration: const Duration(milliseconds: 500))
      ..controller.addListener(() {
        calculate(easyAnimationController.value.value);
      });
  }

  @override
  void dispose() {
    easyAnimationController.dispose();
    super.dispose();
  }

  addPoint(Offset point) {
    print('addPoint------');
    pointData.add(point);
    if (pointData.length <= 3) {
      return;
    }
    var result = _buildPath();
    stepNewList = result.sublist(chartPoints.length);
    list = result;
    print('list:$list');
    easyAnimationController.forward(from: 0);
  }

  reStart() {
    pointData.clear();
    chartPoints.clear();
    pointOffset.value == Offset.zero;
  }

  List<Offset> list = [];

  List<Offset> _buildPath() {
    Size size = Size(325.w, 181.h);

    // var temp = Offset.zero;
    var stepY = size.height / 100;
    var stepX = size.width / (pointData.length - 1);
    var points = List.generate(pointData.length, (index) {
      double dy = 0;
      if (pointData[index].dy < 0) {
        dy = pointData[index].dy.abs() * stepY + size.height / 2;
      } else {
        dy = size.height / 2 - pointData[index].dy;
      }
      return Offset(pointData[index].dx * stepX, dy);
    });
    final spline = CatmullRomSpline(points);
    return spline.generateSamples().map((e) => e.value).toList();
  }

  void calculate(double value) {
    var index = (value * (stepNewList.length - 1)).toInt();
    var item = stepNewList[index];
    if (pointOffset.value.dx != item.dx) {
      pointOffset.value = item;
      // print('chartPoints.length:${chartPoints.length},$index,${list.length}');
      chartPoints.addAll(
          stepNewList.getRange(list.length - chartPoints.length, index));
      chartPoints.refresh();
    }
  }
}
