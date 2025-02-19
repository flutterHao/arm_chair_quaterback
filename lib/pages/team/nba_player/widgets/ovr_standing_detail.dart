import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';

class OvrStandingDetailPage extends StatelessWidget {
  const OvrStandingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: BlackAppWidget(UserInfoBar(),
          bodyWidget: Expanded(
              child: Center(
            child: Text('OvrStandingDetailPage'),
          ))),
    );
  }
}
