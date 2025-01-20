import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future showTopToastDialog({
  required Widget child,
  bool? needBg,
  Duration duration = const Duration(milliseconds: 1000), //停留时间
  double? height,
}) async {
  final overlayEntry = OverlayEntry(
    builder: (context) {
      return TopToastDialog(
        duration: duration,
        needBg: needBg??true,
        height: height,
        child: child,
      );
    },
  );

  Overlay.of(Get.context!).insert(overlayEntry);

  // 自动关闭弹窗
  await Future.delayed(duration + 600.milliseconds);
  overlayEntry.remove();
}

///顶部弹窗
class TopToastDialog extends StatefulWidget {
  const TopToastDialog(
      {super.key,
      required this.child,
      this.height,
      required this.duration,
      this.needBg = true});

  final Widget child;
  final double? height;
  final Duration duration;
  final bool needBg;

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
        parent: Tween<double>(begin: 0, end: 1).animate(_controller),
        curve: Curves.easeOutSine);

    _controller.forward().then((v) async {
      await Future.delayed(widget.duration);
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height ?? -130.w;

    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: height * (1 - _animation.value),
                      child: !widget.needBg
                          ? widget.child
                          : Container(
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
                                  height: 0.9,
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
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double.infinity,
                                height: 2.w,
                                color: AppColors.cFFFFFF,
                              ),
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
