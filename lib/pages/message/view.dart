import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (_) {
        return const BlackAppWidget(
          UserInfoBar(),
          bodyWidget: Expanded(
            child: Center(
              child: LoadStatusWidget(
                loadDataStatus: LoadDataStatus.noData,
              ),
            ),
          ),
        );
      },
    );
  }
}
