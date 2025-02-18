/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-10 18:08:14
 * @LastEditTime: 2025-02-15 18:18:23
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/buble_box.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardFlyWidget extends StatefulWidget {
  const CardFlyWidget({
    super.key,
    required this.duration,
  });
  final Duration duration;

  @override
  State<CardFlyWidget> createState() => _TopDialogState();
}

class _TopDialogState extends State<CardFlyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isShow = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
        parent: Tween<double>(begin: 0, end: 1).animate(_controller),
        curve: Curves.easeOutSine);
    _controller.forward().then((v) async {
      IllustratiionsController ctrl = Get.find();
      ctrl.hasNewPlayer.value = true;
      isShow = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 40.w + 350.h * (1 - _animation.value),
                  child: Visibility(
                    visible: isShow,
                    child: Transform.scale(
                      alignment: Alignment.bottomCenter,
                      scale: 1 - _animation.value,
                      child: Image.asset(
                        Assets.managerUiManagerPlayercardBig,
                        width: 174.w * 0.5,
                        height: 267.w * 0.5,
                      ),
                    ),
                  )),
            ],
          );
        });
  }
}
