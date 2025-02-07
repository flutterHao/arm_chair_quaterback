import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_game_court.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_game_header.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_game_leader.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_mvp.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_quarter.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_status.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_team_status.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/small_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamHistortyPage extends GetView<TeamHistortyController> {
  const TeamHistortyPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        const HistoryGameHeaderWidget(),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const HistoryGameCourtWidget(),
              const HistoryMvpWidget(),
              const HistoryQuarterWidget(),
              const HistoryStatusWidget(),
              const HistoryGameLeaderWidget(),
              HistoryTeamStatsWidget(),
              9.vGap,
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: GetBuilder<TeamHistortyController>(
      init: TeamHistortyController(),
      id: "team_historty",
      builder: (_) {
        return BlackAppWidget(
          // backgroundColor: AppColors.c002B5C,
          backgroundColor: AppColors.cF2F2F2,
          const UserInfoBar(showPop: true),
          bodyWidget: Expanded(child: Obx(
            () {
              if (controller.loadingStatus.value != LoadDataStatus.success) {
                return Center(
                    child: LoadStatusWidget(
                        loadDataStatus: controller.loadingStatus.value));
              }
              return _buildView();
            },
          )),
        );
      },
    ));
  }
}
