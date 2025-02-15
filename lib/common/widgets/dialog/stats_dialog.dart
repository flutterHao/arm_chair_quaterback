/*
 * @Description: 球队、球员排行底部弹窗
 * @Author: lihonghao
 * @Date: 2024-12-27 14:44:25
 * @LastEditTime: 2025-01-07 15:58:15
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_stats_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerStatsDialog extends StatefulWidget {
  const PlayerStatsDialog(
      {super.key,
      required this.title,
      required this.currentIdex,
      required this.types,
      required this.originList,
      required this.onTabChange});
  // final MapEntry<String, Map<String, dynamic>> item;
  final String title;
  final int currentIdex;
  final List<String> types;
  final List<StatsEntity> originList;
  final Function onTabChange;

  @override
  State<PlayerStatsDialog> createState() => _PlayerStatsDialogState();
}

class _PlayerStatsDialogState extends State<PlayerStatsDialog>
    with TickerProviderStateMixin {
  // final controller = Get.find<RankController>();
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    // List<double>widths=[219.w,];
    // int current = widget.item.value["current"];
    // List<String> types = widget.item.value["list"];

    tabController = TabController(
        length: widget.types.length,
        vsync: this,
        initialIndex: widget.currentIdex);
    tabController.addListener(() {
      widget.onTabChange(tabController.index);
      // widget.item.value["current"] = tabController.index;
      // controller.update(["starsRank"]);
    });

    return VerticalDragBackWidget(
      child: SimpleBottomDialog(
          height: 469.w,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.vGap,
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    style: 21
                        .w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                  ),
                ),
                24.vGap,
                Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(left: 16.w),
                  width: MediaQuery.of(context).size.width,
                  child: TLBuildWidget(
                      controller: tabController,
                      builder: (current, next, progress, totalProgress) {
                        return Row(
                          children: List.generate(
                              tabController.length,
                              (index) => InkWell(
                                  onTap: () => tabController.animateTo(index),
                                  child: Container(
                                    width: 61.5.w,
                                    height: 28.w,
                                    margin: EdgeInsets.only(right: 9.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: current == index
                                            ? Color.lerp(AppColors.c262626,
                                                AppColors.cFFFFFF, progress)!
                                            : next == index
                                                ? Color.lerp(
                                                    AppColors.cFFFFFF,
                                                    AppColors.c262626,
                                                    progress)!
                                                : AppColors.cFFFFFF,
                                        borderRadius:
                                            BorderRadius.circular(14.w)),
                                    child: Center(
                                        child: Text(
                                            Utils.getStatsPlayerRankKey(widget
                                                    .types[index]
                                                    .split("_")
                                                    .first)
                                                .tr,
                                            style: 13.w4(
                                              fontFamily: current == index
                                                  ? FontFamily.fOswaldMedium
                                                  : FontFamily.fOswaldRegular,
                                              color: current == index
                                                  ? Color.lerp(
                                                      AppColors.cF2F2F2,
                                                      AppColors.c262626,
                                                      progress)!
                                                  : next == index
                                                      ? Color.lerp(
                                                          AppColors.c262626,
                                                          AppColors.cF2F2F2,
                                                          progress)!
                                                      : AppColors.c262626,
                                            ))),
                                  ))),
                        );
                      }),
                ),
                10.vGap,
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: widget.types.map(
                          (e) {
                            List currentType = e.split("_");
                            String rankType = currentType.first;
                            var list =
                                getStatRankList(rankType, widget.originList);
                            return Column(
                              children: [
                                Container(
                                  height: 34.w,
                                  decoration: const BoxDecoration(
                                      border: Border.symmetric(
                                          horizontal: BorderSide(
                                              color: AppColors.cD1D1D1))),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 219.w,
                                        padding: EdgeInsets.only(left: 40.w),
                                        child: Text(
                                          LangKey.newsButtonTeam.tr,
                                          style: 12.w4(
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                            height: 0.8,
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        color: AppColors.cE6E6E,
                                        width: 1,
                                      ),
                                      if (currentType.isNotEmpty)
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              currentType.first,
                                              style: 12.w4(
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                  height: 0.8),
                                            ),
                                          ),
                                        ),
                                      if (currentType.length > 1)
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              currentType[1],
                                              style: 12.w4(
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                  height: 0.8),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        var item = list[index];
                                        return SizedBox(
                                          height: 33.w,
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      RouteNames
                                                          .picksPlayerDetail,
                                                      arguments:
                                                          PlayerDetailPageArguments(
                                                              item.playerId));
                                                },
                                                child: Container(
                                                  width: 219.w,
                                                  padding: EdgeInsets.only(
                                                      left: 18.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${index + 1}",
                                                        style: 12.w4(
                                                          fontFamily: FontFamily
                                                              .fOswaldRegular,
                                                          color:
                                                              AppColors.cB3B3B3,
                                                          height: 0.8,
                                                        ),
                                                      ),
                                                      16.5.hGap,
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                                width: 1.w,
                                                                color: AppColors
                                                                    .c666666,
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            // Utils.getPlayBaseInfo(
                                                            //         item.playerId!)
                                                            //     .ename,
                                                            item.playerName,
                                                            style: 12.w4(
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular,
                                                                height: 1),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const VerticalDivider(
                                                color: AppColors.cE6E6E,
                                                width: 1,
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    getRankValue(
                                                        currentType.first,
                                                        item),
                                                    style: 12.w4(
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular,
                                                        color:
                                                            AppColors.c4D4D4D,
                                                        height: 0.8),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    getRankValue(currentType[1],
                                                            item)
                                                        .toString(),
                                                    style: 12.w4(
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular,
                                                        color:
                                                            AppColors.c4D4D4D,
                                                        height: 0.8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            height: 1,
                                            color: AppColors.cE6E6E,
                                          ),
                                      itemCount: list.length > 100
                                          ? 100
                                          : list.length),
                                ),
                              ],
                            );
                          },
                        ).toList()))
              ],
            ),
          )),
    );
  }
}

// class PlayerStatsDialog extends GetView<RankController> with SingleTickerProviderStateMixin{
//   const PlayerStatsDialog(this.item, {super.key});
//   final MapEntry<String, Map<String, dynamic>> item;
//   // final List<NabPlayerSeasonGameRankEntity> list;
//   // final String title;
//   // final String type1; //场均
//   // final String type2; //总

// }

class TeamStatsDialog extends StatelessWidget {
  const TeamStatsDialog(this.list, this.title, this.type1, this.type2,
      {super.key});
  final List<StatsEntity> list;
  final String title;
  final String type1; //场均
  final String type2; //总

  @override
  Widget build(BuildContext context) {
    // List<double>widths=[219.w,];
    return VerticalDragBackWidget(
      child: SimpleBottomDialog(
          height: 469.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.vGap,
              Container(
                margin: EdgeInsets.only(left: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style:
                      21.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                ),
              ),
              16.vGap,
              Container(
                height: 34.w,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: AppColors.cD1D1D1))),
                child: Row(
                  children: [
                    Container(
                      width: 219.w,
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text(
                        LangKey.newsButtonTeam.tr,
                        style: 12.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.8,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: AppColors.cE6E6E,
                      width: 1,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          type1,
                          style: 12.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 0.8),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          type2,
                          style: 12.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var item = list[index];
                        return SizedBox(
                          height: 33.w,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(RouteNames.teamDetailPage,
                                      preventDuplicates: false,
                                      arguments: item.teamId);
                                },
                                child: Container(
                                  width: 219.w,
                                  padding: EdgeInsets.only(left: 18.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${index + 1}",
                                        style: 12.w4(
                                          fontFamily: FontFamily.fOswaldRegular,
                                          color: AppColors.cB3B3B3,
                                          height: 0.8,
                                        ),
                                      ),
                                      16.5.hGap,
                                      Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1.w,
                                                color: AppColors.c666666,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            item.teamName,
                                            style: 12.w4(
                                                fontFamily:
                                                    FontFamily.fRobotoRegular,
                                                height: 1),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: AppColors.cE6E6E,
                                width: 1,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    getRankValue(type1, item).toString(),
                                    style: 12.w4(
                                        fontFamily: FontFamily.fRobotoRegular,
                                        color: AppColors.c4D4D4D,
                                        height: 0.8),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    getRankValue(type2, item).toString(),
                                    style: 12.w4(
                                        fontFamily: FontFamily.fRobotoRegular,
                                        color: AppColors.c4D4D4D,
                                        height: 0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 1,
                            color: AppColors.cE6E6E,
                          ),
                      itemCount: list.length))
            ],
          )),
    );
  }
}

List<StatsEntity> getStatRankList(String type, List<StatsEntity> originList) {
  List<StatsEntity> list = List.from(originList);
  switch (type) {
    case "PPG": //场均PTS
      list.sort((a, b) => b.pTS.compareTo(a.pTS));
    case "PTS":
      list.sort((a, b) => b.totalPts.compareTo(a.totalPts));
    case "FGM":
      list.sort((a, b) => b.fGM.compareTo(a.fGM));
    case "FGA":
      list.sort((a, b) => b.fGA.compareTo(a.fGA));
    case "3PM":
      list.sort((a, b) => b.threePM.compareTo(a.threePM));
    case "3PA":
      list.sort((a, b) => b.threePA.compareTo(a.threePA));
    case "FTM":
      list.sort((a, b) => b.fTM.compareTo(a.fTM));
    case "FTA":
      list.sort((a, b) => b.fTA.compareTo(a.fTA));
    case "FG%":
      list.sort((a, b) => b.fgPct.compareTo(a.fgPct));
    case "3P%":
      list.sort((a, b) => b.fg3Pct.compareTo(a.fg3Pct));
    case "FT%":
      list.sort((a, b) => b.ftPct.compareTo(a.ftPct));
    case "APG": //场均AST
      list.sort((a, b) => b.aST.compareTo(a.aST));
    case "AST":
      list.sort((a, b) => b.totalAst.compareTo(a.totalAst));
    case "TPG": //场均TO
      list.sort((a, b) => b.tOV.compareTo(a.tOV));
    case "TO":
      list.sort((a, b) => b.totalTov.compareTo(a.totalTov));
    case "RPG":
      list.sort((a, b) => b.totalReb.compareTo(a.totalReb));
    case "REB": //场均RPG
      list.sort((a, b) => b.rEB.compareTo(a.rEB));
    case "BPG": //场均blk
      list.sort((a, b) => b.bLK.compareTo(a.bLK));
    case "BLK":
      list.sort((a, b) => b.totalBlk.compareTo(a.totalBlk));
    case "GP":
      list.sort((a, b) => b.gp.compareTo(a.gp));
    default:
  }
  return list;
}

String getRankValue(String type, StatsEntity item) {
  double value = 0;
  switch (type) {
    case "PPG": //场均PTS
      value = item.pTS;
    case "PTS":
      value = item.totalPts;
    case "FGM":
      value = item.fGM;
    case "FGA":
      value = item.fGA;
    case "3PM":
      value = item.threePM;
    case "3PA":
      value = item.fGA;
    case "FTM":
      value = item.fTM;
    case "FTA":
      value = item.fTA;
    case "FG%":
      value = item.fgPct * 100;
    case "3P%":
      value = item.fg3Pct * 100;
    case "FT%":
      value = item.ftPct * 100;
    case "APG": //场均AST
      value = item.aST;
    case "AST":
      value = item.totalAst;
    case "TPG": //场均TO
      value = item.tOV;
    case "TO":
      value = item.totalTov;
    case "RPG":
      value = item.rEB;
    case "REB": //场均RPG
      value = item.totalReb;
    case "BPG": //场均blk
      value = item.bLK;
    case "BLK":
      value = item.totalBlk;
    case "GP":
      value = item.gp;
    case "MIN":
      value = item.min;
    default:
      value = 0.0;
  }
  return Utils.formatToThreeSignificantDigits(value);
}
