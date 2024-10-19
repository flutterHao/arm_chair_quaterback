import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SummaryPage extends GetView<SummaryController> {
  const SummaryPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummaryController>(
      init: SummaryController(),
      builder: (_) {
        var scrollController = ScrollController();
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              18.vGap,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text("Recent Performance",
                  style: 16.w7(color: AppColors.c262626, height: 1),),
              ),
              SizedBox(
                height: 48.w,
                child: ListView.builder(
                    itemCount: 10,
                    controller: scrollController,
                    physics: OneBoundaryScrollPhysics(scrollController: scrollController),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        bool isSelected = controller.currentIndex.value == index;
                        return InkWell(
                          onTap: () => controller.currentIndex.value = index,
                          child: Container(
                            margin: EdgeInsets.only(right: 4.w,top: 14.w,bottom: 14.w,left: index==0?16.w:0),
                            height: 20.w,
                            width: 61.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.c262626
                                    : AppColors.cD9D9D9,
                                borderRadius: BorderRadius.circular(10.w)
                            ),
                            child: Text("PTS", style: 13.w4(
                                color: isSelected
                                    ? AppColors.cF2F2F2
                                    : AppColors.c262626, height: 1),),
                          ),
                        );
                      });
                    }),
              ),

            ],
          ),
        );
      },
    );
  }
}
