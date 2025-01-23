import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/game_log.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rank.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rewards.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';
import 'widgets/legendary_manager.dart';

class SeaonRankPage extends GetView<SeaonRankController> {
  const SeaonRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: GetBuilder<SeaonRankController>(
        init: SeaonRankController(),
        id: "seaon_rank",
        builder: (_) {
          return BlackAppWidget(
            // backgroundColor: AppColors.c002B5C,
            backgroundColor: AppColors.cF2F2F2,
            const UserInfoBar(showPop: true),
            bodyWidget: Expanded(child: Obx(() {
              if (controller.loadingStatus.value != LoadDataStatus.success) {
                return Center(
                    child: LoadStatusWidget(
                        loadDataStatus: controller.loadingStatus.value));
              }
              return const SingleChildScrollView(
                  child: Column(
                children: [
                  SeasonTopWidget(),
                  SeasonRewardsWidget(),
                  LegendaryManagerWidget(),
                  SeasonRankWidget(),
                  GameLogWidget(),
                ],
              ));
            })),
          );
        },
      ),
    );
  }
}
