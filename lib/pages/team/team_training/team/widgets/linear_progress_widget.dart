/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:30:20
 * @LastEditTime: 2024-10-16 16:24:20
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressBar extends StatelessWidget {
  final double progress; // 进度值，0.0到1.0
  final double width; // 宽度
  final double? height; // 高度
  final Color? backgroundColor; // 背景颜色
  final Color? progressColor; // 进度颜色

  const CustomLinearProgressBar({
    super.key,
    required this.progress,
    this.width = double.infinity, // 默认填充父容器的宽度
    this.height, // 默认高度
    this.backgroundColor, // 默认背景颜色
    this.progressColor, // 默认进度条颜色
  });

  @override
  Widget build(BuildContext context) {
    double p = progress > 1 ? 1 : progress;
    return SizedBox(
      height: height ?? 4.w,
      width: width,
      child: LinearProgressIndicator(
        value: p,
        borderRadius: BorderRadius.circular((height ?? 4.w) / 2),
        color: progressColor ?? AppColors.cF2F2F2,
        backgroundColor: backgroundColor ?? AppColors.c666666,
      ),
    );
  }
}

// class CustomLinearProgressBar extends StatefulWidget {
//   final double progress; // 进度值，0.0到1.0
//   final double width; // 宽度
//   final double? height; // 高度
//   final Color? backgroundColor; // 背景颜色
//   final Color? progressColor; // 进度颜色

//   const CustomLinearProgressBar({
//     super.key,
//     required this.progress,
//     this.width = double.infinity, // 默认填充父容器的宽度
//     this.height, // 默认高度
//     this.backgroundColor, // 默认背景颜色
//     this.progressColor, // 默认进度条颜色
//   });

//   @override
//   _CustomLinearProgressBarState createState() => _CustomLinearProgressBarState();
// }

// class _CustomLinearProgressBarState extends State<CustomLinearProgressBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   double _currentProgress = 0.0;

//   @override
//   void initState() {
//     super.initState();

//     // 初始化 AnimationController，动画时长为 500 毫秒
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     // 初始化 Tween
//     _animation = Tween<double>(begin: 0.0, end: widget.progress).animate(_controller)
//       ..addListener(() {
//         setState(() {
//           _currentProgress = _animation.value; // 更新当前进度值
//         });
//       });

//     // 开始动画
//     _controller.forward();
//   }

//   @override
//   void didUpdateWidget(covariant CustomLinearProgressBar oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     // 当 progress 参数发生变化时，触发动画
//     if (oldWidget.progress != widget.progress) {
//       _animateProgressChange(oldWidget.progress, widget.progress);
//     }
//   }

//   void _animateProgressChange(double oldProgress, double newProgress) {
//     _animation = Tween<double>(begin: oldProgress, end: newProgress).animate(_controller);
//     _controller.forward(from: 0.0); // 从头开始动画
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height ?? 4.w,
//       width: widget.width,
//       child: LinearProgressIndicator(
//         borderRadius: BorderRadius.circular(( widget.height ?? 4.w) / 2),
//         value: _currentProgress, // 使用当前的动画值作为进度
//         color: widget.progressColor ?? Colors.blue,
//         backgroundColor: widget.backgroundColor ?? Colors.grey,
//       ),
//     );
//   }
// }
