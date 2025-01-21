import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/success_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReceiveAwardDilaog extends StatelessWidget {
  const ReceiveAwardDilaog({super.key, required this.awards});
  final Widget awards;

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      title: "Congratulations".toUpperCase(),
      content: Container(
        margin: EdgeInsets.only(top: 74.w),
        child: Column(
          children: [
            Text(
              "REWARD",
              style: 19.w4(
                fontFamily: FontFamily.fOswaldMedium,
                height: 0.9,
              ),
            ),
            10.vGap,
            Container(
              width: double.infinity,
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              color: AppColors.cE6E6E,
            ),
            23.vGap,
            awards
          ],
        ),
      ),
      comfirmBtn: MtInkWell(
        onTap: () => Get.back(),
        child: Container(
          height: 51.w,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.c000000,
            borderRadius: BorderRadius.circular(9.w),
          ),
          alignment: Alignment.center,
          child: Text(
            "receive reward".toUpperCase(),
            style: 23.w5(
              color: AppColors.cFFFFFF,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
