import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamBattlePage extends GetView<TeamBattleController> {
  const TeamBattlePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("TeamBattlePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleController>(
      init: TeamBattleController(),
      id: "team_battle",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("team_battle")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
