/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-09-29 18:33:31
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-09-29 16:03:41
 */

import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPlayerList extends GetView<TeamTrainingController> {
  const MainPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamTrainingController>(builder: (_) {
      return SizedBox(
        // width: 360.w,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PlayerItem(index: index, isMain: true);
          },
          separatorBuilder: (context, index) => 9.vGap,
          itemCount: controller.teamList.length,
        ),
      );
    });
  }
}

class SubPlayerList extends StatelessWidget {
  const SubPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 360.w,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PlayerItem(index: index, isMain: false);
        },
        separatorBuilder: (context, index) => 9.vGap,
        itemCount: 7,
      ),
    );
  }
}
