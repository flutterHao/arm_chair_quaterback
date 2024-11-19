/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2024-11-19 14:13:01
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2024-11-19 10:05:16
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2024-11-18 18:03:35
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_item.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_dialog.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/emoji_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_bottom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailPage extends GetView<NewListController> {
  NewsDetailPage({super.key, required this.newsDetail});
  final NewsListDetail newsDetail;

  final GlobalKey _globalKey = GlobalKey();

  Widget _head() {
    return Row(
      children: [
        ImageWidget(
          url: newsDetail.imgUrl,
          width: 32.w,
          height: 32.w,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(16.w),
        ),
        7.5.hGap,
        Container(
          constraints: BoxConstraints(maxWidth: 120.w),
          child: Text(
            newsDetail.source,
            overflow: TextOverflow.ellipsis,
            style: 14.w4(
              color: AppColors.c000000,
              fontFamily: FontFamily.fRobotoRegular,
            ),
          ),
        ),
        9.hGap,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.c000000,
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            "OFFICIAL",
            style: 12.w4(
              color: AppColors.cFFFFFF,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        Text(
          Utils.timeAgo(newsDetail.postTime),
          style: 12.w4(
            color: AppColors.cB3B3B3,
            fontFamily: FontFamily.fRobotoRegular,
          ),
        ),
        13.hGap,
        InkWell(
          onTap: () {
            Utils.generateAndShareImage(_globalKey);
          },
          child: Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              border: Border.all(color: AppColors.c666666.withOpacity(0.3)),
            ),
            child: IconWidget(
              iconWidth: 16.w,
              icon: Assets.commonUiCommonIconSystemShare,
              iconColor: AppColors.c000000,
            ),
          ),
        ),
      ],
    );
  }

  // 新闻内容部分
  Widget _buildNewsContent(BuildContext context) {
    // newsDetail.type = 2;
    return Column(
      ///大图
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newsDetail.title.toUpperCase(),
          style: 19.w4(
            color: AppColors.c000000,
            height: 1.25,
            fontFamily: FontFamily.fOswaldMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: ImageWidget(
            url: newsDetail.imgUrl,
            width: 343.w,
            height: newsDetail.imageHeight,
            // fit: BoxFit.fitWidth,
            borderRadius: BorderRadius.circular(12.w),
          ),
        ),
        Text(
          newsDetail.content,
          style: TextStyle(
            fontSize: 16.h,
            fontFamily: FontFamily.fRobotoRegular,
            color: AppColors.c000000,
            height: 1.6,
            // letterSpacing: 0.5,
          ),
          // style: 17.w4(color: AppColors.c262626, height: 1.7,),
        ),
      ],
    );
  }

  Widget _hotComment() {
    return newsDetail.reviewsList.isNotEmpty
        ? InkWell(
            onTap: () {
              Get.find<CommentController>()
                  .getReviews(newsDetail.id, isRefresh: true);
              showModalBottomSheet(
                isScrollControlled: true,
                context: Get.context!,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return VerticalDragBackWidget(
                      child: CommentsDialog(detail: newsDetail));
                },
              );
            },
            child: Container(
              width: double.infinity,
              // height: 110.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.cE6E6E,
                    margin: EdgeInsets.symmetric(vertical: 11.w),
                  ),
                  HotComment(
                      item: Reviews.fromJson(
                          newsDetail.reviewsList.first.toJson())),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: BlackAppWidget(
        backgroundColor: AppColors.cF2F2F2,
        const AppBarWidget(
          title: "NEWS",
        ),
        bodyWidget: Expanded(
          child: GetBuilder<NewListController>(builder: (_) {
            // if (controller.state.newsFlowList.isEmpty) {
            //   return LoadStatusWidget(
            //       onRefreshTap: () =>
            //           controller.getNewsFlow(newsId, isRefresh: true));
            // }
            return RepaintBoundary(
              key: _globalKey,
              child: Container(
                color: AppColors.cFFFFFF,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _head(),
                      14.vGap,
                      _buildNewsContent(context),
                      20.vGap,
                      NewsBottomButton(newsDetail),
                      16.vGap,
                      const EmojiWidget(),
                      _hotComment(),
                      100.vGap,
                      // Text("zzdsa")
                    ],
                  ),
                ),
              ),
            );
            ;
          }),
        ),
      ),
    );
  }
}
