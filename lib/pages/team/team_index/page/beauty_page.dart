/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-12 17:33:59
 * @LastEditTime: 2024-10-12 17:37:53
 */
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:flutter/material.dart';

class BeautyPage extends StatelessWidget {
  const BeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(child: BlackAppWidget(Text("TREASURE")));
  }
}
