import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MineAccountPage extends GetView<MineAccountController> {
  const MineAccountPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineAccountController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("mine_account")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
