import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
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
                            //球员投篮位置，是否投中
                            ...List.generate(controller.shootHistory.length,
                                (index) {
                              var item = controller.shootHistory[index];
                              Color color = item.isAway
                                  ? AppColors.cD60D20
                                  : AppColors.c1F8FE5;
                              return Positioned(
                                  top: item.shootLocation.dy - 20.w / 2,
                                  right: item.shootLocation.dx - 20.w / 2,
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..rotateX(pi / 3),
                                    child: Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                          color: item.isSuccess ? color : null,
                                          border: Border.all(
                                              color: color, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10.w)),
                                    ),
                                  ));
                            }),
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
                // 主角指示器
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (logic) {
                      if (controller.mainOffset == null) {
                        return const SizedBox.shrink();
                      }
                      var last = controller.mainOffset!;
                      return Positioned(
                          top: last.shootLocation.dy - 20.w - 7.w + 38.w,
                          right: last.shootLocation.dx - 12.w,
                          child: MarkAnimationWidget(
                            child: Icon(
                              Icons.location_on_rounded,
                              color: last.isAway
                                  ? AppColors.cD60D20
                                  : AppColors.c1F8FE5,
                            ),
                          ));
                    }),
                // 篮球
                //  左边篮筐位置 top: 49.w,left: 22.w,
                //  左边Y轴中点三分位置：top: 73.w,left: 125.w,
                //
                //  右边篮筐位置 top: 49.w,right: 22.w,
                //  左边Y轴中点三分位置：top: 73.w,right: 125.w,
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
                                child: Center(child: IconWidget(iconWidth: 26.w, icon: Assets.managerUiManagerCourt01))),
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
                                    child: Center(child: IconWidget(iconWidth: 26.w, icon: Assets.managerUiManagerCourt01)))),
                          ],
                        ),
                      );
                    }),
                Obx(() {
                  return Positioned(
                      top: controller.shootOffset.value.dy,
                      right: controller.shootOffset.value.dx,
                      child: Opacity(
                        opacity: controller.isSecondAnimationRunning
                            ? (1 - controller.shootAnimation?.value).toDouble()
                            : 1,
                        child: IconWidget(
                            iconWidth: 6.w, icon: Assets.teamUiTrainingBall),
                      ));
                })
              ],
            ),
          ),
          //普通弹幕
          // Positioned(
          //   top: 0,
          //   width: MediaQuery.of(context).size.width,
          //   height: 45.w,
          //   child: BarrageWall(
          //     width: MediaQuery.of(context).size.width,
          //     height: 45.w,
          //     controller: controller.normalBarrageWallController,
          //     child: Container(),
          //   ),
          // ),
          //高光时刻弹幕
          Positioned(
            bottom: 5.w,
            width: MediaQuery.of(context).size.width,
            height: 30.w,
            child: BarrageWall(
              width: MediaQuery.of(context).size.width,
              height: 30.w,
              controller: controller.highLightBarrageWallController,
              child: Container(),
            ),
          )
        ],
      ),
    );
  }
}
