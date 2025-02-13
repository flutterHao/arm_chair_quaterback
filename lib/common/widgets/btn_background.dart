/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-18 11:23:47
 * @LastEditTime: 2024-10-28 16:57:36
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///通用按钮背景
///@auther gejiahui
///created at 2024/9/18/09:52

class BtnBackground extends StatelessWidget {
  const BtnBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 43.w,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.cFF7954,
                  borderRadius: BorderRadius.circular(20.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cFF7954.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2), // 设置阴影的偏移量
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40.w,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
          ],
        ),
        Container(margin: EdgeInsets.only(bottom: 3.w), child: child),
      ],
    );
  }
}
