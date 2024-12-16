/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2024-12-16 21:38:30
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailPage2 extends StatefulWidget {
  const NewsDetailPage2({super.key, required this.newsDetail});
  final NewsListDetail newsDetail;

  @override
  State<NewsDetailPage2> createState() => _NewsDetailPage2State();
}

class _NewsDetailPage2State extends State<NewsDetailPage2> {
  NewListController controller = Get.find();
  var showCommentDialog = true.obs;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<NewListController>(
          id: "newsDetail",
          builder: (_) {
            return BlackAppWidget(
                // backgroundColor: AppColors.c002B5C,
                backgroundColor: AppColors.cFFFFFF,
                const UserInfoBar(showPop: true),
                bodyWidget: Expanded(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: KeyedSubtree(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            NewsDetailItem(item: widget.newsDetail),
                            100.vGap,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                floatWidgets: [
                  Obx(() {
                    return AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        bottom: showCommentDialog.value ? 0 : -80.w,
                        left: 0,
                        right: 0,
                        child: SendCommentWidget(detail: widget.newsDetail));
                  })
                ]);
          }),
    );
  }
}
