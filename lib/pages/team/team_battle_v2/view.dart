import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/place_holder_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamBattleV2Page extends GetView<TeamBattleV2Controller> {
  const TeamBattleV2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleV2Controller>(
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            showPop: true,
          ),
          bodyWidget: Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                buildBasketballCourt(),
              ],
            ),
          )),
        );
      },
    );
  }

  SizedBox buildBasketballCourt() {
    return SizedBox(
      height: 156.w,
      width: double.infinity,
      child: Stack(
        children: [
          //球场整行的宽高
          Positioned(
            top: 38.w,
            left: 9.w,
            right: 9.w,
            child: Stack(
              children: [
                //球场
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
                        transform: Matrix4.identity()..scale(-1.0, 1.0),
                        child: Image.asset(
                          Assets.managerUiManagerCourt,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                //球员
                Positioned(
                    top: 20,
                    right: 45,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateX(pi / 3),
                      child: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                            color: AppColors.c1F8FE5,
                            borderRadius: BorderRadius.circular(10.w)),
                      ),
                    ))
              ],
            ),
          ),
          //普通弹幕
          Positioned(
              top: 0,
              left: 20,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(11.w),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.cDEDEDE,
                          offset: Offset(3.w, 3.w),
                          blurRadius: 3.w)
                    ]),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                height: 21.w,
                child: Text(
                  "DAMN IT !!!",
                  style: 12.w4(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoRegular),
                ),
              )),
          //高光时刻弹幕
          Positioned(
              bottom: 5.w,
              left: 200,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(14.w),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.cDEDEDE,
                          offset: Offset(3.w, 3.w),
                          blurRadius: 3.w)
                    ]),
                padding: EdgeInsets.only(left: 4.w, right: 12.w),
                height: 28.w,
                child: Row(
                  children: [
                    ImageWidget(
                      url: "",
                      imageFailedPath: Assets.testTestTeamLogo,
                      width: 20.w,
                      height: 20.w,
                    ),
                    7.hGap,
                    Text(
                      "Kyrie Irving makes free throw 1of 2",
                      style: 12.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 101.w,
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      margin: EdgeInsets.only(bottom: 9.w),
      decoration: BoxDecoration(color: AppColors.cFFFFFF, boxShadow: [
        BoxShadow(
            color: AppColors.cDEDEDE,
            offset: Offset(0, 9.w),
            blurRadius: 9.w,
            spreadRadius: -5.w)
      ]),
      child: Column(
        children: [
          12.vGap,
          Row(
            children: [
              16.hGap,
              ImageWidget(
                url: "",
                imageFailedPath: Assets.teamUiHead01,
                width: 36.w,
                borderRadius: BorderRadius.circular(18.w),
              ),
              10.hGap,
              Text(
                "198",
                style: 24.w7(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  "1st 11:45",
                  style: 12.w4(
                      color: AppColors.c10A86A,
                      height: 1,
                      fontFamily: FontFamily.fRobotoRegular),
                ),
              )),
              Text(
                "198",
                style: 24.w7(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold),
              ),
              10.hGap,
              ImageWidget(
                url: "",
                imageFailedPath: Assets.teamUiHead03,
                width: 36.w,
                borderRadius: BorderRadius.circular(18.w),
              ),
              16.hGap,
            ],
          ),
          5.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "My name",
                    style: 12.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  5.vGap,
                  Container(
                    width: 68.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 68.w * 0.4,
                        height: 6.w,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          AppColors.cB3B3B3,
                          AppColors.c000000
                        ])),
                      ),
                    ),
                  ),
                  4.vGap,
                  Text(
                    "POW:25130",
                    style: 10.w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Player name",
                    style: 12.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  5.vGap,
                  Container(
                    width: 68.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                        color: AppColors.c000000,
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 68.w * 0.5,
                        height: 6.w,
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: AppColors.cFFFFFF, width: 1)),
                            gradient: LinearGradient(colors: [
                              AppColors.c022A1D,
                              AppColors.c23E8A9
                            ])),
                      ),
                    ),
                  ),
                  4.vGap,
                  Text(
                    "POW:25130",
                    style: 10.w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
