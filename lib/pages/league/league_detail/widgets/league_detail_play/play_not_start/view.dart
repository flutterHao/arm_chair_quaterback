import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/play_not_start/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/play_not_start/widget/play_not_start_player_detail.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/22/16:21
class PlayNotStartPage extends StatefulWidget {
  const PlayNotStartPage(this.item, {super.key});

  final ScoresEntity item;

  @override
  State<PlayNotStartPage> createState() => _PlayNotStartPageState();
}

class _PlayNotStartPageState extends State<PlayNotStartPage>
    with AutomaticKeepAliveClientMixin {
  final _isExpanded = false.obs;

  var scrollController = ScrollController();

  late PlayNotStartController controller;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(PlayNotStartController(widget.item));
    return GetBuilder<PlayNotStartController>(builder: (_) {
      if (controller.scoresNotStartGameEntity == null) {
        return Obx(() {
          return Center(
            child: LoadStatusWidget(
              loadDataStatus: controller.loadStatus.value,
            ),
          );
        });
      }
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 9.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  color: AppColors.cFFFFFF),
              child: _buildTeamStatsWidget(context),
            ),
            Container(
              height: 333.w,
              margin: EdgeInsets.only(top: 9.w),
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Column(
                children: [
                  16.vGap,
                  SizedBox(
                    height: 40.w,
                    child: TabBar(
                        controller: controller.teamL5GameTabController,
                        indicatorColor: AppColors.cFF7954,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: AppColors.cD1D1D1,
                        overlayColor: null,
                        labelStyle: 16.w5(
                            height: 1, fontFamily: FontFamily.fOswaldMedium),
                        labelColor: AppColors.c000000,
                        unselectedLabelStyle: 16.w5(
                            height: 1, fontFamily: FontFamily.fOswaldMedium),
                        unselectedLabelColor: AppColors.cB2B2B2,
                        tabs: [
                          Row(
                            children: [
                              ImageWidget(
                                url: Utils.getTeamUrl(
                                    controller.item.homeTeamId),
                                width: 28.w,
                              ),
                              7.hGap,
                              Text(
                                Utils.getTeamInfo(controller.item.homeTeamId)
                                    .shortEname,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                Utils.getTeamInfo(controller.item.awayTeamId)
                                    .shortEname,
                              ),
                              7.hGap,
                              ImageWidget(
                                url: Utils.getTeamUrl(
                                    controller.item.awayTeamId),
                                width: 28.w,
                              ),
                            ],
                          )
                        ]),
                  ),
                  18.vGap,
                  Expanded(
                    child: ExtendedTabBarView(
                        controller: controller.teamL5GameTabController,
                        children: [
                          _buildL5GamePageWidget(
                              context,
                              controller
                                      .scoresNotStartGameEntity!.teamHistoryMap[
                                  controller.item.homeTeamId.toString()],
                              controller.item.homeTeamId),
                          _buildL5GamePageWidget(
                              context,
                              controller
                                      .scoresNotStartGameEntity!.teamHistoryMap[
                                  controller.item.awayTeamId.toString()],
                              controller.item.awayTeamId),
                        ]),
                  ),
                  21.vGap,
                ],
              ),
            ),
            Container(
              height:
                  getTeamPlayerMaxLength() * 34.w + 29.w + 20.w + 40.w + 20.w,
              padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
              margin: EdgeInsets.only(top: 9.w),
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(9.w)),
              child: PlayNotStartPlayerDetail(
                  controller.scoresNotStartGameEntity!.teamPlayerMap,
                  controller.item),
            ),
            9.vGap
          ],
        ),
      );
    });
  }

  int getTeamPlayerMaxLength() {
    var teamPlayerMap = controller.scoresNotStartGameEntity!.teamPlayerMap;
    var keys = teamPlayerMap.keys;
    var len = 0;
    for (int i = 0; i < keys.length; i++) {
      var key = keys.toList()[i];
      var list = teamPlayerMap[key]!;
      len = max(len, list.length);
    }
    return len;
  }

  MediaQuery _buildL5GamePageWidget(
      BuildContext context, List<GameSchedulesInfo>? historyMap, int homeId) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: (historyMap ?? []).length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = historyMap![index];
              var isHome = homeId == item.homeTeamId;
              int leftId = isHome ? item.homeTeamId : item.awayTeamId;
              int rightId = isHome ? item.awayTeamId : item.homeTeamId;
              int leftScore = isHome ? item.homeTeamScore : item.awayTeamScore;
              int rightScore = isHome ? item.awayTeamScore : item.homeTeamScore;
              return Container(
                height: 46.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        isHome ? "HOME" : "AWAY",
                        style: 10.w4(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ImageWidget(
                          url: Utils.getTeamUrl(leftId),
                          width: 25.w,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        leftScore.toString(),
                        style: 21.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          MyDateUtils.formatDate(
                              MyDateUtils.getDateTimeByMs(item.gameStartTime),
                              format: DateFormats.DOT_Y_M_D),
                          style: 10.w4(
                              color: AppColors.c4D4D4D,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ImageWidget(
                        url: Utils.getTeamUrl(rightId),
                        width: 25.w,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        rightScore.toString(),
                        style: 21.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        isHome ? "AWAY" : "HOME",
                        style: 10.w4(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  Container _buildTeamStatsWidget(BuildContext context) {
    var leftItem = controller.scoresNotStartGameEntity!.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == controller.item.homeTeamId);
    var rightItem = controller.scoresNotStartGameEntity!.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == controller.item.awayTeamId);
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          25.vGap,
          Container(
            height: 28.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: TLBuildWidget(
                controller: controller.teamPropertyTabController,
                builder: (int current, int next, double progress,
                    double totalProgress) {
                  return Row(
                    children: controller.tabPropertyTitles.map((e) {
                      int index = controller.tabPropertyTitles.indexOf(e);
                      Color bgColor = index == current
                          ? Color.lerp(
                              AppColors.c000000, AppColors.cFFFFFF, progress)!
                          : index == next
                              ? Color.lerp(AppColors.cFFFFFF, AppColors.c000000,
                                  progress)!
                              : AppColors.cFFFFFF;
                      Color color = index == current
                          ? Color.lerp(
                              AppColors.cFFFFFF, AppColors.c000000, progress)!
                          : index == next
                              ? Color.lerp(AppColors.c000000, AppColors.cFFFFFF,
                                  progress)!
                              : AppColors.c000000;
                      return Expanded(
                        child: MtInkwell(
                          onTap: () {
                            if (controller.teamPropertyTabController.index !=
                                index) {
                              controller.teamPropertyTabController
                                  .animateTo(index);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? 0 : 2.5.w,
                                right: index == 0 ? 2.5.w : 0),
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(14.w),
                                border: Border.all(
                                    color: AppColors.c000000, width: 1)),
                            child: Center(
                              child: Text(
                                e,
                                style: 16.w5(
                                    color: color,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
          ),
          17.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 29.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageWidget(
                      url: Utils.getTeamUrl(controller.item.homeTeamId),
                      width: 28.w,
                    ),
                    7.hGap,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.getTeamInfo(controller.item.homeTeamId)
                              .shortEname,
                          style: 16.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1),
                        ),
                        3.vGap,
                        Text(
                          "${leftItem?.conference} ${leftItem == null ? "" : Utils.getSortWithInt(leftItem.division)}",
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Utils.getTeamInfo(controller.item.awayTeamId)
                              .shortEname,
                          style: 16.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1),
                        ),
                        3.vGap,
                        Text(
                          "${rightItem?.conference} ${rightItem == null ? "" : Utils.getSortWithInt(rightItem.division)}",
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )
                      ],
                    ),
                    7.hGap,
                    ImageWidget(
                      url: Utils.getTeamUrl(controller.item.awayTeamId),
                      width: 28.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          9.vGap,
          const Divider(
            color: AppColors.cD1D1D1,
            height: 1,
          ),
          SizedBox(
            height: 360.w,
            child: ExtendedTabBarView(
                controller: controller.teamPropertyTabController,
                children: [
                  _buildDataPageWidget(),
                  _buildHistoryPageWidget(context),
                ]),
          )
        ],
      ),
    );
  }

  MediaQuery _buildHistoryPageWidget(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              controller.scoresNotStartGameEntity!.nbaGameSchedules.length,
          itemBuilder: (context, index) {
            var gameSchedule =
                controller.scoresNotStartGameEntity!.nbaGameSchedules[index];
            return Container(
              height: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${gameSchedule.homeTeamScore}",
                    style: 21.w5(
                        color: AppColors.cB2B2B2,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  Text(
                    MyDateUtils.formatDate(
                        MyDateUtils.getDateTimeByMs(gameSchedule.gameStartTime),
                        format: DateFormats.DOT_Y_M_D),
                    style: 10.w4(
                        color: AppColors.c4D4D4D,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                  Text(
                    "${gameSchedule.awayTeamScore}",
                    style: 21.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  )
                ],
              ),
            );
          }),
    );
  }

  Column _buildDataPageWidget() {
    var teamStatsData = controller.getTeamStatsData();
    var expansionList =
        teamStatsData.length > 4 ? teamStatsData.sublist(4) : [];
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ...List.generate(min(5, teamStatsData.length), (index) {
                  var item = teamStatsData[index];
                  return _teamStatsItemWidget(item);
                }),
                if (teamStatsData.length > 5)
                  Obx(() {
                    return AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: const SizedBox.shrink(),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: expansionList
                            .map((e) => _teamStatsItemWidget(e))
                            .toList(),
                      ),
                      crossFadeState: _isExpanded.value
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    );
                  }),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _isExpanded.value = !_isExpanded.value;
            Future.delayed(const Duration(milliseconds: 100), () {
              scrollController.animateTo(
                  scrollController.position.pixels + 60.w * 5,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            });
          },
          child: Container(
            height: 60.w,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UNFOLD",
                  style: 16.w7(
                      color: AppColors.c262626,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
                4.vGap,
                Obx(() {
                  return IconWidget(
                    iconWidth: 9.w,
                    icon: Assets.commonUiCommonIconSystemJumpto,
                    iconColor: AppColors.c000000,
                    rotateAngle: _isExpanded.value ? -90 : 90,
                  );
                })
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _teamStatsItemWidget(TeamStats item) {
    return Container(
      height: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
      child: Row(
        children: [
          Container(
              width: 38.w,
              alignment: Alignment.centerRight,
              child: Text(
                (item.leftValue * (item.valueIsPercent ? 100 : 1)).format(),
                style: 16.w4(
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fOswaldRegular),
              )),
          6.hGap,
          Expanded(
            child: Container(
              height: 12.w,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cD1D1D1, width: 1),
                  borderRadius: BorderRadius.circular(6.w)),
              child: Transform.rotate(
                angle: pi / 180 * 180,
                child: LinearProgressIndicator(
                  color: item.getLeftColor,
                  value: item.getLeftPercent.toDouble(),
                  borderRadius: BorderRadius.circular(6.w),
                  backgroundColor: AppColors.cTransparent,
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              width: 57.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Center(
                  child: Text(
                item.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: 10.w4(
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fRobotoRegular),
              )),
            ),
          ),
          Expanded(
            child: Container(
              height: 12.w,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cD1D1D1, width: 1),
                  borderRadius: BorderRadius.circular(6.w)),
              child: LinearProgressIndicator(
                color: item.getRightColor,
                value: item.getRightPercent.toDouble(),
                borderRadius: BorderRadius.circular(6.w),
                backgroundColor: AppColors.cTransparent,
              ),
            ),
          ),
          6.hGap,
          SizedBox(
              width: 38.w,
              child: Text(
                (item.rightValue * (item.valueIsPercent ? 100 : 1)).format(),
                style: 16.w4(
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fOswaldRegular),
              )),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
