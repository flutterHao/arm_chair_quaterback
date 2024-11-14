import 'dart:math';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../../common/entities/battle_entity.dart';

///
///@auther gejiahui
///created at 2024/10/9/16:34

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late TeamBattleController controller;
  var myTeamActive = true.obs;

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return Container(
      margin: EdgeInsets.only(top: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColors.cD8D8D8,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
      child: Column(
        children: [
          11.vGap,
          Obx(() {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    if (!myTeamActive.value) myTeamActive.value = true;
                  },
                  child: Container(
                    width: 92.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                        color: myTeamActive.value
                            ? AppColors.c262626
                            : AppColors.cE6E6E6,
                        borderRadius: BorderRadius.circular(12.w)),
                    alignment: Alignment.center,
                    child: Text(
                      "My team",
                      style: 13.w4(
                          color: myTeamActive.value
                              ? AppColors.cF2F2F2
                              : AppColors.c262626),
                    ),
                  ),
                ),
                12.hGap,
                InkWell(
                  onTap: () {
                    if (myTeamActive.value) myTeamActive.value = false;
                  },
                  child: Container(
                    width: 92.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                        color: myTeamActive.value
                            ? AppColors.cE6E6E6
                            : AppColors.c262626,
                        borderRadius: BorderRadius.circular(12.w)),
                    alignment: Alignment.center,
                    child: Text(
                      "Opponent",
                      style: 13.w4(
                          color: myTeamActive.value
                              ? AppColors.c262626
                              : AppColors.cF2F2F2),
                    ),
                  ),
                )
              ],
            );
          }),
          21.vGap,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16.w))),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    //表头
                    SizedBox(
                      height: 36.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 58.w,
                          ),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "PLAYER",
                                    style: 10.w4(color: AppColors.c666666),
                                  ))),
                          SizedBox(
                            width: 50.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SCORE",
                                  style: 10.w4(color: AppColors.c666666),
                                ),
                                3.hGap,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.rotate(
                                        angle: -90 * pi / 180,
                                        child: IconWidget(
                                          iconWidth: 5.w,
                                          icon: Assets.playerUiIconArrows01,
                                          iconColor: AppColors.cB3B3B3,
                                        )),
                                    Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: IconWidget(
                                          iconWidth: 5.w,
                                          icon: Assets.playerUiIconArrows01,
                                          iconColor: AppColors.cFF7954,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "PTS",
                                    style: 10.w4(color: AppColors.c666666),
                                  ),
                                  3.hGap,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Transform.rotate(
                                          angle: -90 * pi / 180,
                                          child: IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.playerUiIconArrows01,
                                            iconColor: AppColors.cB3B3B3,
                                          )),
                                      Transform.rotate(
                                          angle: 90 * pi / 180,
                                          child: IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.playerUiIconArrows01,
                                            iconColor: AppColors.cFF7954,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "REB",
                                    style: 10.w4(color: AppColors.c666666),
                                  ),
                                  3.hGap,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Transform.rotate(
                                          angle: -90 * pi / 180,
                                          child: IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.playerUiIconArrows01,
                                            iconColor: AppColors.cB3B3B3,
                                          )),
                                      Transform.rotate(
                                          angle: 90 * pi / 180,
                                          child: IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.playerUiIconArrows01,
                                            iconColor: AppColors.cFF7954,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "STL",
                                    style: 10.w4(color: AppColors.c666666),
                                  ),
                                  3.hGap,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Transform.rotate(
                                          angle: -90 * pi / 180,
                                          child: IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.playerUiIconArrows01,
                                            iconColor: AppColors.cB3B3B3,
                                          )),
                                      Transform.rotate(
                                          angle: 90 * pi / 180,
                                          child: IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.playerUiIconArrows01,
                                            iconColor: AppColors.cFF7954,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Obx(() {
                          List<ScoreBoardDetails> list = myTeamActive
                              .value
                              ? controller
                              .battleEntity.gameData.homeScoreBoardDetails
                              : controller.battleEntity.gameData
                              .awayScoreBoardDetails;
                          var playerList = myTeamActive.value
                              ? controller.battleEntity.homeTeamPlayerList
                              : controller.battleEntity
                              .awayTeamPlayerList;
                          return Column(children: [
                            ...List.generate(list.length, (index) {
                              var item = list[index];
                              var playBaseInfo = Utils.getPlayBaseInfo(
                                  item.playerId);
                              var teamPlayer = playerList.firstWhere((
                                  e) => e.playerId == item.playerId);
                              return SizedBox(
                                height: 59.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start,
                                  children: [
                                    const Divider(
                                      height: 1,
                                      color: AppColors.cCFCFCF,
                                    ),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 58.w,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                RotatedBox(
                                                    quarterTurns: -1,
                                                    child: Text(
                                                      playBaseInfo
                                                          .position,
                                                      textAlign: TextAlign
                                                          .center,
                                                      style:
                                                      16.w7(
                                                          color: AppColors
                                                              .cD8D8D8,
                                                          height: 1),
                                                    )),
                                                PlayerAvatarWidget(
                                                  width: 36.w,
                                                  playerId: item.playerId,
                                                  fontColor: AppColors
                                                      .c262626,
                                                  backgroundColor:
                                                  AppColors.cD9D9D9,
                                                ),
                                                6.hGap,
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    playBaseInfo.ename,
                                                    style: 12.w4(
                                                        color: AppColors
                                                            .c262626,
                                                        height: 1,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  4.vGap,
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .c666666,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                2.w)),
                                                        child: Text(
                                                          playBaseInfo
                                                              .position,
                                                          style: 10.w4(
                                                              color:
                                                              AppColors
                                                                  .cF2F2F2,
                                                              height: 1),
                                                        ),
                                                      ),
                                                      3.hGap,
                                                      Stack(
                                                        alignment: Alignment
                                                            .center,
                                                        children: [
                                                          IconWidget(
                                                            iconWidth: 14
                                                                .w,
                                                            icon: Assets
                                                                .playerUiIconStar01,
                                                            iconColor:
                                                            AppColors
                                                                .cFF7954,
                                                          ),
                                                          Positioned(
                                                              top: 2.w,
                                                              child: Text(
                                                                '${teamPlayer
                                                                    .breakThroughGrade}',
                                                                style: 9
                                                                    .w7(
                                                                    color: AppColors
                                                                        .cFFFFFF),
                                                              ))
                                                        ],
                                                      ),
                                                      3.hGap,
                                                      IconWidget(
                                                          iconWidth: 12.w,
                                                          icon: Assets
                                                              .playerUiStateBest)
                                                    ],
                                                  )
                                                ],
                                              )),
                                          SizedBox(
                                            width: 50.w,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "8.9",//todo 策划还没想好
                                                  style: 14.w7(
                                                      color: index == 0
                                                          ? AppColors
                                                          .c3B93FF
                                                          : AppColors
                                                          .c262626,
                                                      height: 1),
                                                ),
                                                Visibility(
                                                  visible: index == 0,
                                                  child: Container(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.w),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .c3B93FF,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            4.w)),
                                                    child: Text(
                                                      "SVP",//todo 策划还没想好
                                                      style: 12.w7(
                                                          color:
                                                          AppColors
                                                              .cFFFFFF),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              width: 50.w,
                                              child: Center(
                                                child: Text(
                                                  "${item.pts}",
                                                  style: 12.w4(
                                                      color: AppColors
                                                          .c262626),
                                                ),
                                              )),
                                          SizedBox(
                                              width: 50.w,
                                              child: Center(
                                                child: Text(
                                                  "${item.reb}",
                                                  style: 12.w4(
                                                      color: AppColors
                                                          .c262626),
                                                ),
                                              )),
                                          SizedBox(
                                              width: 50.w,
                                              child: Center(
                                                child: Text(
                                                  "${item.stl}",
                                                  style: 12.w4(
                                                      color: AppColors
                                                          .c262626),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                            100.vGap,
                          ]);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
