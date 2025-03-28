// import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
// import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
// import 'package:arm_chair_quaterback/common/routers/names.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
// import 'package:arm_chair_quaterback/common/utils/utils.dart';
// import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
// import 'package:arm_chair_quaterback/main.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class TeamRankWidget extends GetView<NewListController> {
//   const TeamRankWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NewListController>(
//         id: "newsList",
//         builder: (context) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 16.w, top: 23.w, bottom: 10.w),
//                 child: Text(
//                   "2024 Standings",
//                   style: 19.w7(),
//                 ),
//               ),
//               Container(
//                 height: 175.w,
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.only(bottom: 20.w),
//                 child: PageView.builder(
//                   padEnds: false,
//                   controller: PageController(
//                     viewportFraction: 283 / 375,
//                   ),
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: controller.state.teamMap.entries.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.only(left: 16.w), // 控制左右间距
//                       child: InkWell(
//                         onTap: () {
//                           Get.toNamed(
//                             RouteNames.teamRank,
//                             id: GlobalNestedKey.NEWS,
//                           );
//                         },
//                         child: TeamRankItem(index: index),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         });
//   }
// }

// double width = MyApp.MAXWEBWIDTH.w * 0.9;

// class TeamRankItem extends GetView<NewListController> {
//   const TeamRankItem({super.key, required this.index});
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final item = controller.state.teamMap.entries.elementAt(index);
//     return ShadowContainer(
//       width: width,
//       height: 175.w,
//       child: Column(
//         children: [
//           Container(
//             width: width,
//             height: 39.w,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16.w),
//                     topRight: Radius.circular(16.w))),
//             child: Row(
//               children: [
//                 10.hGap,
//                 Text(
//                   item.key == 1 ? "EAST" : "WEST",
//                   style: 16.w7(),
//                 ),
//                 Expanded(child: Container()),
//                 Container(
//                   width: 50.w,
//                   height: 18.w,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(9.w),
//                     border: Border.all(
//                       width: 1,
//                       color: AppColors.cB3B3B3,
//                     ),
//                   ),
//                   child: Text(
//                     "View all",
//                     style: 10.w4(
//                       color: AppColors.c666666,
//                     ),
//                   ),
//                 ),
//                 10.hGap,
//               ],
//             ),
//           ),
//           Container(
//             width: width,
//             height: 1.w,
//             color: AppColors.cD9D9D9,
//             margin: EdgeInsets.symmetric(horizontal: 9.w),
//           ),
//           SizedBox(
//             height: 36.w,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 100.w,
//                     child: Text(
//                       "TEAM",
//                       style: 11.w4(color: AppColors.cB3B3B3),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: 88.w,
//                     alignment: Alignment.center,
//                     child: Text(
//                       "W-L",
//                       style: 11.w4(color: AppColors.cB3B3B3),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 64.w,
//                     child: Text(
//                       "%",
//                       style: 11.w4(color: AppColors.cB3B3B3),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 40.w,
//                     child: Text(
//                       "GB",
//                       style: 11.w4(color: AppColors.cB3B3B3),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//               width: width,
//               child: TeamListView(
//                 list: item.value,
//               ))
//         ],
//       ),
//     );
//   }
// }

// class TeamListView extends StatelessWidget {
//   const TeamListView({super.key, required this.list});
//   final List<TeamRankEntity> list;

//   @override
//   Widget build(BuildContext context) {
//     int count = list.length > 3 ? 3 : 0;
//     return SizedBox(
//       height: 99.w,
//       child: ListView.builder(
//           padding: const EdgeInsets.all(0),
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             final item = list[index];
//             return SizedBox(
//               height: 30.w,
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: ImageWidget(
//                               url: Utils.getTeamUrl(item.teamID),
//                               width: 25.w,
//                               height: 25.w,
//                             ),
//                           ),
//                           15.hGap,
//                           Expanded(
//                             child: Text(
//                               item.shortEname,
//                               style: 12.w7(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Expanded(child: Container()),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "${item.wINS}-${item.lOSSES}",
//                         style: 11.w4(color: AppColors.c666666),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: 64.w,
//                       child: Text(
//                         "${item.winPCT}",
//                         style: 11.w4(color: AppColors.c666666),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: 40.w,
//                       child: Text(
//                         "${item.conferenceGamesBack}",
//                         style: 11.w4(color: AppColors.c666666),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//           itemCount: count),
//     );
//   }
// }
