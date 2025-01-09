import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/open_reward_count_down_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/rank_page.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/reward_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PickRankPage extends GetView<PickRankController> {
  const PickRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<PickRankController>(
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    delegate: FixedHeightSliverHeaderDelegate(
                        child: Container(
                          color: const Color(0xff3d3f45),
                          padding: EdgeInsets.only(left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.vGap,
                              Text(
                                "PICK RANKS",
                                style: 30.w7(
                                  color: AppColors.cFFE8A0,
                                  height: 0.8,
                                  fontFamily: FontFamily.fOswaldBold,
                                ),
                              ),
                              8.vGap,
                              Text(
                                "DEC 12 - DEC 14",
                                style: 10.w4(
                                  color: AppColors.cFFE8A0,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular,
                                ),
                              ),
                              28.vGap,
                              const OpenRewardCountDownWidget(
                                milliseconds: 23 * 24 * 60 * 60 * 1000 +
                                    0 * 60 * 60 * 1000 +
                                    0 * 60 * 1000 +
                                    5 * 1000,
                              ),
                            ],
                          ),
                        ),
                        height: 189.w)),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 9.w),
                    padding:
                        EdgeInsets.only(top: 25.w, left: 18.w, right: 21.w),
                    color: AppColors.cFFFFFF,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "REWARD",
                              style: 30.w7(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold,
                              ),
                            ),
                            IconWidget(
                              iconWidth: 14.w,
                              icon: Assets.commonUiCommonIconSystemInfo,
                              iconColor: AppColors.c000000,
                            )
                          ],
                        ),
                        25.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildRewardItem(
                                Assets.managerUiManagerGift01, "PLAYER", "1TH"),
                            _buildRewardItem(Assets.managerUiManagerGift02,
                                "BELLE", "1TH-3TH"),
                            _buildRewardItem(Assets.managerUiManagerGift03,
                                "JETTON", "1TH-50TH"),
                          ],
                        ),
                        23.vGap,
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: FixedHeightSliverHeaderDelegate(
                        child: Container(
                          padding: EdgeInsets.only(top: 9.w),
                          color: AppColors.cF2F2F2,
                          child: Container(
                            padding: EdgeInsets.only(left: 16.w, right: 14.w),
                            decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                border: Border(
                                    bottom: BorderSide(
                                  color: AppColors.cD4D4D4,
                                  width: 1.w,
                                )),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.w))),
                            child: Row(
                              children: [
                                Text(
                                  "RANKS",
                                  style: 30.w7(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fOswaldBold,
                                    height: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        height: 75.w)),
                SliverList.builder(
                    itemBuilder: (context, index) {
                  return Container(
                    color: AppColors.cFFFFFF,
                    child: Container(
                      height: 69.w,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.cE6E6E6,
                            width: 1.w,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 46.w,
                              child: Center(
                                  child: Text(
                                "$index",
                                style: 19.w5(
                                  color: AppColors.c1A1A1A,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ))),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.w),
                            child: ImageWidget(
                              url: "url",
                              width: 40.w,
                              height: 40.w,
                              imageFailedPath: Assets.iconUiDefault05,
                            ),
                          ),
                          10.hGap,
                          Expanded(
                              child: Text(
                            "G Cleavinger",
                            style: 14.w5(
                              color: AppColors.c1A1A1A,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          )),
                          Row(
                            children: [
                              IconWidget(
                                iconWidth: 16.w,
                                icon: Assets.commonUiCommonIconCurrency02,
                              ),
                              3.hGap,
                              Text(
                                "+999",
                                style: 14.w5(
                                  color: AppColors.c1A1A1A,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoMedium,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
              ],
            )),
          );
          return _oldWidget(context);
        },
      ),
    );
  }

  Container _buildRewardItem(String image, String name, String rank) {
    return Container(
      width: 91.w,
      height: 113.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: AppColors.cF2F2F2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconWidget(iconWidth: 67.w, icon: image),
          Text(
            name,
            style: 16.w5(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
          7.vGap,
          Text(
            rank,
            style: 10.w4(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular,
            ),
          ),
          9.vGap,
        ],
      ),
    );
  }

  BlackAppWidget _oldWidget(BuildContext context) {
    return BlackAppWidget(
      Stack(
        alignment: Alignment.centerLeft,
        children: [
          AppBarWidget(
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    controller.tabIndex.value == 0
                        ? "PICK RANK"
                        : "PICK REWARD",
                    style: 19.w7(color: AppColors.cE6E6E6),
                  );
                }),
                Obx(() {
                  return Text(
                    controller.rewardOpenTime.value,
                    style: TextStyle(color: AppColors.c666666, fontSize: 12.sp),
                  );
                })
              ],
            ),
          )
        ],
      ),
      totalScreenBuilder: (context, appBarHeight) {
        return TabBarView(controller: controller.tabController, children: [
          //rank
          RankPage(appBarHeight),
          //reward
          RewardPage(appBarHeight),
        ]);
      },
      floatWidgets: [
        //悬浮tab
        Positioned(
          top: MediaQuery.of(context).padding.top +
              AppBarContainer.APPBARCONTAINERHEIGHT +
              6.w +
              16.w,
          left: 12.w,
          right: 12.w,
          child: Container(
            height: 34.w,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 39.w),
            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.w),
                // color: AppColors.c808080.withOpacity(.4),
                border: Border.all(color: AppColors.c808080, width: 1.w)),
            child: Stack(
              alignment: FractionalOffset.centerLeft,
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return TLBuildWidget(
                      controller: controller.tabController,
                      builder: (current, next, progress, totalProgress) {
                        return Container(
                          height: 28.w,
                          width: constraints.maxWidth /
                              controller.tabController.length,
                          margin: EdgeInsets.only(
                              left: totalProgress * constraints.maxWidth / 2),
                          decoration: BoxDecoration(
                              color: AppColors.cF2F2F2,
                              borderRadius: BorderRadius.circular(17.w)),
                        );
                      });
                }),
                Row(
                  children: controller.tabTitles.map((e) {
                    int index = controller.tabTitles.indexOf(e);
                    return Flexible(
                        child: TLBuildWidget(
                            controller: controller.tabController,
                            builder: (current, next, progress, _) {
                              return InkWell(
                                onTap: () =>
                                    controller.tabController.animateTo(index),
                                child: Center(
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        color: current == index
                                            ? Color.lerp(AppColors.c1A1A1A,
                                                AppColors.cB3B3B3, progress)
                                            : next == index
                                                ? Color.lerp(AppColors.cB3B3B3,
                                                    AppColors.c1A1A1A, progress)
                                                : AppColors.cB3B3B3,
                                        fontSize: 13.sp),
                                  ),
                                ),
                              );
                            }));
                  }).toList(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
