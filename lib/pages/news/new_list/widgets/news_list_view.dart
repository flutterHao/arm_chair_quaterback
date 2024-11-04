import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
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
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.state.newsList.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    // var newsId = controller.state.newsList[index].id;
                    // controller.getNewsFlow(newsId, isRefresh: true);
                    // await Get.toNamed(RouteNames.newsDetail,
                    //     arguments: newsId, id: GlobalNestedKey.NEWS);
                    // controller.getNewsList();
                    // controller.pageToDetail(index, callBack: () {
                    //   controller.getNewsList();
                    // });
                  },
                  child: NewsItemView(
                    item: controller.state.newsList[index],
                  ),
                );
              });
        });
  }
}

class NewsItemView extends GetView<NewListController> {
  const NewsItemView({super.key, required this.item});
  final NewsDetail item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShadowContainer(
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.w),
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
                        style: 14.w4(
                          color: item.isView == 0
                              ? AppColors.c262626
                              : AppColors.c666666,
                        ),
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
                "${DateUtil.formatDateMs(item.postTime ?? 0, format: DateFormats.y_mo_d_h_m)} -${"-${item.source}"}",
                style: 10.w4(color: AppColors.cB3B3B3),
              ),
              9.vGap,
              SizedBox(
                width: 270.w,
                child: Text(
                  item.content ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: 12.w4(
                    color: item.isView == 0
                        ? AppColors.c666666
                        : AppColors.cB3B3B3,
                  ),
                ),
              ),
              10.vGap,
              Row(
                children: [
                  SizedBox(
                      width: 60.w,
                      child: TextIconWidget(
                        width: 20.w,
                        icon: item.isView == 0
                            ? Assets.uiIconEye_02Png
                            : Assets.uiIconEye_01Png,
                        color: item.isView == 0
                            ? AppColors.c666666
                            : AppColors.cB3B3B3,
                        text: "${item.views ?? 0}",
                      )),
                  InkWell(
                    onTap: () {
                      // item.isLike?.value == 1
                      //     ? controller.unLikeNews(item)
                      //     : controller.likeNews(item);
                      controller.likeNews(item);
                    },
                    child: SizedBox(
                        width: 60.w,
                        child: TextIconWidget(
                          icon: item.isLike?.value == 1
                              ? Assets.uiIconLike_01Png
                              : Assets.uiIconLike_02Png,
                          color: item.isLike?.value == 1
                              ? AppColors.cFF7954
                              : AppColors.cB3B3B3,
                          text: "${item.likes}",
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 18.w,
          right: 20.w,
          child: IconWidget(
            iconHeight: 14.w,
            iconWidth: 14.w,
            backgroudWitdh: 32.w,
            backgroudheight: 32.w,
            icon: Assets.uiIconArrowsPng,
            iconColor: item.isView == 0 ? AppColors.c262626 : AppColors.c666666,
            borderRadius: BorderRadius.circular(16.w),
            border: Border.all(width: 1, color: AppColors.cB3B3B3),
          ),
        ),
        // if (item.guess != null)
        //   Positioned(
        //       top: 0.w,
        //       right: 0.w,
        //       child: Stack(
        //         alignment: Alignment.center,
        //         children: [
        //           IconWidget(
        //             iconWidth: 36.w,
        //             icon: Assets.uiIconLabelPng,
        //             iconColor: AppColors.cED1451,
        //           ),
        //           IconWidget(
        //             iconWidth: 16.w,
        //             icon: Assets.uiIconJettonBigPng,
        //             iconColor: Colors.white,
        //           ),
        //         ],
        //       ))
      ],
    );
  }
}

class TextIconWidget extends StatelessWidget {
  const TextIconWidget(
      {super.key,
      required this.icon,
      required this.text,
      this.color = AppColors.cB3B3B3,
      this.width = 16,
      this.height});
  final double width;
  final double? height;
  final Color color;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset(
      icon,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );

    return Row(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            color, // 修改为你想要的颜色
            BlendMode.srcIn,
          ),
          child: image, // 替换为你的 PNG 图片
        ),
        5.hGap,
        Text(
          text,
          style: 12.w4(
            color: color,
          ),
        )
      ],
    );
  }
}
