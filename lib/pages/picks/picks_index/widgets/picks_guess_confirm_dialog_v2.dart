import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return DialogBackground(
        frontColor: AppColors.cE6E6E6,
        child: Column(
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
                      style: 16.w7(color: AppColors.c262626, height: 1),
                    ),
                  ],
                )),
            14.vGap,
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      bool lastItem = index == 9; //todo
                      int currentIndex = 0; //todo
                      return Container(
                        height: 70.w,
                        margin: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            bottom: lastItem ? 100 : 9.w),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Player Name",
                                    style: 12.w4(
                                        color: AppColors.c262626, height: 1),
                                  ),
                                  6.vGap,
                                  Text(
                                    "VS NOP 8:05AM",
                                    style: 10.w4(
                                        color: AppColors.cB3B3B3, height: 1),
                                  )
                                ],
                              ),
                            ),
                            9.hGap,
                            Container(
                              width: 61.w,
                              height: 46.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.w),
                                  border: Border.all(
                                      width: 1, color: AppColors.ccccccc)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "25.6",
                                    style: 18.w7(
                                        color: AppColors.c262626, height: 1),
                                  ),
                                  5.vGap,
                                  Text(
                                    "PTS",
                                    style: 10.w7(
                                        color: AppColors.cB3B3B3, height: 1),
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
                                      width: 1, color: AppColors.cFF7954),
                                  borderRadius: BorderRadius.circular(8.w)),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: currentIndex == 0
                                                ? AppColors.cFF7954
                                                : AppColors.cTransparent,
                                            borderRadius: BorderRadius
                                                .horizontal(
                                                left: Radius.circular(7.w))),
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
                                            borderRadius: BorderRadius
                                                .horizontal(
                                                right: Radius.circular(7.w))),
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
                                    borderRadius: BorderRadius.circular(16.w),
                                    border: Border.all(
                                        color: modelCurrentIndex.value == 0
                                            ? AppColors.c10A86A
                                            : AppColors.cTransparent,
                                        width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          itemBuilder: (context,index){
                                            return _buildbet(5.toString(), 10.toString());
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
                                    borderRadius: BorderRadius.circular(16.w),
                                    border: Border.all(
                                        color: modelCurrentIndex.value == 1
                                            ? AppColors.c10A86A
                                            : AppColors.cTransparent,
                                        width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          itemBuilder: (context,index){
                                        return _buildbet(6.toString(), 20.toString());
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
                  )
                ],
              ),
            )
          ],
        ));
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
