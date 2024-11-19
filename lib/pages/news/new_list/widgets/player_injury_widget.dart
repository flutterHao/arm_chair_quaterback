// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2024-10-24 18:04:19
//  * @LastEditTime: 2024-10-29 15:28:39
//  */
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
// import 'package:common_utils/common_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class PlayerInjuryWidget extends StatelessWidget {
//   const PlayerInjuryWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NewListController>(
//         id: "newsList",
//         builder: (controller) {
//           int length = controller.state.newsEntity.injuries.length;
//           if (length <= 1) {
//             return Container();
//           }
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               23.vGap,
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Text(
//                   "Player Injurys",
//                   style: 19.w7(color: AppColors.c262626, height: 1),
//                 ),
//               ),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(vertical: 10.w),
//                 itemBuilder: (context, index) => InkWell(
//                   onTap: () => controller.pageToDetail(
//                       controller.state.newsEntity.injuries[index]),
//                   child: _Item(
//                     item: controller.state.newsEntity.injuries[index],
//                   ),
//                 ),
//                 separatorBuilder: (context, index) => 9.vGap,
//                 itemCount: length > 5 ? 5 : length,
//               )
//             ],
//           );
//         });
//   }
// }

// class _Item extends StatelessWidget {
//   const _Item({required this.item});
//   final NewsListDetail item;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         // width: 343.w,
//         height: 75.w,
//         padding: EdgeInsets.symmetric(horizontal: 15.w),
//         margin: EdgeInsets.symmetric(horizontal: 16.w),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.w),
//           color: AppColors.cF2F2F2,
//         ),
//         child: Row(
//           children: [
//             Image.asset(
//               Assets.newsUiIconInjury,
//               width: 45.w,
//               height: 51.w,
//               fit: BoxFit.fill,
//             ),
//             14.hGap,
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     item.title,
//                     maxLines: 2,
//                     style: 12.w4(color: AppColors.c262626),
//                   ),
//                   10.vGap,
//                   Row(
//                     children: [
//                       Text(
//                         DateUtil.formatDateMs(
//                           item.postTime,
//                           format: DateFormats.y_mo_d_h_m,
//                         ),
//                         style: 10.w4(color: AppColors.cB3B3B3, height: 1),
//                       ),
//                       6.hGap,
//                       Expanded(
//                         child: Text(
//                           "-${item.source}",
//                           overflow: TextOverflow.ellipsis,
//                           style: 10.w4(color: AppColors.cB3B3B3, height: 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
