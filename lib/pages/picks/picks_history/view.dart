import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PicksHistoryPage extends GetView<PicksHistoryController> {
  const PicksHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<PicksHistoryController>(
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(child: Obx(() {
              if (controller.loadStatus.value != LoadDataStatus.success) {
                return Center(
                  child: LoadStatusWidget(
                    loadDataStatus: controller.loadStatus.value,
                  ),
                );
              }
              return DefaultTabController(
                length: 2,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverPersistentHeader(
                            delegate: FixedHeightSliverHeaderDelegate(
                                child: Container(
                                  height: 144.w,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 34.w),
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                        AppColors.c262626,
                                        AppColors.c525252
                                      ])),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          right: -60.w,
                                          top: 16.w,
                                          child: IconWidget(
                                            iconWidth: 200.w,
                                            icon: Assets
                                                .picksUiPicksHistoryJettonBig,
                                            iconColor: AppColors.cFFFFFF
                                                .withOpacity(0.05),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          21.vGap,
                                          Row(
                                            children: [
                                              IconWidget(
                                                  iconWidth: 15.w,
                                                  icon: Assets
                                                      .commonUiCommonIconCurrency02),
                                              4.hGap,
                                              Text(
                                                "AMOUNT WIN",
                                                style: 12.w4(
                                                    color: AppColors.cFFFFFF
                                                        .withOpacity(0.3),
                                                    height: 1,
                                                    fontFamily: Assets
                                                        .fontsRobotoRegular),
                                              )
                                            ],
                                          ),
                                          10.vGap,
                                          Text(
                                            "${controller.teamSimpleEntity.betCoin}",
                                            style: 45.w7(
                                                color: AppColors.cFFFFFF,
                                                fontFamily:
                                                    Assets.fontsOswaldBold,
                                                height: 1),
                                          ),
                                          24.vGap,
                                          Row(
                                            children: [
                                              Text(
                                                "CONTESTS WON: ",
                                                style: 12.w5(
                                                    color: AppColors.cFFFFFF,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoMedium),
                                              ),
                                              Text(
                                                "${controller.teamSimpleEntity.winCount}",
                                                style: 16.w5(
                                                    color: AppColors.cFFFFFF,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoMedium),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                height: 144.w)),
                        SliverPersistentHeader(
                            pinned: true,
                            delegate: FixedHeightSliverHeaderDelegate(
                                child: Container(
                                  color: AppColors.cFFFFFF,
                                  child: TabBar(
                                      labelColor: AppColors.c000000,
                                      unselectedLabelColor: AppColors.cB3B3B3,
                                      labelStyle: 16.w5(
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                      unselectedLabelStyle: 16.w5(
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                      dividerHeight: 0,
                                      indicatorColor: AppColors.cFF7954,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicatorWeight: 3.w,
                                      tabs: List.generate(
                                          controller.tabs.length, (index) {
                                        return Text(controller.tabs[index]);
                                      })),
                                ),
                                height: 36.w)),
                      ];
                    },
                    body: TabBarView(
                        children:
                            List.generate(controller.tabs.length, (index) {
                      return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            bool lastIndex = index == 10 - 1; //todo
                            return Container(
                              color: AppColors.cFFFFFF,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              margin: EdgeInsets.only(
                                  top: 9.w, bottom: lastIndex ? 9.w : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  22.vGap,
                                  Text(
                                    "AUG 1,2024",
                                    style: 30.w7(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                  19.vGap,
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6.w),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 17.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.w),
                                        border: Border.all(
                                          color: AppColors.cD1D1D1,
                                          width: 1.w,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 77.w,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.w),
                                              color: AppColors.cF2F2F2,
                                            ),
                                            child: Column(
                                              children: [
                                                10.vGap,
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 9.w, right: 11.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "POWER 2X",
                                                        style: 19.w5(
                                                            color: AppColors
                                                                .c000000,
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fOswaldMedium),
                                                      ),
                                                      ShareWidget(
                                                        globalKey:
                                                            GlobalKey(), //todo
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                12.vGap,
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 11.w, right: 12.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          IconWidget(
                                                              iconWidth: 15.w,
                                                              icon: Assets
                                                                  .commonUiCommonIconCurrency02),
                                                          6.hGap,
                                                          Text(
                                                            "1000",
                                                            style: 16.w5(
                                                                color: AppColors
                                                                    .c000000,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fOswaldMedium,
                                                                height: 1),
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10.w),
                                                              child: IconWidget(
                                                                iconWidth: 15.w,
                                                                icon: Assets
                                                                    .picksUiPicksHistoryArrowsBig,
                                                                iconColor: AppColors
                                                                    .c000000
                                                                    .withOpacity(
                                                                        0.5),
                                                              )),
                                                          IconWidget(
                                                              iconWidth: 15.w,
                                                              icon: Assets
                                                                  .commonUiCommonIconCurrency02),
                                                          6.hGap,
                                                          Text(
                                                            "1000",
                                                            style: 16.w5(
                                                                color: AppColors
                                                                    .c000000,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fOswaldMedium,
                                                                height: 1),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: List.generate(
                                                            3, (index) {
                                                          return IconWidget(
                                                            iconWidth: 20.w,
                                                            icon: Assets
                                                                .picksUiPicksHistoryPick,
                                                            iconColor: AppColors
                                                                .c10A86A,
                                                          );
                                                        }),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 95.w,
                                            child: Row(
                                              children: [
                                                15.hGap,
                                                PlayerAvatarWidget(
                                                  width: 48.w,
                                                  height: 61.w,
                                                  radius: 4.w,
                                                ),
                                                16.hGap,
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text.rich(
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text:
                                                                  "Lebron James",
                                                              style: 14.w5(
                                                                color: AppColors
                                                                    .c000000,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fOswaldMedium,
                                                              )),
                                                          TextSpan(
                                                              text: "  LAL@HOU",
                                                              style: 10.w4(
                                                                color: AppColors
                                                                    .c808080,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular,
                                                              ))
                                                        ])),
                                                        Text(
                                                          "Result: 36",
                                                          style: 14.w5(
                                                              color: AppColors
                                                                  .c0FA76C),
                                                        )
                                                      ],
                                                    ),
                                                    8.vGap,
                                                    Text.rich(
                                                        const TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "TOTAL POINT ",
                                                              ),
                                                              TextSpan(
                                                                  text: "MORE ",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .fRobotoMedium)),
                                                              TextSpan(
                                                                text: "35.5",
                                                              )
                                                            ]),
                                                        style: 10.w4(
                                                          color:
                                                              AppColors.c000000,
                                                          fontFamily: FontFamily
                                                              .fRobotoRegular,
                                                          height: 1,
                                                        )),
                                                    12.vGap,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "11/08/01  8:00 AM  FINAL",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .c000000,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .fRobotoRegular,
                                                                  height: 1),
                                                              // style: 10.w4(
                                                              //   color: AppColors
                                                              //       .c000000,
                                                              //   fontFamily: FontFamily
                                                              //       .fRobotoRegular,
                                                              //   height: 1,
                                                              // ),
                                                            ),
                                                            6.hGap,
                                                            IconWidget(
                                                              iconWidth: 5.w,
                                                              icon: Assets
                                                                  .commonUiCommonIconSystemJumpto,
                                                              iconColor:
                                                                  AppColors
                                                                      .c000000,
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconWidget(
                                                              iconWidth: 17.w,
                                                              icon: Assets
                                                                  .picksUiPicksHistoryComment,
                                                              iconColor:
                                                                  AppColors
                                                                      .c000000,
                                                            ),
                                                            6.hGap,
                                                            Text(
                                                              "100k",
                                                              style: 10.w4(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .fRobotoRegular),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                                13.hGap,
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }))),
              );
            })),
          );
        },
      ),
    );
  }
}
