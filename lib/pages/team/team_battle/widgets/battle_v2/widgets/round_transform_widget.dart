import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/18/11:16

class RoundTransformWidget extends StatefulWidget {
  const RoundTransformWidget({super.key, this.isLeftToRight = false});

  /// 箭头运动方向
  final bool isLeftToRight;

  @override
  State<RoundTransformWidget> createState() => _RoundTransformWidgetState();
}

class _RoundTransformWidgetState extends State<RoundTransformWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  int times = 1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && times == 1) {
        times += 1;
        animationController.reset();
        animationController.forward(from: 0);
      }
    });
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RoundTransformWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!animationController.isAnimating) {
      TeamBattleV2Controller teamBattleV2Controller = Get.find();
      animationController.duration = Duration(
          milliseconds: (800 / teamBattleV2Controller.gameSpeed).toInt());
      animationController.reset();
      times = 1;
      animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.isLeftToRight
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Transform.rotate(
          angle: widget.isLeftToRight ? pi : 0,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              var color =
                  widget.isLeftToRight ? AppColors.cD60D20 : AppColors.c1F8FE5;
              return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    color.withOpacity(0),
                    color.withOpacity(0.15),
                    color.withOpacity(0.8),
                  ]).createShader(bounds);
            },
            child: Opacity(
              opacity: 1 - animationController.value,
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 70.w) *
                    animationController.value,
                child: Image.asset(
                  Assets.managerUiManagerCourt02,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
