import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/game_log.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rank.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rewards.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_top.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'index.dart';
import 'widgets/legendary_manager.dart';

class SeaonRankPage extends GetView<SeaonRankController> {
  const SeaonRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<SeaonRankController>(
        init: SeaonRankController(),
        id: "seaon_rank",
        builder: (_) {
          return const BlackAppWidget(
            // backgroundColor: AppColors.c002B5C,
            backgroundColor: AppColors.cF2F2F2,
            UserInfoBar(showPop: true),
            bodyWidget: Expanded(
                child: Expanded(
                    child: Column(
              children: [
                SeasonTopWidget(),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SeasonRewardsWidget(),
                      LegendaryManagerWidget(),
                      SeasonRankWidget(),
                      GameLogWidget(),
                    ],
                  ),
                ))
              ],
            ))),
          );
        },
      ),
    );
  }
}
