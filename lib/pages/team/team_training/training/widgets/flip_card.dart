/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-21 20:47:10
 * @LastEditTime: 2024-11-22 19:11:07
 */

import 'dart:math';

import 'package:arm_chair_quaterback/pages/news/new_list/widgets/news_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipCard extends StatefulWidget {
  final bool isFlipped;
  final VoidCallback onFlip;

  const FlipCard({
    super.key,
    required this.isFlipped,
    required this.onFlip,
  });

  @override
  _FlipCardState createState() => _FlipCardState();
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
    return GestureDetector(
      onTap: widget.onFlip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          double angle = _animation.value * 3.14;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: angle < pi / 2
                ? Container(
                    width: 60.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Front',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                : Container(
                    width: 60.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
