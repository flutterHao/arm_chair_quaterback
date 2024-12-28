import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/stats_dialog.dart';
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
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: Get.context!,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return PlayerStatsDialog(
                item: item,
                // list,
                // item.key,
                // rankType,
                // types[1],
              );
            });
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.key,
                  style:
                      16.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                ),
                13.vGap,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55.w,
                      height: 74.w,
                      decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      child: ImageWidget(
                        url: Utils.getPlayUrl(first.playerId),
                        borderRadius: BorderRadius.circular(6.w),
                        width: 55.w,
                      ),
                    ),
                    15.5.hGap,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.vGap,
                        Row(
                          children: [
                            Text(
                              // player.ename,
                              first.playerName,
                              style: 14.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 0.8,
                              ),
                            ),
                            10.5.hGap,
                            Text(
                              Utils.getTeamInfo(player.teamId).shortEname,
                              style: 14.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 0.8,
                              ),
                            )
                          ],
                        ),
                        20.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              controller.getRankValue(rankType, first),
                              style: 35.w4(
                                fontFamily: FontFamily.fOswaldBold,
                                height: 0.8,
                              ),
                            ),
                            12.hGap,
                            Text(
                              rankType,
                              style: 10.w4(
                                  fontFamily: FontFamily.fRobotoRegular,
                                  height: 0.8,
                                  color: AppColors.c4D4D4D),
                            )
                          ],
                        )
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

    return InkWell(
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
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 19.w),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    type.key,
                    style: 16
                        .w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                  ),
                ),
                13.vGap,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55.w,
                      height: 74.w,
                      decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      child: ImageWidget(
                        url: Utils.getTeamUrl(first.teamId),
                        borderRadius: BorderRadius.circular(6.w),
                        width: 64.w * 0.4,
                      ),
                    ),
                    15.5.hGap,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.vGap,
                        Text(
                          first.teamName,
                          style: 14.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 0.8,
                          ),
                        ),
                        18.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              controller.getRankValue(rankType, first),
                              style: 35.w4(
                                fontFamily: FontFamily.fOswaldBold,
                                height: 0.8,
                              ),
                            ),
                            12.hGap,
                            Text(
                              rankType,
                              style: 10.w4(
                                  fontFamily: FontFamily.fRobotoRegular,
                                  height: 0.8,
                                  color: AppColors.c4D4D4D),
                            )
                          ],
                        )
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
            ),
            5.hGap,
          ],
        ),
      ),
    );
  }
}
