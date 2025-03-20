/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 17:22:13
 * @LastEditTime: 2025-03-20 16:51:33
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/custom_buttom.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/player_card.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/slide_transition_x.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/player_exchange_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget_2.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTeamWidget extends StatelessWidget {
  const MyTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(
        // init: TeamController(),
        builder: (ctrl) {
      return Container(
        width: 375.w,
        height: 503.w,
        margin: EdgeInsets.symmetric(vertical: 9.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: AppColors.cFFFFFF,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 25.w,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  LangKey.gametabTeam.tr,
                  style: 24.w.w7(
                        fontFamily: FontFamily.fOswaldBold,
                        height: 0.75,
                      ),
                ),
              ),
            ),

            Positioned(
              top: 63.w,
              child: Container(
                width: 342.w,
                height: 419.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(Assets.managerUiMangerNew29),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 100,
                      child: AnimatedOpacity(
                        duration: 300.milliseconds,
                        opacity: ctrl.showExChange ? 0 : 1,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                                top: 18.w,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200.w,
                                      height: 37.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.w),
                                        color:
                                            AppColors.c000000.withOpacity(0.5),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 4.5.w, right: 9.w),
                                            width: 3.w,
                                            height: 21.w,
                                            color: AppColors.cD7283B,
                                          ),
                                          Text(
                                            "OVR ",
                                            style: 16.w4(
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                              color: AppColors.cFFFFFF,
                                            ),
                                          ),
                                          // 10.hGap,
                                          AnimatedNum(
                                              number: ctrl.getTeamAvgOvr(),
                                              textStyle: 16.w4(
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                                color: AppColors.cFFFFFF,
                                              )),
                                        ],
                                      ),
                                    ),
                                    9.hGap,
                                    MtInkWell(
                                      onTap: () {
                                        Get.toNamed(RouteNames.teamMemberPage);
                                      },
                                      child: Container(
                                        width: 105.w,
                                        height: 37.w,
                                        padding: EdgeInsets.only(
                                            left: 11.5.w, right: 9.w),
                                        decoration: BoxDecoration(
                                            color: AppColors.cFFFFFF,
                                            borderRadius:
                                                BorderRadius.circular(6.w)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "LINE-UP",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  height: 1,
                                                  color: AppColors.c262626,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                ),
                                              ),
                                            ),
                                            IconWidget(
                                              icon: Assets
                                                  .commonUiCommonIconSystemJumpto,
                                              iconWidth: 8.w,
                                              iconColor: AppColors.c000000,
                                              // rotateAngle: -90,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Positioned(
                              top: 86.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 1),
                            ),
                            Positioned(
                              top: 86.w,
                              left: 36.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 2),
                            ),
                            Positioned(
                              top: 86.w,
                              right: 36.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 3),
                            ),
                            Positioned(
                              top: 196.w,
                              left: 91.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 4),
                            ),
                            Positioned(
                              top: 196.w,
                              right: 91.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.w,
                      child: Container(
                        width: 343.w,
                        height: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(9.w)),
                          gradient: RadialGradient(
                            radius: 5.w,
                            colors: [
                              AppColors.c333333,
                              AppColors.c262626,
                            ],
                          ),
                        ),
                        // child:  SlotButton(),
                        child: ctrl.showExChange
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    width: 137.w,
                                    height: 44.w,
                                    text: 'CANCEL',
                                    backgroundColor: Colors.transparent,
                                    borderColor: AppColors.cB3B3B3,
                                    textColor: Colors.white,
                                    type: ButtonType.cancel,
                                    fontSize: 19.sp,
                                    onPressed: () {
                                      ctrl.showExChange = false;
                                      ctrl.update();
                                    },
                                  ),
                                  19.hGap,
                                  CustomButton(
                                    width: 137.w,
                                    height: 44.w,
                                    fontSize: 19.sp,
                                    text: 'Substitute'.toUpperCase(),
                                    backgroundColor: AppColors.cDF2A3D,
                                    borderColor: AppColors.cDF2A3D,
                                    textColor: AppColors.cFFFFFF,
                                    type: ButtonType.cancel,
                                    onPressed: () {
                                      ctrl.playerChangeByCardPack();
                                    },
                                  ),
                                ],
                              )
                            : Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  // Positioned(
                                  //   top: 28.w,
                                  //   child: Image.asset(
                                  //     Assets.managerUiMangerNew211,
                                  //     width: 375.w,
                                  //     height: 41.w,
                                  //   ),
                                  // ),
                                  Positioned(
                                    top: 28.w,
                                    left: 0,
                                    child: BreathingArrows(),
                                  ),
                                  Positioned(
                                    top: 28.w,
                                    right: 0,
                                    child: BreathingArrows(isRight: true),
                                  ),
                                  Positioned(
                                    top: 12.w,
                                    left: 111.5.w,
                                    right: 111.5.w,
                                    bottom: 12.w,
                                    child: MtInkWell(
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        TeamIndexController ctrl = Get.find();
                                        ctrl.matchBattle();
                                      },
                                      child: Image.asset(
                                        Assets.managerUiMangerNew210,
                                        width: 120.w,
                                        height: 76.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Positioned(
                      top: 0.w,
                      left: 14.w,
                      right: 14.w,
                      bottom: 0.w,
                      child: Visibility(
                        visible: ctrl.showExChange,
                        child: Obx(() {
                          return AnimatedOpacity(
                            duration: 300.milliseconds,
                            opacity: ctrl.showExChange ? 1 : 0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  top: 143.w,
                                  child: Container(
                                    width: 36.w,
                                    height: 36.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.w),
                                        color: AppColors.c262626),
                                    child: IconWidget(
                                      icon: Assets
                                          .commonUiCommonIconSystemExchange,
                                      iconWidth: 18.w,
                                      rotateAngle: 90,
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: 300.milliseconds,
                                  top: ctrl.showChangeAnimated.value
                                      ? 185.w
                                      : 30.w,
                                  child: PlayerExchangeCard(
                                    playerId: ctrl.playerIdOld,
                                    isNew: false,
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: 300.milliseconds,
                                  top: ctrl.showChangeAnimated.value
                                      ? 30.w
                                      : 185.w,
                                  child: PlayerExchangeCard(
                                    playerId: ctrl.playerIdNew,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 20.vGap,
          ],
        ),
      );
    });
  }
}

class PlayerCardWidget extends GetView<TeamController> {
  // ignore: prefer_const_constructors_in_immutables
  PlayerCardWidget(
      {super.key, required this.teamPlayers, required this.position});

  final List<TeamPlayerInfoEntity> teamPlayers;
  final int position;

  @override
  Widget build(BuildContext context) {
    if (teamPlayers.isEmpty) return const SizedBox();
    TeamPlayerInfoEntity player = teamPlayers.firstWhere(
        (e) => e.position == position,
        orElse: () => TeamPlayerInfoEntity());
    return Column(
      children: [
        AnimatedSwitcher(
            duration: 300.milliseconds,
            transitionBuilder: (Widget child, Animation<double> animation) {
              //  var tween = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
              return SlideTransitionX(
                direction: AxisDirection.left,
                position: animation,
                showReverse: true,
                child: child,
              );
            },
            child: PlayerCard(
              key: Key(player.playerId.toString()),
              playerId: player.playerId,
              score: Utils.getPlayBaseInfo(player.playerId).playerScore,
            )),
        3.5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).ename,
          style: 12.w4(
            fontFamily: FontFamily.fOswaldMedium,
            height: 0.8,
            color: AppColors.cFFFFFF,
          ),
        ),
        // 2.5.vGap,
        // PlayerStartWidget(grade: player.breakThroughGrade),
        4.5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).position,
          style: 10.w4(
            fontFamily: FontFamily.fRobotoRegular,
            height: 0.8,
            color: AppColors.cFFFFFF,
          ),
        ),
      ],
    );
  }
}

