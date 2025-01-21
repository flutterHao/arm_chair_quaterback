import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/comfirm_button.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * @Description: 自定义弹窗
 * @Author: lihonghao
 * @Date: 2024-09-28 15:59:52
 * @LastEditTime: 2025-01-14 20:43:04
 */

class CustomBottomDialog extends StatelessWidget {
  const CustomBottomDialog(
      {super.key,
      this.height,
      required this.title,
      this.desc,
      this.content,
      required this.onComfirm,
      this.comfirmText = "CONFIRM",
      this.isShowCancelButton = true});
  final double? height;
  final String title;
  final String? desc;
  final Widget? content;
  final Function onComfirm;
  final String comfirmText;
  final bool isShowCancelButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 489.w,
      // constraints: BoxConstraints(
      //   maxHeight: MediaQuery.of(context).size.height * 0.8, // 最大高度为屏幕高度的80%
      // ),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          // 12.vGap,
          // Container(
          //   decoration: BoxDecoration(
          //       color: AppColors.ccccccc,
          //       borderRadius: BorderRadius.circular(2.w)),
          //   height: 4.w,
          //   width: 44.w,
          // ),
          const DialogTopBtn(),
          24.vGap,
          Text(
            title,
            style: 27.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
          ),
          if (ObjectUtil.isNotEmpty(desc))
            Column(
              children: [
                14.5.vGap,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.w),
                  child: Text(
                    desc!,
                    textAlign: TextAlign.center,
                    style: 14.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        color: AppColors.c000000),
                  ),
                ),
                21.vGap,
              ],
            ),
          Expanded(
            child: Container(
              child: content,
            ),
          ),
          7.5.vGap,
          MtInkWell(
            onTap: () {
              onComfirm();
              Navigator.pop(context);
            },
            child: Container(
              height: 51.w,
              width: 343.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.c000000,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Text(
                "CONFIRM",
                style: 23.w5(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
          if (isShowCancelButton) 9.vGap,
          if (isShowCancelButton)
            MtInkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 51.w,
                width: 343.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: AppColors.c666666),
                    borderRadius: BorderRadius.circular(9.w)),
                child: Text(
                  "CANCEL",
                  style: 23.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          41.vGap,
        ],
      ),
    );
  }
}

class SimpleBottomDialog extends StatelessWidget {
  const SimpleBottomDialog({
    super.key,
    this.height,
    required this.child,
    this.onComfirm,
    this.onCencel,
  });
  final double? height;
  final Widget child;
  final Function? onComfirm;
  final Function? onCencel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 489.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          const DialogTopBtn(),
          Expanded(child: child),
          if (onComfirm != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: MtInkWell(
                      onTap: () {
                        if (onCencel != null) {
                          onCencel!();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 51.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.w),
                            border: Border.all(
                                width: 1.w, color: AppColors.c000000)),
                        child: Text(
                          "RESET",
                          style: 23.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              color: AppColors.c000000),
                        ),
                      ),
                    ),
                  ),
                  9.hGap,
                  Expanded(
                    child: MtInkWell(
                      minScale: 0.95,
                      onTap: () {
                        if (onComfirm != null) {
                          onComfirm!();
                        }
                      },
                      child: Container(
                        height: 51.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          color: AppColors.c000000,
                        ),
                        child: Text(
                          "CONFIRM",
                          style: 23.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              color: AppColors.cFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// class CustomDialog extends StatelessWidget {
//   const CustomDialog(
//       {super.key,
//       this.title = "REWARDS",
//       this.image,
//       this.backgroudColor,
//       required this.content,
//       required this.onTap,
//       this.showComfirmButton = true});
//   final String title;
//   final String? image;
//   final Color? backgroudColor;
//   final Widget content;
//   final Function onTap;
//   final bool showComfirmButton;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.transparent,
//       contentPadding: const EdgeInsets.all(0),
//       content: Container(
//         // margin: EdgeInsets.symmetric(horizontal: 36.w),
//         constraints: const BoxConstraints(maxWidth: 350),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             SizedBox(
//                 height: 38.w,
//                 child: Text(
//                   title,
//                   style: 52.w7(
//                       color: backgroudColor ?? AppColors.cFF7954,
//                       height: 1,
//                       fontFamily: FontFamily.fRobotoMedium),
//                 )),
//             Container(
//               height: 93.w,
//               margin: EdgeInsets.only(top: 37.5.w),
//               decoration: BoxDecoration(
//                   color: backgroudColor ?? AppColors.cFF7954,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16.w),
//                       topRight: Radius.circular(16.w))),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10.w),
//               child: Image.asset(
//                 image ?? Assets.iconUiWindowsAward,
//                 height: 96.w,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               height: 30.w,
//               margin: EdgeInsets.only(top: 105.5.w),
//               decoration: BoxDecoration(
//                   color: AppColors.c262626,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16.w),
//                       topRight: Radius.circular(16.w))),
//             ),
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.only(top: 108.w),
//               constraints: BoxConstraints(minHeight: 244.w),
//               decoration: BoxDecoration(
//                   color: AppColors.cF2F2F2,
//                   borderRadius: BorderRadius.circular(16.w)),
//               child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ConstrainedBox(
//                       constraints: BoxConstraints(minHeight: 173.w),
//                       child: content,
//                     ),
//                     if (showComfirmButton)
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: ConfirmButton(
//                             margin: EdgeInsets.only(bottom: 27.w),
//                             onTap: () => onTap()),
//                       )
//                   ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
