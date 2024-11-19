/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2024-11-19 21:39:58
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
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsDetailPage extends GetView<NewListController> {
  NewsDetailPage({super.key, required this.newsDetail});
  final NewsListDetail newsDetail;

  final GlobalKey globalKey = GlobalKey();

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
            Utils.generateAndShareImage(globalKey);
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
          padding: EdgeInsets.symmetric(vertical: 15.w),
          child: ImageWidget(
            url: newsDetail.imgUrl,
            width: 343.w,
            height: newsDetail.imageHeight,
            // fit: BoxFit.fitWidth,
            borderRadius: BorderRadius.circular(12.w),
          ),
        ),
        10.vGap,
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

  Widget _line() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w),
      height: 1.w,
      width: double.infinity,
      color: AppColors.cE6E6E,
    );
  }

  Widget _comments() {
    return GetBuilder<CommentController>(builder: (comCtrl) {
      var list = comCtrl.mainList.where((e) => e.parentReviewId == 0).toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
              "Comments (${newsDetail.reviewsCount.value})",
              style: 19.w7(height: 1),
            );
          }),
          12.vGap,
          list.isNotEmpty
              ? ListView.separated(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 12.w),
                  itemCount: list.length,
                  separatorBuilder: (context, index) {
                    return 30.vGap;
                  },
                  itemBuilder: (context, index) {
                    // var subList = controller.subList
                    //     .where((e) =>
                    //         e.parentReviewId ==
                    //         list[index].id)
                    //     .toList();
                    return Column(
                      children: [
                        CommentItemView(item: list[index]),
                        if (list[index].sonReviews > 0 ||
                            list[index].subList.isNotEmpty)
                          Container(
                            // width: 295.w,
                            margin: EdgeInsets.only(left: 48.w),
                            child: SubComentsListView(list[index]),
                          )
                      ],
                    );
                  })
              : Container(
                  height: 250.w,
                  alignment: Alignment.center,
                  child: const LoadStatusWidget(
                    text: "No comment yet",
                  )),
          if (newsDetail.reviewsCount.value < list.length)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MtInkwell(
                  onTap: () => comCtrl.getReviews(newsDetail.id),
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "Show more comments",
                      textAlign: TextAlign.center,
                      style: 12.w4(color: AppColors.cB3B3B3),
                    ),
                  ),
                )
              ],
            )
        ],
      );
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    final commentsCtrl = Get.find<CommentController>();
    commentsCtrl.getReviews(newsDetail.id, isRefresh: true);
    return HorizontalDragBackWidget(
      child: BlackAppWidget(
          // backgroundColor: AppColors.c002B5C,
          backgroundColor: AppColors.cFFFFFF,
          const UserInfoBar(showPop: true), bodyWidget: Expanded(
        child: GetBuilder<NewListController>(builder: (_) {
          return RepaintBoundary(
            key: globalKey,
            child: InkWell(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
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
                      NewsBottomButton(
                        newsDetail,
                        showCommentBt: false,
                      ),
                      16.vGap,
                      const EmojiWidget(),
                      _line(),
                      _comments(),
                      100.vGap,
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ), floatWidgets: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SendCommentWidget(newsId: newsDetail.id))
      ]),
    );
  }
}
