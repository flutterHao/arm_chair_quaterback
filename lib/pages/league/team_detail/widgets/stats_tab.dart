import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_stats_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/stats_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/rank_card.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({super.key});

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab>
    with AutomaticKeepAliveClientMixin {
  Widget _line({EdgeInsetsGeometry? margin}) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: 1,
      color: AppColors.cD1D1D1,
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Map<String, Map<String, dynamic>> statsPlayerRankMap = {
      "POINTS": {
        "current": 1,
        "list": ["GP_MIN", "PPG_PTS", "FG%_FGM", "3P%_3PM", "FT_FTM"]
      },
      "REBOUNDS": {
        "current": 1,
        "list": ["GP_MIN", "RPG_REB", "DREB_OREB"]
      },
      "ASSISTS": {
        "current": 1,
        "list": ["GP_MIN", "APG_AST", "TPG_TO", "FPG_FOUL"]
      },
    };
    Map<String, String> statsTeamRankMap = {
      "POINTS": "PPG_PTS",
      "REBOUND": "RPG_REB",
      "ASSIST": "APG_AST",
      "FIELD GOLD": "FG%_FGM",
      "THREE POINTS": "3P%_3PM",
      "FREE THROW": "FT%_FTM",
      "TURNOVER": "TPG_TO"
    };
    return GetBuilder<TeamDetailController>(
        tag: Get.arguments.toString(),
        builder: (controller) {
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  9.vGap,
                  if (controller.statPlayerList.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              LangKey.nbaTeamMeanLeader.tr,
                              style: 24.w4(
                                  fontFamily: FontFamily.fOswaldBold,
                                  height: 0.8),
                            ),
                          ),
                          15.vGap,
                          _line(),
                          ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              var item =
                                  statsPlayerRankMap.entries.elementAt(i);
                              int index = item.value["current"];
                              List types = item.value["list"][index].split("_");
                              String rankType = types.first;
                              var list = getStatRankList(
                                  rankType, controller.statPlayerList);
                              StatsEntity first = list.first;
                              var player =
                                  Utils.getPlayBaseInfo(first.playerId);
                              return RankCard(
                                // title: item.key,
                                title: Utils.getTeamStatsKey(item.key).tr,
                                rankType: rankType,
                                imageUrl: Utils.getPlayUrl(player.playerId),
                                name: first.playerName,
                                shortTeamName:
                                    Utils.getTeamInfo(player.teamId).shortEname,
                                rankValue: getRankValue(rankType, first),
                                onTap: () {
                                  BottomTipDialog.showWithSound(
                                      context: Get.context!,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return PlayerStatsDialog(
                                          title: Utils.getTeamStatsKey(item.key)
                                              .tr,
                                          currentIdex: item.value["current"],
                                          types: item.value["list"],
                                          originList: controller.statPlayerList,
                                          onTabChange: (index) {
                                            item.value["current"] = index;
                                            controller.update(["stats"]);
                                          },
                                        );
                                      });
                                },
                                onHeadOnTap: () {
                                  Get.toNamed(
                                    RouteNames.picksPlayerDetail,
                                    arguments: PlayerDetailPageArguments(
                                        first.playerId),
                                  );
                                },
                              );
                            },
                            separatorBuilder: (context, index) => _line(
                                margin: EdgeInsets.symmetric(horizontal: 16.w)),
                            itemCount: statsPlayerRankMap.entries.length,
                          ),
                        ],
                      ),
                    ),
                  9.vGap,
                  if (controller.statTeamList.isNotEmpty)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.vGap,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              LangKey.nbaTeamMeanTeamStats.tr,
                              style: 24.w4(
                                  fontFamily: FontFamily.fOswaldBold,
                                  height: 0.8),
                            ),
                          ),
                          15.vGap,
                          _line(),
                          ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item =
                                  statsTeamRankMap.entries.elementAt(index);
                              List<String> types = item.value.split("_");
                              var rankType = types.first;
                              var list = getStatRankList(
                                  rankType, controller.statTeamList);
                              StatsEntity team = StatsEntity();
                              int rank = 1;
                              for (int i = 0; i < list.length; i++) {
                                if (list[i].teamId == controller.teamId) {
                                  team = list[i];
                                  rank = i + 1;
                                  break;
                                }
                              }
                              return _TeamRankCard(
                                  rankType: rankType,
                                  imageUrl: Utils.getPlayUrl(team.playerId),
                                  name: team.teamName,
                                  rankValue: getRankValue(rankType, team),
                                  rank: rank,
                                  onTap: () {
                                    BottomTipDialog.showWithSound(
                                        context: Get.context!,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return TeamStatsDialog(
                                            list,
                                            item.key,
                                            rankType,
                                            types[1],
                                          );
                                        });
                                  });
                            },
                            separatorBuilder: (context, index) => _line(
                                margin: EdgeInsets.symmetric(horizontal: 16.w)),
                            itemCount: statsTeamRankMap.entries.length,
                          )
                        ],
                      ),
                    ),
                  18.vGap
                ],
              ));
        });
  }
}

class _TeamRankCard extends StatelessWidget {
  const _TeamRankCard({
    required this.rankType,
    required this.imageUrl,
    required this.name,
    required this.rankValue,
    required this.rank,
    required this.onTap,
  });

  final String rankType;
  final String imageUrl;
  final String name;
  final String rankValue;
  final int rank;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 24.w),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "SCoring".toUpperCase(),
                  style:
                      16.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                ),
                22.vGap,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rankValue,
                      style: 35.w4(
                        fontFamily: FontFamily.fOswaldBold,
                        height: 0.8,
                      ),
                    ),
                    27.hGap,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        5.vGap,
                        Text(
                          rankType,
                          style: 14.w4(
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 0.8,
                              color: AppColors.c000000),
                        ),
                        6.5.vGap,
                        Text(
                          // player.ename,
                          "${Utils.getRankText(rank)} overall",
                          style: 10.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                            color: AppColors.c4D4D4D,
                            height: 0.8,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Expanded(child: Container()),
            IconWidget(
              iconWidth: 14.w,
              icon: Assets.iconUiIconArrows04,
              rotateAngle: -90,
              iconColor: AppColors.c000000,
            )
          ],
        ),
      ),
    );
  }
}
