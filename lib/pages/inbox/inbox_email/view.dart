import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/inbox.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/widget/email_rank_award.dart';
import 'package:arm_chair_quaterback/pages/inbox/widgets/inbox_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

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
              // if (controller.type == 4) {
              //   return EmailRankChangeWidget(index);
              // }
              if (controller.emailList[index].state == 0) {
                InboxApi.readMail(controller.emailList[index].mailId);
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
            title: controller.inboxMessageEntity.userName,
            right: MtInkWell(
              splashColor: Colors.transparent,
              onTap: () => BottomTipDialog.showWithSound(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => InboxSettingDialog(
                      inboxMessageEntity: controller.inboxMessageEntity)),
              child: IconWidget(
                  iconWidth: 26.w,
                  iconHeight: 26.w,
                  fit: BoxFit.contain,
                  icon: Assets.iconUiIconMore),
            ),
          ),
          bodyWidget: Expanded(child: _buildView()),
        ));
      },
    );
  }
}
