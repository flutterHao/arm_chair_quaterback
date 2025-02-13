import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

///
///@auther gejiahui
///created at 2024/11/30/11:17

class StartGameCountDownWidget extends StatefulWidget {
  const StartGameCountDownWidget({super.key ,required this.onStart,required this.onDown});

  final Function onDown;
  final Function onStart;

  @override
  State<StartGameCountDownWidget> createState() =>
      _StartGameCountDownWidgetState();
}

class _StartGameCountDownWidgetState extends State<StartGameCountDownWidget>
    with TickerProviderStateMixin {
  late EasyAnimationController startCountDownAnimationController;

  late EasyAnimationController scaleAnimationController;

  late Timer timer;

  double timeCountDown = 3;

  var over = false.obs;

  @override
  void initState() {
    super.initState();
    startCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: 4.0,
        end: 0.0,
        duration: const Duration(seconds: 3));
    startCountDownAnimationController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onDown.call();
      }
    });

    scaleAnimationController = EasyAnimationController(
        vsync: this,
        begin: 1.4,
        end: 1.0,
        duration: const Duration(milliseconds: 300));

    start();
    Future.delayed(Duration.zero,(){
      widget.onStart.call();
    });
  }

  start() {
    timeCountDown = 3;
    over.value = false;
    startCountDownAnimationController.forward(from: 0);
    scaleAnimationController.forward(from: 0);
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      scaleAnimationController.forward(from: 0);
      timeCountDown--;
      if (timeCountDown == 1) {
        over.value = true;
        t.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double value = startCountDownAnimationController.value.value;
      var progress = (4 - value) / 3;
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: over.value ? 0 : 1,
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
              color: AppColors.c000000.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30.w)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 51.w,
                height: 51.w,
                child: CircularProgressIndicator(
                  value: progress,
                  color: AppColors.cF2F2F2,
                  backgroundColor: AppColors.c666666,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 3.w,
                ),
              ),
              Transform.scale(
                scale: scaleAnimationController.value.value,
                child: Text(
                  "${timeCountDown.toInt()}",
                  style: 32.w5(
                      color: AppColors.cF2F2F2,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    startCountDownAnimationController.dispose();
    scaleAnimationController.dispose();
    timer.cancel();
    super.dispose();
  }
}
