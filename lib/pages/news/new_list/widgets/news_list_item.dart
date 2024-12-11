import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
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
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.newsDetail});
  final NewsListDetail newsDetail;

  // GlobalKey get _globalKey => GlobalKey();

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
            // Utils.generateAndShareImage(_globalKey);
            Share.share("${newsDetail.title}\n\n${newsDetail.content}",
                subject: newsDetail.title);
            // Share.shareXFiles([XFile(newsDetail.imgUrl)],
            //     text: newsDetail.content, subject: newsDetail.title);
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
    if (newsDetail.type == 0) {
      return Column(
        ///无图
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
          10.vGap,
          Text(
            newsDetail.content,
            maxLines: 4,
            style: TextStyle(
              fontSize: 16.h,
              fontFamily: FontFamily.fRobotoRegular,
              color: AppColors.c000000,
              overflow: TextOverflow.ellipsis,
              height: 1.6,
              // letterSpacing: 0.5,
            ),
            // style: 17.w4(color: AppColors.c262626, height: 1.7,),
          ),
        ],
      );
    } else if (newsDetail.type == 1) {
      return Column(
        ///大图
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ObjectUtil.isNotEmpty(newsDetail.title))
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
                borderRadius: BorderRadius.circular(12.w)),
          ),
          Text(
            newsDetail.content,
            maxLines: 4,
            style: TextStyle(
              fontSize: 16.h,
              fontFamily: FontFamily.fRobotoRegular,
              color: AppColors.c000000,
              overflow: TextOverflow.ellipsis,
              height: 1.6,
              // letterSpacing: 0.5,
            ),
            // style: 17.w4(color: AppColors.c262626, height: 1.7,),
          ),
        ],
      );
    } else {
      var titleStyle = 19.w4(
        color: AppColors.c000000,
        height: 1.25,
        fontFamily: FontFamily.fOswaldMedium,
      );
      int col = Utils.calculateActualLines(newsDetail.title,
          343.w - (newsDetail.imamgeWidth ?? 0) - 20.w, titleStyle);

      int subClo = 4 - col;
      return Column(
        ///小图
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 343.w,
            constraints: BoxConstraints(minHeight: 97.w, maxHeight: 110.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsDetail.title,
                        style: 19.w4(
                          color: AppColors.c000000,
                          height: 1.25,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      10.vGap,
                      if (subClo > 0)
                        Expanded(
                            child: Text(
                          newsDetail.content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: subClo,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontFamily.fRobotoRegular,
                            color: AppColors.c000000,
                            height: 19 / 14,
                            // letterSpacing: 0.5,
                          ),
                        )),
                    ],
                  ),
                ),
                10.hGap,
                ImageWidget(
                  url: newsDetail.imgUrl,
                  // width: 97.w,
                  height: 97.w,
                  width: newsDetail.imamgeWidth,
                  fit: BoxFit.fitHeight,
                  borderRadius: BorderRadius.circular(12.w),
                )
              ],
            ),
          ),
          // if (col >= 4)
          //   Container(
          //     margin: EdgeInsets.only(top: 10.w),
          //     child: Text(
          //       newsDetail.content,
          //       overflow: TextOverflow.ellipsis,
          //       maxLines: 4,
          //       style: TextStyle(
          //         fontSize: 16.sp,
          //         fontFamily: FontFamily.fRobotoRegular,
          //         color: AppColors.c000000,
          //         height: 19 / 14,
          //         // letterSpacing: 0.5,
          //       ),
          //     ),
          //   )
        ],
      );
    }
  }

  Widget _hotComment() {
    return GetBuilder<CommentController>(
        id: newsDetail.id.toString(),
        builder: (ctrl) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            child: newsDetail.reviewsList.isNotEmpty
                ? InkWell(
                    onTap: () async {
                      ctrl.getReviews(newsDetail.id, isRefresh: true);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: Get.context!,
                        barrierColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return VerticalDragBackWidget(
                              child: CommentsDialog(detail: newsDetail));
                        },
                      );
                      newsDetail.reviewsList = ctrl.mainList.value;
                      ctrl.update();
                    },
                    child: HotComment(item: newsDetail.reviewsList.first),
                  )
                : const SizedBox(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(12.w)),
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
          2.vGap,
        ],
      ),
    );
  }
}
