import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MineSettingPage extends GetView<MineSettingController> {
  const MineSettingPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineSettingController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("mine_setting")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
