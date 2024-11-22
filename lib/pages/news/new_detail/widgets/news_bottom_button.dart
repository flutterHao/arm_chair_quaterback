/*
 * @Description: 新闻的底部按钮点赞分享评论
 * @Author: lihonghao
 * @Date: 2024-10-17 17:02:35
 * @LastEditTime: 2024-11-22 11:57:29
 */

import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsBottomButton extends GetView<NewListController> {
  const NewsBottomButton(this.detail, {super.key, this.showCommentBt = true});
  final NewsListDetail detail;
  final bool showCommentBt;

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
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(7.w),
            border: Border.all(
              width: 1.h,
              color: AppColors.c666666.withOpacity(0.3),
            )),
        child: child,
      ),
    );
  }

  static String numFormat(int num) {
    if (num >= 0 && num <= 999) {
      return "$num";
    } else {
      return "${(num / 1000).toStringAsFixed(1)}k";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///点赞
        _container(
          width: 113.w,
          child: Obx(() {
            int like = detail.likes - detail.unLikes;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => controller.likeNews(detail),
                  child: Container(
                    width: 72.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        7.hGap,
                        InkWell(
                          child: IconWidget(
                            iconWidth: 18.w,
                            icon: detail.isLike.value == 1
                                ? Assets.iconUiIconLike01
                                : Assets.iconUiIconLike02,
                            iconColor: detail.isLike.value == 1
                                ? AppColors.cFF7954
                                : AppColors.c000000,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 7.w),
                          child: Text(
                            "${like > 0 ? numFormat(like) : 0}",
                            style: 14.w4(
                              color: detail.isLike.value == 1
                                  ? AppColors.cFF7954
                                  : AppColors.c000000,
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
                    width: 37.w,
                    padding: EdgeInsets.only(top: 3.w),
                    alignment: Alignment.center,
                    // padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: IconWidget(
                      rotateAngle: 180,
                      iconWidth: 18.w,
                      icon: detail.isLike.value == -1
                          ? Assets.iconUiIconLike01
                          : Assets.iconUiIconLike02,
                      iconColor: detail.isLike.value == -1
                          ? AppColors.c2D84EF
                          : AppColors.c000000,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        12.hGap,

        ///评论
        if (showCommentBt)
          _container(
              width: 76.w,
              onTap: () async {
                final ctrl = Get.find<CommentController>();
                ctrl.getReviews(detail.id, isRefresh: true);

                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: Get.context!,
                  // barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return VerticalDragBackWidget(
                        child: CommentsDialog(detail: detail));
                  },
                );

                detail.reviewsList = ctrl.mainList.value;
                ctrl.update();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    iconWidth: 18.w,
                    icon: Assets.iconUiIconChatting02,
                    iconColor: AppColors.c000000,
                  ),
                  // if (detail.likes != 0)
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(left: 7.w),
                      child: Text(
                        numFormat(detail.reviewsCount.value),
                        style: 14.w4(color: AppColors.c000000),
                      ),
                    );
                  }),
                ],
              )),
        // 4.hGap,
      ],
    );
  }
}
