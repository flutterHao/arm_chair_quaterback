// 箭头方向的枚举
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ArrowDirection { up, down, left, right }

/// 气泡框
class BubbleBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final ArrowDirection arrowDirection;
  final double arrowSize; // 箭头的高度
  final double arrowWidth; // 箭头的宽度
  final double arrowOffset; // 箭头距离边角的偏移量

  const BubbleBox({
    super.key,
    required this.child,
    this.color = Colors.black,
    this.arrowDirection = ArrowDirection.down, // 默认箭头向下
    this.arrowSize = 6.0, // 控制箭头的高度（降低箭头高度）
    this.arrowWidth = 8.0,
    this.arrowOffset = 20, // 控制箭头的宽度
  });

  @override
  Widget build(BuildContext context) {
    // 根据箭头的方向为气泡框添加外部边距
    EdgeInsets padding;

    switch (arrowDirection) {
      case ArrowDirection.up:
        padding = EdgeInsets.only(top: arrowSize); // 上方预留箭头空间
        break;
      case ArrowDirection.down:
        padding = EdgeInsets.only(bottom: arrowSize); // 下方预留箭头空间
        break;
      case ArrowDirection.left:
        padding = EdgeInsets.only(left: arrowSize); // 左边预留箭头空间
        break;
      case ArrowDirection.right:
        padding = EdgeInsets.only(right: arrowSize); // 右边预留箭头空间
        break;
    }

    return Padding(
      padding: padding,
      child: CustomPaint(
        painter: BubblePainter(
            color: color,
            arrowDirection: arrowDirection,
            arrowSize: arrowSize,
            arrowWidth: arrowWidth,
            arrowOffset: arrowOffset),
        child: child,
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final Color color;
  final ArrowDirection arrowDirection;
  final double arrowSize; // 箭头高度
  final double arrowWidth; // 箭头宽度
  final double arrowOffset; // 箭头距离边角的偏移量

  BubblePainter({
    required this.color,
    required this.arrowDirection,
    required this.arrowSize,
    required this.arrowWidth,
    this.arrowOffset = 20.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();

    double radius = 6.0.w; // 气泡框的圆角半径

    // 调整箭头绘制的形状和位置
    switch (arrowDirection) {
      case ArrowDirection.up:
        // 绘制朝上的箭头
        path.moveTo(size.width - (arrowOffset + arrowWidth), 0);
        path.lineTo(
            size.width - (arrowOffset + arrowWidth / 2), -arrowSize); // 箭头顶点更圆滑
        path.lineTo(size.width - arrowOffset, 0);
        path.lineTo(radius, 0); // 开始绘制气泡框
        path.quadraticBezierTo(0, 0, 0, radius);
        path.lineTo(0, size.height - radius);
        path.quadraticBezierTo(0, size.height, radius, size.height);
        path.lineTo(size.width - radius, size.height);
        path.quadraticBezierTo(
            size.width, size.height, size.width, size.height - radius);
        path.lineTo(size.width, radius);
        path.quadraticBezierTo(size.width, 0, size.width - radius, 0);
        path.close();
        break;

      case ArrowDirection.down:
        // 绘制朝下的箭头
        path.moveTo(radius, 0);
        path.lineTo(size.width - radius, 0);
        path.quadraticBezierTo(size.width, 0, size.width, radius);
        path.lineTo(size.width, size.height - radius - arrowSize);
        path.quadraticBezierTo(
            size.width, size.height, size.width - radius, size.height);
        path.lineTo(size.width - (arrowOffset + arrowWidth), size.height);
        path.lineTo(size.width - (arrowOffset + arrowWidth / 2),
            size.height + arrowSize); // 箭头顶点
        path.lineTo(size.width - arrowOffset, size.height);
        path.lineTo(radius, size.height);
        path.quadraticBezierTo(0, size.height, 0, size.height - radius);
        path.lineTo(0, radius);
        path.quadraticBezierTo(0, 0, radius, 0);
        path.close();
        break;

      case ArrowDirection.left:
        // 绘制朝左的箭头
        path.moveTo(arrowSize, arrowOffset + arrowWidth);
        path.lineTo(0, arrowOffset + arrowWidth / 2); // 箭头顶点
        path.lineTo(arrowSize, arrowOffset);
        path.lineTo(arrowSize, radius);
        path.quadraticBezierTo(arrowSize, 0, arrowSize + radius, 0);
        path.lineTo(size.width - radius, 0);
        path.quadraticBezierTo(size.width, 0, size.width, radius);
        path.lineTo(size.width, size.height - radius);
        path.quadraticBezierTo(
            size.width, size.height, size.width - radius, size.height);
        path.lineTo(arrowSize + radius, size.height);
        path.quadraticBezierTo(
            arrowSize, size.height, arrowSize, size.height - radius);
        path.close();
        break;

      case ArrowDirection.right:
        // 绘制朝右的箭头
        path.moveTo(radius, 0);
        path.lineTo(size.width - arrowSize - radius, 0);
        path.quadraticBezierTo(
            size.width - arrowSize, 0, size.width - arrowSize, radius);
        path.lineTo(size.width - arrowSize, arrowOffset);
        path.lineTo(size.width, arrowOffset + arrowWidth / 2); // 箭头顶点
        path.lineTo(size.width - arrowSize, arrowOffset + arrowWidth);
        path.lineTo(size.width - arrowSize, size.height - radius);
        path.quadraticBezierTo(size.width - arrowSize, size.height,
            size.width - arrowSize - radius, size.height);
        path.lineTo(radius, size.height);
        path.quadraticBezierTo(0, size.height, 0, size.height - radius);
        path.lineTo(0, radius);
        path.quadraticBezierTo(0, 0, radius, 0);
        path.close();
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
