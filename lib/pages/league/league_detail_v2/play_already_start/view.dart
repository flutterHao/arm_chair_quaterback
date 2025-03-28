import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/routers/pages.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/WidgetUtils.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/game_grid_source.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/widgets/scores_player_detail.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/11/21/11:18

class LeagueDetailPlayPage extends StatefulWidget {
  const LeagueDetailPlayPage(this.item, {super.key, required this.header});

  final ScoresEntity item;
  final Widget header;

  @override
  State<LeagueDetailPlayPage> createState() => _LeagueDetailPlayPageState();
}

class _LeagueDetailPlayPageState extends State<LeagueDetailPlayPage>
    with AutomaticKeepAliveClientMixin {
  final _isExpanded = false.obs;

  late LeagueDetailPlayController controller;
  late LeagueDetailV2Controller leagueDetailV2Controller;

  @override
  void initState() {
    super.initState();
    controller =
        Get.put(LeagueDetailPlayController(widget.item), tag: getTag());
  }

  String getTag() {
    return "${widget.item.gameId}";
  }

  @override
  dispose() {
    Get.delete<LeagueDetailPlayController>(tag: getTag());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueDetailPlayController>(
        tag: getTag(),
        builder: (_) {
          if (controller.nbaGameDetailEntity == null) {
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
              Transform.scale(
                scale: 0.000001,
                child: RepaintBoundary(
                  key: controller.headerKey,
                  child: Container(
                    height: 212.w,
                    color: AppColors.cF2F2F2,
                    child: Column(
                      children: [
                        widget.header,
                        _buildQuarterTableWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: FixedHeightSliverHeaderDelegate(
                          child: Stack(
                            children: [
                              widget.header,
                              Positioned(
                                  top: 14.w,
                                  right: 10.w,
                                  child: ShareWidget(globalKey: controller.headerKey))
                            ],
                          ),
                          height: 81.w)),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          _buildQuarterTableWidget(),
                          _buildGameLeadersWidget(context),
                          _buildTeamStatsWidget(),
                          9.vGap,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );

        });
  }

  Widget _buildTeamStatsWidget() {
    var teamStatsData = controller.getTeamStatsData();
    var expansionList =
        teamStatsData.length > 4 ? teamStatsData.sublist(4) : [];
    print('tttt:$teamStatsData');
    return Stack(
      children: [
        RepaintBoundary(
          key: controller.teamStatsKey,
          child: Container(
            margin: EdgeInsets.only(top: 9.w),
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
            child: Column(
              children: [
                25.vGap,
                Container(
                  margin: EdgeInsets.only(left: 16.w,),
                  child: Row(
                    children: [
                      Text(
                        LangKey.nbaTeamMeanTeamStats.tr,
                        style: 30.w7(
                            color: AppColors.c000000,
                            height: 0.9,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ],
                  ),
                ),
                25.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ImageWidget(
                            url: Utils.getTeamUrl(controller.item.homeTeamId),
                            width: 23.w,
                          ),
                          7.hGap,
                          Text(
                            Utils.getTeamInfo(controller.item.homeTeamId).shortEname,
                            style: 16.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            Utils.getTeamInfo(controller.item.awayTeamId).shortEname,
                            style: 16.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                          7.hGap,
                          ImageWidget(
                            url: Utils.getTeamUrl(controller.item.awayTeamId),
                            width: 23.w,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                10.vGap,
                const Divider(
                  color: AppColors.cD1D1D1,
                  height: 1,
                ),
                ...List.generate(min(4, teamStatsData.length), (index) {
                  var item = teamStatsData[index];
                  return _teamStatsItemWidget(item);
                }),
                if (teamStatsData.length > 4)
                  Column(
                    children: [
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
                      InkWell(
                        onTap: () {
                          _isExpanded.value = !_isExpanded.value;
                          Future.delayed(const Duration(milliseconds: 100), () {
                            PrimaryScrollController.of(context).animateTo(
                                PrimaryScrollController.of(context)
                                    .position
                                    .maxScrollExtent,
                                duration: const Duration(milliseconds: 100),
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
                                LangKey.gameButtonUnfold.tr,
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
                  ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 34.w,
            right: 10.w,
            child: ShareWidget(globalKey: controller.teamStatsKey))
      ],
    );
  }

  Widget _teamStatsItemWidget(TeamStats item) {
    var leftPercent =
        (item.leftValue + 2) / (item.rightValue + item.leftValue + 4) * 100;
    return Container(
      height: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${item.leftValue}",
                style: 16.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              ),
              Text(
                item.name,
                style: 10.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular),
              ),
              Text(
                "${item.rightValue}",
                style: 16.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              )
            ],
          ),
          3.5.vGap,
          SupportPercentProgressWidget(
            height: 12.w,
            leftPercent: leftPercent.toInt(),
            leftColor: AppColors.cB3B3B3,
            rightPercent: (100 - leftPercent).toInt(),
            rightColor: AppColors.c000000,
          )
        ],
      ),
    );
  }

  Widget _buildGameLeadersWidget(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          key: controller.gameLeaderKey,
          child: Container(
            margin: EdgeInsets.only(top: 9.w),
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
            child: Column(
              children: [
                25.vGap,
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  child: Row(
                    children: [
                      Text(
                        LangKey.gameTabGameLeader.tr,
                        style: 30.w7(
                            color: AppColors.c000000,
                            height: 0.9,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                      // Container(
                      //   width: 24.w,
                      //   height: 24.w,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(4.w),
                      //       border: Border.all(color: AppColors.c666666, width: 1)),
                      //   child: IconWidget(
                      //     iconWidth: 15.w,
                      //     icon: Assets.commonUiCommonIconSystemShare,
                      //     iconColor: AppColors.c000000,
                      //   ),
                      // )
                    ],
                  ),
                ),
                27.vGap,
                Container(
                  height: 28.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TLBuildWidget(
                      controller: controller.tabController,
                      builder: (int current, int next, double progress,
                          double totalProgress) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: controller.tabTitles.map((e) {
                            int index = controller.tabTitles.indexOf(e);
                            Widget child = MtInkWell(
                              splashColor: AppColors.cTransparent,
                              vibrate: false,
                              onTap: () {
                                if (controller.tabController.index != index) {
                                  controller.tabController.animateTo(index);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.w),
                                    border: Border.all(
                                        color: AppColors.c666666, width: 1),
                                    color: index == current
                                        ? Color.lerp(AppColors.c000000,
                                            AppColors.cFFFFFF, progress)
                                        : index == next
                                            ? Color.lerp(AppColors.cFFFFFF,
                                                AppColors.c000000, progress)
                                            : AppColors.cFFFFFF),
                                child: Text(e.tr,
                                    style: 16.w4(
                                      color: index == current
                                          ? Color.lerp(AppColors.cFFFFFF,
                                              AppColors.c000000, progress)!
                                          : index == next
                                              ? Color.lerp(AppColors.c000000,
                                                  AppColors.cFFFFFF, progress)!
                                              : AppColors.c000000,
                                    )),
                              ),
                            );
                            if (index == 0) {
                              child = Container(
                                margin: EdgeInsets.only(right: 2.5.w),
                                child: child,
                              );
                            } else if (index == 1) {
                              child = Container(
                                margin: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
                                child: child,
                              );
                            } else {
                              child = Container(
                                margin: EdgeInsets.only(left: 2.5.w),
                                child: child,
                              );
                            }
                            return Expanded(child: child);
                          }).toList(),
                        );
                      }),
                ),
                10.vGap,
                const Divider(
                  color: AppColors.cD1D1D1,
                  height: 1,
                ),
                SizedBox(
                  height: 314.w,
                  child: ExtendedTabBarView(
                      controller: controller.tabController,
                      children: controller.tabTitles.map((e) {
                        var index = controller.tabTitles.indexOf(e);
                        String tab = index == 0
                            ? "pts"
                            : index == 1
                                ? "reb"
                                : "ast";
                        List<NbaGameDetailGameDataPlayerScores> list =
                            controller.getTwoMaxByTab(tab);
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              if (list.isEmpty)
                                SizedBox(
                                  height: 132.w * 2,
                                  child: const Center(
                                    child: LoadStatusWidget(
                                      loadDataStatus: LoadDataStatus.noData,
                                    ),
                                  ),
                                )
                              else
                                ...List.generate(list.length, (i) {
                                  var item = list[i];
                                  var playBaseInfo =
                                      Utils.getPlayBaseInfo(item.playerId);
                                  var teamInfo =
                                      Utils.getTeamInfo(playBaseInfo.teamId);
                                  List<Widget> child;
                                  List<Map<String, String>> values = [];
                                  if (index == 0) {
                                    values.addAll([
                                      {"PTS": "${item.pts}"},
                                      {"FG": "${item.fgm}/${item.fga}"},
                                      {"FT": "${item.ftm}/${item.fta}"}
                                    ]);
                                  } else if (index == 1) {
                                    values.addAll([
                                      {"REB": "${item.reb}"},
                                      {"DERB": "${item.dreb}"},
                                      {"OREB": "${item.oreb}"}
                                    ]);
                                  } else {
                                    values.addAll([
                                      {"AST": "${item.ast}"},
                                      {"TO": "${item.to}"},
                                      {"MIN": "${item.min}"}
                                    ]);
                                  }
                                  return MtInkWell(
                                    minScale: 1,
                                    onTap: () {
                                      Get.toNamed(
                                        RouteNames.picksPlayerDetail,
                                        arguments:
                                            PlayerDetailPageArguments(item.playerId),
                                      );
                                    },
                                    child: Container(
                                      height: 132.w,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: AppColors.cE6E6E,
                                                  width: 1))),
                                      child: Row(
                                        children: [
                                          13.hGap,
                                          Stack(
                                            children: [
                                              PlayerAvatarWidget(
                                                width: 73.w,
                                                height: 93.w,
                                                radius: 9.w,
                                                playerId: item.playerId,
                                                backgroundColor: AppColors.cD9D9D9,
                                              ),
                                              Positioned(
                                                  top: 4.w,
                                                  right: 4.w,
                                                  child: Container(
                                                    height: 16.w,
                                                    width: 16.w,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.cFFFFFF,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.w)),
                                                    child: IconWidget(
                                                      iconWidth: 9.w,
                                                      icon: Assets.iconUiIconRead,
                                                      iconColor: AppColors.c000000,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          13.hGap,
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                playBaseInfo.ename,
                                                style: 21.w5(
                                                    color: AppColors.c262626,
                                                    height: 1,
                                                    fontFamily:
                                                        FontFamily.fOswaldMedium),
                                              ),
                                              7.vGap,
                                              Text(
                                                "${playBaseInfo.position} · ${teamInfo.shortEname}",
                                                style: 12.w4(
                                                    color: AppColors.c000000,
                                                    height: 1,
                                                    fontFamily:
                                                        FontFamily.fRobotoRegular),
                                              ),
                                              16.vGap,
                                              Row(
                                                children: values
                                                    .map((e) => Container(
                                                          margin: EdgeInsets.only(
                                                              right: 25.w),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                e.values.first,
                                                                style: 14.w5(
                                                                    color: AppColors
                                                                        .c000000,
                                                                    height: 1,
                                                                    fontFamily: FontFamily
                                                                        .fRobotoMedium),
                                                              ),
                                                              5.vGap,
                                                              Text(
                                                                e.keys.first,
                                                                style: 10.w4(
                                                                    color: AppColors
                                                                        .c4D4D4D,
                                                                    height: 1,
                                                                    fontFamily: FontFamily
                                                                        .fRobotoRegular),
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                    .toList(),
                                              )
                                            ],
                                          )),
                                          IconWidget(
                                            iconWidth: 8.w,
                                            icon:
                                                Assets.commonUiCommonIconSystemJumpto,
                                            iconColor: AppColors.c000000,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              Expanded(
                                child: MtInkWell(
                                  onTap: () {
                                    if (controller.nbaGameDetailEntity?.gameData ==
                                        null) {
                                      return;
                                    }
                                    BottomTipDialog.showWithSound(
                                        isScrollControlled: true,
                                        context: context,
                                        backgroundColor: AppColors.cTransparent,
                                        builder: (_) {
                                          return SizedBox(
                                            height:
                                                MediaQuery.of(context).size.height,
                                            width: MediaQuery.of(context).size.width,
                                            child: Column(
                                              children: [
                                                WidgetUtils.getDialogTransWidget(
                                                    context),
                                                Container(
                                                  height: Utils.getDialogHeight(),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.cFFFFFF,
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius.circular(
                                                                  9.w))),
                                                  child: Column(
                                                    children: [
                                                      8.vGap,
                                                      Container(
                                                        width: 44.w,
                                                        height: 4.w,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.c000000
                                                                .withOpacity(.2),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    2.w)),
                                                      ),
                                                      24.vGap,
                                                      Expanded(
                                                        child: ScoresPlayerDetail(
                                                            controller
                                                                .nbaGameDetailEntity!
                                                                .gameData),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        LangKey.gameButtonSeeAll.tr,
                                        style: 16.w7(
                                            color: AppColors.c262626,
                                            height: 1,
                                            fontFamily: FontFamily.fOswaldBold),
                                      ),
                                      6.hGap,
                                      IconWidget(
                                        iconWidth: 5.w,
                                        icon: Assets.commonUiCommonIconSystemJumpto,
                                        iconColor: AppColors.c000000,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList()),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 34.w,
            right: 10.w,
            child: ShareWidget(globalKey: controller.gameLeaderKey))
      ],
    );
  }

  Widget _buildQuarterTableWidget() {
    if (controller.nbaGameDetailEntity!.gameData.homeTeamScore == null) {
      return const SizedBox.shrink();
    }
    return Container(
      height: 122.w,
      width: double.infinity,
      margin: EdgeInsets.only(top: 9.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: SfDataGridTheme(
          data: const SfDataGridThemeData(
              gridLineColor: AppColors.cTransparent,
              frozenPaneLineColor: AppColors.cTransparent,
              rowHoverColor: AppColors.c10A86A,
              gridLineStrokeWidth: 0),
          child: SfDataGrid(
            frozenColumnsCount: 1,
            footerFrozenColumnsCount: 1,
            rowHeight: 34.w,
            headerRowHeight: 30.w,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            source: GameGridSource(controller.nbaGameDetailEntity!, controller),
            columns: [
              GridColumn(
                  columnName: 'id',
                  width: 130.w,
                  label: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.cD1D1D1, width: 1))),
                    child: const Text(
                      '',
                    ),
                  )),
              ...controller.getQuarterColumnNames().map((e) {
                return GridColumn(
                    columnName: e,
                    columnWidthMode: ColumnWidthMode.fill,
                    label: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.cD1D1D1, width: 1))),
                      child: Text(
                        e,
                        style: 12.w5(
                            color: AppColors.c4D4D4D,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ));
              }),
              GridColumn(
                  columnName: 'total',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 16.w),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.cD1D1D1, width: 1))),
                    child: Text(
                      'Total',
                      style: 12.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium),
                    ),
                  )),
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
