/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-09 19:12:03
 * @LastEditTime: 2024-12-11 21:03:26
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
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
      duration: const Duration(milliseconds: 300),
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
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: hight * (1 - _animation.value),
                child: Container(
                  width: double.infinity,
                  height: 130.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.cFF7954,
                      AppColors.cEE6C4D,
                    ],
                  )),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Text(
                          "congratulation".toUpperCase(),
                          style: TextStyle(
                            fontSize: 53.sp,
                            height: 0.2,
                            color: AppColors.cff7c5a.withOpacity(0.67),
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16.w, top: 47.w),
                        width: double.infinity,
                        height: 130.w,
                        alignment: Alignment.centerLeft,
                        child: widget.child,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
