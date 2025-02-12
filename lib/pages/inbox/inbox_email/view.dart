import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/widget/email_rank_award.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widget/email_rank_change.dart';

class InboxEmailPage extends GetView<InboxEmailController> {
  const InboxEmailPage({super.key});

  // 主视图
  Widget _buildView() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Obx(() {
          if (controller.loadingStatus.value != LoadDataStatus.success) {
            return Center(
                child: LoadStatusWidget(
                    loadDataStatus: controller.loadingStatus.value));
          }
          return ListView.separated(
            itemCount: controller.emailList.length,
            padding: EdgeInsets.symmetric(vertical: 16.w),
            itemBuilder: (context, index) {
              if (controller.emailList[index].mailType != 0) {
                return EmailRankChangeWidget(index);
              }
              return EmailRankAwardWidget(index);
            },
            separatorBuilder: (context, index) => 15.vGap,
          );
        }));
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
            title: controller.title,
            right: IconWidget(iconWidth: 26.w, icon: Assets.iconUiIconMore),
          ),
          bodyWidget: Expanded(child: _buildView()),
        ));
      },
    );
  }
}
