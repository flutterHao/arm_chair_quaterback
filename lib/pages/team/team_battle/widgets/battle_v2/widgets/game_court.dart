import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/chart_painter.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/ball_path_painter.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/high_light_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/round_transform_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/start_game_count_down_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'mark_animation_widget.dart';

///
///@auther gejiahui
///created at 2024/12/12/17:28

class GameCourtWidget extends GetView<TeamBattleV2Controller> {
  const GameCourtWidget({this.needCountDown = false, super.key});

  final bool needCountDown;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleV2Controller>(builder: (_) {
      return buildBasketballCourt(context);
    });
  }

  SizedBox buildBasketballCourt(BuildContext context) {
    return SizedBox(
      height: 156.w,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          //球场整行的宽高
          Positioned(
            top: 0.w,
            left: 9.w,
            right: 9.w,
            child: Stack(
              children: [
                //球场容器
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (_) {
                      return Container(
                        margin: EdgeInsets.only(top: 38.w),
                        width: 357.w,
                        height: 89.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ///球场
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    Assets.managerUiManagerCourt,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Expanded(
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..scale(-1.0, 1.0),
                                    child: Image.asset(
                                      Assets.managerUiManagerCourt,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //比赛开始倒计时
                            if (needCountDown)
                              StartGameCountDownWidget(
                                onStart: () {
                                  // controller.checkShowDialog();
                                },
                                onDown: () {
                                  /// 倒计时结束，开始比赛
                                  controller.isGameStart.value = true;
                                  controller.startGame();
                                },
                              ),
                          ],
                        ),
                      );
                    }),

                /// 回合转换动画
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idRoundTransform,
                    builder: (logic) {
                      if (controller.leftRound == null) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                          margin: EdgeInsets.only(top: 38.w),
                          width: 357.w,
                          height: 89.w,
                          child: RoundTransformWidget(
                            isLeftToRight: !controller.leftRound!,
                          ));
                    }),
                //球员投篮位置，是否投中
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (c) {
                      return Positioned(
                        top: 0.w,
                        right: 0.w,
                        left: 0.w,
                        bottom: 0,
                        child: Stack(
                          children: [
                            ...List.generate(controller.shootHistory.length,
                                (index) {
                              var item = controller.shootHistory[index];
                              Color color = item.isAway
                                  ? AppColors.cD60D20
                                  : AppColors.c1F8FE5;
                              return Positioned(
                                  top: item.shootLocation.dy - 10.w / 2 + 2.w,
                                  right: item.shootLocation.dx - 10.w / 2 + 3.w,
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..rotateX(pi / 3),
                                    child: Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: BoxDecoration(
                                          color: item.isSuccess ? color : null,
                                          border: Border.all(
                                              color: color, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(5.w)),
                                    ),
                                  ));
                            }),
                          ],
                        ),
                      );
                    }),
                // 主角指示器
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (logic) {
                      if (controller.shootPathOffsets.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      var last = controller.shootPathOffsets.first;
                      return Positioned(
                          top: last.dy - 20.w - 1.w,
                          right: last.dx - 4.5.w,
                          child: MarkAnimationWidget(
                            child: Icon(
                              Icons.location_on_rounded,
                              size: 15.w,
                              color: controller.shootPathColor,
                            ),
                          ));
                    }),

                ///篮球架
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (_) {
                      return Container(
                        margin: EdgeInsets.only(top: 38.w),
                        width: 357.w,
                        height: 89.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// 左边篮球架
                            Positioned(
                                left: 3.w,
                                top: 5.w,
                                width: 26.w,
                                height: 38.w,
                                child: Center(
                                    child: IconWidget(
                                        iconWidth: 26.w,
                                        icon: Assets.managerUiManagerCourt01))),

                            /// 右边篮球架
                            Positioned(
                                right: 3.w,
                                top: 5.w,
                                width: 26.w,
                                height: 38.w,
                                child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..scale(-1.0, 1.0),
                                    child: Center(
                                        child: IconWidget(
                                            iconWidth: 26.w,
                                            icon: Assets
                                                .managerUiManagerCourt01)))),
                          ],
                        ),
                      );
                    }),
                // 篮球
                //  左边篮筐位置 top: 49.w,left: 22.w,
                //  左边Y轴中点三分位置：top: 73.w,left: 125.w,
                //
                //  右边篮筐位置 top: 49.w,right: 22.w,
                //  左边Y轴中点三分位置：top: 73.w,right: 125.w,
                Obx(() {
                  return Positioned(
                      top: controller.shootOffset.value.dy,
                      right: controller.shootOffset.value.dx,
                      child: Opacity(
                        opacity: controller.isSecondAnimationRunning ? 1 : 1,
                        child: IconWidget(
                            iconWidth: 6.w, icon: Assets.teamUiTrainingBall),
                      ));
                })
              ],
            ),
          ),

          /// 篮球轨迹线
          Obx(() {
            controller.shootOffset.value;
            return Positioned(
                left: 9.w,
                right: 9.w,
                top: 0,
                bottom: 0,
                child: CustomPaint(
                    painter: BallPathPainter(
                        offsets: controller.shootPathOffsets,
                        progress: controller.isSecondAnimationRunning ? 1 : 1,
                        color: controller.shootPathColor)));
          }),

          //普通弹幕
          Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            height: 40.w,
            child: BarrageWall(
              width: MediaQuery.of(context).size.width,
              height: 40.w,
              massiveMode: false,
              controller: controller.normalBarrageWallController,
              child: Container(),
            ),
          ),
          //高光时刻弹幕
          // Positioned(
          //   bottom: 5.w,
          //   width: MediaQuery.of(context).size.width,
          //   height: 30.w,
          //   child: BarrageWall(
          //     width: MediaQuery.of(context).size.width,
          //     height: 30.w,
          //     controller: controller.highLightBarrageWallController,
          //     child: Container(),
          //   ),
          // ),

          /// 高光时刻气泡
          Positioned(
            top: 0.w,
            left: 9.w,
            right: 9.w,
            child: Container(
              width: 357.w,
              height: 127.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GetBuilder<TeamBattleV2Controller>(
                      id: TeamBattleV2Controller.idHighLightEvent,
                      builder: (logic) {
                        GameEvent? event = controller.highLightEvent;
                        if (event == null) {
                          return const SizedBox.shrink();
                        }
                        return HighLightWidget(event: event!);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
