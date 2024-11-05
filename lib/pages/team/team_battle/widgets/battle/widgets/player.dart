import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/9/16:34

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  var myTeamActive = true.obs;

  @override
  Widget build(BuildContext context) {
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
                                        icon: Assets.uiIconArrows_01Png,
                                        iconColor: AppColors.cB3B3B3,
                                      )),
                                  Transform.rotate(
                                      angle: 90 * pi / 180,
                                      child: IconWidget(
                                        iconWidth: 5.w,
                                        icon: Assets.uiIconArrows_01Png,
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
                                          icon: Assets.uiIconArrows_01Png,
                                          iconColor: AppColors.cB3B3B3,
                                        )),
                                    Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: IconWidget(
                                          iconWidth: 5.w,
                                          icon: Assets.uiIconArrows_01Png,
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
                                          icon: Assets.uiIconArrows_01Png,
                                          iconColor: AppColors.cB3B3B3,
                                        )),
                                    Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: IconWidget(
                                          iconWidth: 5.w,
                                          icon: Assets.uiIconArrows_01Png,
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
                                          icon: Assets.uiIconArrows_01Png,
                                          iconColor: AppColors.cB3B3B3,
                                        )),
                                    Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: IconWidget(
                                          iconWidth: 5.w,
                                          icon: Assets.uiIconArrows_01Png,
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
                      child: Column(children: [
                        ...List.generate(20, (index) {
                          return SizedBox(
                            height: 59.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Transform.rotate(
                                                angle: pi / 180 * -90,
                                                child: Text(
                                                  "C",
                                                  style: 16.w7(
                                                      color: AppColors.cD8D8D8),
                                                )),
                                            PlayerAvatarWidget(
                                              width: 36.w,
                                              fontColor: AppColors.c262626,
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
                                            "Player Name",
                                            style: 12.w4(
                                                color: AppColors.c262626,
                                                height: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          4.vGap,
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.c666666,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.w)),
                                                child: Text(
                                                  "SG",
                                                  style: 10.w4(
                                                      color: AppColors.cF2F2F2,
                                                      height: 1),
                                                ),
                                              ),
                                              3.hGap,
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  IconWidget(
                                                    iconWidth: 14.w,
                                                    icon:
                                                        Assets.uiIconStar_01Png,
                                                    iconColor:
                                                        AppColors.cFF7954,
                                                  ),
                                                  Positioned(
                                                      top: 2.w,
                                                      child: Text(
                                                        '1',
                                                        style: 9.w7(
                                                            color: AppColors
                                                                .cFFFFFF),
                                                      ))
                                                ],
                                              ),
                                              3.hGap,
                                              IconWidget(
                                                  iconWidth: 12.w,
                                                  icon: Assets.uiStateBestPng)
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
                                              "8.9",
                                              style: 14.w7(
                                                  color: index == 0
                                                      ? AppColors.c3B93FF
                                                      : AppColors.c262626,
                                                  height: 1),
                                            ),
                                            Visibility(
                                              visible: index == 0,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w),
                                                decoration: BoxDecoration(
                                                    color: AppColors.c3B93FF,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.w)),
                                                child: Text(
                                                  "SVP",
                                                  style: 12.w7(
                                                      color: AppColors.cFFFFFF),
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
                                              "15.6",
                                              style: 12
                                                  .w4(color: AppColors.c262626),
                                            ),
                                          )),
                                      SizedBox(
                                          width: 50.w,
                                          child: Center(
                                            child: Text(
                                              "15.6",
                                              style: 12
                                                  .w4(color: AppColors.c262626),
                                            ),
                                          )),
                                      SizedBox(
                                          width: 50.w,
                                          child: Center(
                                            child: Text(
                                              "15.6",
                                              style: 12
                                                  .w4(color: AppColors.c262626),
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
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
