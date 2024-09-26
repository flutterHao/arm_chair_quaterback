/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 11:35:44
 * @LastEditTime: 2024-09-26 11:59:51
 */
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamIndexPage extends GetView<TeamIndexController> {
  const TeamIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    // return  Expanded(child: child);
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
      init: TeamIndexController(),
      id: "team_index",
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            title: "TEAM",
          ),
          bodyWidget: _buildView(),
        );
      },
    );
  }
}
