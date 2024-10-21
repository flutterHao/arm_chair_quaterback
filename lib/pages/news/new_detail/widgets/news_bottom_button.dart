/*
 * @Description: 新闻的底部按钮点赞分享评论
 * @Author: lihonghao
 * @Date: 2024-10-17 17:02:35
 * @LastEditTime: 2024-10-21 21:47:01
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/drag_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsBottomButton extends StatelessWidget {
  const NewsBottomButton(this.detail, {super.key});
  final NewsDetail detail;

  NewsDetailController get controller => Get.find<NewsDetailController>();

  Widget _container(
      {required double width, Function? onTap, required Widget child}) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Container(
        width: width,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.cE6E6E,
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///点赞
          _container(
            width: 137.w,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => controller.likeNews(detail),
                    child: Container(
                      // color: Colors.amber,
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: IconWidget(
                              iconWidth: 18.w,
                              icon: detail.isLike?.value == 1
                                  ? Assets.uiIconLike_01Png
                                  : Assets.uiIconLike_02Png,
                              iconColor: detail.isLike?.value == 1
                                  ? AppColors.c262626
                                  : AppColors.c666666,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 7.w),
                            child: Text(
                              Utils.numFormat(detail.likes!),
                              style: 14.w4(
                                color: detail.isLike?.value == 1
                                    ? AppColors.c262626
                                    : AppColors.c666666,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // if (detail.likes != 0)

                  Container(
                    width: 1.w,
                    height: 24.w,
                    color: AppColors.ccccccc,
                  ),
                  InkWell(
                    onTap: () => controller.unLikeNews(detail),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(pi),
                        child: IconWidget(
                          iconWidth: 18.w,
                          icon: detail.isLike?.value == -1
                              ? Assets.uiIconLike_01Png
                              : Assets.uiIconLike_02Png,
                          iconColor: detail.isLike?.value == -1
                              ? AppColors.c262626
                              : AppColors.c666666,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          4.hGap,

          ///评论
          _container(
              width: 86.w,
              onTap: () {
                Get.find<CommentController>()
                    .getReviews(detail.id!, isRefresh: true);

                showModalBottomSheet(
                  isScrollControlled: true,
                  context: Get.context!,
                  // barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return VerticalDragBackWidget(
                        child: CommentsDialog(detail: detail));
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    iconWidth: 18.w,
                    icon: Assets.uiIconChatting_02Png,
                    iconColor: AppColors.c666666,
                  ),
                  // if (detail.likes != 0)
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(left: 7.w),
                      child: Text(
                        Utils.numFormat(detail.reviewsCount!.value),
                        style: 14.w4(color: AppColors.c262626),
                      ),
                    );
                  }),
                ],
              )),
          4.hGap,

          /// 分享
          _container(
            width: 86.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  iconWidth: 15.w,
                  icon: Assets.iconSharePng,
                  iconColor: AppColors.c666666,
                ),
                // if (detail.likes != 0)
                Container(
                  margin: EdgeInsets.only(left: 7.w),
                  child: Text(
                    "0",
                    style: 14.w4(
                      color: detail.isLike?.value == true
                          ? AppColors.c262626
                          : AppColors.c666666,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
