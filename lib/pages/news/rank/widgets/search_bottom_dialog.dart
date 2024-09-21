import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';

import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// class SearchBottomDialog extends GetView<RankController> {
//   const SearchBottomDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: 375.w,
//           height: 353.w,
//           decoration: BoxDecoration(
//               color: AppColors.cFF7954,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16.w),
//                   topRight: Radius.circular(16.w))),
//         ),
//         GetBuilder<RankController>(
//             id: "search",
//             builder: (_) {
//               return Container(
//                   // width: 375.w,
//                   height: 350.w,
//                   margin: EdgeInsets.only(top: 3.w),
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.w),
//                   decoration: BoxDecoration(
//                     color: AppColors.c262626,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(16.w),
//                         topRight: Radius.circular(16.w)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 88.w,
//                         child: Column(
//                           children: [
//                             ShadowContainer(
//                                 backgroudColor: Colors.black54,
//                                 child: Text("Division",
//                                     style: 14.w7(color: AppColors.c666666))),
//                             Expanded(
//                                 child: ListView.builder(
//                                     itemCount: Constant.statTypeList.length,
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 10.w),
//                                     itemBuilder: (context, index) {
//                                       String item =
//                                           Constant.statTypeList[index];
//                                       bool isCurren =
//                                           controller.statType == item;
//                                       return SearchItem(
//                                         text: item,
//                                         isCurren: isCurren,
//                                         onTap: () {
//                                           controller.statType = item;
//                                           controller.update(["search"]);
//                                           Navigator.pop(context);
//                                           controller.getStatRank();
//                                         },
//                                       );
//                                     }))
//                           ],
//                         ),
//                       ),
//                       20.hGap,
//                       SizedBox(
//                         width: 204.w,
//                         child: Column(
//                           children: [
//                             ShadowContainer(
//                                 backgroudColor: Colors.black54,
//                                 child: Text("season",
//                                     style: 14.w7(color: AppColors.c666666))),
//                             Expanded(
//                                 child: ListView.builder(
//                                     itemCount: controller.seasonList.length,
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 10.w),
//                                     itemBuilder: (context, index) {
//                                       String item =
//                                           controller.seasonList[index];
//                                       bool isCurren = controller.season == item;
//                                       return SearchItem(
//                                         text: item,
//                                         isCurren: isCurren,
//                                         onTap: () {
//                                           controller.season = item;
//                                           controller.update(["search"]);
//                                         },
//                                       );
//                                     }))
//                           ],
//                         ),
//                       )
//                     ],
//                   ));
//             }),
//       ],
//     );
//   }
// }

class SearchBottomDialog extends GetView<RankController> {
  const SearchBottomDialog(this.item, this.list, this.onTap, {super.key});
  final String item;
  final List<String> list;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: 375.w,
          height: 353.w,
          decoration: BoxDecoration(
              color: AppColors.cFF7954,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w))),
        ),
        GetBuilder<RankController>(
            id: "search",
            builder: (_) {
              return Container(
                  height: 350.w,
                  margin: EdgeInsets.only(top: 3.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.w),
                  decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w)),
                  ),
                  child: ListView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      itemBuilder: (context, index) {
                        String item = list[index];
                        bool isCurren = controller.statType == item;
                        return SearchItem(
                          text: item,
                          isCurren: isCurren,
                          onTap: () {
                            Navigator.pop(context);
                            onTap(item);
                          },
                        );
                      }));
            }),
      ],
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem(
      {super.key,
      required this.text,
      required this.isCurren,
      required this.onTap});
  final String text;
  final bool isCurren;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: isCurren
          ? Container(
              // width: 87.w,
              height: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Text(
                text,
                style: 14.w7(color: AppColors.cFF7954),
              ),
            )
          : Container(
              width: 87.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Text(
                text,
                style: 14.w7(color: AppColors.c666666),
              ),
            ),
    );
  }
}
