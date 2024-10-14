import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/10/14/10:02

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 63.w + 88.w + 6.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            top: 14.w + 34.w + 18.w,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                height: 306.w,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.circular(16.w)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    width: 18.w,
                                    height: 18.w,
                                    margin: EdgeInsets.only(top: 9.w, right: 9.w),
                                    child: IconWidget(
                                      iconWidth: 18.w,
                                      icon: Assets.uiIconEyesPng,
                                      iconColor: AppColors.c666666,
                                    )),
                              ],
                            ),
                            5.vGap,
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ArcWidget(
                                  85.w,
                                  borderColor: AppColors.c666666,
                                  progressColor: AppColors.cFF7954,
                                  progressWidth: 16,
                                  borderWidth: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("25",style: 42.w7(color: AppColors.cFF7954,height: 1),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("TEAM LEVEL",style: 12.w7(color: AppColors.c666666,height: 1),),
                                        3.hGap,
                                        IconWidget(iconWidth: 12.w, icon: Assets.uiIconMsgPng,iconColor: AppColors.c666666,),
                                      ],
                                    ),
                                    Text("2345/12512",style: 10.w4(color: AppColors.c666666),)

                                  ],
                                )

                              ],
                            ),
                            24.vGap,
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: const Divider(height: 1,color: AppColors.c666666,)),
                            Container(
                              height: 46.w,
                              margin: EdgeInsets.symmetric(horizontal: 24.w),
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                children: [
                                  IconWidget(iconWidth: 18.w, icon: Assets.uiIconWinPng,iconColor: AppColors.cFF7954,),
                                  10.hGap,
                                  Expanded(child: Text("Win rate",style: 12.w4(color: AppColors.c666666),)),
                                  Text("56%",style: 16.w7(color: AppColors.cFFFFFF),)
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: const Divider(height: 1,color: AppColors.c666666,)),
                            Container(
                              height: 46.w,
                              margin: EdgeInsets.symmetric(horizontal: 24.w),
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                children: [
                                  IconWidget(iconWidth: 18.w, icon: Assets.uiIconScorePng,iconColor: AppColors.cFF7954,),
                                  10.hGap,
                                  Expanded(child: Text("Top score",style: 12.w4(color: AppColors.c666666),)),
                                  Text("98",style: 16.w7(color: AppColors.cFFFFFF),)
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: const Divider(height: 1,color: AppColors.c666666,)),
                            Container(
                              height: 46.w,
                              margin: EdgeInsets.symmetric(horizontal: 24.w),
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                children: [
                                  IconWidget(iconWidth: 18.w, icon: Assets.uiIconWinningPng,iconColor: AppColors.cFF7954,),
                                  10.hGap,
                                  Expanded(child: Text("Winning streak",style: 12.w4(color: AppColors.c666666),)),
                                  Text("11",style: 16.w7(color: AppColors.cFFFFFF),)
                                ],
                              ),
                            ),
                            14.vGap
                          ],
                        ),
                      ),
                    ),
                    8.hGap,
                    Flexible(flex: 1, child: Column(
                      children: [
                        Container(
                          height: 84.w,
                          padding: EdgeInsets.only(left: 14.w,right: 16.w),
                          decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.circular(16.w)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("999K",style: 16.w7(color: AppColors.cFFFFFF,height: 1),),
                                  8.hGap,
                                  Text("/999K",style: 10.w4(color: AppColors.c666666,height: 1),)
                                ],
                              ),
                              7.vGap,
                              LinearProgressIndicator(
                                color: AppColors.cB3B3B3,
                                value: 0.8,
                                minHeight: 4.w,
                                backgroundColor: AppColors.c666666,
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              15.vGap,
                              Text("Salary",style: 12.w4(color: AppColors.c666666,height: 1),)
                            ],
                          ),
                        ),
                        9.vGap,
                        Expanded(child: Container(
                          padding: EdgeInsets.only(left: 14.w,right: 16.w),
                          decoration: BoxDecoration(
                              color: AppColors.c262626,
                              borderRadius: BorderRadius.circular(16.w)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(iconWidth: 40.w, icon: Assets.uiIconTrophy_01Png),
                              28.vGap,
                              Text("2156",style: 21.w7(color: AppColors.cFFFFFF,height: 1),),
                              9.vGap,
                              Text("Current",style: 12.w4(color: AppColors.c666666),),
                              20.vGap,
                              Text("2156",style: 21.w7(color: AppColors.cFFFFFF,height: 1),),
                              9.vGap,
                              Text("Highest",style: 12.w4(color: AppColors.c666666),),
                            ],
                          ),
                        ))
                      ],
                    ))
                  ],
                ),
              ),
              33.vGap,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Main",style: 19.w7(color: AppColors.c262626,height: 1),),
                    8.hGap,
                    Expanded(child: Text("expend more stamina",style: 10.w4(color: AppColors.c666666,height: 1),)),
                    SizedBox(
                      width: 18.w,
                      height: 18.w,
                      child: IconWidget(iconWidth: 18.w, icon: Assets.uiIconEyesPng,iconColor: AppColors.cB3B3B3,),
                    )
                  ],
                ),
              ),
              ...List.generate(10, (index){
                return Container(
                  margin: EdgeInsets.only(top: 13.w,right: 16.w),
                  height: 84.w,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 84.w,
                        width: 40.w,
                        color: AppColors.c3B93FF,
                        alignment: Alignment.centerLeft,
                        child: Transform.rotate(angle: pi/180 * -90,
                        child: Text("C",style: 21.w7(color: AppColors.c2170D2),)),
                      ),
                      Container(
                        height: 84.w,
                        margin: EdgeInsets.only(left: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)
                        ),
                        child: Row(
                          children: [
                            10.hGap,
                            const PlayerAwater(backgroudColor: AppColors.cE1E1E1,),
                            4.hGap,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 12.w,
                                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.c000000.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(6.w)
                                      ),
                                      child: Row(
                                        children: [
                                          Text("OVR",style: 10.w4(color: AppColors.cB3B3B3,height: 1),),
                                          8.hGap,
                                          Text("185%",style: 10.w4(color: AppColors.c262626,height: 1),)
                                        ],
                                      ),
                                    ),
                                    4.hGap,
                                    Container(
                                      height: 12.w,
                                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                                      decoration: BoxDecoration(
                                          color: AppColors.c000000.withOpacity(0.05),
                                          borderRadius: BorderRadius.circular(6.w)
                                      ),
                                      child: Row(
                                        children: [
                                          Text("SAL",style: 10.w4(color: AppColors.cB3B3B3,height: 1),),
                                          8.hGap,
                                          Text("250k",style: 10.w4(color: AppColors.c262626,height: 1),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                6.vGap,
                                Container(
                                  margin: EdgeInsets.only(left: 6.w),
                                    child: Text("Player Name",style: 16.w4(color: AppColors.c262626),)),
                                6.vGap,
                                Container(
                                  margin: EdgeInsets.only(left: 6.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 12.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(horizontal:3.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.c666666,
                                          borderRadius: BorderRadius.circular(2.w)
                                        ),
                                        child: Text("SG",style: 10.w7(color: AppColors.cF2F2F2,height: 1),),
                                      ),
                                      6.hGap,
                                      IconWidget(iconWidth: 12.w, icon: Assets.uiStateBestPng)
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
              100.vGap
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
