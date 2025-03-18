// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2025-02-26 19:58:38
//  * @LastEditTime: 2025-03-04 11:17:02
//  */
// import 'package:arm_chair_quaterback/common/constant/font_family.dart';
// import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
// import 'package:arm_chair_quaterback/common/routers/names.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
// import 'package:arm_chair_quaterback/common/utils/utils.dart';
// import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
// import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
// import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/pages/team/beauty_chat/controller.dart';
// import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/chat_bubble.dart';
// import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/girl_head_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class ChatDetailPage extends GetView<BeautyChatController> {
//   const ChatDetailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BeautyChatController>(
//       init: BeautyChatController(),
//       id: "beauty_chat",
//       builder: (controller) {
//         var list = controller.girlChatEntity.historicalChatRecords;
//         if (list.isEmpty) return Container();
//         var chooseList = list.last.choices;
//         return Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//               width: 375.w,
//               height: 707.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(23.w),
//                 border: Border(
//                   top: BorderSide(width: 5.w, color: AppColors.cE6E6E),
//                   left: BorderSide(width: 5.w, color: AppColors.cE6E6E),
//                   right: BorderSide(width: 5.w, color: AppColors.cE6E6E),
//                 ),
//               ),
//               alignment: Alignment.bottomCenter,
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Image.asset(
//                     width: 365.w,
//                     height: 707.h,
//                     Assets.managerUiManagerChat01,
//                     fit: BoxFit.fitHeight,
//                     alignment: Alignment.topCenter,
//                   ),
//                   Positioned(
//                     top: 0,
//                     child: Image.asset(
//                       Assets.managerUiManagerChat02,
//                       width: 365.w,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     top: 40.w,
//                     child: InkWell(
//                       onTap: () => Get.back(),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 13.w, vertical: 10.w),
//                         child: IconWidget(
//                           icon: Assets.iconUiIconArrows04,
//                           iconWidth: 19.w,
//                           iconColor: AppColors.c000000,
//                           rotateAngle: 90,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       top: 41.5.w,
//                       right: 16.w,
//                       child: GirlHeadWidget(
//                         width: 32.w,
//                         url: controller.getCurrentGirl().icon,
//                       )),
//                   Positioned(top: 44.5.w, child: GirlOnlineWidget()),
//                   Positioned(
//                     top: 86.w,
//                     left: 15.w,
//                     right: 15.w,
//                     bottom: 0,
//                     child: ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       // reverse: true,
//                       // controller: controller.scrollController,
//                       padding: EdgeInsets.only(top: 10.w, bottom: 100.w),
//                       itemCount: list.length,
//                       itemBuilder: (context, index) {
//                         var item = list[index];
//                         var textType =
//                             controller.getTextType(item.messageDefineId);
//                         if (textType == 1) {
//                           return Align(
//                             alignment: item.type == 1
//                                 ? Alignment.centerLeft
//                                 : Alignment.centerRight,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 4.w),
//                               child: ChatBubble(
//                                 message: item,
//                               ),
//                             ),
//                           );
//                         }

//                         if (textType == 2) {
//                           return Align(
//                             alignment: Alignment.centerLeft,
//                             child: Container(
//                               alignment: Alignment.centerLeft,
//                               margin: EdgeInsets.symmetric(vertical: 4.w),
//                               child: ImageWidget(
//                                 // width: 375.w * 0.6,
//                                 borderRadius: BorderRadius.circular(16.w),
//                                 height: 158.w,
//                                 fit: BoxFit.fitHeight,
//                                 url: controller.getGirlImage(item.context),
//                               ),
//                             ),
//                           );
//                         }

//                         if (textType == 3) {
//                           List<String> awardList = item.award.split("_");
//                           int awardId = int.parse(awardList[1]);
//                           String awardNum = awardList[2];
//                           return Align(
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: 150.w,
//                                   alignment: Alignment.center,
//                                   margin:
//                                       EdgeInsets.only(top: 40.w, bottom: 18.w),
//                                   padding: EdgeInsets.symmetric(vertical: 7.w),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6.w),
//                                       color: AppColors.cFFFFFF),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         "you get",
//                                         style: 14.w4(
//                                             fontFamily:
//                                                 FontFamily.fRobotoRegular,
//                                             color: AppColors.c000000),
//                                       ),
//                                       5.5.hGap,
//                                       Image.asset(
//                                         Utils.getPropIconUrl(awardId),
//                                         height: 20.w,
//                                         fit: BoxFit.fitHeight,
//                                       ),
//                                       2.hGap,
//                                       Text(
//                                         awardNum,
//                                         style: 14.w4(
//                                             fontFamily:
//                                                 FontFamily.fRobotoRegular,
//                                             color: AppColors.c000000),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Text(
//                                   "End of conversation",
//                                   style: 14.w4(
//                                     height: 1,
//                                     fontFamily: FontFamily.fRobotoRegular,
//                                     color: AppColors.c000000.withOpacity(0.6),
//                                   ),
//                                 ),
//                                 MtInkWell(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   child: Container(
//                                     width: 323.w,
//                                     height: 51.w,
//                                     alignment: Alignment.center,
//                                     margin: EdgeInsets.only(top: 45.w),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.c000000,
//                                       borderRadius: BorderRadius.circular(9.w),
//                                     ),
//                                     child: Text(
//                                       "collect".toUpperCase(),
//                                       style: 23.w4(
//                                           fontFamily: FontFamily.fOswaldMedium,
//                                           color: AppColors.cFFFFFF),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                         }
//                         return SizedBox.shrink();
//                       },
//                     ),
//                   ),
//                   if (chooseList.isNotEmpty)
//                     Positioned(
//                       bottom: 41.w,
//                       left: 21.w,
//                       right: 15.5.w,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: chooseList.length,
//                         itemBuilder: (context, index) {
//                           return MtInkWell(
//                             onTap: () {
//                               int messageId =
//                                   controller.girlChatEntity.currentMessageId;
//                               controller.nextMessage(index, messageId, false);
//                             },
//                             child: SelectBubble(
//                               message: chooseList[index],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                 ],
//               )),
//         );
//       },
//     );
//   }
// }

// class GirlOnlineWidget extends GetView<BeautyChatController> {
//   const GirlOnlineWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Get.toNamed(RouteNames.beautyInfo),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 Assets.managerUiManagerIconLock,
//                 width: 14.w,
//                 // height: 15.5.w,
//                 fit: BoxFit.fitWidth,
//               ),
//               8.hGap,
//               Text(
//                 controller.getCurrentGirl().eName,
//                 style: 16.w4(fontFamily: FontFamily.fRobotoMedium, height: 0.8),
//               )
//             ],
//           ),
//           6.5.vGap,
//           Text(
//             "online",
//             style: 12.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.8),
//           )
//         ],
//       ),
//     );
//   }
// }
