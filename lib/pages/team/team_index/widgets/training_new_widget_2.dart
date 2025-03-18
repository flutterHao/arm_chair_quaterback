// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2025-02-11 16:05:49
//  * @LastEditTime: 2025-03-17 20:32:59
//  */
// import 'dart:math';

// import 'package:arm_chair_quaterback/common/constant/font_family.dart';
// import 'package:arm_chair_quaterback/common/entities/user_entiry/team.dart';
// import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
// import 'package:arm_chair_quaterback/common/routers/names.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
// import 'package:arm_chair_quaterback/common/utils/utils.dart';
// import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
// import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
// import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
// import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
// import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';

// import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_bottomsheet.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_dialog.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/task_arc_widget.dart';
// import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot_new_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class TrainingNewWidget extends GetView<TrainingController> {
//   const TrainingNewWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // controller.showAward();
//     return GetBuilder<TrainingController>(
//         id: "training_page",
//         builder: (ctrl) {
//           var team = HomeController.to.userEntiry.teamLoginInfo?.team;
//           return Container(
//               decoration: BoxDecoration(
//                 color: AppColors.cFFFFFF,
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(9.w),
//                 ),
//               ),
//               width: double.infinity,
//               height: 580.w,
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   ///背景文字
//                   Positioned(
//                     top: 20.w,
//                     left: 16.w,
//                     child: Text(
//                       team?.teamName ?? "",
//                       style: 14.w4(fontFamily: FontFamily.fRobotoRegular),
//                     ),
//                   ),
//                   Positioned(
//                     top: 42.5.w,
//                     left: 16.w,
//                     child: Text(
//                       "${MyDateUtils.getWeekday(DateTime.now())},${MyDateUtils.getEnDDMM(DateTime.now())}",
//                       style: 24.w4(
//                         fontFamily: FontFamily.fOswaldBold,
//                         height: 0.9,
//                       ),
//                     ),
//                   ),

//                   for (int i = 0; i < 3; i++)
//                     Positioned(
//                       top: 37.w,
//                       right: 21.w + i * 19.w,
//                       child: Image.asset(
//                         ctrl.shieldCount.value > i
//                             ? Assets.managerUiNewManger13
//                             : Assets.managerUiNewManger12,
//                         width: 24.w,
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),

//                   ///背景图
//                   Positioned(
//                     top: 76.w,
//                     child: Image.asset(
//                       Assets.managerUiNewManger03,
//                       width: 343.w,
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),

//                   Positioned(
//                       top: 91.w,
//                       left: 29.w,
//                       child: Container(
//                         width: 46.w,
//                         height: 16.w,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.w),
//                           color: AppColors.cF2F2F2.withOpacity(0.7),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 4.w,
//                               height: 4.w,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(2.w),
//                                   color: AppColors.cC42F3F),
//                             ),
//                             4.5.hGap,
//                             Text(
//                               "live".toUpperCase(),
//                               style:
//                                   10.w4(fontFamily: FontFamily.fRobotoMedium),
//                             )
//                           ],
//                         ),
//                       )),

//                   Positioned(
//                     top: 121.w,
//                     left: 29.w,
//                     child: Container(
//                       width: 165.w,
//                       height: 105.w,
//                       decoration: BoxDecoration(
//                           color: AppColors.cF2F2F2,
//                           borderRadius: BorderRadius.circular(4.w),
//                           border: Border.all(
//                             width: 2,
//                             color: AppColors.cD9D9D9,
//                           )),
//                       child: PreparationCard(),
//                     ),
//                   ),

//                   ///美女动画
//                   // Positioned(
//                   //   top: 67,
//                   //   left: 0,
//                   //   right: 0,
//                   //   child: GetBuilder<BeautyController>(
//                   //       // init: BeautyController(),
//                   //       builder: (beautyCtrl) {
//                   //     return InkWell(
//                   //       onTap: () {
//                   //         Random random = Random();
//                   //         beautyCtrl.setAnimation(random.nextBool() ? 1 : 2);
//                   //       },
//                   //       child: Container(
//                   //           margin: EdgeInsets.only(left: 130.w, top: 20.w),
//                   //           height: 468.5.w,
//                   //           child: SpineWidget.fromAsset(
//                   //             Assets.assetsSpineNv1,
//                   //             "assets/spine/nv_1.json",
//                   //             beautyCtrl.spineWidgetController,
//                   //             fit: BoxFit.fitHeight,
//                   //             alignment: Alignment.topCenter,
//                   //           )),
//                   //     );
//                   //   }),
//                   // ),

