import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class InboxEmailPage extends GetView<InboxEmailController> {
  const InboxEmailPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("InboxEmailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxEmailController>(
      init: InboxEmailController(),
      id: "inbox_email",
      builder: (_) {
        return HorizontalDragBackContainer(
            child: BlackAppWidget(
          backgroundColor: AppColors.cFFFFFF,
          AppBarWidget(
            title: 'email',
            right: IconWidget(iconWidth: 26.w, icon: Assets.iconUiIconMore),
          ),
          bodyWidget: Expanded(child: _buildView()),
        ));
      },
    );
  }
}
