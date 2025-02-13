/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-21 20:47:10
 * @LastEditTime: 2025-02-13 18:06:17
 */

import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipCard extends StatefulWidget {
  final bool isFlipped;
  final VoidCallback onFlip;
  final TrainingInfoBuff buff;
  final double? width;
  final bool useSmallTacticCard;

  const FlipCard({
    super.key,
    required this.isFlipped,
    required this.onFlip,
    required this.buff,
    this.width,
    this.useSmallTacticCard = false,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isFlipped) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFlipped != widget.isFlipped) {
      if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      onTap: widget.onFlip,
      splashColor: Colors.transparent,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          double angle = _animation.value * 3.14;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: angle >= pi / 2
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: widget.useSmallTacticCard
                        ? SmallTacticCardNew(
                            buff: widget.buff,
                            width: widget.width ?? 74.w,
                          )
                        : TacticCard(
                            num: widget.buff.face,
                            color: widget.buff.color,
                            width: widget.width ?? 74.w,
                            buff: widget.buff,
                          ),
                  )
                : Image.asset(
                    Assets.managerUiManagerTacticsCardback,
                    width: 74.w,
                    fit: BoxFit.fill,
                  ),
          );
        },
      ),
    );
  }
}
