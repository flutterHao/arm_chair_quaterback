/*
 * @Description: 确定按钮
 * @Author: lihonghao
 * @Date: 2024-09-28 15:59:52
 * @LastEditTime: 2024-09-28 16:04:36
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton(
      {super.key, this.width, this.height, required this.onTap, this.margin});
  final String text = "CONFIRM";
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Container(
        margin: margin,
        width: width ?? 243.w,
        height: height ?? 44.w,
        child: BtnBackground(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 9.w,
              child: SizedBox(
                width: 26.w,
                height: 26.w,
                child: Stack(
                  children: [
                    IconWidget(iconWidth: 26.w, icon: Assets.iconUiIconRing),
                    Positioned(
                        left: 7.w,
                        bottom: 7.w,
                        child: IconWidget(
                          iconWidth: 17.w,
                          icon: Assets.iconUiIconRuidgt,
                          iconColor: AppColors.c10A86A,
                        ))
                  ],
                ),
              ),
            ),
            Center(
                child: Text(
              "CONFIRM",
              style: 21.w7(color: AppColors.cF2F2F2),
            ))
          ],
        )),
      ),
    );
  }
}
