import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LatestWidget extends StatelessWidget {
  const LatestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vGap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Latest",
                  style: 19.w7(color: AppColors.c262626, height: 1),
                ),
              ),
              10.vGap,
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    NewsDetail item = controller.state.newsList[index];
                    return InkWell(
                      onTap: () => controller.pageToDetail(index),
                      child: ShadowContainer(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item.content}",
                              maxLines: 2,
                              style: 12.w4(color: AppColors.c262626),
                            ),
                            10.vGap,
                            Row(
                              children: [
                                Text(
                                  DateUtil.formatDateMs(
                                    item.postTime!,
                                    format: DateFormats.y_mo_d_h_m,
                                  ),
                                  style: 10
                                      .w4(color: AppColors.cB3B3B3, height: 1),
                                ),
                                14.hGap,
                                Text(
                                  item.source ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: 10
                                      .w4(color: AppColors.cB3B3B3, height: 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 9.vGap;
                  },
                  itemCount: controller.state.newsList.length)
            ],
          );
        });
  }
}
