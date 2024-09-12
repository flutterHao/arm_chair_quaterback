import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/text_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 343.w),
      // height: 139.w,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10.w),
          separatorBuilder: (context, index) {
            return 9.vGap;
          },
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () =>
                  Get.toNamed(RouteNames.newsDetail, id: GlobalNestedKey.NEWS),
              child: NewsItem(
                index: index,
              ),
            );
          }),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      // height: 139.w,
      child: Stack(
        children: [
          ShadowContainer(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconWidget(
                        iconHeight: 12.w,
                        iconWidth: 15.w,
                        icon: Assets.uiIconReadPng,
                        iconColor: AppColors.cFF7954,
                      ),
                      8.hGap,
                      SizedBox(
                          width: 271.w,
                          child: Text(
                            "Tyler O'Neill's 465-foot home run run run...",
                            overflow: TextOverflow.ellipsis,
                            style: 14.w4(),
                          )),
                    ],
                  ),
                  6.vGap,
                  Container(
                    width: 319.w,
                    height: 0.5,
                    color: AppColors.cB3B3B3,
                  ),
                  5.vGap,
                  Text(
                    "2024/07/10 12:05 -via twitter",
                    style: 10.w4(color: AppColors.cB3B3B3),
                  ),
                  9.vGap,
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      "Statcast measures the projected distance and exit velocity of T",
                      maxLines: 2,
                      style: 12.w4(color: AppColors.c666666),
                    ),
                  ),
                  10.vGap,
                  Row(
                    children: [
                      SizedBox(
                          width: 60.w,
                          child: const TextIconWidget(
                            icon: Assets.uiIconChatting_01Png,
                            text: "100K",
                          )),
                      SizedBox(
                          width: 60.w,
                          child: const TextIconWidget(
                            icon: Assets.uiIconLike_01Png,
                            color: Colors.red,
                            text: "100K",
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12.w,
            right: 12.w,
            child: IconWidget(
              iconHeight: 14.w,
              iconWidth: 14.w,
              backgroudWitdh: 32.w,
              backgroudheight: 32.w,
              icon: Assets.uiIconArrowsPng,
              iconColor: Colors.black,
              borderRadius: BorderRadius.circular(16.w),
              border: Border.all(width: 1, color: AppColors.cB3B3B3),
            ),
          )
        ],
      ),
    );
  }
}
