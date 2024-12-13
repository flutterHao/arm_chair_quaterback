import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///底部弹窗
///@auther gejiahui
///created at 2024/12/12/10:49

class BottomTipDialog {
  static Future show({
    required BuildContext context,
    required Function onTap,
    Widget? icon,
    String? title,
    String? desc,
    String? confirmStr,
    Color? confirmBtnColor,
    Widget? centerWidget,
  }) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return _BottomTipDialog(
            onTap: onTap,
            icon: icon,
            title: title,
            desc: desc,
            confirmStr: confirmStr,
            confirmBtnColor: confirmBtnColor,
            centerWidget: centerWidget,
          );
        });
  }
}

class _BottomTipDialog extends StatelessWidget {
  const _BottomTipDialog({
    required this.onTap,
    this.icon,
    this.title,
    this.desc,
    this.confirmStr,
    this.confirmBtnColor,
    this.centerWidget,
  });

  final Function onTap;
  final Widget? icon;
  final String? title;
  final String? desc;
  final String? confirmStr;
  final Color? confirmBtnColor;
  final Widget? centerWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 419.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          38.vGap,
          icon ??
              IconWidget(
                iconWidth: 62.w,
                icon: Assets.commonUiCommonIconSystemDanger,
                iconColor: AppColors.c000000,
              ),
          25.vGap,
          Text(
            title ?? "ARE YOU SURE",
            style: 27.w5(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium),
          ),
          10.vGap,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              desc ?? "Do you want to skip the game?",
              textAlign: TextAlign.center,
              style: 14.w4(
                  color: AppColors.c000000,
                  // height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          centerWidget ?? const SizedBox.shrink(),
          7.5.vGap,
          Container(
            height: 51.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            constraints: BoxConstraints(maxWidth: 343.w),
            decoration: BoxDecoration(
                color: confirmBtnColor ?? AppColors.c000000,
                borderRadius: BorderRadius.circular(9.w)),
            child: MtInkwell(
              onTap: () => onTap.call(),
              child: Center(
                child: Text(
                  confirmStr ?? "CONFIRM",
                  style: 23.w5(
                      color: AppColors.cF2F2F2,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          ),
          9.vGap,
          Container(
            height: 51.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            constraints: BoxConstraints(maxWidth: 343.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(color: AppColors.c666666, width: 1.w)),
            child: MtInkwell(
              onTap: () => Get.back(),
              child: Center(
                child: Text(
                  "CANCEL",
                  style: 23.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          ),
          41.vGap,
        ],
      ),
    );
  }
}
