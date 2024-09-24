/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-10 10:49:23
 * @LastEditTime: 2024-09-24 16:00:39
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  const TextIconWidget(
      {super.key,
      required this.icon,
      required this.text,
      this.color = AppColors.cB3B3B3,
      this.width = 16,
      this.height});
  final double width;
  final double? height;
  final Color color;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset(
      icon,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );

    return Row(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            color, // 修改为你想要的颜色
            BlendMode.srcIn,
          ),
          child: image, // 替换为你的 PNG 图片
        ),
        5.hGap,
        Text(
          text,
          style: 12.w4(
            color: color,
          ),
        )
      ],
    );
  }
}
