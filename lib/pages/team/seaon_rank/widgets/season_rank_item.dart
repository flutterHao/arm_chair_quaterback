import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeasonRankItemView extends StatefulWidget {
  const SeasonRankItemView(this.seasonRankEntity, {super.key});
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
  RxBool isShowBottom = false.obs;
  RxBool isShowTop = false.obs;

  ///未上榜显示条件
  RxBool isNotSeasonList = false.obs;

  ///我在榜单显示范围内索引
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///我已上榜单
    if (widget.seasonRankEntity.myRank != null) {
      print(widget.seasonRankEntity.myRank);

      ///我在榜单显示范围内
      if (widget.seasonRankEntity.myRank!.rank <=
          int.parse(controller.showNumGameConstantEntity!.constantValue)) {
        activeIndex = widget.seasonRankEntity.myRank!.rank - 1;
        WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
      } else {
        isShowBottom.value = true;
      }
    } else {
      print('未上榜');
      isNotSeasonList.value = true;
      activeIndex = -1;
    }
  }

  void _afterLayout(_) {
    final RenderBox ranksBodyRenderBox =
        controller.ranksBodyGlobalKey.currentContext!.findRenderObject()
            as RenderBox;
    rankBodyHeight = ranksBodyRenderBox.size.height;
    rankItemHeight = 74.w;
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
    // scrollController.removeListener(_scrollListener);
    // scrollController.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Container(
              child: widget.seasonRankEntity.ranks.isNotEmpty
                  ? ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: widget.seasonRankEntity.ranks.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: _seasonRankItemWidget(
                              index,
                              index == activeIndex
                                  ? AppColors.cFF7954
                                  : AppColors.c000000),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: AppColors.cD4D4D4, height: 1),
                    )
                  : Container(
                      color: AppColors.cFFFFFF,
                      height: 300.w,
                      child: const Center(
                        child: LoadStatusWidget(
                          loadDataStatus: LoadDataStatus.noData,
                        ),
                      ),
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
        height: 74.w,
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
                  height: 36.w,
                  url: Utils.getAvatarUrl(
                      widget.seasonRankEntity.ranks[index].teamLogo)),
            ),
            6.hGap,
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Text(
                        controller.formatToW(
                            widget.seasonRankEntity.ranks[index].cup),
                        style: 14.w5(fontFamily: FontFamily.fOswaldMedium)),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _myRankItemWidget() {
    return widget.seasonRankEntity.myRank != null
        ? Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 17.w),
            child: Row(
              children: [
                Text(
                  widget.seasonRankEntity.myRank!.rank >
                          int.parse(controller
                              .showNumGameConstantEntity!.constantValue)
                      ? '${int.parse(controller.showNumGameConstantEntity!.constantValue)}'
                      : '${widget.seasonRankEntity.myRank!.rank}',
                  style: 19.w5(
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                ),
                20.hGap,
                ClipOval(
                  child: ImageWidget(
                      width: 36.w,
                      url: Utils.getAvatarUrl(
                          widget.seasonRankEntity.myRank!.teamLogo)),
                ),
                6.hGap,
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.seasonRankEntity.myRank!.teamName,
                        style: 14.w5(
                            fontFamily: FontFamily.fOswaldMedium,
                            color: AppColors.cFF7954),
                      ),
                      Text(
                        'Win Rate  ${(widget.seasonRankEntity.myRank!.winPro * 100).round()}%',
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
                        child: Text('${widget.seasonRankEntity.myRank!.cup}',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium)),
                      )
                    ],
                  ),
                )
              ],
            ))
        : const SizedBox();
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
                      text: '${controller.teamSimpleEntity.value.totalGames}',
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
