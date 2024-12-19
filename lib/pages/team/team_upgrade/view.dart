import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamUpgradePage extends GetView<TeamUpgradeController> {
  const TeamUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    var playerId = Get.arguments['playerId'];
    return HorizontalDragBackWidget(
      child: GetBuilder<TeamUpgradeController>(
        init: TeamUpgradeController(playerId),
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
              child: Obx(() {
                if (controller.loadStatus.value != LoadDataStatus.success) {
                  return Center(
                    child: LoadStatusWidget(
                      loadDataStatus: controller.loadStatus.value,
                    ),
                  );
                }
                return Column(
                  children: [
                    ..._buildHeader(context, playerId),
                    Expanded(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 9.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(12.w)),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    20.vGap,
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 16.w),
                                          child: Text(
                                            "ABILITY",
                                            style: 30.w7(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldBold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    26.vGap,
                                    ...List.generate(8, (index) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 17.w),
                                        child: Row(
                                          children: [
                                            29.hGap,
                                            Text(
                                              "FGM",
                                              style: 16.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fOswaldRegular),
                                            ),
                                            19.hGap,
                                            SizedBox(
                                              height: 12.w,
                                              width: 235.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6.w),
                                                child:
                                                    Builder(builder: (context) {
                                                  double value = Random()
                                                          .nextInt(100)
                                                          .toDouble() +
                                                      70;
                                                  double total = value + 20;
                                                  double baseValue = 30;
                                                  double beforeUpgradeValue =
                                                      50;
                                                  double afterUpgradeValue = 60;
                                                  double maxProgress =
                                                      value / total;
                                                  double baseProgress =
                                                      baseValue / total;
                                                  double beforeProgress =
                                                      beforeUpgradeValue /
                                                          total;
                                                  double afterProgress =
                                                      afterUpgradeValue / total;

                                                  return Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      /// 边框
                                                      Container(
                                                        height: 12.w,
                                                        width: 235.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.w),
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .cD1D1D1,
                                                                width: 1.w)),
                                                      ),
                                                      AnimatedPositioned(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          left: -(235.w *
                                                              (1 -
                                                                  maxProgress)),
                                                          child: Container(
                                                            width: 235.w,
                                                            height: 10.w,
                                                            decoration: BoxDecoration(
                                                                border: Border(
                                                                    right: BorderSide(
                                                                        color: AppColors
                                                                            .c000000,
                                                                        width: 2
                                                                            .w))),
                                                          )),

                                                      /// 升级后
                                                      AnimatedPositioned(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          left: -(235.w *
                                                              (1 -
                                                                  afterProgress)),
                                                          child: Container(
                                                            height: 12.w,
                                                            width: 235.w,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .cFFD133,
                                                                borderRadius: BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            6.w))),
                                                          )),

                                                      /// 升级前
                                                      AnimatedPositioned(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          left: -(235.w *
                                                              (1 -
                                                                  beforeProgress)),
                                                          child: Container(
                                                            height: 12.w,
                                                            width: 235.w,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .cFF7954,
                                                                borderRadius: BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            6.w))),
                                                          )),

                                                      /// 基础
                                                      AnimatedPositioned(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          left: -(235.w *
                                                              (1 -
                                                                  baseProgress)),
                                                          child: Container(
                                                            height: 12.w,
                                                            width: 235.w,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .c000000,
                                                                borderRadius: BorderRadius.horizontal(
                                                                    left: Radius
                                                                        .circular(
                                                                            6.w))),
                                                          )),
                                                    ],
                                                  );
                                                }),
                                              ),
                                            ),
                                            9.hGap,
                                            Text(
                                              "3000",
                                              style: 16.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fOswaldRegular),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    16.vGap,
                                    MtInkwell(
                                      onTap: () {
                                        print('upgrade--------');
                                      },
                                      child: Container(
                                        height: 51.w,
                                        width: 343.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.c000000,
                                            borderRadius:
                                                BorderRadius.circular(9.w)),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              "UPGRADE",
                                              style: 23.w5(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium),
                                            ),
                                            Positioned(
                                                right: 13.w,
                                                child: IconWidget(
                                                    iconWidth: 11.w,
                                                    icon: Assets
                                                        .commonUiCommonIconSystemJumpto))
                                          ],
                                        ),
                                      ),
                                    ),
                                    21.vGap,
                                  ],
                                ),
                                Positioned(
                                    right: 10.w,
                                    top: 10.w,
                                    child: ShareWidget(
                                        globalKey: GlobalKey())) //todo
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 9.w),
                            decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            child: Column(
                              children: [
                                20.vGap,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 16.w),
                                      child: Text(
                                        "OFFENSIVE",
                                        style: 24.w7(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily: FontFamily.fOswaldBold),
                                      ),
                                    ),
                                  ],
                                ),
                                22.vGap,
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 29.w, right: 16.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(3, (index) {
                                      double progress = Random().nextDouble();

                                      var borderSweepAngle = 190.0;

                                      var progressSweepAngle =
                                          progress * borderSweepAngle;

                                      progress = progress * 100;
                                      return Container(
                                        height: 99.w,
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                          height: 52.w,
                                          width: 90.w,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              ArcWidget(
                                                45.w,
                                                borderColor: AppColors.cE1E1E1,
                                                progressColor:
                                                    AppColors.cFF7954,
                                                progressWidth: 7.w,
                                                progressSweepAngle:
                                                    progressSweepAngle,
                                                borderWidth: 7.w,
                                                startAngle: 170,
                                                borderSweepAngle:
                                                    borderSweepAngle,
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${progress.format()}%",
                                                      style: 20.w7(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldBold),
                                                    ),
                                                    7.vGap,
                                                    Text(
                                                      "LAYUP",
                                                      style: 10.w4(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoRegular),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 16.w),
                                      child: Text(
                                        "ADDITIONAL",
                                        style: 24.w7(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily: FontFamily.fOswaldBold),
                                      ),
                                    ),
                                  ],
                                ),
                                16.vGap,
                                Divider(
                                  color: AppColors.cD1D1D1,
                                  height: 1.w,
                                ),
                                Container(
                                  height: 110.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(3, (index){
                                          return SizedBox(
                                            width: 125.w,
                                            height: 28.w,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Midline defense",
                                                    style: 12.w4(
                                                        color: AppColors.c000000,
                                                        height: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  ),
                                                ),
                                                15.hGap,
                                                Text(
                                                  "2630",
                                                  style: 12.w4(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fRobotoRegular),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                      56.hGap,
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: List.generate(3, (index){
                                          return SizedBox(
                                            width: 125.w,
                                            height: 28.w,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Midline defense",
                                                    style: 12.w4(
                                                        color: AppColors.c000000,
                                                        height: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  ),
                                                ),
                                                15.hGap,
                                                Text(
                                                  "2630",
                                                  style: 12.w4(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fRobotoRegular),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Divider(
                                      color: AppColors.cD1D1D1,
                                      height: 1.w,
                                    )),
                                21.vGap,
                              ],
                            ),
                          ),
                          9.vGap,
                        ],
                      ),
                    ))
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context, int playerId) {
    return [
      Container(
        height: 117.w,
        width: double.infinity,
        color: Utils.getTeamColor(controller.playerBaseInfo.teamId),
        child: Stack(
          children: [
            Row(
              children: [
                20.hGap,
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 116.w,
                      width: 144.w,
                      child: ImageWidget(
                        url: Utils.getPlayUrl(playerId),
                        imageFailedPath: Assets.iconUiDefault04,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Positioned(
                      right: 2.w,
                      top: 18.w,
                      child: Container(
                        width: 29.w,
                        height: 16.w,
                        margin: EdgeInsets.only(right: 3.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Text(
                          controller.teamPlayerInfo.position > 0
                              ? "MAIN"
                              : "SUB",
                          style: 10.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                8.hGap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      18.vGap,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.getLastName(),
                          style: 16.w4(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        ),
                      ),
                      4.vGap,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.getLastName(),
                          style: 24.w5(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                      ),
                      11.vGap,
                      Row(
                        children: [
                          Text(
                            "${Utils.getTeamInfo(controller.playerBaseInfo.teamId).shortEname} · ${controller.playerBaseInfo.position}",
                            style: 12.w4(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          10.hGap,
                          IconWidget(
                              iconWidth: 16.w,
                              icon: Utils.getStatusUrl(
                                  controller.teamPlayerInfo.playerStatus)),
                          6.hGap,
                          IconWidget(
                              iconWidth: 16.w,
                              icon: Assets.commonUiCommonIconInjury),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: 18.w,
                left: 16.w,
                bottom: 8.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Text(
                          "S",
                          style: TextStyle(
                            fontSize: 30.sp,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamily.fRobotoRegular,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.w
                              ..color = AppColors.cFFFFFF,
                          ),
                        ),
                        Text(
                          "S",
                          style: TextStyle(
                            fontSize: 30.sp,
                            height: 1,
                            color: AppColors.c000000,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.managerUiManagerPlayerstar),
                        Text(
                          "${controller.teamPlayerInfo.getBreakThroughGrade()}",
                          style: 13.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fRobotoMedium,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${controller.playerBaseInfo.playerScore}",
                          style: 19.w7(
                              height: 1,
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fOswaldBold),
                        ),
                        Text(
                          "OVR",
                          style: 10.w4(
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      Container(
        height: 37.w,
        width: double.infinity,
        color: AppColors.cFFFFFF,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.hGap,
            Expanded(
              flex: 114,
              child: Container(
                width: 114.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "POWER",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Text(
                      "${controller.teamPlayerInfo.power}",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
              ),
            ),
            4.hGap,
            Expanded(
              flex: 139,
              child: Container(
                width: 139.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SALARY",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Row(
                      children: [
                        IconWidget(
                            iconWidth: 16.w, icon: Assets.commonUiCommonProp05),
                        4.hGap,
                        Text(
                          Utils.formatMoney(controller.playerBaseInfo.salary),
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldRegular),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            4.hGap,
            Expanded(
              flex: 82,
              child: Container(
                width: 82.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconWidget(
                        iconWidth: 11.w,
                        icon: Assets.managerUiManagerIconRecover),
                    7.hGap,
                    Text(
                      ///todo 暂无此字段
                      "${controller.teamPlayerInfo.power}",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
              ),
            ),
            16.hGap
          ],
        ),
      )
    ];
  }
}
