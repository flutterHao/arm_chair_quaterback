import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text; // 按钮文字
  final ButtonType type; // 按钮类型
  final double width; // 按钮宽度
  final double height; // 按钮高度
  final double? fontSize;
  final VoidCallback onPressed; // 点击回调

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.type = ButtonType.confirm,
    required this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    // 根据按钮类型设置样式
    switch (type) {
      case ButtonType.cancel:
        backgroundColor = Colors.white;
        textColor = Colors.black;
        borderColor = AppColors.c666666;
        break;
      case ButtonType.confirm:
        backgroundColor = Colors.black;
        textColor = Colors.white;
        borderColor = Colors.black;

        break;
      case ButtonType.disabled:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        borderColor = Colors.grey;
        break;
    }

    return MtInkWell(
      onTap: () {
        type == ButtonType.disabled ? null : onPressed();
      },
      child: Container(
        width: width.w,
        height: height.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(9.w),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 16.sp,
            color: textColor,
            height: 1,
            fontFamily: FontFamily.fOswaldMedium,
          ),
        ),
      ),
    );
  }
}

// 按钮类型枚举
enum ButtonType {
  cancel, // 取消按钮
  confirm, // 确定按钮
  disabled, // 不可用按钮
}