class BreathingArrows extends StatefulWidget {
  final bool isRight;

  const BreathingArrows({super.key, this.isRight = false});

  @override
  _BreathingArrowsState createState() => _BreathingArrowsState();
}

class _BreathingArrowsState extends State<BreathingArrows>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<double>> _positionAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    // 为每个箭头创建错开的动画
    for (int i = 0; i < 3; i++) {
      _positionAnimations.add(
        Tween<double>(begin: 0, end: 0.2).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              i * 0.2, // 每个箭头错开20%的时间
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
      );

      _opacityAnimations.add(
        Tween<double>(begin: 0.6, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              i * 0.2,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimations[index].value,
              child: Transform.translate(
                offset: Offset(
                    (widget.isRight ? -1 : 1) *
                        _positionAnimations[index].value *
                        100.w,
                    0),
                child: IconWidget(
                  rotateAngle: widget.isRight ? 180 : 0,
                  icon: Assets.managerUiMangerNew217, // 替换为你的箭头图片路径
                  iconHeight: 41.w,
                  fit: BoxFit.fitHeight,
                  iconColor: AppColors.cFFFFFF, // 可自定义颜色
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

// 使用示例
class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('呼吸箭头')),
      body: Center(
        child: BreathingArrows(),
      ),
    );
  }
}

class PlayerStartWidget extends StatelessWidget {
  const PlayerStartWidget({super.key, required this.grade});
  final int grade;

  @override
  Widget build(BuildContext context) {
    int count = grade ~/ 2;
    int half = grade % 2;
    return SizedBox(
      width: 55.w,
      height: 18.5.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < 5; i++)
            count > i
                ? Positioned(
                    left: 8.5.w * i,
                    child: Image.asset(
                      Assets.managerUiManagerIconStar,
                      height: 18.5.w,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : (grade > i * 2)
                    ? Positioned(
                        left: 8.w * count,
                        child: Image.asset(
                          grade >= 9
                              ? Assets.managerUiManagerIconStar01
                              : Assets.managerUiManagerIconStar02,
                          height: 18.5.w,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Positioned(
                        left: 8.5.w * i,
                        child: Image.asset(
                          Assets.managerUiManagerIconAshstar,
                          height: 18.5.w,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
        ],
      ),
    );
  }
}
