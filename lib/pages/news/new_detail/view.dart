/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:11:48
 * @LastEditTime: 2024-12-16 20:57:10
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/news_list_item.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_item.dart';
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
                                    item: controller.state.detailList[index])
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
                                      CommentController commentController =
                                          Get.find(tag: item.id.toString());
                                      item.reviewsList =
                                          commentController.mainList.value;
                                      controller.update(["newsDetail"]);
                                    },
                                    child: NewsListItem(
                                      newsDetail:
                                          controller.state.detailList[index],
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
                        child: SendCommentWidget(newsId: widget.newsDetail.id));
                  })
                ]);
          }),
    );
  }
}

class NewsDetailItem extends GetView<NewListController> {
  NewsDetailItem({super.key, required this.item});
  final NewsListDetail item;

  final GlobalKey globalKey = GlobalKey();

  Widget _head() {
    return Row(
      children: [
        ImageWidget(
          url: item.imgUrl,
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
        InkWell(
          onTap: () {
            Utils.generateAndShareImage(globalKey);
          },
          child: Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              border: Border.all(color: AppColors.c666666.withOpacity(0.3)),
            ),
            child: IconWidget(
              iconWidth: 16.w,
              icon: Assets.commonUiCommonIconSystemShare,
              iconColor: AppColors.c000000,
            ),
          ),
        ),
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
                  width: item.type == 1 ? 343.w : item.imamgeWidth,
                  height: item.imageHeight,
                  // fit: BoxFit.fitWidth,
                  borderRadius: BorderRadius.circular(9.w),
                ),
              )
            : 10.vGap,
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => 10.vGap,
            itemCount: item.imgList.length,
            itemBuilder: (contex, index) {
              return ImageWidget(
                url: item.imgList[index],
                width: 343.w,
                // fit: BoxFit.fitWidth,
                borderRadius: BorderRadius.circular(9.w),
              );
            }),
        10.vGap,
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
      ],
    );
  }

  Widget _comments() {
    return GetBuilder<CommentController>(
        tag: item.id.toString(),
        builder: (comCtrl) {
          var list =
              comCtrl.mainList.where((e) => e.parentReviewId == 0).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1.w,
                margin: EdgeInsets.symmetric(vertical: 25.w),
                width: double.infinity,
                color: AppColors.cE6E6E,
              ),
              Text(
                "Comments",
                style: 19.w7(height: 1),
              ),
              12.vGap,
              list.isNotEmpty
                  ? ListView.separated(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      itemCount: list.length,
                      separatorBuilder: (context, index) {
                        return 30.vGap;
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CommentItemView(item: list[index]),
                            if (list[index].sonReviews > 0 ||
                                list[index].subList.isNotEmpty)
                              Container(
                                // width: 295.w,
                                margin: EdgeInsets.only(left: 48.w),
                                child: SubComentsListView(list[index]),
                              )
                          ],
                        );
                      })
                  : SizedBox.shrink(),
              if (item.reviewsCount.value > list.length)
                Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MtInkwell(
                        onTap: () => comCtrl.getReviews(item.id),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          child: Text(
                            "Show more comments",
                            textAlign: TextAlign.center,
                            style: 12.w4(color: AppColors.cB3B3B3),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    int index = controller.state.detailList.indexOf(item);
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _head(),
            14.vGap,
            _buildNewsContent(),
            20.vGap,
            NewsBottomButton(
              item,
            ),
            16.vGap,
            const EmojiWidget(),
            if (index == 0 && item.reviewsCount > 0) _comments(),
            if (controller.state.detailList.length == 1) 80.vGap,
          ],
        ),
      ),
    );
  }
}
