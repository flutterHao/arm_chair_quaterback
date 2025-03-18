// /*
//  * @Description: 换人换装页面
//  * @Author: lihonghao
//  * @Date: 2024-01-08 17:33:59
//  * @LastEditTime: 2025-01-09 14:18:22
//  */

// import 'dart:math';

// import 'package:arm_chair_quaterback/common/constant/font_family.dart';
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
// import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
// import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
// import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class BeautyProgress extends StatelessWidget {
//   const BeautyProgress({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BeautyController>(builder: (controller) {
//       var progress = Random().nextInt(50) + 50;
//       return Visibility(
//         visible: !controller.expandedGirl,
//         child: Container(
//           height: 53.h,
//           decoration: BoxDecoration(
//             color: AppColors.c000000,
//             borderRadius: BorderRadius.circular(9.w),
//           ),
//           child: Row(
//             children: [
//               5.hGap,
//               Stack(
//                 children: [
//                   Container(
//                     width: 43.h,
//                     height: 43.h,
//                     alignment: Alignment.centerLeft,
//                     decoration: BoxDecoration(
//                       color: AppColors.c404040,
//                       borderRadius: BorderRadius.circular(6.w),
//                     ),
//                   ),
//                   Positioned(
//                     top: 6.5.h,
//                     left: 6.5.h,
//                     child: IconWidget(
//                       iconWidth: 27.5.h,
//                       icon: Assets.cheerleadersUiCheerleadersIconType01,
//                     ),
//                   )
//                 ],
//               ),
//               11.hGap,
//               Text(
//                 "GIRL’S NAME",
//                 style: 24.w4(
//                     fontFamily: FontFamily.fOswaldMedium,
//                     color: AppColors.cFFFFFF),
//               ),
//               const Expanded(child: SizedBox.shrink()),
//               if (controller.beautyIndex.value !=
//                   controller.girlList.length - 1)
//                 CircleProgressView(
//                     backgroundColor: AppColors.c333333,
//                     progressColor: AppColors.cFF5672,
//                     progressWidth: 4.h,
//                     progress: progress * 1.0,
//                     width: 43.h,
//                     height: 43.h,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconWidget(
//                           iconWidth: 21.h,
//                           icon: Assets.cheerleadersUiCheerleadersIconIntimacy,
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
//                           "$progress%",
//                           style: TextStyle(
//                               fontFamily: FontFamily.fRobotoMedium,
//                               color: AppColors.cFFFFFF,
//                               height: 0.8,
//                               fontSize: 10.h),
//                         ),
//                       ],
//                     )),
//               SizedBox(width: 5.5.h),
//               IconWidget(
//                 iconWidth: 14.w,
//                 icon: Assets.iconUiIconArrows04,
//                 rotateAngle: -90,
//               ),
//               SizedBox(width: 9.h)
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
