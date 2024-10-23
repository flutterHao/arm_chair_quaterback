// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2024-09-29 16:33:17
//  * @LastEditTime: 2024-09-30 12:16:25
//  */
// import 'package:arm_chair_quaterback/common/constant/assets.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
// import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
// import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/recover_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class RecoverConfirmButton extends GetView<TeamController> {
//   const RecoverConfirmButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         BorderWidget(
//           onTap: () {
//             controller.isRecovering.value = false;
//             controller.update();
//           },
//           offset: Offset(0, -3.w),
//           width: 69.w,
//           height: 44.w,
//           borderRadius: BorderRadius.circular(22.w),
//           child: IconWidget(
//             iconWidth: 18.w,
//             icon: Assets.iconClosePng,
//             iconColor: AppColors.cE72646,
//           ),
//         ),
//         10.hGap,
//         BorderWidget(
//           onTap: () {
//             showDialog(
//               context: Get.context!,
//               builder: (context) {
//                 return const RecoverDialog();
//               },
//             );
//           },
//           offset: Offset(0, -3.w),
//           width: 243.w,
//           height: 44.w,
//           borderRadius: BorderRadius.circular(22.w),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 left: 9.w,
//                 child: SizedBox(
//                   width: 26.w,
//                   height: 26.w,
//                   child: Stack(
//                     children: [
//                       IconWidget(iconWidth: 26.w, icon: Assets.uiIconRingPng),
//                       Positioned(
//                           left: 7.w,
//                           bottom: 7.w,
//                           child: IconWidget(
//                             iconWidth: 17.w,
//                             icon: Assets.uiIconRuidgtPng,
//                             iconColor: AppColors.c10A86A,
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 64.w,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "CONFIRM",
//                       style: 21.w7(color: AppColors.cF2F2F2),
//                     ),
//                     16.hGap,
//                     IconWidget(
//                       iconWidth: 15.w,
//                       icon: Assets.uiIconMoneyBPng,
//                       iconColor: AppColors.cF2F2F2,
//                     ),
//                     5.hGap,
//                     Text(
//                       "100K",
//                       style: 14.w7(color: AppColors.cF2F2F2),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
