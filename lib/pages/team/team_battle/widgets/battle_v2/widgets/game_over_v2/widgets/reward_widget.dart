import 'dart:async';

import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over_v2/widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2025/3/19/14:58

class RewardWidget extends StatefulWidget {
  const RewardWidget({super.key, required this.type, this.onEnd});

  /// eventType : 1 偷钱 2 偷球员
  final int type;
  final Function? onEnd;

  @override
  State<RewardWidget> createState() => _RewardWidgetState();
}

class _RewardWidgetState extends State<RewardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(milliseconds: 300));
  }

  @override
  void didUpdateWidget(covariant RewardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // test code
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    print('RewardWidget----RewardWidget------');
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          if (animationController.isCompleted) {
            return SizedBox.shrink();
          }
          return ClipRect(
            child: Align(
              heightFactor: 1 - animationController.value,
              child: Container(
                height: 118.w,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.cD1D1D1,
                  width: 1.w,
                ))),
                child: EventWidget(
                  type: widget.type,
                  onEnd: (bool res) async {
                    if (!res) {
                      return;
                    }
                    widget.onEnd?.call();
                    await Future.delayed(Duration(milliseconds: 300));
                    animationController.forward();
                  },
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
