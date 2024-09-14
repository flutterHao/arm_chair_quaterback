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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class NewsDetailPage extends GetView<NewDetailController> {
  const NewsDetailPage({super.key});

  // 主视图
  Widget _buildView(context) {
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
      bodyWidget: Expanded(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // _buildAppBar(),
              _buildNewsContent(),
              _buildMoreNews(),
              _buildComments(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100.w,
                ),
              )
            ],
          ),
        ),
      ),
      floatWidgets: const [Positioned(bottom: 0, child: CommentInputWidget())],
    );
  }

// 1. AppBar部分抽取为单独的组件
  // Widget _buildAppBar() {
  //   return SliverToBoxAdapter(
  //     child: AppBarWidget(
  //       title: "NEWS",
  //       right: InkWell(
  //         onTap: () {},
  //         child: IconWidget(
  //           iconWidth: 19.w,
  //           iconHeight: 19.w,
  //           icon: Assets.iconSharePng,
  //         ),
  //       ),
  //     ),
  //   );
  // }

// 2. 新闻内容部分抽取为单独的组件
  Widget _buildNewsContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: SizedBox(
          width: 311.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNewsTitle(),
              _buildAuthorAndDate(),
              _buildNewsDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsTitle() {
    return Text(
      "Way-Too-Early MLB Free-Agency Predictions Post · 2024 Trade Dea",
      style: 24.w7(color: AppColors.c262626),
    );
  }

  Widget _buildAuthorAndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.vGap,
        Text("zachary d. rymer", style: 12.w4(color: AppColors.c666666)),
        6.vGap,
        Text("august 1, 2024", style: 12.w4(color: AppColors.cB3B3B3)),
      ],
    );
  }

  Widget _buildNewsDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        "ClutchPoints: “John Wall [was] in tears, crying. He lost 25 gam "
        "ClutchPoints: “John Wall [was] in tears, crying. He lost 25 gam "
        "ClutchPoints: “John Wall [was] in tears, crying. He lost 25 gam",
        style: 14.w4(color: AppColors.c666666),
      ),
    );
  }

// 3. 更多新闻部分抽取为单独的组件
  Widget _buildMoreNews() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 28.w, horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("More news", style: 14.w7(color: AppColors.c262626)),
            12.vGap,
            const MoreNewsWidget(),
          ],
        ),
      ),
    );
  }

// 4. 评论部分抽取为单独的组件
  Widget _buildComments() {
    return const SliverToBoxAdapter(
      child: CommentsWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewDetailController>(
      builder: (_) {
        // return Scaffold(body: _buildView());
        return _buildView(context);
      },
    );
  }
}
