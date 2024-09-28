import 'dart:math';

import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/28/16:57

class ScaleAnimationWidget extends StatefulWidget {
  const ScaleAnimationWidget(
      {super.key,
      required this.size,
      required this.image,
      this.borderRadius,
      this.onComplete});

  final Size size;
  final String image;
  final BorderRadius? borderRadius;
  final Function(String image)? onComplete;

  @override
  State<ScaleAnimationWidget> createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var progress = 0.0.obs;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: Random().nextInt(1000) + 1000));
    if (widget.onComplete != null) {
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.onComplete!.call(widget.image);
        }
        if(status == AnimationStatus.completed){
          animationController.reverse();
        }
      });
    }
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() => progress.value = animation.value);
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Obx(() {
      return SizedBox(
        width: widget.size.width * progress.value,
        height: widget.size.height * progress.value,
        child: ClipRRect(
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(widget.size.width * progress.value / 5),
            child: IconWidget(
                iconWidth: widget.size.width * progress.value,
                icon: widget.image)),
      );
    });
  }
}