//                   //背景
//                   Positioned(
//                     top: 417.w,
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: 343.w,
//                           height: 142.5.w,
//                           decoration: BoxDecoration(
//                             gradient: RadialGradient(
//                               colors: [
//                                 AppColors.c4D4D4D,
//                                 AppColors.c4D4D4D,
//                                 AppColors.c262626,
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 343.w,
//                           height: 142.5.w,
//                           padding: EdgeInsets.all(5.w),
//                           decoration: BoxDecoration(
//                               color: AppColors.c3e3e3e,
//                               // color: AppColors.c262626.withOpacity(0.1),
//                               borderRadius: BorderRadius.vertical(
//                                 bottom: Radius.circular(9.w),
//                               )),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1,
//                                   color: AppColors.cD9D9D9.withOpacity(0.1)),
//                               borderRadius: BorderRadius.vertical(
//                                 bottom: Radius.circular(5.w),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   Positioned(
//                     top: 436.w,
//                     left: 35.5.w,
//                     child: const CollectWidget(),
//                   ),

//                   Positioned(
//                     top: 436.w,
//                     right: 35.5.w,
//                     child: const TrainingTaskWidget(),
//                   ),

//                   ///训练slot
//                   Positioned(
//                     top: 333.5.w,
//                     left: 30.w,
//                     right: 30.w,
//                     child: const TrainingSlotNew(),
//                   ),

//                   //开始按钮
//                   Positioned(
//                     top: 430.5.w,
//                     child: const SlotButton(),
//                   ),

//                   ///恢复倒计时
//                   // if (ctrl.trainingInfo.prop.num < ctrl.trainDefine.ballMaxNum)
//                   //   Positioned(
//                   //     // bottom: 12.w,
//                   //     top: 560.w,
//                   //     child: Row(
//                   //       mainAxisAlignment: MainAxisAlignment.end,
//                   //       children: [
//                   //         Text(
//                   //           "${ctrl.trainDefine.ballRecoverNum} Go ready in ",
//                   //           style: 12.w4(
//                   //               height: 1,
//                   //               fontFamily: FontFamily.fRobotoRegular,
//                   //               color: AppColors.c000000),
//                   //         ),
//                   //         Obx(() {
//                   //           return Text(
//                   //             ctrl.recoverTimeStr.value,
//                   //             style: 12.w4(
//                   //               height: 1,
//                   //               color: AppColors.c10A86A,
//                   //               fontFamily: FontFamily.fRobotoRegular,
//                   //             ),
//                   //           );
//                   //         }),
//                   //       ],
//                   //     ),
//                   //   ),
//                 ],
//               ));
//         });
//   }
// }

