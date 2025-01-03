// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2024-12-27 14:44:25
//  * @LastEditTime: 2025-01-03 15:12:35
//  */
// import 'package:arm_chair_quaterback/common/constant/font_family.dart';
// import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
// import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';
// import 'package:arm_chair_quaterback/common/routers/names.dart';
// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
// import 'package:arm_chair_quaterback/common/utils/utils.dart';
// import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
// import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
// import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
// import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

// class PlayerStatsDialog extends StatefulWidget {
//   const PlayerStatsDialog({super.key, required this.item});
//   final MapEntry<String, Map<String, dynamic>> item;

//   @override
//   State<PlayerStatsDialog> createState() => _PlayerStatsDialogState();
// }

// class _PlayerStatsDialogState extends State<PlayerStatsDialog>
//     with TickerProviderStateMixin {
//   final controller = Get.find<RankController>();
//   late TabController tabController;
//   @override
//   Widget build(BuildContext context) {
//     // List<double>widths=[219.w,];
//     // int current = widget.item.value["current"];
//     List<String> types = widget.item.value["list"];

//     tabController = TabController(
//         length: types.length,
//         vsync: this,
//         initialIndex: widget.item.value["current"]);
//     tabController.addListener(() {
//       widget.item.value["current"] = tabController.index;
//       controller.update(["starsRank"]);
//     });

