/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-29 16:06:50
 * @LastEditTime: 2024-12-13 15:22:26
//  */
// import 'package:arm_chair_quaterback/common/constant/font_family.dart';
// import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
// import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
// import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class AddBallDialog extends GetView<TrainingController> {
//   const AddBallDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomDialog(
//       height: 400.w,
//       title: "Tip",
//       desc:
//           "Automatically use Coins for training when there's a shortage of balls ",
//       content: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // IconWidget(
//           //   iconWidth: 129.w,
//           //   icon: Assets.newsUiIconBall,
//           // ),
//           Expanded(child: Container()),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "COST:",
//                 style: 16.w4(fontFamily: FontFamily.fOswaldBold),
//               ),
//               10.hGap,
//               Image.asset(
//                 Assets.commonUiCommonIconCurrency02,
//                 width: 20.w,
//               ),
//               5.hGap,
//               Text(
//                 "1",
//                 style: 16.w4(fontFamily: FontFamily.fOswaldBold),
//               ),
//             ],
//           ),
//         ],
//       ),
//       onComfirm: () {
//         // controller.buyTrainingBall(10);
//         controller.startSlot();
//       },
//     );
//   }
// }
