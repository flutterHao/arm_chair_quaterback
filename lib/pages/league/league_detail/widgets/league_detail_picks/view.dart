import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class LeagueDetailPicksPage extends StatefulWidget {
  const LeagueDetailPicksPage(this.item, {super.key});

  final ScoresEntity item;

  @override
  State<LeagueDetailPicksPage> createState() => _LeagueDetailPicksPageState();
}

class _LeagueDetailPicksPageState extends State<LeagueDetailPicksPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _LeagueDetailPicksViewGetX(widget.item);
  }
}

class _LeagueDetailPicksViewGetX extends GetView<LeagueDetailPicksController> {
  const _LeagueDetailPicksViewGetX(this.item, {super.key});

  final ScoresEntity item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueDetailPicksController>(
      init: LeagueDetailPicksController(item),
      id: LeagueDetailPicksController.idLeagueDetailPicks,
      builder: (_) {
        return controller.leagueDetailPicks == null ||
                (controller.leagueDetailPicks?.guessDataInfo.isEmpty == true &&
                    controller.leagueDetailPicks?.scheduleData.isEmpty == true)
            ? Obx(() {
                return Center(
                  child: LoadStatusWidget(
                    loadDataStatus: controller.loadStatus.value,
                  ),
                );
              })
            : Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      9.vGap,
                      ScoreItemWidget(gameGuess: controller.getGameGuess()),
                      9.vGap,
                      if (controller.getPlayerV2().isNotEmpty && controller.getPlayerMaxLength() != 0) ...[
                        Container(
                          height: 58.w +
                              250.w * controller.getPlayerMaxLength(),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(9.w)),
                          child: Column(
                            children: [
                              Container(
                                height: 58.w,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.cD1D1D1,
                                            width: 1.w))),
                                child: TLBuildWidget(
                                    controller: controller.tabController!,
                                    builder: (int current,
                                        int next,
                                        double progress,
                                        double totalProgress) {
                                      return SingleChildScrollView(
                                        controller:
                                            controller.scrollController,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children:
                                              controller.getTabs().map((e) {
                                            int index = controller
                                                .getTabs()
                                                .indexOf(e);
                                            Color bgColor = index == current
                                                ? Color.lerp(
                                                    AppColors.c000000,
                                                    AppColors.cFFFFFF,
                                                    progress)!
                                                : index == next
                                                    ? Color.lerp(
                                                        AppColors.cFFFFFF,
                                                        AppColors.c000000,
                                                        progress)!
                                                    : AppColors.cFFFFFF;
                                            Color color = index == current
                                                ? Color.lerp(
                                                    AppColors.cFFFFFF,
                                                    AppColors.c000000,
                                                    progress)!
                                                : index == next
                                                    ? Color.lerp(
                                                        AppColors.c000000,
                                                        AppColors.cFFFFFF,
                                                        progress)!
                                                    : AppColors.c000000;
                                            return MtInkwell(
                                              onTap: () {
                                                if (controller
                                                        .tabController!
                                                        .index !=
                                                    index) {
                                                  controller.tabController!
                                                      .animateTo(index);
                                                }
                                              },
                                              child: Container(
                                                height: 28.w,
                                                width: 108.w,
                                                margin: EdgeInsets.only(
                                                    left: index == 0
                                                        ? 16.w
                                                        : 0,
                                                    right: 10.w),
                                                decoration: BoxDecoration(
                                                    color: bgColor,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(14.w),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .c666666,
                                                        width: 1)),
                                                child: Center(
                                                  child: Text(
                                                    e,
                                                    style: 16.w4(
                                                        color: color,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: ExtendedTabBarView(
                                    controller: controller.tabController,
                                    children: controller.getTabs().map((e) {
                                      List<PicksPlayerV2> list =
                                          controller.getPlayerV2()[e] ?? [];
                                      return MediaQuery.removePadding(
                                        removeTop: true,
                                        context: context,
                                        child: ListView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: list.map((e) {
                                            var i = list.indexOf(e);
                                            return Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: i ==
                                                                    list.length -
                                                                        1
                                                                ? AppColors
                                                                    .cFFFFFF
                                                                : AppColors
                                                                    .cE6E6E,
                                                            width: 1.w))),
                                                child: GuessItemV2(
                                                  playerV2: e,
                                                  index: i,
                                                ));
                                          }).toList(),
                                        ),
                                      );
                                    }).toList()),
                              )
                            ],
                          ),
                        ),
                        9.vGap
                      ]
                    ],
                  ),
                ),
                Obx(() {
                  return BottomGuessTipWidget(
                    bottomValue: 20.w,
                    needCheckHomeTab: false,
                    widgetReady: controller.isWidgetReady.value,
                  );
                }),
              ],
            );
      },
    );
  }
}
