import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamUpgradePage extends GetView<TeamUpgradeController> {
  const TeamUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamUpgradeController>(
      init: TeamUpgradeController(),
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            showPop: true,
          ),
          bodyWidget: Container(),
        );
      },
    );
  }
}
