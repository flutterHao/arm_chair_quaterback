import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_bottom_button.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
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
      margin: EdgeInsets.symmetric(vertical: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _line(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              "NEXT",
              style: 10.w4(color: AppColors.cB3B3B3),
            ),
          ),
          _line(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: BlackAppWidget(
        AppBarWidget(
          title: "NEWS",
          right: InkWell(
            onTap: () {
              ///TODO
            },
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: IconWidget(
                iconWidth: 19.w,
                iconHeight: 19.w,
                icon: Assets.iconSharePng,
              ),
            ),
          ),
        ),
        bodyWidget: Expanded(
          child: SmartRefresher(
            controller: controller.flowRefreshCtrl,
            onRefresh: () => controller.getNewsFlow(newsId, isRefresh: true),
            onLoading: () => controller.getNewsFlow(newsId, isRefresh: false),
            child: ListView.separated(
                itemCount: controller.state.newsFlowList.length,
                separatorBuilder: (context, index) {
                  return _next();
                },
                itemBuilder: (context, index) {
                  var newsId = controller.state.newsFlowList[index].id;
                  return NewsDetailPage(newsId, key: Key(newsId.toString()));
                }),
          ),
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage(this.newsId, {super.key});
  final Object? newsId;

  // 主视图
  Widget _buildView(BuildContext context, NewsDetailController controller) {
    return Column(
      children: [
        // _buildAppBar(),
        _buildNewsContent(controller),
        // _buildComments(controller),
        Container(
          margin: EdgeInsets.only(top: 20.w),
          child: NewsBottomButton(newsId),
        ),
        if (controller.state.reviewsList.isNotEmpty)
          Container(
              width: 343.w,
              height: 11.w,
              decoration: BoxDecoration(
                color: AppColors.cE6E6E,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: CommentItemView(
                  item: controller.state.reviewsList.first, isSub: false))
      ],
    );
  }

  // 新闻内容部分
  Widget _buildNewsContent(NewsDetailController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: SizedBox(
        width: 311.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.vGap,
            _buildNewsTitle(controller),
            _buildAuthorAndDate(controller),
            _buildNewsDescription(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsTitle(NewsDetailController controller) {
    return Text(
      controller.state.newDetail.title ?? "",
      style: 24.w7(color: AppColors.c262626),
    );
  }

  Widget _buildAuthorAndDate(NewsDetailController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.vGap,
        Text(
          controller.state.newDetail.source ?? "",
          style: 12.w4(color: AppColors.c666666),
        ),
        6.vGap,
        if (controller.state.newDetail.postTime != 0)
          Text(
            DateUtil.formatDateMs(
              controller.state.newDetail.postTime!,
              format: DateFormats.y_mo_d,
            ),
            style: 12.w4(color: AppColors.cB3B3B3),
          ),
      ],
    );
  }

  Widget _buildNewsDescription(NewsDetailController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        controller.state.newDetail.content ?? "",
        style: 14.w4(color: AppColors.c666666),
      ),
    );
  }

  // 评论部分
  Widget _buildComments(NewsDetailController controller) {
    int id = controller.state.newDetail.id ?? 0;
    return SliverToBoxAdapter(
      child: CommentsWidget(
        commentList: controller.state.newDetail.reviewsList ?? [],
        newsId: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 查找带有 tag 的控制器，确保通过 newsId 来区分不同的新闻详情页
    Get.put(
      NewsDetailController(newsId),
      tag: newsId.toString(), /*  */
    );
    SystemChannels.textInput.invokeMethod('TextInput.setKeyboardAppearance', 1);
    return GetBuilder<NewsDetailController>(
      tag: newsId.toString(), // 使用 tag 区分控制器实例
      builder: (controller) {
        return _buildView(context, controller);
      },
    );
  }
}
