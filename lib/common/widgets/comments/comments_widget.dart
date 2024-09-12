import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CommentController controller = Get.put(CommentController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Comments(52K)",
                  style: 19.w7(),
                ),
              ),
              Text(
                "2.5W",
                style: 10.w7(color: AppColors.cB3B3B3),
              ),
              2.hGap,
              IconWidget(
                iconWidth: 13.w,
                iconHeight: 12.w,
                icon: Assets.uiIconChatting_01Png,
                iconColor: AppColors.cB3B3B3,
              )
            ],
          ),
          16.vGap,
          SizedBox(
            width: 343.w,
            // height: 100,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.count.value,
                separatorBuilder: (context, index) {
                  return 16.vGap;
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CommentItemView(index: index, isSub: false),
                      SizedBox(
                        width: 295.w,
                        child: const SubComentsListView(),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

///附属评论列表
class SubComentsListView extends GetView<CommentController> {
  const SubComentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      child: Obx(() {
        return ListView.builder(
            padding: EdgeInsets.only(top: 20.w),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.count.value,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CommentItemView(index: index, isSub: true);
            });
      }),
    );
  }
}

class CommentItemView extends GetView<CommentController> {
  const CommentItemView({super.key, required this.isSub, required this.index});
  final int index;
  final bool isSub;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWidget(
          url: "https://file.qiumiwu.com/player/202404/24/349123f6.png",
          width: isSub ? 36.w : 48.w,
          height: isSub ? 36.w : 48.w,
          borderRadius: BorderRadius.circular(24.w),
        ),
        6.hGap,
        Expanded(
          child: Column(
            children: [
              /// 用户信息
              Row(
                children: [
                  Text(
                    "Gleavinger",
                    style: 12.w4(),
                  ),
                  6.hGap,
                  Container(
                    width: 36.w,
                    height: 14.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.w),
                        color: AppColors.cE7B6DF),
                    child: Text(
                      "KOI",
                      style: 10.w4(color: Colors.white),
                    ),
                  ),
                  13.hGap,
                  Text(
                    "@ Gleavinger",
                    style: 12.w4(color: AppColors.cB3B3B3),
                  ),
                  Text(
                    "18h",
                    style: 12.w4(color: AppColors.cB3B3B3),
                  )
                ],
              ),
              10.vGap,

              /// 评论内容
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    "I'm talking about both being able to win  on the defensive side",
                    style: 14.w4(color: AppColors.c666666),
                  )),
                  30.hGap,
                  IconWidget(
                    iconWidth: 15.w,
                    iconHeight: 12.w,
                    icon: index % 2 == 0
                        ? Assets.uiIconLike_01Png
                        : Assets.uiIconLike_02Png,
                    iconColor: index % 2 == 0 ? AppColors.cFF546C : null,
                  )
                ],
              ),
              10.vGap,

              /// 点赞和回复
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      "100k likes",
                      style: 12.w4(color: AppColors.cB3B3B3),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showCommentBottomSheet(context);
                    },
                    child: Text(
                      "Reple",
                      style: 12.w4(color: AppColors.c666666),
                    ),
                  ),
                ],
              ),

              /// 展开 收起
              if (index == controller.count.value - 1)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.count.value += 3;
                        },
                        child: Row(
                          children: [
                            IconWidget(
                              iconWidth: 8.w,
                              iconHeight: 5.w,
                              icon: Assets.ball_1Png,
                            ),
                            4.hGap,
                            Text(
                              "more replies  (15)",
                              style: 12.w4(),
                            )
                          ],
                        ),
                      ),
                      30.hGap,
                      InkWell(
                        onTap: () {
                          controller.count.value = 0;
                        },
                        child: Row(
                          children: [
                            IconWidget(
                              iconWidth: 8.w,
                              iconHeight: 5.w,
                              icon: Assets.ball_1Png,
                            ),
                            4.hGap,
                            Text(
                              "fpld",
                              style: 12.w4(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
