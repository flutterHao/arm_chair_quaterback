/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2025-03-05 14:36:11
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
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
    return HorizontalDragBackContainer(
      child: BlackAppWidget(
          // backgroundColor: AppColors.c002B5C,
          backgroundColor: AppColors.cFFFFFF,
          const UserInfoBar(showPop: true),
          bodyWidget: Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height, // 设置最小高度为屏幕高度
                  ),
                  child: Column(
                    children: [
                      NewsDetailItem(
                        item: widget.newsDetail,
                        showComments: true,
                      ),
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
            }),
            BottomGuessTipWidget(
              bottomValue: 9.w,
            ),
          ]),
    );
  }
}
