import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/widget/star_upgrade_game_turntable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/27/15:33

class StarUpgradeGame extends GetView<StarUpgradeGameController> {
  const StarUpgradeGame(this.playerUuid, {super.key});

  final String playerUuid;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<StarUpgradeGameController>(
          init: StarUpgradeGameController(playerUuid),
          builder: (logic) {
            return Container(
              color: AppColors.c1A1A1A,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// 背景
                  Positioned(
                    top: 0.w,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      Assets.managerUiManagerStar06,
                      width: 205.5.w,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),

                  /// sparring
                  Positioned(
                      top: -35.h,
                      bottom: 0,
                      child: OutlinedText(
                          text: "SPARRING",
                          strokeWidth: 1.w,
                          strokeColor: AppColors.c217FE0,
                          textStyle: 94.w7(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold,
                          ))),

                  Positioned(
                      top: 118.h,
                      child: Column(
                        children: [
                          /// player info and reward
                          Container(
                            height: 210.h,
                            width: 356.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.w),
                              color: AppColors.c35353E,
                            ),
                            padding: EdgeInsets.all(7.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.w),
                                color: AppColors.cF2F2F2,
                              ),
                              child: Column(
                                children: [
                                  /// player info
                                  Container(
                                    height: 74.h,
                                    margin:
                                        EdgeInsets.only(left: 11.w, right: 6.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            15.vGap,
                                            OutlinedText(
                                              text: "78",
                                              textStyle: 24.w7(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldBold,
                                              ),
                                              strokeWidth: 1.5.w,
                                              strokeColor: AppColors.cFFFFFF,
                                            ),
                                          ],
                                        ),
                                        6.hGap,
                                        ImageWidget(
                                          url: "url",
                                          width: 84.w,
                                          height: 64.w,
                                          imageFailedPath:
                                              Assets.iconUiDefault05,
                                        ),
                                        9.hGap,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Player Name",
                                              style: 19.w5(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                              ),
                                            ),
                                            3.vGap,
                                            PlayerStartWidget(grade: 9),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Divider(
                                      height: 1.h,
                                      color: AppColors.cA5A5A5,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 15.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          controller.propertyList.length,
                                          (index) {
                                        String property =
                                            controller.propertyList[index];
                                        return SizedBox(
                                          width: 28.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      property,
                                                      style: 12.w5(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  5.vGap,
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      "1000",
                                                      style: 14.w5(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              10.vGap,
                                              Expanded(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(3,
                                                    (innerIndex) {
                                                  return Container(
                                                    height: 14.h,
                                                    width: 28.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        color:
                                                            AppColors.cC9C9CF),
                                                  );
                                                }),
                                              ))
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          21.vGap,
                          SizedBox(
                            height: 434.h,
                            width: 375.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                /// 背景
                                Container(
                                  height: 434.h,
                                  width: 356.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.c363742,
                                    borderRadius: BorderRadius.circular(9.w),
                                    border: Border.all(
                                        color: AppColors.c454957, width: 1.w),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 9.w,
                                      top: 14.h,
                                      right: 9.w,
                                      bottom: 8.h),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 14.h,
                                    ),

                                    /// 升星次数
                                    Container(
                                      width: 356.w,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.w),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 34.h,
                                            decoration: BoxDecoration(
                                                color: AppColors.c28282E,
                                                borderRadius:
                                                    BorderRadius.circular(4.w)),
                                          ),
                                          SizedBox(
                                            height: 42.h,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: controller
                                                    .getMaxStarTimes(),
                                                itemBuilder: (context, index) {
                                                  bool isFirst = index == 0;
                                                  bool isLast = index ==
                                                      controller
                                                              .getMaxStarTimes() -
                                                          1;
                                                  bool bonus = controller
                                                      .getBonusList()
                                                      .contains(index + 1);
                                                  double width =
                                                      bonus ? 22.w : 19.w;
                                                  String icon = bonus
                                                      ? Assets
                                                          .managerUiManagerRisingstar01
                                                      : Assets
                                                          .managerUiManagerRisingstar02;
                                                  bool isActive = index <=
                                                      controller.currentIndex;
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        left:
                                                            isFirst ? 11.w : 0,
                                                        right:
                                                            isLast ? 11.w : 0),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        SizedBox(
                                                          width: width,
                                                          height: 34.h,
                                                          child: IconWidget(
                                                            icon: icon,
                                                            iconColor: isActive
                                                                ? null
                                                                : AppColors
                                                                    .c3D3F4B,
                                                          ),
                                                        ),
                                                        if (bonus)
                                                          Positioned(
                                                            bottom: 0,
                                                            left: 0,
                                                            right: 0,
                                                            child:
                                                                Transform.scale(
                                                              scaleX: 31 / 22,
                                                              child: Container(
                                                                width: 22.w,
                                                                height: 12.h,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2.w),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                  border: Border
                                                                      .all(
                                                                    width: 1.w,
                                                                    color: isActive
                                                                        ? AppColors
                                                                            .cFFC93C
                                                                        : AppColors
                                                                            .c535561,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    FittedBox(
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                  child: Text(
                                                                    "BONUS",
                                                                    style:
                                                                        10.w5(
                                                                      color: isActive
                                                                          ? AppColors
                                                                              .cFFC93C
                                                                          : AppColors
                                                                              .c5F6170,
                                                                      height:
                                                                          0.9,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .fOswaldMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    // 水果机
                                    SizedBox(
                                      width: 356.w,
                                      height: 137.h,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          /// 背景
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 18.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children:
                                                  List.generate(5, (index) {
                                                return Container(
                                                  height: 137.h,
                                                  width: 59.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.cF1F1F1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.w)),
                                                );
                                              }),
                                            ),
                                          ),

                                          /// 中间线
                                          Positioned(
                                              left: 0.w,
                                              right: 0.w,
                                              child: Row(
                                                children: [
                                                  IconWidget(
                                                    icon: Assets
                                                        .managerUiManagerRisingstar05,
                                                    iconWidth: 17.w,
                                                    rotateAngle: -90,
                                                  ),
                                                  Expanded(
                                                      child: Divider(
                                                    height: 1.h,
                                                    color: AppColors.cC40722,
                                                  )),
                                                  IconWidget(
                                                    icon: Assets
                                                        .managerUiManagerRisingstar05,
                                                    iconWidth: 17.w,
                                                    rotateAngle: 90,
                                                  ),
                                                ],
                                              )),

                                          /// pageview
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 18.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children:
                                                  List.generate(5, (index) {
                                                return SizedBox(
                                                  height: 137.h,
                                                  width: 59.w,
                                                  child: PageView.builder(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      controller:
                                                          PageController(
                                                        initialPage: controller
                                                            .propertyList
                                                            .length,
                                                        viewportFraction: 0.4,
                                                      ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        String text = controller
                                                                .propertyList[
                                                            index %
                                                                controller
                                                                    .propertyList
                                                                    .length];
                                                        return Center(
                                                          child: Container(
                                                            color: AppColors
                                                                .cFFFFFF,
                                                            child: OutlinedText(
                                                              text: text,
                                                              textStyle: 21.w7(
                                                                color: AppColors
                                                                    .c000000,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fOswaldBold,
                                                              ),
                                                              strokeColor:
                                                                  AppColors
                                                                      .cFFFFFF,
                                                              strokeWidth: 2.w,
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    // 成功率进度条
                                    Container(
                                      width: 319.w,
                                      height: 16.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.c28282E,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 319.w * 0.3,
                                            height: 16.h,
                                            color: AppColors.c9B1A2C,
                                          ),
                                          IconWidget(
                                            icon: Assets
                                                .managerUiManagerRisingstar09,
                                            iconHeight: 16.h,
                                          )
                                        ],
                                      ),
                                    ),

                                    /// 成功率文本
                                    SizedBox(
                                      height: 37.h,
                                      width: 354.w,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Divider(
                                                  color: AppColors.c454957,
                                                  height: 1.h,
                                                ),
                                                Divider(
                                                  color: AppColors.c454957,
                                                  height: 1.h,
                                                ),
                                                Divider(
                                                  color: AppColors.c454957,
                                                  height: 1.h,
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 170.w,
                                            height: 20.h,
                                            color: AppColors.c363742,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Text(
                                                  "SUCCESS RATE 20%",
                                                  style: 14.w4(
                                                    color: AppColors.cFFFFFF,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fOswaldRegular,
                                                  ),
                                                ),
                                                Positioned(
                                                    right: 9.w,
                                                    child: IconWidget(
                                                      icon: Assets
                                                          .commonUiCommonIconSystemDanger01,
                                                      iconWidth: 16.w,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    /// 按钮
                                    Container(
                                      height: 137.h,
                                      width: 337.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(Assets
                                                  .managerUiManagerRisingstar08))),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          /// 完成按钮
                                          Positioned(
                                              left: 20.w,
                                              top: 27.h,
                                              width: 65.w,
                                              height: 50.h,
                                              child: MtInkWell(
                                                splashColor: AppColors.cTransparent,
                                                onTap: ()=> Get.back(),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    IconWidget(
                                                      icon: Assets
                                                          .managerUiManagerRisingstar04,
                                                      iconWidth: 23.w,
                                                    ),
                                                    5.vGap,
                                                    Text(
                                                      "FINISH",
                                                      style: 12.w4(
                                                        // color: AppColors.c5C5E6A,
                                                        color: AppColors.cFFFFFF,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldRegular,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                          /// 开始转动按钮
                                          Positioned(
                                              top: 13.h,
                                              left: 117.w,
                                              child: Stack(
                                                children: [
                                                  IconWidget(
                                                    icon: Assets
                                                        .managerUiManagerRisingstarButton,
                                                    iconHeight: 100.h,
                                                  ),
                                                  Positioned(
                                                    top: 0.h,
                                                    left: 0.w,
                                                    child: MtInkWell(
                                                      onTap: (){
                                                        print('DRILL');
                                                        showModalBottomSheet(
                                                          isScrollControlled: true,
                                                          backgroundColor: AppColors.cTransparent,
                                                            context: context, builder: (context){
                                                          return StarUpgradeGameTurntable();
                                                        });
                                                      },
                                                      splashColor: AppColors
                                                          .cTransparent,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    25.w,
                                                                vertical: 28.h),
                                                        child: Text(
                                                          "DRILL",
                                                          style: 23.w5(
                                                            color: AppColors
                                                                .cFFFFFF,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fOswaldMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          Positioned(
                                              top: 27.h,
                                              right: 20.5.w,
                                              child: Container(
                                                height: 50.h,
                                                width: 45.w,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "INSERT COIN",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: 13.w5(
                                                        color:
                                                            AppColors.c3D3F4B,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium,
                                                      ),
                                                    ),
                                                    Text(
                                                      "TO PLAY",
                                                      style: 10.w5(
                                                        color:
                                                            AppColors.c3D3F4B,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            );
          }),
    );
  }
}
