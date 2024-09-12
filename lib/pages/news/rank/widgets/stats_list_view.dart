import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// author: lihonghao
/// date: 2024/9/11
/// 球员排名列表
class PlayListView extends StatelessWidget {
  const PlayListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
        separatorBuilder: (context, index) => 9.vGap,
        itemBuilder: (context, index) {
          return StatsTeamItem(index: index);
        });
  }
}

class TeamListView extends StatelessWidget {
  const TeamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
        separatorBuilder: (context, index) => 9.vGap,
        itemBuilder: (context, index) {
          return StatsItem(index: index);
        });
  }
}

class StatsItem extends StatelessWidget {
  const StatsItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      height: 84.w,
      width: 343.w,
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
            url: "https://file.qiumiwu.com/player/202404/24/dab169bb.png",
            width: 64.w,
            height: 64.w,
            borderRadius: BorderRadius.circular(32.w),
          ),
          9.hGap,
          SizedBox(
            width: 147.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "hou",
                  style: 10.w4(color: AppColors.cB3B3B3),
                ),
                5.vGap,
                Text(
                  "Player Name",
                  style: 16.w7(),
                ),
                5.vGap,
                ShadowContainer(
                    width: 18.w,
                    // height: 12.w,
                    backgroudColor: AppColors.c666666,
                    borderRadius: BorderRadius.circular(2.w),
                    child: Text(
                      "SG",
                      style: 10.w7(color: AppColors.cF2F2F2),
                    ))
              ],
            ),
          ),
          Text(
            "34.7",
            style: 24.w7(),
          )
        ],
      ),
    );
  }
}

class StatsTeamItem extends StatelessWidget {
  const StatsTeamItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      height: 84.w,
      width: 343.w,
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
            url: "https://file.qiumiwu.com/team/IND_300.png",
            width: 56.w,
            height: 56.w,
            borderRadius: BorderRadius.circular(30.w),
          ),
          9.hGap,
          SizedBox(
              width: 140.w,
              child: Text(
                "hou",
                style: 16.w4(),
              )),
          Text(
            "34.7",
            style: 17.w7(),
          )
        ],
      ),
    );
  }
}
