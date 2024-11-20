import 'package:arm_chair_quaterback/pages/league/league_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LeagueDetailPage extends GetView<LeagueDetailController> {
  const LeagueDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return  Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueDetailController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("league_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
