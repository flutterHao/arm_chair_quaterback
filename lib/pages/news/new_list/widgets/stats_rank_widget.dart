// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
// import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
// import 'package:arm_chair_quaterback/common/routers/names.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
// import 'package:arm_chair_quaterback/common/utils/utils.dart';
// import 'package:arm_chair_quaterback/main.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
// import 'package:common_utils/common_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class StatsRankWidget extends GetView<NewListController> {
//   const StatsRankWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NewListController>(
//         id: "newsList",
//         builder: (_) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 16.w, top: 24.w, bottom: 10.w),
//                 child: Text(
//                   "Stars",
//                   style: 19.w7(height: 1),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 height: 152.w,
//                 child: PageView.builder(
//                   padEnds: false,
//                   controller: PageController(
//                     initialPage: 0,
//                     viewportFraction: 283 / 375,
//                   ),
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: controller.state.statsRankMap.entries.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.only(left: 16.w), // 控制左右间距
//                       child: InkWell(
//                         onTap: () {
//                           controller.pointType = controller
//                               .state.statsRankMap.entries
//                               .elementAt(index)
//                               .key;
//                           Get.toNamed(RouteNames.statsRank,
//                               id: GlobalNestedKey.NEWS,
//                               arguments: controller.state.statsRankMap.entries
//                                   .elementAt(index)
//                                   .key);
//                         },
//                         child: StatsRankItem(index: index),
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

// double width = MyApp.MAXWEBWIDTH.w * 283 / 375;

// class StatsRankItem extends GetView<NewListController> {
//   const StatsRankItem({super.key, required this.index});
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final item = controller.state.statsRankMap.entries.elementAt(index);
//     return ShadowContainer(
//       width: width,
//       height: 152.w,
//       child: Column(
//         children: [
//           Container(
//             width: width,
//             height: 39.w,
//             decoration: BoxDecoration(
//                 color: AppColors.cF2F2F2,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16.w),
//                     topRight: Radius.circular(16.w))),
//             child: Row(
//               children: [
//                 14.hGap,
//                 Text(
//                   item.key,
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
//           StatsListView(type: item.key, list: item.value)
//         ],
//       ),
//     );
//   }
// }

// class StatsListView extends GetView<NewListController> {
//   const StatsListView({super.key, required this.type, required this.list});
//   final String type;
//   final List<NbaPlayerStat> list;

//   @override
//   Widget build(BuildContext context) {
//     int count = list.length > 3 ? 3 : 0;
//     return SizedBox(
//       height: 112.w,
//       child: ListView.builder(
//           padding: const EdgeInsets.all(0),
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             final item = list[index];
//             return SizedBox(
//               height: 36.w,
//               child: Row(
//                 children: [
//                   20.hGap,
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       if (index <= 2)
//                         Image.asset(
//                           width: 18.w,
//                           fit: BoxFit.fitWidth,
//                           index == 0
//                               ? Assets.picksIconRankGold
//                               : index == 1
//                                   ? Assets.picksIconRankSilver
//                                   : Assets.picksIconRankCopper,
//                         ),
//                       Positioned(
//                         top: 4.5.w,
//                         child: Text(
//                           "${index + 1}",
//                           style: 12.w7(color: AppColors.cF2F2F2, height: 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                   13.hGap,
//                   Expanded(
//                       child: Text(
//                     ObjectUtil.isNotEmpty(
//                             Utils.getPlayBaseInfo(item.playerId!).ename)
//                         ? Utils.getPlayBaseInfo(item.playerId!).ename
//                         : item.playerName!,
//                     style: 12.w4(),
//                   )),
//                   15.hGap,
//                   // Expanded(
//                   //   child: Text(
//                   //     item.playerName ?? "",
//                   //     style: 12.w4(),
//                   //   ),
//                   // ),
//                   Text(
//                     "${controller.getStartData(type, item)}",
//                     style: 12.w4(),
//                   ),
//                   15.hGap,
//                 ],
//               ),
//             );
//           },
//           itemCount: count),
//     );
//   }
// }
