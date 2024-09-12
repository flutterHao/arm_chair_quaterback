import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankTabview extends GetView<RankController> {
  const RankTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 349.w,
            height: 32.w,
            padding: EdgeInsets.all(4.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              border: Border.all(width: 0.5, color: AppColors.cB3B3B3),
            ),
            child: Obx(() {
              return Row(
                  children: controller.tabs.map((e) {
                bool selected =
                    controller.tabs.indexOf(e) == controller.current.value;
                return GestureDetector(
                  onTap: () {
                    // 自定义点击事件处理
                    controller.current.value = controller.tabs.indexOf(e);
                  },
                  child: Container(
                    width: 169.w,
                    height: 26.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: selected ? AppColors.c262626 : null,
                        borderRadius: BorderRadius.circular(13.w)),
                    child: Text(
                      e,
                      style: 13.w7(
                          color:
                              selected ? AppColors.cF2F2F2 : AppColors.c262626),
                    ),
                  ),
                );
              }).toList());
            }),
          ),
          Expanded(
              child: TabBarView(children: [
            Text("1"),
            Text("2"),
          ]))
        ],
      ),
    );
  }
}
