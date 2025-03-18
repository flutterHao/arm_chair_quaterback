import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/widgets/about_more.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/widgets/user_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class UserInfoPage extends GetView<UserInfoController> {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
      UserInfoBar(showPop: true),
      bodyWidget: Expanded(
          child: GetBuilder<UserInfoController>(
        init: UserInfoController(),
        id: "user_info",
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [16.vGap, UserTopWidget(), 10.vGap, AboutMoreWidget()],
            ),
          );
        },
      )),
    ));
  }
}
