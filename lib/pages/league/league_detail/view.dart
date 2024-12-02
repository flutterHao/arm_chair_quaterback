import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/place_holder_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_picks/view.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/play_not_start/view.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/view.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LeagueDetailPage extends GetView<LeagueDetailController> {
  const LeagueDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LeagueDetailController(Get.arguments["item"],
        gameId: Get.arguments["gameId"]));
    return HorizontalDragBackWidget(
      hasScrollChild: true,
      responseDepth: const [1,3],
      child: GetBuilder<LeagueDetailController>(
        id: LeagueDetailController.idLeagueDetailTabBarViw,
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
                child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverPersistentHeader(
                      floating: true,
                      delegate: FixedHeightSliverHeaderDelegate(
                          child: Container(
                            color: AppColors.cFFFFFF,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                            child: SizedBox.shrink()),
                                        Column(
                                          children: [
                                            PlaceHolderWidget(
                                              width: 34.w,
                                              borderRadius:
                                                  BorderRadius.circular(17.w),
                                              showChild:
                                                  controller.item?.homeTeamId !=
                                                      null,
                                              child: ImageWidget(
                                                url: Utils.getTeamUrl(controller
                                                    .item?.homeTeamId),
                                                width: 34.w,
                                              ),
                                            ),
                                            2.vGap,
                                            PlaceHolderWidget(
                                              width: 20,
                                              height: 10,
                                              showChild:
                                                  controller.item != null,
                                              child: Text(
                                                "${controller.item?.homeTeamWL}",
                                                style: 10.w4(
                                                    color: AppColors.c000000,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoRegular),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: 34.w,
                                          child: Row(
                                            children: [
                                              11.hGap,
                                              PlaceHolderWidget(
                                                width: 30,
                                                height: 24,
                                                showChild:
                                                    controller.item != null,
                                                child: Text(
                                                  "${controller.item?.homeTeamScore}",
                                                  style: 24.w7(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldBold),
                                                ),
                                              ),
                                              14.hGap,
                                              Obx(() {
                                                return PlaceHolderWidget(
                                                  width: 50,
                                                  height: 12,
                                                  showChild:
                                                      controller.item != null,
                                                  child: Text(
                                                    controller
                                                        .gameStartTimeStr.value,
                                                    style: 12.w4(
                                                        color: controller.item
                                                                    ?.status ==
                                                                1
                                                            ? AppColors.c10A86A
                                                            : AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  ),
                                                );
                                              }),
                                              14.hGap,
                                              PlaceHolderWidget(
                                                width: 30,
                                                height: 24,
                                                showChild:
                                                    controller.item != null,
                                                child: Text(
                                                  "${controller.item?.awayTeamScore}",
                                                  style: 24.w7(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldBold),
                                                ),
                                              ),
                                              11.hGap,
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            PlaceHolderWidget(
                                              width: 34.w,
                                              showChild:
                                                  controller.item != null,
                                              borderRadius:
                                                  BorderRadius.circular(17.w),
                                              child: ImageWidget(
                                                url: Utils.getTeamUrl(controller
                                                    .item?.awayTeamId),
                                                width: 34.w,
                                              ),
                                            ),
                                            2.vGap,
                                            PlaceHolderWidget(
                                              width: 20,
                                              height: 10,
                                              showChild:
                                                  controller.item != null,
                                              child: Text(
                                                "${controller.item?.awayTeamWL}",
                                                style: 10.w4(
                                                    color: AppColors.c000000,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoRegular),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Expanded(
                                            child: SizedBox.shrink()),
                                      ],
                                    )
                                  ],
                                ),
                                Positioned(
                                    top: 14.w,
                                    right: 10.w,
                                    child: Container(
                                      width: 24.w,
                                      height: 24.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.w),
                                          border: Border.all(
                                              color: AppColors.c666666,
                                              width: 1)),
                                      child: IconWidget(
                                        iconWidth: 15.w,
                                        icon: Assets
                                            .commonUiCommonIconSystemShare,
                                        iconColor: AppColors.c262626,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          height: 67.w)),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: FixedHeightSliverHeaderDelegate(
                          child: Container(
                            color: AppColors.cFFFFFF,
                            child: TabBar(
                                controller: controller.tabController,
                                labelStyle: 16.w5(
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                                labelColor: AppColors.c000000,
                                unselectedLabelStyle: 16.w5(
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldRegular),
                                unselectedLabelColor: AppColors.cB3B3B3,
                                dividerHeight: 1,
                                dividerColor: AppColors.cD1D1D1,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                      color: AppColors.cFF7954, width: 3.w),
                                ),
                                tabs: controller.tabTitles
                                    .map((e) => Text(
                                          e,
                                        ))
                                    .toList()),
                          ),
                          height: 34.w))
                ];
              },
              body: controller.item == null
                  ? Obx(() {
                      return Center(
                        child: LoadStatusWidget(
                          loadDataStatus: controller.loadStatus.value,
                        ),
                      );
                    })
                  : ExtendedTabBarView(
                      controller: controller.tabController,
                      cacheExtent: 2,
                      shouldIgnorePointerWhenScrolling: false,
                      children: [
                          LeagueDetailPicksPage(controller.item!),
                          controller.isGameStart
                              ? LeagueDetailPlayPage(controller.item!)
                              : PlayNotStartPage(controller.item!),
                        ]),
            )),
          );
        },
      ),
    );
  }
}
