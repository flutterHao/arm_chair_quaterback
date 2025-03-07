/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2025-03-06 16:58:17
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/news_list_item.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_dialog.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/emoji_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_bottom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.newsDetail});

  final NewsListDetail newsDetail;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  ScrollController detailScrollController = ScrollController();
  NewListController controller = Get.find();
  var showCommentDialog = true.obs;
  final _firstItemKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    detailScrollController.addListener(() {
      _onScroll();
    });
  }

  void _onScroll() {
    final RenderBox? firstItemRenderBox =
        _firstItemKey.currentContext?.findRenderObject() as RenderBox?;
    if (firstItemRenderBox != null) {
      final offset = detailScrollController.position.pixels;
      final itemSize = firstItemRenderBox.size;
      if (offset > itemSize.height - 200.h) {
        showCommentDialog.value = false;
      } else {
        showCommentDialog.value = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
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
                    child: ListView.separated(
                        controller: detailScrollController,
                        padding: EdgeInsets.only(bottom: 80.w),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = controller.state.detailList[index];
                          return KeyedSubtree(
                            key: index == 0 ? _firstItemKey : null,
                            child: index == 0
                                ? NewsDetailItem(
                                    item: controller.state.detailList[index],
                                    showComments:
                                        index == 0 && item.reviewsCount > 0,
                                  )
                                : InkWell(
                                    onTap: () {
                                      ///获取评论
                                      final comCtrl = Get.put(
                                          CommentController(),
                                          tag: item.id.toString());
                                      comCtrl.getReviews(item.id,
                                          isRefresh: true);
                                      Get.toNamed(RouteNames.newsDetail2,
                                          arguments: item);
                                      // CommentController commentController =
                                      //     Get.find(tag: item.id.toString());
                                      // item.reviewsList =
                                      //     commentController.mainList.value;
                                      // controller.update(["newsDetail"]);
                                    },
                                    child: NewsListItem(
                                        newsDetail:
                                            controller.state.detailList[index],
                                        showMoreNew: index == 1
                                        // key: Key(item.id.toString()),
                                        ),
                                  ),
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(vertical: 10.w),
                              width: double.infinity,
                              height: 1,
                              color: AppColors.cD4D4D4,
                            ),
                        itemCount: controller.state.detailList.length),
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
                ]);
          }),
    );
  }
}

class NewsDetailItem extends GetView<NewListController> {
  NewsDetailItem({super.key, required this.item, this.showComments = false});

  final NewsListDetail item;
  final bool showComments;

  final GlobalKey globalKey = GlobalKey();

  Widget _head() {
    return Row(
      children: [
        ImageWidget(
          url: controller.getNewsSourceImage(item.source),
          width: 32.w,
          height: 32.w,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(16.w),
        ),
        7.5.hGap,
        Container(
          constraints: BoxConstraints(maxWidth: 120.w),
          child: Text(
            item.source,
            overflow: TextOverflow.ellipsis,
            style: 14.w4(
              color: AppColors.c000000,
              fontFamily: FontFamily.fRobotoRegular,
            ),
          ),
        ),
        9.hGap,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.c000000,
              borderRadius: BorderRadius.circular(4.w)),
          child: Text(
            "OFFICIAL",
            style: 12.w4(
              color: AppColors.cFFFFFF,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        Text(
          Utils.timeAgo(item.postTime),
          style: 12.w4(
            color: AppColors.cB3B3B3,
            fontFamily: FontFamily.fRobotoRegular,
          ),
        ),
        13.hGap,
        SizedBox(
          width: 24.w,
          height: 24.w,
        )
      ],
    );
  }

  // 新闻内容部分
  Widget _buildNewsContent() {
    // newsDetail.type = 2;
    return Column(
      ///大图
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title.toUpperCase(),
          style: 19.w4(
            color: AppColors.c000000,
            height: 1.25,
            fontFamily: FontFamily.fOswaldMedium,
          ),
        ),
        ObjectUtil.isNotEmpty(item.imgUrl)
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: ImageWidget(
                  url: item.imgUrl,
                  // url:
                  //     "https://oss.ducafecat.com/ducafecat/2023/10/18/6d28b39f0a3bdae61fa2d40261bdc7d2.gif",
                  width: item.type == 1 ? 343.w : item.imamgeWidth,
                  height: item.imageHeight,
                  // fit: BoxFit.fitWidth,
                  borderRadius: BorderRadius.circular(9.w),
                ),
                // child: Container(
                //   width: item.imamgeWidth,
                //   height: item.imageHeight,
                // ),
              )
            : 10.vGap,
        Text(
          item.content,
          style: TextStyle(
            fontSize: 16.h,
            fontFamily: FontFamily.fRobotoRegular,
            color: AppColors.c000000,
            height: 1.6,
            // letterSpacing: 0.5,
          ),
          // style: 17.w4(color: AppColors.c262626, height: 1.7,),
        ),
        10.vGap,
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => 10.vGap,
            itemCount: item.imgList.length,
            itemBuilder: (contex, index) {
              // return ImageWidget(
              //   url: item.imgList[index],
              //   width: 343.w,
              //   // fit: BoxFit.fitWidth,
              //   borderRadius: BorderRadius.circular(9.w),
              // );
              return ImageWidget(
                url: item.imgList[index],
                width: item.type == 1 ? 343.w : item.imamgeWidth,
                height: item.imageHeight,
                // fit: BoxFit.fitWidth,
                borderRadius: BorderRadius.circular(9.w),
              );
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          key: globalKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 11.5.w),
            color: AppColors.cFFFFFF,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _head(),
                      14.vGap,
                      _buildNewsContent(),
                    ],
                  ),
                ),
                if (controller.pickPlayerList.isNotEmpty &&
                    item.imgList.length <= 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.vGap,
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15.w),
                        child: Text(
                          "PLAYER PICK",
                          style: 20.w4(
                              height: 1, fontFamily: FontFamily.fOswaldMedium),
                        ),
                      ),
                      SizedBox(
                        height: 150.w,
                        // width: 375.w,
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                  alignment: Alignment.centerLeft,
                                  width: 300.w,
                                  child: GuessItemV2(
                                    margin: EdgeInsets.all(0),
                                    playerV2: controller.pickPlayerList[index],
                                    index: index,
                                    mainRoute: true,
                                    isInScoreDetail: true,
                                  ),
                                ),
                            separatorBuilder: (context, index) => 10.hGap,
                            itemCount: controller.pickPlayerList.length),
                      )
                    ],
                  ),
                20.vGap,

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewsBottomButton(
                        item,
                      ),
                      16.vGap,
                      EmojiWidget(
                        emojis: item.emojis,
                        myEmojis: item.myEmoji,
                        type: 1,
                        targetId: item.id,
                        subgoal: item.id,
                      ),
                      if (showComments) DetailCommentWidget(item: item),
                    ],
                  ),
                )
                // if (controller.state.detailList.length == 1) 80.vGap,
              ],
            ),
          ),
        ),
        Positioned(
          top: 11.5.w,
          right: 15.w,
          child: ShareWidget(
            globalKey: globalKey,
            type: ShareType.guess,
          ),
        )
      ],
    );
  }
}
