import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/legendary_manager.dart';

class SeaonRankPage extends GetView<SeaonRankController> {
  const SeaonRankPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SeaonRankPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<SeaonRankController>(
        init: SeaonRankController(),
        id: "seaon_rank",
        builder: (_) {
          return BlackAppWidget(
            // backgroundColor: AppColors.c002B5C,
            backgroundColor: AppColors.cF2F2F2,
            const UserInfoBar(showPop: true),
            bodyWidget: SingleChildScrollView(
              child: Column(
                children: [
                  const LegendaryManagerWidget(),
                  18.vGap,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
