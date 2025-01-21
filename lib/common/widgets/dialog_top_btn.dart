import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/12/10:59

class DialogTopBtn extends StatelessWidget {
  const DialogTopBtn({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      minScale: 1.0,
      onTap: ()=> onTap??Get.back(),
      child: Container(
        width: 44.w,
        height: 4.w,
        margin: EdgeInsets.only(top: 12.w),
        decoration: BoxDecoration(
          color: AppColors.c000000.withOpacity(0.2),
          borderRadius: BorderRadius.circular(2.w)
        ),
      ),
    );
  }
}
