import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/stats_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/rank_card.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatsTab extends GetView<TeamDetailController> {
  const StatsTab({super.key});

  Widget _line({EdgeInsetsGeometry? margin}) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: 1,
      color: AppColors.cD1D1D1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
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
                      "TEAM LEADERS".toUpperCase(),
                      style: 24
                          .w4(fontFamily: FontFamily.fOswaldBold, height: 0.8),
                    ),
                  ),
                  15.vGap,
                  _line(),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      var item = controller.statsRankMap.entries.elementAt(i);
                      int index = item.value["current"];
                      List types = item.value["list"][index].split("_");
                      // String rankType = types.first;
                      // var list = getStatRankList(rankType, []);
                      // StatsEntity first = list.first;
                      // var player = Utils.getPlayBaseInfo(first.playerId ?? 0);
                      return RankCard(
                        // title: item.key,
                        // rankType: rankType,
                        // imageUrl: Utils.getPlayUrl(player.playerId),
                        // name: first.playerName,
                        // shortTeamName:
                        //     Utils.getTeamInfo(player.teamId).shortEname,
                        title: item.key,
                        rankType: "PPG",
                        imageUrl: Utils.getPlayUrl(2879),
                        name: "jemas",
                        rankValue: "10",
                        onTap: () {
                          showModalBottomSheet(
                              context: Get.context!,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return PlayerStatsDialog(
                                  title: item.key,
                                  currentIdex: item.value["current"],
                                  types: item.value["list"],
                                  originList: [],
                                  onTabChange: (index) {
                                    item.value["current"] = index;
                                    controller.update(["starsRank"]);
                                  },
                                );
                              });
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        _line(margin: EdgeInsets.symmetric(horizontal: 16.w)),
                    itemCount: controller.statsRankMap.entries.length,
                  ),
                ],
              ),
            ),
            9.vGap,
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
                      "TEAM STATS".toUpperCase(),
                      style: 24
                          .w4(fontFamily: FontFamily.fOswaldBold, height: 0.8),
                    ),
                  ),
                  15.vGap,
                  _line(),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // List<String> types = type.value.split("_");
                      // var rankType = types.first;
                      // var list = getStatRankList(rankType, true);
                      // StatsEntity first = list.first;
                      return _TeamRankCard(
                          rankType: "PPG",
                          imageUrl: Utils.getPlayUrl(2879),
                          name: "jemas",
                          rankValue: "10",
                          onTap: () {
                            showModalBottomSheet(
                                context: Get.context!,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return TeamStatsDialog(
                                    [],
                                    "type.key",
                                    "rankType",
                                    "types[1]",
                                  );
                                });
                          });
                    },
                    separatorBuilder: (context, index) =>
                        _line(margin: EdgeInsets.symmetric(horizontal: 16.w)),
                    itemCount: 4,
                  )
                ],
              ),
            ),
            9.vGap
          ],
        ));
  }
}

class _TeamRankCard extends StatelessWidget {
  const _TeamRankCard({
    required this.rankType,
    required this.imageUrl,
    required this.name,
    required this.rankValue,
    required this.onTap,
  });
  final String rankType;
  final String imageUrl;
  final String name;
  final String rankValue;
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
                          "17th  overall",
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
