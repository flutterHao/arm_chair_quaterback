import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///顶部弹窗
class TopToastDialog extends StatefulWidget {
  const TopToastDialog({super.key, required this.child, this.height});
  final Widget child;
  final double? height;

  @override
  State<TopToastDialog> createState() => _TopDialogState();
}

class _TopDialogState extends State<TopToastDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
        parent: Tween<double>(begin: 00, end: 1).animate(_controller),
        curve: Curves.easeOutSine);

    _controller.forward().then((v) {
      Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        _controller.reverse().then((v) {
          Navigator.of(context).pop();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double hight = widget.height ?? -130.w;

    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: hight * (1 - _animation.value),
                child: widget.child,
              ),
            ],
          );
        });
  }
}
