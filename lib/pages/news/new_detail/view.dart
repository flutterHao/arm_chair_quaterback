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
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/news_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailPage extends GetView<NewListController> {
  const NewsDetailPage({super.key, required this.newsDetail});
  final NewsListDetail newsDetail;

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
            return NewsListItem(
              newsDetail: newsDetail,
            );
          }),
        ),
      ),
    );
  }
}
