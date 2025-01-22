import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
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
      child: Obx(() => Column(
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
                        return SeasonRankItemView(pageIndex);
                      }))
            ],
          )),
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
                    '${controller.getEnMMDD(controller.seasonRankList[controller.pageviewIndex.value].nowCycleStartTime)} - ${controller.getEnMMDD(controller.seasonRankList[controller.pageviewIndex.value].nowCycleEndTime)}',
                    style: 12.w5(fontFamily: FontFamily.fOswaldRegular),
                  )),
              5.hGap,
              MtInkWell(
                  onTap: () async {
                    // if (controller
                    //         .seasonRankList[controller.pageviewIndex.value]
                    //         .nextRank !=
                    //     null) {
                    //   print('有下个赛季');

                    //   print('添加新页面');
                    //   SeasonRankInfoEntity res =
                    //       await PicksApi.getSeasonRankInfo(
                    //           controller
                    //               .seasonRankList[
                    //                   controller.pageviewIndex.value]
                    //               .nextRank!
                    //               .seasonId,
                    //           pageSize: controller
                    //               .showNumGameConstantEntity!.constantValue);
                    //   controller.seasonRankList.add(res);
                    //   print(controller.seasonRankList.length);
                    //   await controller.seaDialogPageController.nextPage(
                    //       duration: const Duration(milliseconds: 300),
                    //       curve: Curves.linear);
                    //   controller.pageviewIndex.value =
                    //       (controller.seaDialogPageController.page ?? 0)
                    //           .toInt();
                    //   print(controller.pageviewIndex.value);
                    // } else {
                    //   print('没有下个赛季');
                    // }
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
  const SeasonRankItemView(this.pageIndex, {super.key});
  final int pageIndex;

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

  ///未上榜显示条件
  RxBool isNotSeasonList = false.obs;

  ///我在榜单显示范围内索引
  int activeIndex = 0;
  SeasonRankInfoEntity? seasonRankEntity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("controller.seasonRankList.length");
    // print(controller.seasonRankList.length);
    // print(widget.pageIndex);
    seasonRankEntity = controller.seasonRankList[widget.pageIndex];
    // print(seasonRankEntity == null);

    ///我已上榜单
    if (seasonRankEntity!.myRank != null) {
      ///我在榜单显示范围内
      if (seasonRankEntity!.myRank!.rank <=
          int.parse(controller.showNumGameConstantEntity!.constantValue)) {
        activeIndex = seasonRankEntity!.myRank!.rank - 1;
        WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
      } else {
        isShowBottom.value = true;
      }
    } else {
      print('未上榜');
      isNotSeasonList.value = true;
    }
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
                itemCount:
                    controller.seasonRankList[widget.pageIndex].ranks.length,
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
                      child: _myRankItemWidget(),
                    ))),
            Positioned(
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
                      child: _myRankItemWidget(),
                    ))),

            ///未上榜
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Visibility(
                    visible: isNotSeasonList.value,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: AppColors.cDEDEDE,
                          blurRadius: 10,
                        )
                      ]),
                      child: _isNotSeasonRankItemWidget(),
                    ))),
          ],
        ));
  }

  Widget _seasonRankItemWidget(int index, [Color color = AppColors.c000000]) {
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
                      seasonRankEntity!.ranks[index].teamLogo)),
            ),
            6.hGap,
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seasonRankEntity!.ranks[index].teamName,
                    style: 14
                        .w5(fontFamily: FontFamily.fOswaldMedium, color: color),
                  ),
                  Text(
                    'Win Rate  ${(seasonRankEntity!.ranks[index].winPro * 100).round()}%',
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
                    child: Text(
                        controller
                            .formatToW(seasonRankEntity!.ranks[index].cup),
                        style: 14.w5(fontFamily: FontFamily.fOswaldMedium)),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _myRankItemWidget() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 17.w),
        child: Row(
          children: [
            Text(
              seasonRankEntity!.myRank!.rank >
                      int.parse(
                          controller.showNumGameConstantEntity!.constantValue)
                  ? '${int.parse(controller.showNumGameConstantEntity!.constantValue)}'
                  : '${seasonRankEntity!.myRank!.rank}',
              style: 19.w5(
                fontFamily: FontFamily.fOswaldMedium,
              ),
            ),
            20.hGap,
            ClipOval(
              child: ImageWidget(
                  width: 36.w,
                  url: Utils.getAvaterUrl(seasonRankEntity!.myRank!.teamLogo)),
            ),
            6.hGap,
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seasonRankEntity!.myRank!.teamName,
                    style: 14.w5(
                        fontFamily: FontFamily.fOswaldMedium,
                        color: AppColors.cFF7954),
                  ),
                  Text(
                    'Win Rate  ${widget.pageIndex}%',
                    // 'Win Rate  ${(widget.seasonRankEntity.myRank != null ? widget.seasonRankEntity.myRank!.winPro * 100 : 0).round()}%',
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
                    child: Text('${seasonRankEntity!.myRank!.cup}',
                        style: 14.w5(fontFamily: FontFamily.fOswaldMedium)),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _isNotSeasonRankItemWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.w),
      child: Row(
        children: [
          IconWidget(
            iconWidth: 34.w,
            icon: controller
                .getcupUrl(controller.teamSimpleEntity.value.cupRankId),
          ),
          16.hGap,
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '5',
                      style: 24.w5(fontFamily: FontFamily.fOswaldBold)),
                  TextSpan(
                      text:
                          '/${controller.distanceSeasonGameConstantEntity!.constantValue}',
                      style: 16.w5(fontFamily: FontFamily.fOswaldMedium))
                ])),
                Text(
                  '${controller.distanceSeasonGameConstantEntity!.constantValue} MATCH INTO RANK',
                  style: 10.w4(fontFamily: FontFamily.fRobotoRegular),
                ),
              ],
            ),
          )),
          const Spacer(),
          IconWidget(
            iconWidth: 7.w,
            icon: Assets.commonUiCommonIconSystemJumpto,
            iconColor: AppColors.c000000,
          ),
        ],
      ),
    );
  }
}
