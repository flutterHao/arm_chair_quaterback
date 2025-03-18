// import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
// import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
// import 'package:arm_chair_quaterback/pages/team/team_gift/widgets/bottom_gift.dart';
// import 'package:arm_chair_quaterback/pages/team/team_gift/widgets/girl_status.dart';
// import 'package:arm_chair_quaterback/pages/team/team_gift/widgets/gril_bg_text.dart';
// import 'package:arm_chair_quaterback/pages/team/team_gift/widgets/money_info.dart';
// import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../common/constant/font_family.dart';
// import 'index.dart';
// import 'widgets/girl_desc.dart';

// class TeamGiftPage extends GetView<TeamGiftController> {
//   TeamGiftPage({super.key});
//   final beautyController = Get.find<BeautyController>();

//   // 主视图
//   Widget _buildView() {
//     var colors = beautyController.currentGirl.backGroundColor.map((e) => Color(e)).toList();
//     return Obx(() => Container(
//           decoration: BoxDecoration(
//               border: Border.all(width: 0),
//               gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: colors)),
//           child: Stack(
//             children: [
//               /// 背景灯光
//               Positioned(
//                 top: 169.h,
//                 bottom: 0,
//                 child: Image.asset(
//                   Assets.cheerleadersUiCheerleadersBgLight,
//                   width: 375.w,
//                   fit: BoxFit.fitWidth,
//                   color: Color(beautyController.currentGirl.lightColor),
//                   alignment: Alignment.topCenter,
//                 ),
//               ),
//               //背景文字
//               GrilBgTextWidget(),

//               ///妹子人物
//               Positioned(
//                 top: 48.w + 80.h,
//                 left: 0,
//                 right: 0,
//                 bottom: 210.h,
//                 child: Image.asset(
//                   beautyController.currentGirl.girlImg,
//                   fit: BoxFit.fitHeight,
//                   alignment: Alignment.bottomCenter,
//                 ),
//               ),

//               ///妹子状态
//               GirlStatusWidget(),

//               ///钱币信息
//               MoneyInfoWidget(),

//               ///赠礼气泡窗
//               GirlDescWidget(),

//               ///底部送礼物
//               BottomGiftWidget(),
//             ],
//           ),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       // canPop: false,
//       child: GetBuilder<TeamGiftController>(
//         init: TeamGiftController(),
//         id: "team_gift",
//         builder: (_) {
//           return Scaffold(
//             body: _buildView(),
//           );
//         },
//       ),
//     );
//   }

//   Widget _grade() {
//     return Positioned(
//       top: 48.w + 40.h,
//       left: 16.w,
//       child: Obx(() {
//         ///当前亲密度等级
//         var nowIntimacyLevel = controller.queryGirlDefine.value.intimacyLevel;
//         var maxIntimacyLevel = controller.gGirlDefine.value.maxIntimacyLevel;
//         var progress = ((nowIntimacyLevel / maxIntimacyLevel) * 100).round();
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(controller.gGirlDefine.value.eName,
//                 style: 30.w5(
//                   color: Colors.white,
//                   fontFamily: FontFamily.fOswaldMedium,
//                 )),
//             4.vGap,
//             Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
//                 decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16.w)),
//                 child: Row(
//                   children: [
//                     OutlinedText(
//                       text: beautyController.currentGirl.grade,
//                       textStyle: TextStyle(
//                           fontFamily: FontFamily.fRobotoBlack, letterSpacing: 0, height: 1, fontSize: 21.spMin),
//                     ),
//                     12.hGap,
//                     IconWidget(
//                       icon: Assets.cheerleadersUiCheerleadersIconType01,
//                       iconWidth: 18.h,
//                     )
//                   ],
//                 )),
//             20.vGap,
//             Column(
//               children: [
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
//                 16.vGap,
//                 IconWidget(
//                   icon: Assets.managerUiManagerIconStar04,
//                   iconWidth: 28.h,
//                   iconHeight: 32.h,
//                 ),
//                 SizedBox(height: 2),
//                 Text(
//                   controller.gGirlDefine.value.initialCharm,
//                   style: 12.w5(color: Colors.white, fontFamily: FontFamily.fRobotoMedium),
//                 )
//               ],
//             )
//           ],
//         );
//       }),
//     );
//   }
// }
