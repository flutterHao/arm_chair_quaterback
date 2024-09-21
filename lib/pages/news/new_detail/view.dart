import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comments_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/more_new_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

// class NewsDetailPage extends GetView<NewsDetailController> {
//   const NewsDetailPage(this.newsId, {super.key});
//   final Object? newsId;

//   // 主视图
//   Widget _buildView(context) {
//     return BlackAppWidget(
//       AppBarWidget(
//         id: GlobalNestedKey.NEWS,
//         title: "NEWS",
//         right: InkWell(
//           onTap: () {},
//           child: IconWidget(
//             iconWidth: 19.w,
//             iconHeight: 19.w,
//             icon: Assets.iconSharePng,
//           ),
//         ),
//       ),
//       bodyWidget: Expanded(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: CustomScrollView(
//             physics: const BouncingScrollPhysics(),
//             slivers: [
//               // _buildAppBar(),
//               _buildNewsContent(),
//               _buildMoreNews(),
//               _buildComments(),
//               SliverToBoxAdapter(
//                 child: SizedBox(
//                   height: 100.w,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       floatWidgets: [
//         Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: CommentDialog(newsId: int.tryParse(newsId.toString()) ?? 0))
//       ],
//     );
//   }

// // 2. 新闻内容部分抽取为单独的组件
//   Widget _buildNewsContent() {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 32.w),
//         child: SizedBox(
//           width: 311.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildNewsTitle(),
//               _buildAuthorAndDate(),
//               _buildNewsDescription(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNewsTitle() {
//     return Text(
//       controller.state.newDetail.title ?? "",
//       style: 24.w7(color: AppColors.c262626),
//     );
//   }

//   Widget _buildAuthorAndDate() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         16.vGap,
//         Text(controller.state.newDetail.source ?? "",
//             style: 12.w4(color: AppColors.c666666)),
//         6.vGap,
//         if (controller.state.newDetail.postTime != 0)
//           Text(
//               DateUtil.formatDateMs(controller.state.newDetail.postTime!,
//                   format: DateFormats.y_mo_d),
//               style: 12.w4(color: AppColors.cB3B3B3)),
//       ],
//     );
//   }

//   Widget _buildNewsDescription() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16),
//       child: Text(
//         controller.state.newDetail.content ?? "",
//         style: 14.w4(color: AppColors.c666666),
//       ),
//     );
//   }

// // 3. 更多新闻部分抽取为单独的组件
//   Widget _buildMoreNews() {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 28.w, horizontal: 32.w),
//         child: MoreNewsWidget(),
//       ),
//     );
//   }

// // 4. 评论部分抽取为单独的组件
//   Widget _buildComments() {
//     return SliverToBoxAdapter(
//       child: CommentsWidget(
//         commentList: controller.state.newDetail.reviewsList ?? [],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Get.put(NewsDetailController(newsId),
//         tag: newsId.toString()); // 初始化 Controller 并传递参数
//     return GetBuilder<NewsDetailController>(
//       builder: (_) {
//         // return Scaffold(body: _buildView());
//         return _buildView(context);
//       },
//     );
//   }
// }

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage(this.newsId, {super.key});
  final Object? newsId;

  // 主视图
  Widget _buildView(BuildContext context, NewsDetailController controller) {
    return BlackAppWidget(
      AppBarWidget(
        id: GlobalNestedKey.NEWS,
        title: "NEWS",
        right: InkWell(
          onTap: () {},
          child: IconWidget(
            iconWidth: 19.w,
            iconHeight: 19.w,
            icon: Assets.iconSharePng,
          ),
        ),
      ),
      bodyWidget: Visibility(
        visible: !controller.state.isLoading,
        child: Expanded(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // _buildAppBar(),
                _buildNewsContent(controller),
                _buildMoreNews(),
                _buildComments(controller),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100.w,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatWidgets: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CommentDialog(newsId: int.tryParse(newsId.toString()) ?? 0),
        ),
        Positioned(
          top: 200.w,
          child: Visibility(
              visible: controller.state.isLoading,
              child: Text(
                "loading...",
                style: 14.w4(color: AppColors.c666666),
              )),
        )
      ],
    );
  }

  // 新闻内容部分
  Widget _buildNewsContent(NewsDetailController controller) {
    return SliverToBoxAdapter(
      child: Padding(
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

  // 更多新闻部分
  Widget _buildMoreNews() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 28.w, horizontal: 32.w),
        child: MoreNewsWidget(
          tag: newsId.toString(),
        ),
      ),
    );
  }

  // 评论部分
  Widget _buildComments(NewsDetailController controller) {
    return SliverToBoxAdapter(
      child: CommentsWidget(
        commentList: controller.state.newDetail.reviewsList ?? [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 查找带有 tag 的控制器，确保通过 newsId 来区分不同的新闻详情页
    Get.put(
      NewsDetailController(newsId),
      tag: newsId.toString(),
    );

    return GetBuilder<NewsDetailController>(
      tag: newsId.toString(), // 使用 tag 区分控制器实例
      builder: (controller) {
        return _buildView(context, controller);
      },
    );
  }
}
