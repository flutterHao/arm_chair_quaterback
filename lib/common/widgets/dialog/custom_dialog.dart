import 'package:arm_chair_quaterback/common/widgets/dialog/comfirm_button.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * @Description: 自定义弹窗
 * @Author: lihonghao
 * @Date: 2024-09-28 15:59:52
 * @LastEditTime: 2024-10-12 18:36:24
 */
class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      this.title = "REWARDS",
      this.image,
      this.backgroudColor,
      required this.content,
      required this.onTap,  this.showComfirmButton=true});
  final String title;
  final String? image;
  final Color? backgroudColor;
  final Widget content;
  final Function onTap;
  final bool showComfirmButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        // margin: EdgeInsets.symmetric(horizontal: 36.w),
        constraints: const BoxConstraints(maxWidth: 350),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
                height: 38.w,
                child: Text(
                  title,
                  style: 52.w7(
                      color: backgroudColor ?? AppColors.cFF7954, height: 1),
                )),
            Container(
              height: 93.w,
              margin: EdgeInsets.only(top: 37.5.w),
              decoration: BoxDecoration(
                  color: backgroudColor ?? AppColors.cFF7954,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w))),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w),
              child: Image.asset(
                image ?? Assets.uiWindowsAwardPng,
                height: 104,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 30.w,
              margin: EdgeInsets.only(top: 105.5.w),
              decoration: BoxDecoration(
                  color: AppColors.c262626,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w))),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 108.w),
              constraints: BoxConstraints(minHeight: 244.w),
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 173.w),
                      child: content,
                    ),
                    if(showComfirmButton)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ConfirmButton(
                          margin: EdgeInsets.only(bottom: 27.w),
                          onTap: () => onTap()),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
