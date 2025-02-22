/*
 * @Author: lihonghao
 * @Date: 2025-02-22 17:32:55
 * @LastEditTime: 2025-02-22 17:33:01
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  final bool value; // 当前开关的状态
  final ValueChanged<bool> onChanged; // 开关状态改变时的回调函数
  final Color activeColor; // 开关打开时的颜色
  final Color trackColor; // 开关关闭时的背景颜色
  final double width; // 开关的宽度
  final double height; // 开关的高度

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.trackColor,
    this.width = 40, // 默认宽度
    this.height = 20, // 默认高度
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.value ? 1.0 : 0.0, // 根据初始状态设置动画进度
    );
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationController.animateTo(widget.value ? 1.0 : 0.0); // 当状态改变时更新动画
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value); // 切换状态
        _animationController.animateTo(widget.value ? 1.0 : 0.0); // 切换时触发动画
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width.w, // 使用设置的宽度
        height: widget.height.h, // 使用设置的高度
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), // 设置圆角
          color:
              widget.value ? widget.activeColor : widget.trackColor, // 根据状态切换颜色
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut, // 滑动的动画曲线
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft, // 滑块的位置
          child: Container(
            width: 16.w, // 滑块的宽度
            height: 16.h, // 滑块的高度
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // 滑块是一个圆形
              color: Colors.white, // 滑块颜色
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // 销毁动画控制器
    super.dispose();
  }
}
