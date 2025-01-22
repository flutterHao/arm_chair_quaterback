import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SeasonRankDialog extends GetView<SeaonRankController> {
  const SeasonRankDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return VerticalDragBackWidget(
        child: Container(
      height: 650.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          10.vGap,
          _seasonRankHeaderWidget(),
          5.vGap,
          const Divider(
            height: 1,
            color: AppColors.cD4D4D4,
          ),
          Expanded(
              key: controller.ranksBodyGlobalKey,
              child: PageView.builder(
                  itemCount: controller.seasonRankList.length,
                  controller: controller.seaDialogPageController,
                  itemBuilder: (context, pageIndex) {
                    return SeasonRankItemView(
                        pageIndex, controller.seasonRankList[pageIndex]);
                  }))
        ],
      ),
    ));
  }

  Widget _seasonRankHeaderWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Obx(() => Row(
            children: [
              Text(
                'Season Ranks',
                style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
              ),
              const Spacer(),
              MtInkWell(
                  onTap: () async {
                    await controller.seaDialogPageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    controller.pageviewIndex.value =
                        (controller.seaDialogPageController.page ?? 0).toInt();
                  },
                  child: Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: controller.pageviewIndex.value != 0
                                  ? AppColors.cB3B3B3
                                  : AppColors.cE6E6E,
                              width: 1)),
                      child: Transform.rotate(
                          angle: pi,
                          child: IconWidget(
                              iconWidth: 5.w,
                              iconColor: controller.pageviewIndex.value != 0
                                  ? AppColors.c000000
                                  : AppColors.cB3B3B3,
                              icon: Assets.commonUiCommonIconSystemJumpto)))),
              5.hGap,
              Container(
                  height: 28.w,
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      border: Border.all(color: AppColors.cB3B3B3, width: 1)),
                  alignment: Alignment.center,
                  child: Text(
                    'dec 12 - dec 14',
                    style: 12.w5(fontFamily: FontFamily.fOswaldRegular),
                  )),
              5.hGap,
              MtInkWell(
                  onTap: () async {
                    await controller.seaDialogPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    controller.pageviewIndex.value =
                        (controller.seaDialogPageController.page ?? 0).toInt();
                  },
                  child: Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: controller.pageviewIndex.value !=
                                    controller.seasonRankList.length - 1
                                ? AppColors.cB3B3B3
                                : AppColors.cE6E6E,
                            width: 1)),
                    child: IconWidget(
                        iconWidth: 5.w,
                        iconColor: controller.pageviewIndex.value !=
                                controller.seasonRankList.length - 1
                            ? AppColors.c000000
                            : AppColors.cB3B3B3,
                        icon: Assets.commonUiCommonIconSystemJumpto),
                  ))
            ],
          )),
    );
  }
}

class SeasonRankItemView extends StatefulWidget {
  const SeasonRankItemView(this.pageIndex, this.seasonRankEntity, {super.key});
  final int pageIndex;
  final SeasonRankInfoEntity seasonRankEntity;
  @override
  State<SeasonRankItemView> createState() => _SeasonRankItemViewState();
}

class _SeasonRankItemViewState extends State<SeasonRankItemView> {
  ScrollController scrollController = ScrollController();

  final SeaonRankController controller = Get.find();
  // final NabPlayerSeasonGameRankEntity seasonRankEntity =controller.seasonRankList[widget.pageIndex];
  double rankItemHeight = .0;
  double rankBodyHeight = .0;
  final GlobalKey _globalKey = GlobalKey();
  RxBool isShowBottom = false.obs;
  RxBool isShowTop = false.obs;
  var activeIndex = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    final RenderBox ranksBodyRenderBox =
        controller.ranksBodyGlobalKey.currentContext!.findRenderObject()
            as RenderBox;
    rankBodyHeight = ranksBodyRenderBox.size.height;
    final RenderBox renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    rankItemHeight = renderBox.size.height;
    isShowBottom.value = activeIndex * rankItemHeight > rankBodyHeight;

    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var rankItemTop = activeIndex * rankItemHeight;
    if (scrollController.position.extentBefore +
                rankBodyHeight -
                rankItemHeight >
            rankItemTop &&
        scrollController.position.extentBefore < rankItemTop) {
      isShowBottom.value = false;
      isShowTop.value = false;
    } else if (scrollController.position.extentBefore +
            rankBodyHeight -
            rankItemHeight <
        rankItemTop) {
      isShowBottom.value = true;
    } else {
      isShowTop.value = true;
    }
  }

  @override
  void dispose() {
    // 移除监听器并释放控制器资源
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Container(
              child: ListView.separated(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: widget.seasonRankEntity.ranks.length,
                itemBuilder: (context, index) {
                  return Container(
                    key: index == 0 ? _globalKey : null,
                    child: _seasonRankItemWidget(
                        index,
                        index == activeIndex
                            ? AppColors.cFF7954
                            : AppColors.c000000),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.cD4D4D4, height: 1),
              ),
            ),
            Positioned(
                // duration: const Duration(milliseconds: 300),
                bottom: 0,
                left: 0,
                right: 0,
                child: Visibility(
                    visible: isShowBottom.value,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.w),
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: AppColors.cDEDEDE,
                          blurRadius: 10,
                        )
                      ]),
                      child: _seasonRankItemWidget(
                          controller.seasonRankList.length - 1,
                          AppColors.cFF7954),
                    ))),
            Positioned(
                // duration: const Duration(milliseconds: 300),
                top: 0,
                left: 0,
                right: 0,
                child: Visibility(
                    visible: isShowTop.value,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.w),
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: AppColors.cDEDEDE,
                          blurRadius: 10,
                        )
                      ]),
                      child: _seasonRankItemWidget(
                          controller.seasonRankList.length - 1,
                          AppColors.cFF7954),
                    )))
          ],
        ));
  }

  Widget _seasonRankItemWidget(int index, [Color color = AppColors.c000000]) {
    // controller.seasonRankList[controller.pageviewIndex.value];
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 17.w),
        child: Row(
          children: [
            Text(
              '${index + 1}',
              style: 19.w5(
                fontFamily: FontFamily.fOswaldMedium,
              ),
            ),
            20.hGap,
            ClipOval(
              child: ImageWidget(
                  width: 36.w,
                  url: Utils.getAvaterUrl(
                      widget.seasonRankEntity.ranks[index].teamLogo)),
            ),
            6.hGap,
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.seasonRankEntity.ranks[index].teamName,
                    style: 14
                        .w5(fontFamily: FontFamily.fOswaldMedium, color: color),
                  ),
                  Text(
                    'Win Rate  ${(widget.seasonRankEntity.ranks[index].winPro * 100).round()}%',
                    style: 12.w4(
                        color: AppColors.c4D4D4D,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                ],
              ),
            )),
            SizedBox(
              width: 100.w,
              child: Row(
                children: [
                  IconWidget(
                      iconWidth: 22.w,
                      icon: Assets.managerUiManagerGameGrade01),
                  const Spacer(),
                  IconWidget(
                      iconWidth: 17.w,
                      icon: Assets.managerUiManagerIconCurrency04),
                  2.hGap,
                  SizedBox(
                    width: 42.w,
                    // alignment: Alignment.centerRight,
                    child: Text('${widget.seasonRankEntity.ranks[index].cup}',
                        style: 14.w5(fontFamily: FontFamily.fOswaldMedium)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
