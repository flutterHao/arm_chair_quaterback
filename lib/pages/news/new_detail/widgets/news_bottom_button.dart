/*
 * @Description: 新闻的底部按钮点赞分享评论
 * @Author: lihonghao
 * @Date: 2024-10-17 17:02:35
 * @LastEditTime: 2024-10-17 18:34:19
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsBottomButton extends GetView<NewsDetailController> {
  const NewsBottomButton(this.newsId, {super.key});
  final Object? newsId;

  Widget _container({required double width, required Widget child}) {
    return Container(
      width: width,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.cE6E6E, borderRadius: BorderRadius.circular(16.w)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    NewsDetail detail =
        Get.find<NewsDetailController>(tag: newsId.toString()).state.newDetail;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///点赞
        _container(
          width: 137.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconWidget(
                iconWidth: 18.w,
                icon: detail.isLike?.value == true
                    ? Assets.uiIconLike_01Png
                    : Assets.uiIconLike_02Png,
                iconColor: detail.isLike?.value == true
                    ? AppColors.c262626
                    : AppColors.c666666,
              ),
              // if (detail.likes != 0)
              Container(
                margin: EdgeInsets.only(left: 7.w),
                child: Text(
                  "${detail.likes}",
                  style: 14.w4(
                    color: detail.isLike?.value == true
                        ? AppColors.c262626
                        : AppColors.c666666,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                width: 1.w,
                height: 24.w,
                color: AppColors.ccccccc,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(pi),
                child: IconWidget(
                  iconWidth: 18.w,
                  icon: detail.isLike?.value == true
                      ? Assets.uiIconLike_01Png
                      : Assets.uiIconLike_02Png,
                  iconColor: detail.isLike?.value == true
                      ? AppColors.c262626
                      : AppColors.c666666,
                ),
              ),
            ],
          ),
        ),
        4.hGap,

        ///评论
        _container(
            width: 86.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  iconWidth: 15.w,
                  icon: Assets.uiIconChatting_02Png,
                  iconColor: AppColors.c666666,
                ),
                // if (detail.likes != 0)
                Container(
                  margin: EdgeInsets.only(left: 7.w),
                  child: Text(
                    "${detail.likes}",
                    style: 14.w4(
                      color: detail.isLike?.value == true
                          ? AppColors.c262626
                          : AppColors.c666666,
                    ),
                  ),
                ),
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
                  "${detail.likes}",
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
    );
  }
}
