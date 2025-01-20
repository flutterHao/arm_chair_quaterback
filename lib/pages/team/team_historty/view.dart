import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamHistortyPage extends GetView<TeamHistortyController> {
  const TeamHistortyPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("TeamHistortyPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamHistortyController>(
      init: TeamHistortyController(),
      id: "team_historty",
      builder: (_) {
        return BlackAppWidget(
          // backgroundColor: AppColors.c002B5C,
          backgroundColor: AppColors.cF2F2F2,
          const UserInfoBar(showPop: true),
          bodyWidget: _buildView(),
        );
      },
    );
  }
}
