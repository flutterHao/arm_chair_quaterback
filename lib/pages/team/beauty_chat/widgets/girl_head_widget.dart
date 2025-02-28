/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-27 11:56:08
 * @LastEditTime: 2025-02-27 12:03:04
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GirlHeadWidget extends StatelessWidget {
  const GirlHeadWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.w),
        color: AppColors.cED4873,
      ),
      child: Image.asset(
        Assets.cheerleadersUiCheerleaders02,
        width: 36.w,
        fit: BoxFit.contain,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
