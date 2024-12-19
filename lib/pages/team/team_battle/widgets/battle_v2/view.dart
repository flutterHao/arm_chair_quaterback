import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/before_game/before_game.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_court.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_header.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/game_leader_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/game_over_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_players.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_score_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/team_stat/team_stats_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/win_rate_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamBattleV2Page extends GetView<TeamBattleV2Controller> {
  TeamBattleV2Page({super.key});

  late TeamBattleController teamBattleController;

  @override
  Widget build(BuildContext context) {
    teamBattleController = Get.find();
    return GetBuilder<TeamBattleV2Controller>(
      id: TeamBattleV2Controller.idBattleMain,
      builder: (_) {
        return PopScope(
          canPop: controller.isGameOver.value || controller.maybeException.value,
          child: HorizontalDragBackWidget(
            onWidgetOut: () {
              controller.jumpGame();
            },
            noBackAnimation: !controller.isGameOver.value,
            child: BlackAppWidget(
              UserInfoBar(
                showPop: true,
                onClickPop: () {
                  controller.jumpGame();
                },
              ),
              bodyWidget: Expanded(child: Obx(() {
                var value = !controller.isGameStart.value;
                var gameHeaderWidget = GameHeaderWidget(teamBattleController);
                return  Stack(
                  children: [
                    GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onLongPressUp: () {
                              print('onLongPressUp---------------');
                              controller.changeGameSpeed(1);
                            },
                            onLongPress: () {
                              print('onLongPress---------------');
                              controller.changeGameSpeed(10);
                            },
                            child: Column(
                              children: [
                                gameHeaderWidget,
                                Expanded(
                                  child: Builder(builder: (c) {
                                    var isGameOver = controller.isGameOver.value;
                                    return Stack(
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              const ClipRRect(
                                                  borderRadius: BorderRadius.zero,
                                                  child: GameCourtWidget()),
                                              const GamePlayersWidget(),
                                              const LiveTextWidget(),
                                              // WinRateWidget(
                                              //     controller.winRateController),
                                              GetBuilder<TeamBattleV2Controller>(
                                                  id: TeamBattleV2Controller
                                                      .idQuarterScore,
                                                  builder: (_) {
                                                    return QuarterScoreWidget();
                                                  }),
                                              GameLeaderWidget(
                                                controller:
                                                    controller.gameLeaderController,
                                              ),
                                              TeamStatsWidget(
                                                controller:
                                                    controller.teamStatsController,
                                              ),
                                              20.vGap,
                                            ],
                                          ),
                                        ),
                                        if (isGameOver)
                                          Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: GameOverWidget()),
                                      ],
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                    if(value)
                      BeforeGameWidget(
                          gameHeaderWidget, teamBattleController, controller)
                  ],
                );
              })),
            ),
          ),
        );
      },
    );
  }
}
