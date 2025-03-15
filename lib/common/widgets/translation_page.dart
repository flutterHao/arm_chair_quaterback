import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 转场
///@auther gejiahui
///created at 2025/3/14/17:58

class TranslationPage extends StatelessWidget {
  const TranslationPage({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c000000,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: IconWidget(
                icon: Assets.managerUiMangerNew22,
                iconWidth: 204.w,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: IconWidget(
                icon: Assets.managerUiMangerNew21,
                iconWidth: 204.w,
              )),
          Positioned(
              top: 259.h,
              child: OutlinedText(
                  text: "EVENT",
                  strokeWidth: 1.w,
                  strokeColor: AppColors.c4D4D4D,
                  textStyle: 140.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ))),
          Positioned(
              top: 305.h,
              child: child ??
                  Column(
                    children: [
                      Text(
                        "PLAYER",
                        style: 45.w5(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                      Text(
                        "POACHING",
                        style: 54.w7(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fOswaldBold,
                        ),
                      ),
                    ],
                  ))
        ],
      ),
    );
  }
}
