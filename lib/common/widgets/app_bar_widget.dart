import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///@author lihonghao
///@date 2024/9/9
///@description 页面标题栏
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.left, this.right, required this.title});
  final Widget? left;
  final Widget? right;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            SizedBox(
              width: 19.w,
              height: 19.w,
              child: left ??
                  InkWell(
                    onTap: () => Get.back(),
                    child: IconWidget(
                      iconWidth: 19.w,
                      iconHeight: 19.w,
                      icon: Assets.iconBackPng,
                      iconColor: Colors.white,
                    ),
                  ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: 19.w7(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 19.w,
              height: 19.w,
              child: right,
            )
          ],
        ),
      ),
    );
  }
}

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 63.w,
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        color: AppColors.c262626,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.w),
            bottomRight: Radius.circular(32.w)),
      ),
      child: child,
    );
  }
}
