/*
 * @Description: 用户头像
 * @Author: lihonghao
 * @Date: 2024-11-07 15:27:28
 * @LastEditTime: 2024-11-07 15:30:46
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvaterWidget extends StatelessWidget {
  const UserAvaterWidget({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.radius,
  });

  final String url;
  final double width;
  final double height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      url: url,
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(radius??width / 3),
      errorWidget: Container(
        width: width,
        height: height,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: AppColors.cD9D9D9, borderRadius: BorderRadius.circular(4.w)),
        child: Image.asset(
          Assets.iconUiDefault03,
          width: width * 5 / 6,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