// class PreparationCard extends GetView<TrainingController> {
//   const PreparationCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var team = HomeController.to.userEntiry.teamLoginInfo?.team;
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Positioned(
//             child: Image.asset(
//           Assets.managerUiNewManger14,
//           width: 161.w,
//           fit: BoxFit.fitWidth,
//         )),
//         Positioned(
//           top: 10.w,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   UserAvatarWidget(
//                     url: Utils.getAvatarUrl(team?.teamLogo ?? 0),
//                     radius: 16.w,
//                     width: 32.w,
//                     height: 32.w,
//                   ),
//                   4.5.vGap,
//                   Text(
//                     team?.teamName ?? "",
//                     style: 9
//                         .w4(fontFamily: FontFamily.fOswaldRegular, height: 0.8),
//                   )
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Text(
//                   "VS",
//                   style: 16.w4(fontFamily: FontFamily.fOswaldMedium),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     width: 32.w,
//                     height: 32.w,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.w),
//                         color: AppColors.c262626),
//                     child: Text(
//                       "?",
//                       style: 17.w4(
//                           fontFamily: FontFamily.fRobotoBlack,
//                           color: AppColors.cFFFFFF),
//                     ),
//                   ),
//                   4.5.vGap,
//                   Text(
//                     ". . .",
//                     style: 9
//                         .w4(fontFamily: FontFamily.fOswaldRegular, height: 0.8),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//         Positioned(
//           top: 70.w,
//           child: Column(
//             children: [
//               Container(
//                 width: 161.w,
//                 height: 18.w,
//                 color: AppColors.c262626,
//                 padding: EdgeInsets.only(left: 5.5.w, right: 8.w, bottom: 4.w),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Game Preparation",
//                         style: 10.w4(
//                             fontFamily: FontFamily.fRobotoRegular,
//                             color: AppColors.cFFFFFF,
//                             height: 0.8),
//                       ),
//                     ),
//                     Text(
//                       "${(controller.trainingInfo.playerReadiness * 100).toInt()}",
//                       style: 14.w4(
//                           fontFamily: FontFamily.fOswaldMedium,
//                           color: AppColors.cFFFFFF,
//                           height: 0.8),
//                     ),
//                     Text(
//                       "%",
//                       style: 10.w4(
//                           fontFamily: FontFamily.fOswaldMedium,
//                           color: AppColors.cFFFFFF,
//                           height: 0.8),
//                     ),
//                   ],
//                 ),
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     width: 161.w,
//                     height: 6.w,
//                     color: AppColors.c262626,
//                   ),
//                   Positioned(
//                     left: 0,
//                     child: AnimatedContainer(
//                       duration: 300.milliseconds,
//                       width:
//                           (120.75).w * controller.trainingInfo.playerReadiness,
//                       height: 6.w,
//                       color: controller.trainingInfo.playerReadiness <= 1
//                           ? AppColors.c17C29C
//                           : AppColors.cCC2639,
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: Image.asset(
//                       Assets.managerUiNewManger05,
//                       width: 161.w * 0.25,
//                       color: AppColors.c4D4D4D,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SlotButton extends StatelessWidget {
//   const SlotButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TeamController>(builder: (controller) {
//       return InkWell(
//         onTap: () {
//           TeamIndexController ctrl = Get.find();
//           ctrl.matchBattle();
//         },
//         child: Container(
//           width: 120.w,
//           height: 91.w,
//           alignment: Alignment.center,
//           child: Opacity(
//             opacity: controller.showExChange ? 0 : 1,
//             child: Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 SizedBox(
//                   width: 120.w,
//                   height: 91.w,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image.asset(
//                         Assets.managerUiNewManger09,
//                         width: 120.w,
//                         height: 91.w,
//                         fit: BoxFit.fill,
//                       ),
//                       Image.asset(
//                         Assets.managerUiNewManger10,
//                         width: 104.w,
//                         height: 75.w,
//                         fit: BoxFit.fill,
//                       ),
//                       Positioned(
//                         top: 25.w,
//                         left: 35.w,
//                         child: Image.asset(
//                           Assets.managerUiNewManger11,
//                           width: 45.w + 35.w,
//                           fit: BoxFit.fitWidth,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

// class CollectWidget extends StatelessWidget {
//   const CollectWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MtInkWell(
//       splashColor: Colors.transparent,
//       onTap: () {
//         TeamIndexController ctrl = Get.find();
//         ctrl.goToIllustraction();
//       },
//       child: Container(
//         width: 74.w,
//         height: 103.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(9.w),
//           color: AppColors.c515151,
//         ),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Positioned(
//               top: 15.w,
//               child: Container(
//                 width: 57.w,
//                 height: 57.w,
//                 decoration: BoxDecoration(
//                     color: AppColors.c666666,
//                     borderRadius: BorderRadius.circular(28.5.w)),
//               ),
//             ),
//             Positioned(
//               top: 31.w,
//               child: Image.asset(
//                 Assets.managerUiNewManger07,
//                 height: 27.5.w,
//                 width: 28.w,
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//             Positioned(
//                 top: 83.w,
//                 child: Text(
//                   "Collect",
//                   style: 12.w4(
//                       fontFamily: FontFamily.fRobotoRegular,
//                       color: AppColors.cFFFFFF,
//                       height: 0.8),
//                 )),
//             Positioned(
//               top: 8.5.w,
//               child: Container(
//                 width: 44.w,
//                 height: 16.w,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: AppColors.cE34D4D,
//                   borderRadius: BorderRadius.circular(8.w),
//                 ),
//                 child: Text(
//                   "14:59",
//                   style: 12.w4(
//                       fontFamily: FontFamily.fOswaldMedium,
//                       color: AppColors.cFFFFFF,
//                       height: 0.8),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TrainingTaskWidget extends GetView<TrainingController> {
//   const TrainingTaskWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MtInkWell(
//       splashColor: Colors.transparent,
//       onTap: () {
//         showModalBottomSheet(
//             isScrollControlled: true,
//             backgroundColor: Colors.transparent,
//             barrierColor: Colors.transparent,
//             context: context,
//             builder: (context) {
//               return const AwardBottomsheet();
//             });
//       },
//       child: Container(
//         width: 74.w,
//         height: 103.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(9.w),
//           color: AppColors.c515151,
//         ),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Positioned(
//               top: 15.w,
//               child: Obx(() {
//                 // return AnimationArcWidget(
//                 //   29.w,
//                 //   startAngle: 135,
//                 //   progressWidth: 4.w,
//                 //   progressColor: AppColors.c34BAFE,
//                 //   borderColor: AppColors.c666666,
//                 //   progressSweepAngle: 270 * 1 / controller.currentTaskNeed,
//                 //   borderSweepAngle: 270,
//                 //   // progressSweepAngle: 50,
//                 //   borderWidth: 4.w,
//                 // );
//                 return AnimatedArcWidget(
//                   29.w,
//                   progressWidth: 4.w,
//                   progressColor: AppColors.c34BAFE,
//                   startAngle: 135,
//                   progressSweepAngle: 270 *
//                       (controller.taskValue.value) /
//                       controller.currentTaskNeed,
//                   borderWidth: 4.w,
//                   borderColor: AppColors.c666666,
//                   borderSweepAngle: 270,
//                   duration: const Duration(milliseconds: 300),
//                   showIndicatorDot: true,
//                 );
//               }),
//             ),
//             Positioned(
//               top: 27.w,
//               child: Image.asset(
//                 Assets.managerUiNewManger08,
//                 height: 28.w,
//                 width: 28.w,
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//             Positioned(
//                 top: 83.w,
//                 child: Text(
//                   "Task",
//                   style: 12.w4(
//                       fontFamily: FontFamily.fRobotoRegular,
//                       color: AppColors.cFFFFFF,
//                       height: 0.8),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
