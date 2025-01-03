import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/stats_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/rank_card.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsRankPage extends GetView<RankController> {
  const StatsRankPage({super.key});

  Widget _line() {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.cD1D1D1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankController>(
      id: "starsRank",
      builder: (_) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 9.w),
            child: Column(
              children: [
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
                          "player STATS".toUpperCase(),
                          style: 24.w4(
                              fontFamily: FontFamily.fOswaldBold, height: 0.8),
                        ),
                      ),
                      15.vGap,
                      _line(),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StatsPlayerRankCard(
                            item: controller.statsRankMap.entries
                                .elementAt(index),
                          );
                        },
                        separatorBuilder: (context, index) => _line(),
                        itemCount: controller.statsRankMap.entries.length,
                      )
                    ],
                  ),
                ),
                9.vGap,
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
                          "TEAM STATS".toUpperCase(),
                          style: 24.w4(
                              fontFamily: FontFamily.fOswaldBold, height: 0.8),
                        ),
                      ),
                      15.vGap,
                      _line(),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StatsTeamRankCard(
                            type: controller.statsTeamTypeMap.entries
                                .elementAt(index),
                          );
                        },
                        separatorBuilder: (context, index) => _line(),
                        itemCount: controller.statsTeamTypeMap.length,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StatsPlayerRankCard extends GetView<RankController> {
  const StatsPlayerRankCard({super.key, required this.item});
  final MapEntry<String, Map<String, dynamic>> item;

  @override
  Widget build(BuildContext context) {
    int index = item.value["current"];
    List types = item.value["list"][index].split("_");
    String rankType = types.first;
    var list = controller.getStatRankList(rankType, false);
    StatsEntity first = list.first;
    var player = Utils.getPlayBaseInfo(first.playerId ?? 0);
    return RankCard(
        title: item.key,
        rankType: rankType,
        imageUrl: Utils.getPlayUrl(player.playerId),
        name: first.playerName,
        shortTeamName: Utils.getTeamInfo(player.teamId).shortEname,
        rankValue: controller.getRankValue(rankType, first),
        onTap: () {
          showModalBottomSheet(
              context: Get.context!,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return PlayerStatsDialog(
                  title: item.key,
                  currentIdex: item.value["current"],
                  types: item.value["list"],
                  originList: controller.statPlayerList,
                  onTabChange: (index) {
                    item.value["current"] = index;
                    controller.update(["starsRank"]);
                  },
                );
              });
        });
  }
}

class StatsTeamRankCard extends GetView<RankController> {
  const StatsTeamRankCard({super.key, required this.type});
  final MapEntry<String, String> type;

  @override
  Widget build(BuildContext context) {
    // return Container();
    List<String> types = type.value.split("_");
    var rankType = types.first;
    var list = controller.getStatRankList(rankType, true);
    StatsEntity first = list.first;
    return RankCard(
        title: type.key,
        rankType: rankType,
        imageUrl: Utils.getTeamUrl(first.teamId),
        name: first.teamName,
        rankValue: controller.getRankValue(rankType, first),
        onTap: () {
          showModalBottomSheet(
              context: Get.context!,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return TeamStatsDialog(
                  list,
                  type.key,
                  rankType,
                  types[1],
                );
              });
        });
  }
}
