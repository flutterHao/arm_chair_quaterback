import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/shoot_mark_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamBattleV2Page extends GetView<TeamBattleV2Controller> {
  const TeamBattleV2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<TeamBattleV2Controller>(
        init: TeamBattleV2Controller(),
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
                  Obx(() {
                    var isGameOver = controller.isGameOver.value;
                    if (isGameOver) {
                      return buildGameOverWidget(context);
                    }
                    return buildGameWidget(context);
                  }),
                  buildLiveText(context)
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  Column buildGameWidget(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () => controller.gameOver(),
            child: ClipRRect(
                borderRadius: BorderRadius.zero,
                child: buildBasketballCourt(context))),
        buildPlayersWidget(),
        10.vGap,
      ],
    );
  }

  Widget buildGameOverWidget(BuildContext context) {
    return InkWell(
      onTap: ()=> controller.showTactical(context),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(9.w)),
            height: 280.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 52.w,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "FINAL STATEMENT",
                      style: TextStyle(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontFamily: FontFamily.fOswaldBold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.w
                            ..color = AppColors.ccccccc),
                    ),
                  ),
                ),
                Positioned(
                    top: 78.w,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.asset(
                          Assets.managerUiManagerGameoverBg2,
                          fit: BoxFit.fitWidth,
                        )),
                        Expanded(
                            child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0),
                          child: Image.asset(
                            Assets.managerUiManagerGameoverBg2,
                            fit: BoxFit.fitWidth,
                          ),
                        ))
                      ],
                    )),
                Positioned(
                    top: 31.w,
                    child: Text(
                      "VICTORY",
                      style: 42.w7(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldBold),
                    )),
                Positioned(
                    top: 100.w,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.c000000,
                              border: Border.all(
                                color: AppColors.cB3B3B3,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(15.w)),
                          height: 31.w,
                          width: 243.w,
                          padding: EdgeInsets.only(left: 18.w, right: 37.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconWidget(
                                  iconWidth: 21.w,
                                  icon: Assets.teamUiIconTrophy01),
                              Text(
                                "15300",
                                style: 16.w5(
                                    color: AppColors.cFFFFFF,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                              Stack(
                                children: [
                                  IconWidget(
                                    iconWidth: 7.w,
                                    icon: Assets.commonUiCommonIconSystemJumpto,
                                    iconColor: AppColors.cB3B3B3,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 7.w),
                                      child: IconWidget(
                                          iconWidth: 7.w,
                                          icon: Assets
                                              .commonUiCommonIconSystemJumpto,
                                          iconColor: AppColors.cB3B3B3)),
                                ],
                              ),
                              Text(
                                "15300",
                                style: 16.w5(
                                    color: AppColors.c2DE298,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                              IconWidget(
                                iconWidth: 8.w,
                                icon: Assets.commonUiCommonIconSystemArrow,
                                rotateAngle: -90,
                                iconColor: AppColors.c2DE298,
                              ),
                            ],
                          ),
                        ),
                        14.vGap,
                        Container(
                          constraints: BoxConstraints(minHeight: 23.w),
                          child: IconWidget(
                              iconWidth: 60.w,
                              icon: Assets.managerUiManagerGift03),
                        ),
                        6.vGap,
                        Container(
                          constraints: BoxConstraints(maxWidth: 180.w),
                          child: Text(
                            "You've got a treasure chest",
                            textAlign: TextAlign.center,
                            style: 14.w4(
                                color: AppColors.c000000,
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 1.2),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          9.vGap,
        ],
      ),
    );
  }

  Container buildLiveText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          Container(
            height: 59.w,
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              children: List.generate(2, (index) {
                ///todo
                bool active = index == 1;
                return Container(
                  width: 82.w,
                  height: 28.w,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                      color: active ? AppColors.c000000 : AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(14.w),
                      border: Border.all(color: AppColors.c666666, width: 1.w)),
                  alignment: Alignment.center,
                  child: Text(
                    Utils.getSortWithInt(index + 1),
                    style: active
                        ? 16.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium)
                        : 16.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldRegular),
                  ),
                );
              }),
            ),
          ),
          Divider(
            color: AppColors.cD1D1D1,
            height: 1.w,
          ),
          SizedBox(
            height: 44.w * 5,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 44.w,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding: EdgeInsets.only(left: 1.w, right: 24.w),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.cE6E6E6, width: 1.w))),
                      child: Row(
                        children: [
                          Text(
                            "12:00",
                            style: 10.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          10.hGap,
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.5.w),
                                border: Border.all(
                                    color: AppColors.c1F8FE5, width: 1.5.w)),
                            child: ImageWidget(
                              url: "",
                              width: 28.w,
                              height: 28.w,
                              borderRadius: BorderRadius.circular(14.w),
                              imageFailedPath: Assets.teamUiHead03,
                            ),
                          ),
                          13.hGap,
                          Expanded(
                              child: Text(
                            "Kyrie Irving lost the ball",
                            maxLines: 3,
                            softWrap: true,
                            style: 12.w4(
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.c4D4D4D,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          )),
                          Text(
                            "0-0",
                            style: 12.w4(
                                color: AppColors.c4D4D4D,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          MtInkwell(
            child: Container(
              height: 44.w,
              margin: EdgeInsets.only(right: 20.w),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SEE ALL",
                    style: 16.w7(
                        color: AppColors.c262626,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                  6.hGap,
                  IconWidget(
                    iconWidth: 5.w,
                    icon: Assets.commonUiCommonIconSystemJumpto,
                    iconColor: AppColors.c000000,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildPlayersWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        16.hGap,
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              ///todo
              var active = index == 2;
              return Container(
                  margin: EdgeInsets.only(right: 4.w, bottom: active ? 8.w : 0),
                  child: ImageWidget(
                    url: "",
                    imageFailedPath: Assets.iconUiDefault04,
                    width: 28.w,
                    color: active ? AppColors.c1F8FE5 : AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(4.w),
                    height: 36.w,
                  ));
            }),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(5, (index) {
              return Container(
                  margin: EdgeInsets.only(right: 4.w),
                  child: ImageWidget(
                    url: "",
                    imageFailedPath: Assets.iconUiDefault04,
                    width: 28.w,
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(4.w),
                    height: 36.w,
                  ));
            }),
          ),
        ),
        16.hGap,
      ],
    );
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
                        child: Stack(
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
                              Color color = item.isBlue
                                  ? AppColors.c1F8FE5
                                  : AppColors.cD60D20;
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
                          ],
                        ),
                      );
                    }),
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (logic) {
                      if (controller.shootHistory.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      var last = controller.shootHistory.last;
                      return Positioned(
                          top: last.shootLocation.dy - 20.w - 7.w + 38.w,
                          right: last.shootLocation.dx - 12.w,
                          child: ShootMarkAnimationWidget(
                            child: Icon(
                              Icons.location_on_rounded,
                              color: last.isBlue
                                  ? AppColors.c1F8FE5
                                  : AppColors.cD60D20,
                            ),
                          ));
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
          Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            height: 45.w,
            child: BarrageWall(
              width: MediaQuery.of(context).size.width,
              height: 45.w,
              bullets: controller.getNormalBullets(),
              controller: controller.normalBarrageWallController,
              child: Container(),
            ),
          ),
          //高光时刻弹幕
          Positioned(
            bottom: 5.w,
            width: MediaQuery.of(context).size.width,
            height: 30.w,
            child: BarrageWall(
              width: MediaQuery.of(context).size.width,
              height: 30.w,
              bullets: controller.getHighLightBullets(),
              controller: controller.highLightBarrageWallController,
              child: Container(),
            ),
          )
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
              Container(
                width: 45.w,
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  int score = controller.redScore.value;
                  return AnimatedNum(
                    number: score,
                    milliseconds: 300,
                    textStyle: 24.w7(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  );
                }),
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
              Container(
                width: 45.w,
                alignment: Alignment.centerRight,
                child: Obx(() {
                  int score = controller.blueScore.value;
                  return AnimatedNum(
                    number: score,
                    milliseconds: 300,
                    textStyle: 24.w7(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  );
                }),
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
