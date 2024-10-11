import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/10/11/21:26

class HeartbeatNumber extends StatefulWidget {
  const HeartbeatNumber({super.key});

  @override
  _HeartbeatNumberState createState() => _HeartbeatNumberState();
}

class _HeartbeatNumberState extends State<HeartbeatNumber> with SingleTickerProviderStateMixin {
  int _number = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // 动画时长
      vsync: this,
    );

    // 缩放动画，值从 1.0 到 1.2，然后回到 1.0，模仿心跳效果
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // 动画完成时反向播放
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementNumber() {
    setState(() {
      _number++;
    });
    _controller.forward(); // 每次数字改变时触发放大缩小动画
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _incrementNumber, // 点击屏幕增加数字
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value, // 根据动画值进行缩放
              child: Text(
                '$_number',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}