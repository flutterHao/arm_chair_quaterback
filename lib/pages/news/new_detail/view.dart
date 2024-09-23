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

///TODO: 跳转动画优化
Route createCustomRoute(Widget cur, Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1), // 动画时长 2 秒钟
    pageBuilder: (context, animation, secondaryAnimation) => page, // 新页面
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 缩小和移动退出动画（针对第一个页面）
      var scaleTween = Tween<double>(begin: 1.0, end: 0.5)
          .chain(CurveTween(curve: Curves.easeInOut)); // 缩小效果
      var slideTween =
          Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-0.9, 0.0))
              .chain(CurveTween(curve: Curves.easeInOut)); // 左侧退出效果

      // 新页面的右侧进入效果
      var slideInTween =
          Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .chain(CurveTween(curve: Curves.easeInOut)); // 右侧进入效果

      return Stack(
        children: [
          // 第一个页面：缩小并从左侧退出
          SlideTransition(
            position: animation.drive(slideTween), // 左侧滑出
            child: ScaleTransition(
              scale: animation.drive(scaleTween), // 同时缩小
              child: cur, // 第一个页面内容（当前页面）
            ),
          ),
          // 第二个页面：从右侧进入
          SlideTransition(
            position: animation.drive(slideInTween), // 右侧滑入
            child: page, // 第二个页面内容
          ),
        ],
      );
    },
  );
}

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
          onTap: () {
            Navigator.of(context)
                .push(createCustomRoute(this, NewsDetailPage(123)));
          },
          child: IconWidget(
            iconWidth: 19.w,
            iconHeight: 19.w,
            icon: Assets.iconSharePng,
          ),
        ),
      ),
      bodyWidget: !controller.state.isLoading
          ? Expanded(
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
            )
          : Expanded(
              child: Center(
                  child: Text(
                "Loading...",
                style: 14.w4(),
              )),
            ),
      floatWidgets: [
        if (!controller.state.isLoading)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CommentDialog(newsId: int.tryParse(newsId.toString()) ?? 0),
          ),
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
        // return Obx(() {
        //   return controller.state.isLoading.value
        //       ? Center(
        //           child: Text(
        //           "Loading...",
        //           style: 14.w4(),
        //         ))
        //       : _buildView(context, controller);
        // });
        return _buildView(context, controller);
      },
    );
  }
}
