/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:08:22
 * @LastEditTime: 2024-10-31 20:03:40
 */
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerBagTab extends GetView<TeamController> {
  const PlayerBagTab({super.key});

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return GetBuilder<TeamController>(builder: (_) {
      var canSelect = controller.myBagList
          .where((e) => controller.canChange(true, e))
          .toList();
      var cantSelect = controller.myBagList
          .where((e) => !controller.canChange(true, e))
          .toList();
      canSelect.sort((a, b) => a.position.compareTo(b.position));
      cantSelect.sort((a, b) => a.position.compareTo(b.position));
      List<TeamPlayerInfoEntity> list = List.from(canSelect)
        ..addAll(cantSelect);
      return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        controller: scrollController,
        physics: OneBoundaryScrollPhysics(scrollController: scrollController),
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return PlayerItem(
            item: list[index],
            isBag: true,
          );
        },
        separatorBuilder: (context, index) => 9.vGap,
        itemCount: list.length,
      );
    });
  }
}
