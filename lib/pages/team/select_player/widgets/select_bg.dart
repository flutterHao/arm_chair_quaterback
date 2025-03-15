import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectBgWidget extends StatelessWidget {
  const SelectBgWidget({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cF2F2F2,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 0,
              right: -20.w,
              child: IconWidget(
                icon: Assets.managerUiManagerLineupBg,
                iconColor: AppColors.cEBEBEB,
                iconWidth: 400.w,
              )),
          Positioned(
              bottom: -190.w,
              right: -150.w,
              child: Container(
                width: 300.w,
                height: 300.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.cEBEBEB, width: 20.w)),
              )),
          SafeArea(child: body),
        ],
      ),
    );
  }
}
