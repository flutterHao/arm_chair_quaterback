/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-10-23 10:16:06
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-09-29 16:03:41
 */

import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPlayerList extends GetView<TeamController> {
  const MainPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position > 0)
        .toList();
    return GetBuilder<TeamController>(builder: (_) {
      return SizedBox(
        // width: 360.w,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PlayerItem(item: list[index], isMain: true);
          },
          separatorBuilder: (context, index) => 9.vGap,
          itemCount: list.length,
        ),
      );
    });
  }
}

class SubPlayerList extends GetView<TeamController> {
  const SubPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position == 0)
        .toList();
    return SizedBox(
      // width: 360.w,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PlayerItem(item:list[index] , isMain: false);
        },
        separatorBuilder: (context, index) => 9.vGap,
        itemCount: list.length,
      ),
    );
  }
}
