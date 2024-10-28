import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_item.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_bottom_button.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/regular_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class NewsDetailList extends GetView<NewListController> {
  const NewsDetailList(this.newsId, {super.key});
  final Object? newsId;

  Widget _line() {
    return Container(
      width: 140.w,
      height: 1.w,
      decoration: const BoxDecoration(
        color: AppColors.cB3B3B3,
        // borderRadius: BorderRadius.circular(0.5.w),
      ),
    );
  }

  Widget _next() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _line(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              "NEXT",
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          ),
          _line(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CommentController());
    Get.put(NewsDetailController(newsId));
    return HorizontalDragBackWidget(
      child: BlackAppWidget(
        backgroundColor: AppColors.cF2F2F2,
        const AppBarWidget(
          title: "NEWS",
        ),
        bodyWidget: Expanded(
          child: GetBuilder<NewListController>(
              id: "newsFlow",
              builder: (_) {
                // if (controller.state.newsFlowList.isEmpty) {
                //   return LoadStatusWidget(
                //       onRefreshTap: () =>
                //           controller.getNewsFlow(newsId, isRefresh: true));
                // }
                return SmartRefresher(
                  controller: controller.flowRefreshCtrl,
                  enablePullUp: true,
                  enableTwoLevel: true,
                  onRefresh: () =>
                      controller.getNewsFlow(newsId, isRefresh: true),
                  onLoading: () =>
                      controller.getNewsFlow(newsId, isRefresh: false),
                  child: ListView.separated(
                      controller: controller.scrollController,
                      padding: EdgeInsets.symmetric(vertical: 40.w),
                      itemCount: controller.state.newsFlowList.length,
                      separatorBuilder: (context, index) {
                        return _next();
                      },
                      itemBuilder: (context, index) {
                        NewsDetail item = controller.state.newsFlowList[index];
                        return NewsDetailItem(
                          newsDetail: item,
                          key: Key(newsId.toString()),
                        );
                      }),
                );
              }),
        ),
      ),
    );
  }
}

class NewsDetailItem extends StatelessWidget {
  const NewsDetailItem({super.key, required this.newsDetail});
  final NewsDetail newsDetail;

  // 主视图
  Widget _buildView(BuildContext context, NewsDetailController controller) {
    return Column(
      children: [
        _buildNewsContent(controller),
        20.vGap,
        NewsBottomButton(newsDetail),
        10.vGap,
        _progressWidget(),
        20.vGap,
        _hotComment(),
      ],
    );
  }

  // 新闻内容部分
  Widget _buildNewsContent(NewsDetailController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: SizedBox(
        // width: 311.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsDetail.title ?? "",
              style: 28.w7(color: AppColors.c262626, height: 1.25),
            ),
            15.vGap,
            if (newsDetail.source != null)
              Text(
                newsDetail.source ?? "",
                style: 12.w4(color: AppColors.c666666, height: 1),
              ),
            6.vGap,
            if (newsDetail.postTime != 0)
              Text(
                DateUtil.formatDateMs(
                  newsDetail.postTime!,
                  format: DateFormats.y_mo_d,
                ),
                style: 12.w4(color: AppColors.cB3B3B3, height: 1),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                newsDetail.content ?? "",
                style: TextStyle(
                  fontSize: 16.h,
                  fontFamily: FontFamily.fNotoSans,
                  color: AppColors.c262626,
                  // fontWeight: FontWeight.w500,
                  height: 1.6,
                  // letterSpacing: 0.5,
                ),
                // style: 17.w4(color: AppColors.c262626, height: 1.7,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressWidget() {
    return ShadowContainer(
        width: 343.w,
        child: Column(
          children: [
            Text(
              "Support Rate",
              style: 14.w7(),
            ),
            10.vGap,
            NewsPercentWidget(
                leftTitle: "Agress",
                rightTitle: "Disagress",
                leftCount: newsDetail.likes ?? 0,
                rightCount: newsDetail.unLikes ?? 0),
          ],
        ));
  }

  Widget _hotComment() {
    return newsDetail.reviewsList!.isNotEmpty
        ? Container(
            width: 343.w,
            // height: 110.w,
            padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.cE6E6E,
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: HotComment(item: newsDetail.reviewsList!.first),
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    // 查找带有 tag 的控制器，确保通过 newsId 来区分不同的新闻详情页
    // Get.put(
    //   NewsDetailController(newsDetail.id),
    //   tag: newsDetail.id.toString(), /*  */
    // );
    SystemChannels.textInput.invokeMethod('TextInput.setKeyboardAppearance', 1);
    return GetBuilder<NewsDetailController>(
      // tag: newsDetail.id.toString(), // 使用 tag 区分控制器实例
      builder: (controller) {
        return _buildView(context, controller);
      },
    );
  }
}
