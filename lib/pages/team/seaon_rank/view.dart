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
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/game_log.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rank.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rewards.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_top.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
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
            bodyWidget: Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SeasonTopWidget(),
                  const SeasonRewardsWidget(),
                  const LegendaryManagerWidget(),
                  const SeasonRankWidget(),
                  const GameLogWidget(),
                  18.vGap,
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _caseExecutionRecord(index);
                      })
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  Widget _caseExecutionRecord(int index) {
    return Stack(
      children: [
        index != 0
            ? Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  color: Colors.red,
                ),
              )
            : Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 2,
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Container(
                          width: 2,
                          height: double.infinity,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 22,
              height: 22,
              color: AppColors.cF2F2F2,
              alignment: Alignment.center,
              child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                      color: AppColors.cF2F2F2, shape: BoxShape.circle),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.limeAccent,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
