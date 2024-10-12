/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 20:42:45
 * @LastEditTime: 2024-10-11 21:42:59
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropBubleWidget extends StatelessWidget {
  const PropBubleWidget({super.key});

  Widget _row(int count, int award) {
    return Row(
      children: [
        _item(count >= 1),
        _item(count >= 2),
        _item(count >= 3),
       const SizedBox(width: 8),
        Text(
          "+$award",
          style: 16.w7(color: AppColors.cFF7954),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          _row(1, 1),
          7.vGap,
          _row(2, 4),
          7.vGap,
          _row(3, 9),
        ],
      ),
    );
  }
}

class _item extends StatelessWidget {
  const _item(this.isShow);
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 14.w,
          height: 28.w,
          decoration: BoxDecoration(
            color: AppColors.c262626,
            borderRadius: BorderRadius.circular(7.w),
          ),
        ),
        isShow
            ? IconWidget(
                iconWidth: 17.5.w,
                iconHeight: 12.5.w,
                icon: Assets.uiMoney_02Png)
            : 17.5.hGap
      ],
    );
  }
}