//     return VerticalDragBackWidget(
//       child: SimpleBottomDialog(
//           height: 469.w,
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 30.vGap,
//                 Container(
//                   margin: EdgeInsets.only(left: 16.w),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     widget.item.key,
//                     style: 21
//                         .w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
//                   ),
//                 ),
//                 24.vGap,
//                 Container(
//                   // color: Colors.red,
//                   margin: EdgeInsets.only(left: 16.w),
//                   width: MediaQuery.of(context).size.width,
//                   child: TLBuildWidget(
//                       controller: tabController,
//                       builder: (current, next, progress, totalProgress) {
//                         return Row(
//                           children: List.generate(
//                               tabController.length,
//                               (index) => InkWell(
//                                   onTap: () => tabController.animateTo(index),
//                                   child: Container(
//                                     width: 61.5.w,
//                                     height: 28.w,
//                                     margin: EdgeInsets.only(right: 9.w),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(),
//                                         color: current == index
//                                             ? Color.lerp(AppColors.c262626,
//                                                 AppColors.cFFFFFF, progress)!
//                                             : next == index
//                                                 ? Color.lerp(
//                                                     AppColors.cFFFFFF,
//                                                     AppColors.c262626,
//                                                     progress)!
//                                                 : AppColors.cFFFFFF,
//                                         borderRadius:
//                                             BorderRadius.circular(14.w)),
//                                     child: Center(
//                                         child: Text(
//                                             types[index].split("_").first,
//                                             style: 13.w4(
//                                               fontFamily: current == index
//                                                   ? FontFamily.fOswaldMedium
//                                                   : FontFamily.fOswaldRegular,
//                                               color: current == index
//                                                   ? Color.lerp(
//                                                       AppColors.cF2F2F2,
//                                                       AppColors.c262626,
//                                                       progress)!
//                                                   : next == index
//                                                       ? Color.lerp(
//                                                           AppColors.c262626,
//                                                           AppColors.cF2F2F2,
//                                                           progress)!
//                                                       : AppColors.c262626,
//                                             ))),
//                                   ))),
//                         );
//                         ;
//                       }),
//                 ),
//                 10.vGap,
//                 Expanded(
//                     child: TabBarView(
//                         controller: tabController,
//                         children: types.map(
//                           (e) {
//                             List currentType = e.split("_");
//                             String rankType = currentType.first;
//                             var list =
//                                 controller.getStatRankList(rankType, false);
//                             return Column(
//                               children: [
//                                 Container(
//                                   height: 34.w,
//                                   decoration: const BoxDecoration(
//                                       border: Border.symmetric(
//                                           horizontal: BorderSide(
//                                               color: AppColors.cD1D1D1))),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         width: 219.w,
//                                         padding: EdgeInsets.only(left: 40.w),
//                                         child: Text(
//                                           "PLAYER",
//                                           style: 12.w4(
//                                             fontFamily:
//                                                 FontFamily.fOswaldMedium,
//                                             height: 0.8,
//                                           ),
//                                         ),
//                                       ),
//                                       const VerticalDivider(
//                                         color: AppColors.cE6E6E,
//                                         width: 1,
//                                       ),
//                                       Expanded(
//                                         child: Center(
//                                           child: Text(
//                                             currentType.first,
//                                             style: 12.w4(
//                                                 fontFamily:
//                                                     FontFamily.fOswaldMedium,
//                                                 height: 0.8),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Center(
//                                           child: Text(
//                                             currentType[1],
//                                             style: 12.w4(
//                                                 fontFamily:
//                                                     FontFamily.fOswaldMedium,
//                                                 height: 0.8),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: ListView.separated(
//                                       itemBuilder: (context, index) {
//                                         var item = list[index];
//                                         return SizedBox(
//                                           height: 33.w,
//                                           child: Row(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   Get.toNamed(
//                                                       RouteNames
//                                                           .picksPlayerDetail,
//                                                       arguments:
//                                                           PlayerDetailPageArguments(
//                                                               item.playerId));
//                                                 },
//                                                 child: Container(
//                                                   width: 219.w,
//                                                   padding: EdgeInsets.only(
//                                                       left: 18.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Text(
//                                                         "${index + 1}",
//                                                         style: 12.w4(
//                                                           fontFamily: FontFamily
//                                                               .fOswaldRegular,
//                                                           color:
//                                                               AppColors.cB3B3B3,
//                                                           height: 0.8,
//                                                         ),
//                                                       ),
//                                                       16.5.hGap,
//                                                       Container(
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             border: Border(
//                                                               bottom:
//                                                                   BorderSide(
//                                                                 width: 1.w,
//                                                                 color: AppColors
//                                                                     .c666666,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           child: Text(
//                                                             // Utils.getPlayBaseInfo(
//                                                             //         item.playerId!)
//                                                             //     .ename,
//                                                             item.playerName,
//                                                             style: 12.w4(
//                                                                 fontFamily:
//                                                                     FontFamily
//                                                                         .fRobotoRegular,
//                                                                 height: 1),
//                                                           )),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               const VerticalDivider(
//                                                 color: AppColors.cE6E6E,
//                                                 width: 1,
//                                               ),
//                                               Expanded(
//                                                 child: Center(
//                                                   child: Text(
//                                                     controller.getRankValue(
//                                                         currentType.first,
//                                                         item),
//                                                     style: 12.w4(
//                                                         fontFamily: FontFamily
//                                                             .fRobotoRegular,
//                                                         color:
//                                                             AppColors.c4D4D4D,
//                                                         height: 0.8),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Center(
//                                                   child: Text(
//                                                     controller
//                                                         .getRankValue(
//                                                             currentType[1],
//                                                             item)
//                                                         .toString(),
//                                                     style: 12.w4(
//                                                         fontFamily: FontFamily
//                                                             .fRobotoRegular,
//                                                         color:
//                                                             AppColors.c4D4D4D,
//                                                         height: 0.8),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                       separatorBuilder: (context, index) =>
//                                           Container(
//                                             margin: EdgeInsets.symmetric(
//                                                 horizontal: 16.w),
//                                             height: 1,
//                                             color: AppColors.cE6E6E,
//                                           ),
//                                       itemCount: list.length > 100
//                                           ? 100
//                                           : list.length),
//                                 ),
//                               ],
//                             );
//                           },
//                         ).toList()))
//               ],
//             ),
//           )),
//     );
//   }
// }

// // class PlayerStatsDialog extends GetView<RankController> with SingleTickerProviderStateMixin{
// //   const PlayerStatsDialog(this.item, {super.key});
// //   final MapEntry<String, Map<String, dynamic>> item;
// //   // final List<NabPlayerSeasonGameRankEntity> list;
// //   // final String title;
// //   // final String type1; //场均
// //   // final String type2; //总

// // }

// class TeamStatsDialog extends GetView<RankController> {
//   const TeamStatsDialog(this.list, this.title, this.type1, this.type2,
//       {super.key});
//   final List<StatsEntity> list;
//   final String title;
//   final String type1; //场均
//   final String type2; //总

//   @override
//   Widget build(BuildContext context) {
//     // List<double>widths=[219.w,];
//     return VerticalDragBackWidget(
//       child: SimpleBottomDialog(
//           height: 469.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               30.vGap,
//               Container(
//                 margin: EdgeInsets.only(left: 16.w),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   title,
//                   style:
//                       21.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
//                 ),
//               ),
//               16.vGap,
//               Container(
//                 height: 34.w,
//                 decoration: const BoxDecoration(
//                     border: Border.symmetric(
//                         horizontal: BorderSide(color: AppColors.cD1D1D1))),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 219.w,
//                       padding: EdgeInsets.only(left: 40.w),
//                       child: Text(
//                         "TEAM",
//                         style: 12.w4(
//                           fontFamily: FontFamily.fOswaldMedium,
//                           height: 0.8,
//                         ),
//                       ),
//                     ),
//                     const VerticalDivider(
//                       color: AppColors.cE6E6E,
//                       width: 1,
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           type1,
//                           style: 12.w4(
//                               fontFamily: FontFamily.fOswaldMedium,
//                               height: 0.8),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           type2,
//                           style: 12.w4(
//                               fontFamily: FontFamily.fOswaldMedium,
//                               height: 0.8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: ListView.separated(
//                       itemBuilder: (context, index) {
//                         var item = list[index];
//                         return SizedBox(
//                           height: 33.w,
//                           child: Row(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Get.toNamed(RouteNames.teamDetailPage,
//                                       arguments: item.teamId);
//                                 },
//                                 child: Container(
//                                   width: 219.w,
//                                   padding: EdgeInsets.only(left: 18.w),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "${index + 1}",
//                                         style: 12.w4(
//                                           fontFamily: FontFamily.fOswaldRegular,
//                                           color: AppColors.cB3B3B3,
//                                           height: 0.8,
//                                         ),
//                                       ),
//                                       16.5.hGap,
//                                       Container(
//                                           decoration: BoxDecoration(
//                                             border: Border(
//                                               bottom: BorderSide(
//                                                 width: 1.w,
//                                                 color: AppColors.c666666,
//                                               ),
//                                             ),
//                                           ),
//                                           child: Text(
//                                             item.teamName,
//                                             style: 12.w4(
//                                                 fontFamily:
//                                                     FontFamily.fRobotoRegular,
//                                                 height: 1),
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const VerticalDivider(
//                                 color: AppColors.cE6E6E,
//                                 width: 1,
//                               ),
//                               Expanded(
//                                 child: Center(
//                                   child: Text(
//                                     controller
//                                         .getRankValue(type1, item)
//                                         .toString(),
//                                     style: 12.w4(
//                                         fontFamily: FontFamily.fRobotoRegular,
//                                         color: AppColors.c4D4D4D,
//                                         height: 0.8),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Center(
//                                   child: Text(
//                                     controller
//                                         .getRankValue(type2, item)
//                                         .toString(),
//                                     style: 12.w4(
//                                         fontFamily: FontFamily.fRobotoRegular,
//                                         color: AppColors.c4D4D4D,
//                                         height: 0.8),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       separatorBuilder: (context, index) => Container(
//                             margin: EdgeInsets.symmetric(horizontal: 16.w),
//                             height: 1,
//                             color: AppColors.cE6E6E,
//                           ),
//                       itemCount: list.length))
//             ],
//           )),
//     );
//   }
// }
