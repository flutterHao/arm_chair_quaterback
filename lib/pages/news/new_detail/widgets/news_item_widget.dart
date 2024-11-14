import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/image_ext.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_item.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_dialog.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_bottom_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsDetailItem extends StatelessWidget {
  const NewsDetailItem({super.key, required this.newsDetail});
  final NewsDetail newsDetail;

  // GlobalKey get _globalKey => GlobalKey();

  Widget _head(globalKey) {
    return Row(
      children: [
        ImageWidget(
          url: newsDetail.imgUrl ?? "",
          width: 32.w,
          height: 32.w,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(16.w),
        ),
        7.5.hGap,
        Text(
          newsDetail.source ?? "",
          style: 14.w4(
            color: AppColors.c000000,
            fontFamily: FontFamily.fRobotoRegular,
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
          Utils.timeAgo(newsDetail.postTime ?? 0),
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
  Widget _buildNewsContent(NewsDetailController controller) {
    return SizedBox(
      // width: 311.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newsDetail.title!.toUpperCase(),
            style: 19.w4(
              color: AppColors.c000000,
              height: 1.25,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: ImageWidget(
              url: newsDetail.imgUrl ?? "",
              width: 343.w,
              fit: BoxFit.fitWidth,
              borderRadius: BorderRadius.circular(12.w),
            ),
          ),
          Text(
            newsDetail.content ?? "",
            style: TextStyle(
              fontSize: 16.h,
              fontFamily: FontFamily.fRobotoRegular,
              color: AppColors.c000000,
              // fontWeight: FontWeight.w500,
              height: 1.6,
              // letterSpacing: 0.5,
            ),
            // style: 17.w4(color: AppColors.c262626, height: 1.7,),
          ),
        ],
      ),
    );
  }

  Widget _hotComment() {
    return newsDetail.reviewsList!.isNotEmpty
        ? InkWell(
            onTap: () {
              Get.find<CommentController>()
                  .getReviews(newsDetail.id!, isRefresh: true);
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
              padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: HotComment(item: newsDetail.reviewsList!.first),
            ),
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    return GetBuilder<NewsDetailController>(
      // tag: newsDetail.id.toString(), // 使用 tag 区分控制器实例
      builder: (controller) {
        return RepaintBoundary(
          key: globalKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(12.w)),
            child: Column(
              children: [
                _head(globalKey),
                14.vGap,
                _buildNewsContent(controller),
                20.vGap,
                NewsBottomButton(newsDetail),
                10.vGap,
                _hotComment(),
              ],
            ),
          ),
        );
        ;
      },
    );
  }
}
