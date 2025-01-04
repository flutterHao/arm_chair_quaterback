/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-04 11:25:34
 * @LastEditTime: 2025-01-04 11:47:34
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/inbox/widgets/inbox_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class InboxPage extends GetView<InboxController> {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      init: InboxController(),
      id: "inbox",
      builder: (_) {
        return const BlackAppWidget(
          backgroundColor: AppColors.cFFFFFF,
          UserInfoBar(),
          bodyWidget: InboxList(),
        );
      },
    );
  }
}
