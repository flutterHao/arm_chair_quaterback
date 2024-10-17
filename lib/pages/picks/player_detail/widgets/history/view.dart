import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("history")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
