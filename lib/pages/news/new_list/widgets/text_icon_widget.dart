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
        Text(
          text,
          style: 12.w4(
            color: AppColors.c666666,
          ),
        )
      ],
    );
  }
}
