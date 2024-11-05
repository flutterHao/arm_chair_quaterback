import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';

import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchBottomDialog extends GetView<RankController> {
  const SearchBottomDialog(this.item, this.list, this.onChange, {super.key});
  final RxString item;
  final List<String> list;
  final Function onChange;

  Container _line() {
    return Container(
      width: 375.w,
      height: 1.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.cE6E6E,
            AppColors.ccccccc,
            AppColors.cE6E6E,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
      child: Stack(
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
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: BoxDecoration(
                      color: AppColors.cE6E6E6,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.w),
                          topRight: Radius.circular(16.w)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 64.w,
                          height: 4.w,
                          margin: EdgeInsets.symmetric(vertical: 12.w),
                          decoration: BoxDecoration(
                            color: AppColors.ccccccc,
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20.w),
                            child: Swiper(
                              loop: false,
                              index: list.indexOf(item.value),
                              viewportFraction: 0.2,
                              scale: 0.9,
                              scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              onIndexChanged: (index) {
                                // controller.tabIndex.value = index;
                                onChange(list[index]);
                              },
                              itemBuilder: (context, index) {
                                String cur = list[index];
                                return Obx(() {
                                  bool isCurren = item.value == cur;
                                  return InkWell(
                                    onTap: () {
                                      item.value = cur;
                                      onChange(cur);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 50.w,
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          if (isCurren) _line(),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                cur,
                                                style: isCurren
                                                    ? 21.w7()
                                                    : 16.w4(
                                                        color:
                                                            AppColors.c666666),
                                              ),
                                            ),
                                          ),
                                          if (isCurren) _line(),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                    // child: ListView.builder(
                    //   itemCount: list.length,
                    //   padding: EdgeInsets.symmetric(vertical: 10.w),
                    //   itemBuilder: (context, index) {
                    //     String item = list[index];
                    //     bool isCurren = sel == item;
                    //     return SearchItem(
                    //       text: item,
                    //       isCurren: isCurren,
                    //       onTap: () {
                    //         Navigator.pop(context);
                    //         onTap(item);
                    //       },
                    //     );
                    //   },
                    // ),
                    );
              }),
        ],
      ),
    );
  }
}
