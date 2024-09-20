import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/text_icon_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsListView extends GetView<NewListController> {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (_) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 343.w),
            // height: 139.w,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.state.newsList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10.w),
                separatorBuilder: (context, index) {
                  return 9.vGap;
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed(RouteNames.newsDetail,
                        arguments: controller.state.newsList[index].id,
                        id: GlobalNestedKey.NEWS),
                    child: NewsItemView(
                      item: controller.state.newsList[index],
                    ),
                  );
                }),
          );
        });
  }
}

class NewsItemView extends GetView<NewListController> {
  const NewsItemView({super.key, required this.item});
  final NewsDetail item;

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
                            item.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: 14.w4(),
                          )),
                    ],
                  ),
                  6.vGap,
                  Container(
                    width: 319.w,
                    height: 0.5.w,
                    color: AppColors.cB3B3B3,
                  ),
                  5.vGap,
                  Text(
                    "${DateUtil.formatDateMs(item.postTime ?? 0, format: DateFormats.y_mo_d_h_m)} -${item.source}",
                    style: 10.w4(color: AppColors.cB3B3B3),
                  ),
                  9.vGap,
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      item.content ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: 12.w4(color: AppColors.c666666),
                    ),
                  ),
                  10.vGap,
                  Row(
                    children: [
                      SizedBox(
                          width: 60.w,
                          child: TextIconWidget(
                            width: 16.w,
                            icon: item.isView == 0
                                ? Assets.uiIconChatting_01Png
                                : Assets.uiIconChatting_02Png,
                            color: item.isView == 0
                                ? AppColors.c666666
                                : AppColors.cB3B3B3,
                            text: "${item.views ?? 0}",
                          )),
                      InkWell(
                        onTap: () {
                          item.isLike == 1
                              ? controller.unLikeNews(item)
                              : controller.likeNews(item);
                        },
                        child: SizedBox(
                            width: 60.w,
                            child: TextIconWidget(
                              icon: item.isLike == 1
                                  ? Assets.uiIconLike_01Png
                                  : Assets.uiIconLike_02Png,
                              color: item.isLike == 1
                                  ? AppColors.cFF546C
                                  : AppColors.cB3B3B3,
                              text: "${item.likes}",
                            )),
                      ),
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
