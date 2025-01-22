import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/open_reward_count_down_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/rank_reward_detail.dart';
import 'package:flutter/material.dart';
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
            bodyWidget: Expanded(child: Builder(builder: (context) {
              if (controller.rankInfo == null) {
                return Obx(() {
                  return Center(
                    child: LoadStatusWidget(
                      loadDataStatus: controller.loadStatus.value,
                    ),
                  );
                });
              }
              return Stack(
                children: [
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: FixedHeightSliverHeaderDelegate(
                              child: Container(
                                padding: EdgeInsets.only(left: 16.w),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            Assets.picksUiPickRanksBg),
                                        alignment: Alignment.topRight,
                                        fit: BoxFit.cover)),
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
                                      "${controller.getMonthDay(controller.rankInfo!.nowCycleStartTime)} - ${controller.getMonthDay(controller.rankInfo!.nowCycleEndTime)}",
                                      style: 10.w4(
                                        color: AppColors.cFFE8A0,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoRegular,
                                      ),
                                    ),
                                    28.vGap,
                                    OpenRewardCountDownWidget(
                                      milliseconds:
                                          controller.getRewardOpenTime(),
                                    ),
                                  ],
                                ),
                              ),
                              height: 189.w)),
                      SliverToBoxAdapter(
                        child: MtInkWell(
                          minScale: 0.95,
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: AppColors.cTransparent,
                                context: context,
                                builder: (context) {
                                  return RankRewardDetail();
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 9.w),
                            padding: EdgeInsets.only(
                                top: 25.w, left: 18.w, right: 21.w),
                            color: AppColors.cFFFFFF,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildRewardItem(
                                        Assets.managerUiManagerGift03,
                                        "PLAYER",
                                        "1TH"),
                                    _buildRewardItem(
                                        Assets.managerUiManagerGift02,
                                        "BELLE",
                                        "1TH-3TH"),
                                    _buildRewardItem(Assets.picksUiPickGift01,
                                        "JETTON", "1TH-50TH"),
                                  ],
                                ),
                                23.vGap,
                              ],
                            ),
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
                                  padding:
                                      EdgeInsets.only(left: 16.w, right: 14.w),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "RANKS",
                                        style: 30.w7(
                                          color: AppColors.c000000,
                                          fontFamily: FontFamily.fOswaldBold,
                                          height: 1,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Obx(() {
                                            return MtInkWell(
                                              onTap: () => controller.pre(),
                                              child: Container(
                                                width: 28.w,
                                                height: 28.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.w),
                                                  border: Border.all(
                                                    color:
                                                        controller.hasPre.value
                                                            ? AppColors.cB3B3B3
                                                            : AppColors.cE6E6E6,
                                                    width: 1.w,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: IconWidget(
                                                    iconWidth: 5.w,
                                                    icon: Assets
                                                        .commonUiCommonIconSystemJumpto,
                                                    iconColor:
                                                        controller.hasPre.value
                                                            ? AppColors.c000000
                                                            : AppColors.cB3B3B3,
                                                    rotateAngle: 180,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                          Obx(() {
                                            return Container(
                                              width: 112.w,
                                              height: 28.w,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 6.w),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColors.cB3B3B3,
                                                  width: 1.w,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.w),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${controller.getMonthDay(controller.currentStartMs.value)} - ${controller.getMonthDay(controller.currentEndMs.value)}",
                                                style: 12.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldRegular,
                                                ),
                                              ),
                                            );
                                          }),
                                          Obx(() {
                                            return MtInkWell(
                                              onTap: () => controller.next(),
                                              child: Container(
                                                width: 28.w,
                                                height: 28.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.w),
                                                  border: Border.all(
                                                    color:
                                                        controller.hasNext.value
                                                            ? AppColors.cB3B3B3
                                                            : AppColors.cE6E6E6,
                                                    width: 1.w,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: IconWidget(
                                                    iconWidth: 5.w,
                                                    icon: Assets
                                                        .commonUiCommonIconSystemJumpto,
                                                    iconColor:
                                                        controller.hasNext.value
                                                            ? AppColors.c000000
                                                            : AppColors.cB3B3B3,
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              height: 75.w)),
                      GetBuilder<PickRankController>(
                          id: PickRankController.idRankList,
                          builder: (_) {
                            if (controller.rankInfo!.ranks.isEmpty) {
                              return Obx(() {
                                return SliverToBoxAdapter(
                                  child: Container(
                                    color: AppColors.cFFFFFF,
                                    height: 300.w,
                                    child: Center(
                                      child: LoadStatusWidget(
                                        loadDataStatus:
                                            controller.loadOtherStatus.value,
                                      ),
                                    ),
                                  ),
                                );
                              });
                            }
                            return SliverList.builder(
                                itemCount: controller.rankInfo!.ranks.length,
                                itemBuilder: (context, index) {
                                  var item = controller.rankInfo!.ranks[index];
                                  var isMe = Get.find<HomeController>()
                                          .userEntiry
                                          .teamLoginInfo
                                          ?.team
                                          ?.teamId ==
                                      item.teamId;
                                  return Container(
                                    color: AppColors.cFFFFFF,
                                    child: Container(
                                      height: 69.w,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.w),
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
                                                "${index + 1}",
                                                style: 19.w5(
                                                  color: AppColors.c1A1A1A,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                ),
                                              ))),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                            child: ImageWidget(
                                              url: Utils.getAvaterUrl(
                                                  item.teamLogo),
                                              width: 40.w,
                                              height: 40.w,
                                              imageFailedPath:
                                                  Assets.iconUiDefault05,
                                            ),
                                          ),
                                          10.hGap,
                                          Expanded(
                                              child: Text(
                                            item.teamName,
                                            style: 14.w5(
                                              color: isMe
                                                  ? AppColors.cFF7954
                                                  : AppColors.c1A1A1A,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                            ),
                                          )),
                                          Row(
                                            children: [
                                              IconWidget(
                                                iconWidth: 16.w,
                                                icon: Assets
                                                    .commonUiCommonIconCurrency02,
                                              ),
                                              3.hGap,
                                              Text(
                                                "+${item.chip}",
                                                style: 14.w5(
                                                  color: AppColors.c1A1A1A,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fRobotoMedium,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                      GetBuilder<PickRankController>(
                          id: PickRankController.idRankListBottomEmpty,
                          builder: (_) {
                            if ((controller.rankInfo!.myRank.rank ?? 0) == 0 ||
                                ((controller.rankInfo!.myRank.rank ?? 0) != 0 &&
                                    !controller.inTheRankList.value)) {
                              return SliverPadding(
                                  padding: EdgeInsets.only(top: 87.w));
                            }
                            return const SliverToBoxAdapter(
                                child: SizedBox.shrink());
                          })
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: GetBuilder<PickRankController>(
                          id: PickRankController.idRankFloat,
                          builder: (_) {
                            if ((controller.rankInfo!.myRank.rank ?? 0) == 0) {
                              return MtInkWell(
                                onTap: () => Get.back(),
                                child: Container(
                                  height: 78.w,
                                  padding:
                                      EdgeInsets.only(left: 24.w, right: 28.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cFFFFFF,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.c000000
                                                .withOpacity(0.05),
                                            offset: Offset(0, -9.w),
                                            blurRadius: 9.w)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconWidget(
                                              iconWidth: 34.w,
                                              icon: Assets
                                                  .commonUiCommonIconCurrency02),
                                          16.hGap,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text.rich(TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "${controller.rankInfo!.myRank.chip ?? 0}",
                                                    style: 24.w7(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldBold,
                                                    )),
                                                TextSpan(
                                                    text:
                                                        "/${controller.getBetRewardRank().format()}",
                                                    style: 16.w5(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
                                                    )),
                                              ])),
                                              6.vGap,
                                              Text(
                                                "WIN ${controller.getBetRewardRank().format()} JETTON RANK",
                                                style: 10.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fRobotoRegular,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      IconWidget(
                                        iconWidth: 7.w,
                                        icon: Assets
                                            .commonUiCommonIconSystemJumpto,
                                        iconColor: AppColors.c000000,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            if (controller.inTheRankList.value) {
                              return const SizedBox.shrink();
                            }
                            var item = controller.rankInfo!.myRank;
                            return Container(
                              color: AppColors.cFFFFFF,
                              child: Container(
                                height: 78.w,
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
                                          "${item.rank}",
                                          style: 19.w5(
                                            color: AppColors.c1A1A1A,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                          ),
                                        ))),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.w),
                                      child: ImageWidget(
                                        url: Utils.getAvaterUrl(item.teamLogo),
                                        width: 40.w,
                                        height: 40.w,
                                        imageFailedPath: Assets.iconUiDefault05,
                                      ),
                                    ),
                                    10.hGap,
                                    Expanded(
                                        child: Text(
                                      "${item.teamName}",
                                      style: 14.w5(
                                        color: AppColors.cFF7954,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium,
                                      ),
                                    )),
                                    Row(
                                      children: [
                                        IconWidget(
                                          iconWidth: 16.w,
                                          icon: Assets
                                              .commonUiCommonIconCurrency02,
                                        ),
                                        3.hGap,
                                        Text(
                                          "+${item.chip}",
                                          style: 14.w5(
                                            color: AppColors.c1A1A1A,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoMedium,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))
                ],
              );
            })),
          );
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
}
