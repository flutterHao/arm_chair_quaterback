/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-21 20:47:10
 * @LastEditTime: 2024-12-18 20:20:58
 */

import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/big_player_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/small_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxCardWidget extends StatefulWidget {
  final bool isFlipped;
  final VoidCallback onFlip;
  final double? width;
  final bool isSmall;
  final PlayerCardEntity player;

  const BoxCardWidget({
    super.key,
    required this.isFlipped,
    required this.onFlip,
    this.width,
    this.isSmall = true,
    required this.player,
  });

  @override
  State<BoxCardWidget> createState() => _BoxCardWidgetState();
}

class _BoxCardWidgetState extends State<BoxCardWidget>
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
  void didUpdateWidget(covariant BoxCardWidget oldWidget) {
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
    return GestureDetector(
      onTap: widget.onFlip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          double angle = _animation.value * 3.14;
          return AnimatedScale(
            duration: const Duration(milliseconds: 250),
            scale: widget.player.isSelect.value ? 1.0 : 0.9,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: widget.isSmall
                  ? Container(
                      width: 98.w + (widget.player.isSelect.value ? 6.w : 0),
                      height: 136.w + (widget.player.isSelect.value ? 6.w : 0),
                      decoration: BoxDecoration(
                          border: widget.player.isSelect.value
                              ? Border.all(width: 3.w, color: AppColors.cFF7954)
                              : null,
                          borderRadius: BorderRadius.circular(15.w)),
                      child: angle >= pi / 2
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..scale(-1.0, 1.0),
                              child: SmallPlayerCard(
                                item: widget.player,
                              ),
                            )
                          : Image.asset(
                              Assets.managerUiManagerPlayercardSmall,
                              width: 88.w,
                              fit: BoxFit.fill,
                            ),
                    )
                  : Transform.scale(
                      alignment: Alignment.topCenter,
                      scale: 1.h / 1.w,
                      child: angle >= pi / 2
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..scale(-1.0, 1.0),
                              child: BigPlayerCard(
                                item: widget.player,
                              ),
                            )
                          : Image.asset(
                              Assets.managerUiManagerPlayercardBig,
                              width: 174.w,
                              fit: BoxFit.fill,
                            ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

String getBigCardImage(String grade) {
  switch (Utils.formatGrade(grade)) {
    case "S":
      return Assets.managerUiManagerPlayercardBig03;
    case "A":
      return Assets.managerUiManagerPlayercardBig02;
    default:
      return Assets.managerUiManagerPlayercardBig01;
  }
}

String getSmallCardImage(String grade) {
  switch (Utils.formatGrade(grade)) {
    case "S":
      return Assets.managerUiManagerPlayercardSmall03;
    case "A":
      return Assets.managerUiManagerPlayercardSmall02;
    default:
      return Assets.managerUiManagerPlayercardSmall01;
  }
}

Color getCardColor(String grade) {
  switch (Utils.formatGrade(grade)) {
    case "S":
      return AppColors.cFAC837;
    case "A":
      return AppColors.cC24CFF;
    default:
      return AppColors.c808080;
  }
}
