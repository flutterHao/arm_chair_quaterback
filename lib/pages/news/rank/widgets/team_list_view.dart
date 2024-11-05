import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// author: lihonghao
/// date: 2024/9/11
/// 球员排名列表
class EasTeamListView extends StatelessWidget {
  const EasTeamListView({super.key, required this.type});
  final int type;

  Widget _flexText({required String text}) {
    return Flexible(
        child: Center(
      child: Text(
        text,
        style: 10.w7(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    NewListController newListCtrl = Get.find();

    List<String> columns = ["Rank", "Team", "W-L", "PCT", "HOME", "AWAY", "GB"];
    var list = newListCtrl.state.teamMap[type] ?? [];
    list.sort((a, b) => a.conferenceGamesBack.compareTo(b.conferenceGamesBack));
    // RxInt size = 10.obs;
    return Column(
      children: [
        Row(children: columns.map((e) => _flexText(text: e)).toList()),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              padding: EdgeInsets.symmetric(vertical: 10.w),
              itemBuilder: (context, index) {
                return TeamItemView(
                  index: index,
                  item: list[index],
                );
              }),
        ),
      ],
    );
  }
}

// class WesTeamListView extends StatelessWidget {
//   const WesTeamListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 10,
//         padding: EdgeInsets.symmetric(vertical: 10.w),
//         itemBuilder: (context, index) {
//           return TeamItemView(index: index);
//         });
//   }
// }

class TeamItemView extends StatelessWidget {
  const TeamItemView({super.key, required this.index, required this.item});
  final int index;
  final TeamRankEntity item;

  Widget _flexWidget({required Widget child}) {
    return Flexible(
      child: Center(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.w,
      color: index % 2 == 0 ? AppColors.cF2F2F2 : AppColors.cFFFFFF,
      child: Row(
        children: [
          _flexWidget(
              child: Text(
            "${index + 1}",
            style: 16.w7(),
          )),
          _flexWidget(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageWidget(
                url: Utils.getTeamUrl(item.teamID),
                width: 20.w,
                height: 20.w,
              ),
              2.hGap,
              Expanded(
                child: Text(
                  item.shortEname,
                  style: 12.w7(color: AppColors.c666666),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
          _flexWidget(
              child: Text(
            "${item.wINS}-${item.lOSSES}",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            "${item.winPCT}",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            item.hOME,
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            "-",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            "${item.conferenceGamesBack}",
            style: 12.w7(),
          )),
        ],
      ),
    );
  }
}
