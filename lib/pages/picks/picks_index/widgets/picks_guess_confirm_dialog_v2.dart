import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/drag_back_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/18:08

class PicksGuessConfirmDialogV2 extends StatefulWidget {
  const PicksGuessConfirmDialogV2({super.key});

  @override
  State<PicksGuessConfirmDialogV2> createState() =>
      _PicksGuessConfirmDialogV2State();
}

class _PicksGuessConfirmDialogV2State extends State<PicksGuessConfirmDialogV2> {
  var modelCurrentIndex = 0.obs;

  double maxHeight = 780.h, minHeight = 620.h;
  double height = 620.h;

  ScrollController scrollController = ScrollController();
  Function? listener;

  // 开始滑动时候滚动位置的缓存
  double startPixels = 0;

  double startY = 0;

  var offsetY = 0.0.obs;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (listener == null) {
        scrollController.position.isScrollingNotifier
            .addListener(listener = () {
          if (scrollController.position.isScrollingNotifier.value) {
            startPixels = scrollController.position.pixels;
          } else {
            startPixels = 0;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onVerticalDragDown(detail) {
      startY = detail.localPosition.dy;
    }

    onVerticalDragStart(detail) {
      startY = detail.localPosition.dy;
    }

    onVerticalDragUpdate(detail) {
      print('---------:${offsetY.value}');
      offsetY.value = startY - detail.localPosition.dy;
    }

    onVerticalDragCancel() {
      height = offsetY.value + height;
    }

    onVerticalDragEnd(detail) {
      height = offsetY.value + height;
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // print('notification:${notification.runtimeType}');
        // print('notification:${notification.metrics.pixels}');
        return false;
      },
      child: Obx(() {
        var h = height + offsetY.value;
        h = min(h, maxHeight);
        h = max(h, minHeight);
        return RawGestureDetector(
          gestures: {
            CustomTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                CustomTapGestureRecognizer>(
              () => CustomTapGestureRecognizer(),
              (HorizontalDragGestureRecognizer detector) {
                detector
                  ..onDown = onVerticalDragDown
                  ..onStart = onVerticalDragStart
                  ..onUpdate = onVerticalDragUpdate
                  ..onEnd = onVerticalDragEnd
                  ..onCancel = onVerticalDragCancel();
              },
            )
          },
          child: Column(
            children: [
              Expanded(child: Container(
                color: AppColors.cTransparent,
              )),
              SizedBox(
                height: h,
                child: DialogBackground(
                    frontColor: AppColors.cE6E6E6,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            12.vGap,
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.ccccccc,
                                  borderRadius: BorderRadius.circular(2.w)),
                              height: 4.w,
                              width: 64.w,
                            ),
                            24.vGap,
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "Picks confirmation",
                                      style: 16
                                          .w7(color: AppColors.c262626, height: 1),
                                    ),
                                  ],
                                )),
                            14.vGap,
                          ],
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                controller: scrollController,
                                physics: OneBoundaryScrollPhysics(
                                    scrollController: scrollController),
                                itemBuilder: (context, index) {
                                  bool lastItem = index == 9; //todo
                                  int currentIndex = 0; //todo
                                  return Container(
                                    height: 70.w,
                                    margin: EdgeInsets.only(
                                        left: 16.w,
                                        right: 16.w,
                                        bottom: lastItem ? 60 : 9.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.cF2F2F2,
                                        borderRadius: BorderRadius.circular(16.w)),
                                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                                    child: Row(
                                      children: [
                                        ImageWidget(
                                          url: "",
                                          width: 42.w,
                                          color: AppColors.ccccccc,
                                        ),
                                        4.hGap,
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Player Name",
                                                style: 12.w4(
                                                    color: AppColors.c262626,
                                                    height: 1),
                                              ),
                                              6.vGap,
                                              Text(
                                                "VS NOP 8:05AM",
                                                style: 10.w4(
                                                    color: AppColors.cB3B3B3,
                                                    height: 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        9.hGap,
                                        Container(
                                          width: 61.w,
                                          height: 46.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.w),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.ccccccc)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "25.6",
                                                style: 18.w7(
                                                    color: AppColors.c262626,
                                                    height: 1),
                                              ),
                                              5.vGap,
                                              Text(
                                                "PTS",
                                                style: 10.w7(
                                                    color: AppColors.cB3B3B3,
                                                    height: 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        11.hGap,
                                        Container(
                                          height: 46.w,
                                          width: 110.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.cFF7954),
                                              borderRadius:
                                                  BorderRadius.circular(8.w)),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                    color: currentIndex == 0
                                                        ? AppColors.cFF7954
                                                        : AppColors.cTransparent,
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            left: Radius.circular(
                                                                7.w))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconWidget(
                                                      iconWidth: 15.w,
                                                      icon: Assets.uiIconUpPng,
                                                      iconColor: currentIndex == 0
                                                          ? AppColors.cF2F2F2
                                                          : AppColors.cFF7954,
                                                    ),
                                                    5.vGap,
                                                    Text(
                                                      "MORE",
                                                      style: 12.w7(
                                                          color: currentIndex == 0
                                                              ? AppColors.cF2F2F2
                                                              : AppColors.cFF7954,
                                                          height: 1),
                                                    )
                                                  ],
                                                ),
                                              )),
                                              Divider(
                                                height: 46.w,
                                                color: AppColors.cFF7954,
                                              ),
                                              Flexible(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                    color: currentIndex == 1
                                                        ? AppColors.cFF7954
                                                        : AppColors.cTransparent,
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                            right: Radius.circular(
                                                                7.w))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconWidget(
                                                      iconWidth: 15.w,
                                                      icon: Assets.uiIconUpPng,
                                                      iconColor: currentIndex == 1
                                                          ? AppColors.cF2F2F2
                                                          : AppColors.cFF7954,
                                                      rotateAngle: 180,
                                                    ),
                                                    5.vGap,
                                                    Text(
                                                      "MORE",
                                                      style: 12.w7(
                                                          color: currentIndex == 1
                                                              ? AppColors.cF2F2F2
                                                              : AppColors.cFF7954,
                                                          height: 1),
                                                    )
                                                  ],
                                                ),
                                              )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                        Container(
                          color: AppColors.cF2F2F2,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, top: 13.w, bottom: 31.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                      child: InkWell(
                                    onTap: () => modelCurrentIndex.value = 0,
                                    child: Obx(() {
                                      return Container(
                                        height: 167.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 14.w),
                                        decoration: BoxDecoration(
                                            color: AppColors.cFFFFFF,
                                            borderRadius:
                                                BorderRadius.circular(16.w),
                                            border: Border.all(
                                                color: modelCurrentIndex.value == 0
                                                    ? AppColors.c10A86A
                                                    : AppColors.cTransparent,
                                                width: 2)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Flex play",
                                                  style: 14.w7(
                                                      color: AppColors.c262626,
                                                      height: 1),
                                                ),
                                                _buildSelect(
                                                    modelCurrentIndex.value == 0),
                                              ],
                                            ),
                                            6.vGap,
                                            const Divider(
                                              height: 1,
                                              color: AppColors.cE6E6E6,
                                            ),
                                            5.vGap,
                                            Expanded(
                                              child: ListView.builder(
                                                  itemCount: 3,
                                                  itemBuilder: (context, index) {
                                                    return _buildbet(5.toString(),
                                                        10.toString());
                                                  }),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(left: 11.w),
                                                child: Text(
                                                  "Hit 3out of 5 in the lineup",
                                                  style: 10.w4(
                                                      color: AppColors.cB3B3B3,
                                                      height: 1),
                                                ))
                                          ],
                                        ),
                                      );
                                    }),
                                  )),
                                  9.hGap,
                                  Flexible(
                                      child: InkWell(
                                    onTap: () => modelCurrentIndex.value = 1,
                                    child: Obx(() {
                                      return Container(
                                        height: 167.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 14.w),
                                        decoration: BoxDecoration(
                                            color: AppColors.cFFFFFF,
                                            borderRadius:
                                                BorderRadius.circular(16.w),
                                            border: Border.all(
                                                color: modelCurrentIndex.value == 1
                                                    ? AppColors.c10A86A
                                                    : AppColors.cTransparent,
                                                width: 2)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Flex play",
                                                  style: 14.w7(
                                                      color: AppColors.c262626,
                                                      height: 1),
                                                ),
                                                _buildSelect(
                                                    modelCurrentIndex.value == 1),
                                              ],
                                            ),
                                            6.vGap,
                                            const Divider(
                                              height: 1,
                                              color: AppColors.cE6E6E6,
                                            ),
                                            5.vGap,
                                            Expanded(
                                              child: ListView.builder(
                                                  itemCount: 1,
                                                  itemBuilder: (context, index) {
                                                    return _buildbet(6.toString(),
                                                        20.toString());
                                                  }),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(left: 11.w),
                                                child: Text(
                                                  "Hit 3out of 5 in the lineup",
                                                  style: 10.w4(
                                                      color: AppColors.cB3B3B3,
                                                      height: 1),
                                                ))
                                          ],
                                        ),
                                      );
                                    }),
                                  )),
                                ],
                              ),
                              10.vGap,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                            text: "5",
                                            style: 18.w7(
                                                color: AppColors.c262626,
                                                height: 1),
                                          ),
                                          TextSpan(
                                              text: "/10",
                                              style: 14.w4(
                                                  color: AppColors.c666666,
                                                  height: 1))
                                        ])),
                                        2.vGap,
                                        Text(
                                          "Correct",
                                          style: 10.w4(
                                              color: AppColors.c666666, height: 1),
                                        )
                                      ],
                                    ),
                                    25.hGap,
                                    Flexible(
                                      child: Container(
                                        height: 40.w,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppColors.cDCDCDC,
                                            borderRadius:
                                                BorderRadius.circular(4.w)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "450000",
                                              style: 18.w7(
                                                  color: AppColors.c262626,
                                                  height: 1),
                                            ),
                                            Text(
                                              "To win",
                                              style: 10.w4(
                                                  color: AppColors.c666666,
                                                  height: 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // if(false)
                                    Flexible(
                                        child: Container(
                                      height: 40.w,
                                      margin: EdgeInsets.only(left: 9.w),
                                      padding:
                                          EdgeInsets.only(right: 6.w, top: 8.w),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColors.c10A86A,
                                          borderRadius: BorderRadius.circular(4.w)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "13",
                                                    style: 18.w7(
                                                        color: AppColors.cF1F1F1,
                                                        height: 1),
                                                  ),
                                                  3.vGap,
                                                  Text(
                                                    "Streak",
                                                    style: 10.w4(
                                                        color: AppColors.cF1F1F1,
                                                        height: 1),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "10000",
                                                style: 18.w7(
                                                    color: AppColors.cF1F1F1,
                                                    height: 1),
                                              ),
                                              3.vGap,
                                              Text(
                                                "streak bonus",
                                                style: 10.w4(
                                                    color: AppColors.cF1F1F1,
                                                    height: 1),
                                              )
                                            ],
                                          ),
                                          Container(
                                              width: 8.w,
                                              height: 8.w,
                                              margin: EdgeInsets.only(left: 2.w),
                                              child: Center(
                                                  child: IconWidget(
                                                      iconWidth: 8.w,
                                                      icon:
                                                          Assets.uiIconDetailsPng)))
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              8.vGap,
                              const Divider(
                                color: AppColors.c666666,
                                height: 1,
                              ),
                              17.vGap,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 44.w,
                                      width: 44.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22.w),
                                          border: Border.all(
                                              color: AppColors.cB3B3B3, width: 1)),
                                      child: IconWidget(
                                        iconWidth: 16.w,
                                        icon: Assets.uiIconDelete_01Png,
                                        iconColor: AppColors.c262626,
                                      ),
                                    ),
                                    12.hGap,
                                    Flexible(
                                      child: Container(
                                        height: 44.w,
                                        child: BtnBackground(
                                          child: Container(
                                            height: 44.w,
                                            width: double.infinity,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Text(
                                                  "CONFIRM",
                                                  style: 18
                                                      .w7(color: AppColors.cF2F2F2),
                                                ),
                                                Positioned(
                                                    left: 9.w,
                                                    child: Stack(
                                                      children: [
                                                        IconWidget(
                                                            iconWidth: 26.w,
                                                            icon: Assets
                                                                .uiIconRingPng),
                                                        Positioned(
                                                            left: 7.w,
                                                            top: 5.5.w,
                                                            child: IconWidget(
                                                              iconWidth: 17.w,
                                                              icon: Assets
                                                                  .uiIconConfirmPng,
                                                              iconColor:
                                                                  AppColors.c31E99E,
                                                            ))
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildbet(String num, String bet) {
    return Container(
      height: 30.w,
      child: Row(
        children: [
          11.hGap,
          Text(
            num,
            style: 16.w7(color: AppColors.c282828, height: 1),
          ),
          8.hGap,
          Expanded(
              child: Text(
            "correct",
            style: 12.w4(color: AppColors.c666666),
          )),
          Container(
            height: 15.w,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.circular(5.w)),
            alignment: Alignment.center,
            child: Text(
              "${bet}x",
              style: 11.w4(color: AppColors.cF2F2F2, height: 1),
            ),
          ),
          11.hGap
        ],
      ),
    );
  }

  Container _buildSelect(bool select) {
    return Container(
      height: 15.w,
      width: 15.w,
      decoration: BoxDecoration(
          border: Border.all(
              color: select ? AppColors.c10A86A : AppColors.cB3B3B3,
              width: 1.5),
          borderRadius: BorderRadius.circular(8.w)),
      child: Visibility(
        visible: select,
        child: Center(
          child: Container(
            height: 9.w,
            width: 9.w,
            decoration: BoxDecoration(
                color: AppColors.c10A86A,
                borderRadius: BorderRadius.circular(5.w)),
          ),
        ),
      ),
    );
  }
}
