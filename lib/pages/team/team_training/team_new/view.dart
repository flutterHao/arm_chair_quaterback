/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-12-10 21:40:42
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-10-12 20:29:16
 */

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/team_tab_bar.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamMenberView extends GetView<TeamController> {
  const TeamMenberView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initData();
    return HorizontalDragBackContainer(
      child: BlackAppWidget(
        backgroundColor: AppColors.cF2F2F2,
        const UserInfoBar(showPop: true),
        bodyWidget: Expanded(
          child: GetBuilder<TeamController>(
            builder: (_) {
              return Column(
                children: [
                  const TeamTabbar(),
                  Expanded(
                    child: TabBarView(
                      // physics: const NeverScrollableScrollPhysics(),
                      controller: controller.tabController,
                      children: controller.pages.map((e) => e).toList(),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
