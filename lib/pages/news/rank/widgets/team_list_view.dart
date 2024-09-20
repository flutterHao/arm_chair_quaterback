import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// author: lihonghao
/// date: 2024/9/11
/// 球员排名列表
class EasTeamListView extends StatelessWidget {
  const EasTeamListView({super.key});

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
    List<String> columns = ["Rank", "Team", "W-L", "PCT", "HOME", "AWAY", "GB"];
    return Column(
      children: [
        Row(children: columns.map((e) => _flexText(text: e)).toList()),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(vertical: 10.w),
              itemBuilder: (context, index) {
                return TeamItemView(index: index);
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
  const TeamItemView({super.key, required this.index});
  final int index;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                url: "https://file.qiumiwu.com/team/BOS_300.png",
                width: 20.w,
                height: 20.w,
              ),
              2.hGap,
              Text(
                "BAL",
                style: 12.w7(color: AppColors.c666666),
              )
            ],
          )),
          _flexWidget(
              child: Text(
            "62-64",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            ".780",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            "37-4",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            "62-64",
            style: 12.w7(color: AppColors.c666666),
          )),
          _flexWidget(
              child: Text(
            "14.0",
            style: 12.w7(),
          )),
        ],
      ),
    );
  }
}
