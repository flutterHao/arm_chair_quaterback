/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:08:22
 * @LastEditTime: 2024-10-23 16:55:13
 */
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerBagTab extends GetView<TeamController> {
  const PlayerBagTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return PlayerItem(
          item: controller.myBagList[index],
          isBag: true,
        );
      },
      separatorBuilder: (context, index) => 9.vGap,
      itemCount: controller.myBagList.length,
    );
    ;
  }
}
