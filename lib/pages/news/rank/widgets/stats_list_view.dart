import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// author: lihonghao
/// date: 2024/9/11
/// 球员排名列表
class PlayListView extends GetView<RankController> {
  const PlayListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankController>(
        id: "stars",
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: SmartRefresher(
                  controller: controller.refreshCtrl,
                  enablePullUp: true,
                  // header: const WaterDropHeader(), // 使用水滴风格的下拉刷新
                  // footer: const ClassicFooter(), // 使用经典风格的上拉加载更多
                  onRefresh: () => controller.getStatRank(),
                  onLoading: () => controller.getStatRank(refresh: false),
                  child: ListView.separated(
                      itemCount: controller.statList.length,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 16.w),
                      separatorBuilder: (context, index) => 9.vGap,
                      itemBuilder: (context, index) {
                        return StatsItem(index: index);
                      }),
                ),
              ),
            ],
          );
        });
  }
}

class StatsItem extends GetView<RankController> {
  const StatsItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var item = controller.statList[index];

    return ShadowContainer(
      height: 84.w,
      // width: 343.w,
      backgroudColor: AppColors.cF1F1F1,
      borderRadius: BorderRadius.circular(16.w),
      child: Row(
        children: [
          Container(
            width: 50.w,
            alignment: Alignment.center,
            child: Text(
              "${index + 1}",
              style: 21.w7(),
            ),
          ),
          ImageWidget(
            url: Utils.getPlayUrl(item.playerId),
            width: 64.w,
            height: 64.w,
            imageFailedPath: Assets.head_0000Png,
            borderRadius: BorderRadius.circular(32.w),
          ),
          9.hGap,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.getTeamInfo(item.teamId ?? 0).shortEname,
                  style: 10.w4(color: AppColors.cB3B3B3),
                ),
                5.vGap,
                Text(
                  Utils.getPlayBaseInfo(item.playerId ?? 0).ename,
                  style: 16.w7(),
                  overflow: TextOverflow.ellipsis,
                ),
                5.vGap,
                ShadowContainer(
                    width: 18.w,
                    // height: 12.w,
                    backgroudColor: AppColors.c666666,
                    borderRadius: BorderRadius.circular(2.w),
                    child: Text(
                      Utils.getPlayBaseInfo(item.playerId ?? 0).position,
                      style: 10.w7(color: AppColors.cF2F2F2),
                    ))
              ],
            ),
          ),
          20.hGap,
          Text(
            "${controller.getRankValue(item)}",
            style: 24.w7(),
          ),
          10.hGap,
        ],
      ),
    );
  }
}

class TeamListView extends GetView<RankController> {
  const TeamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankController>(
        id: "starsTeam",
        builder: (_) {
          return ListView.separated(
              itemCount: controller.starsTeamRankList.length,
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
              separatorBuilder: (context, index) => 9.vGap,
              cacheExtent: 84.w,
              itemBuilder: (context, index) {
                return StatsTeamItem(
                    index: index, item: controller.starsTeamRankList[index]);
              });
        });
  }
}

class StatsTeamItem extends GetView<RankController> {
  const StatsTeamItem({super.key, required this.index, required this.item});
  final int index;
  final StarsTeamRank item;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      height: 84.w,
      // width: 343.w,
      backgroudColor: AppColors.cF1F1F1,
      borderRadius: BorderRadius.circular(16.w),
      child: Row(
        children: [
          Container(
            width: 64.w,
            alignment: Alignment.center,
            child: Text(
              "${index + 1}",
              style: 21.w7(),
            ),
          ),
          ImageWidget(
            url: Utils.getTeamUrl(item.teamId),
            width: 56.w,
            height: 56.w,
            // imageFailedPath: Assets.head_0000Png,
            borderRadius: BorderRadius.circular(30.w),
          ),
          9.hGap,
          Expanded(
            child: SizedBox(
                width: 140.w,
                child: Text(
                  item.teamName ?? "",
                  style: 16.w4(),
                )),
          ),
          Text(
            "${controller.getRankValue(item)}",
            style: 17.w7(),
          ),
          10.hGap,
        ],
      ),
    );
  }
}
