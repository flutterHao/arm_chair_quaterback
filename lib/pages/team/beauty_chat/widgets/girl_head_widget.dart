/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-27 11:56:08
 * @LastEditTime: 2025-03-03 14:56:28
 */
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GirlHeadWidget extends StatelessWidget {
  const GirlHeadWidget({super.key, required this.url, required this.width});
  final String url;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      onTap: () {
        Get.toNamed(RouteNames.beautyInfo);
      },
      child: Container(
        width: width,
        height: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 2),
          // color: AppColors.cED4873,
        ),
        child: Image.asset(
          Assets.teamUiHead01,
          width: width,
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
