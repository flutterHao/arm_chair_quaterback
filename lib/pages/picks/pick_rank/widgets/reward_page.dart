import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/11/18:56

class RewardPage extends StatefulWidget {
  const RewardPage(this.appBarHeight,{super.key});
  final double appBarHeight;

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickRankController>(
        id: PickRankController.idAwards,
        builder: (controller) {
          if (controller.awardInfo.isEmpty) {
            return const Center(child: LoadStatusWidget());
          }
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 599.w,
                      child: Image.asset(
                        alignment: Alignment.bottomCenter,
                        Assets.bgRank_02Jpg,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      margin:
                          EdgeInsets.only(top: 564.w, left: 16.w, right: 16.w),
                      padding: EdgeInsets.only(
                        left: 11.w,
                        top: 12.w,
                        right: 11.w,
                        bottom: 90.w,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.w),
                              topRight: Radius.circular(20.w))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 77.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: 77.w,
                                    width: 156.w,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.w, horizontal: 13.w),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage(Assets.uiRankBoxPng),
                                            fit: BoxFit.fill)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Box",
                                            style: 24
                                                .w7(color: AppColors.cFFFFFF)),
                                        Text(
                                          "rank ${controller.minRak}-10",
                                          style: TextStyle(
                                              color: AppColors.cB3B3B3,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: 77.w,
                                    width: 156.w,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.w, horizontal: 13.w),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                Assets.uiRankMoneyPng),
                                            fit: BoxFit.fitWidth)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Money",
                                            style: 24
                                                .w7(color: AppColors.cFFFFFF)),
                                        Text(
                                          "rank 1-${controller.maxRank}",
                                          style: TextStyle(
                                              color: AppColors.cB3B3B3,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9.w,
                          ),
                          ...List.generate(controller.awardInfo.length,
                              (index) {
                            return Container(
                              height: 42.w,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 9.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.w)),
                              padding: EdgeInsets.only(left: 22.w, right: 15.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Rank ${controller.awardInfo[index].rankAwardEntity.minRank}${controller.awardInfo[index].rankAwardEntity.minRank == controller.awardInfo[index].rankAwardEntity.maxRank ? "" : " - ${controller.awardInfo[index].rankAwardEntity.maxRank}"}",
                                          style: 12.w7(
                                              color: index ==
                                                      controller
                                                          .selfInRankListIndex
                                                  ? AppColors.cFF7954
                                                  : AppColors.c262626)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (controller.awardInfo[index]
                                          .awardPickData.isNotEmpty)
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              Assets.uiPropsBoxPng,
                                              width: 28.w,
                                            ),
                                            Text(
                                              "x1",
                                              style: TextStyle(
                                                  color: AppColors.c666666,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            Assets.uiPropsMoenyPng,
                                            width: 32.w,
                                          ),
                                          SizedBox(
                                            width: 35.w,
                                            child: Text(
                                              "x${controller.awardInfo[index].awardDataNum}",
                                              style: TextStyle(
                                                  color: AppColors.c666666,
                                                  fontSize: 10.sp),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (controller.selfInRankListIndex != -1 && false)
                Positioned(
                    left: 63.w,
                    right: 63.w,
                    bottom: 20.w,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.dialog(Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 36.w),
                              constraints: const BoxConstraints(maxWidth: 350),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  SizedBox(
                                      height: 38.w,
                                      child: Text(
                                        "REWARDS",
                                        style: 52.w7(
                                            color: AppColors.cFF7954,
                                            height: 1),
                                      )),
                                  Container(
                                    height: 93.w,
                                    margin: EdgeInsets.only(top: 37.5.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.cFF7954,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16.w),
                                            topRight: Radius.circular(16.w))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.w),
                                    child: Image.asset(
                                      Assets.uiWindowsAwardPng,
                                      height: 104,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 30.w,
                                    margin: EdgeInsets.only(top: 105.5.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.c262626,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16.w),
                                            topRight: Radius.circular(16.w))),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 400.w,
                                    margin: EdgeInsets.only(top: 110.5.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.cF2F2F2,
                                        borderRadius:
                                            BorderRadius.circular(16.w)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        16.vGap,
                                        Container(
                                          width: 162.w,
                                          alignment: Alignment.center,
                                          height: 24.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.ccccccc,
                                              borderRadius:
                                                  BorderRadius.circular(12.w)),
                                          child: Text(
                                            "There must be",
                                            style:
                                                14.w4(color: AppColors.c262626),
                                          ),
                                        ),
                                        14.vGap,
                                        IconWidget(
                                            iconWidth: 64.w,
                                            icon: Assets.uiPropsMoenyPng),
                                        Text(
                                          "x${controller.awardInfo[controller.selfInRankListIndex].awardDataNum}",
                                          style:
                                              14.w4(color: AppColors.c262626),
                                        ),
                                        28.vGap,
                                        Container(
                                          width: 162.w,
                                          alignment: Alignment.center,
                                          height: 24.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.ccccccc,
                                              borderRadius:
                                                  BorderRadius.circular(12.w)),
                                          child: Text(
                                            "One out of three",
                                            style:
                                                14.w4(color: AppColors.c262626),
                                          ),
                                        ),
                                        17.vGap,
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 39.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: List.generate(
                                                controller
                                                    .awardInfo[controller
                                                        .selfInRankListIndex]
                                                    .awardPickData
                                                    .length, (index) {
                                              return Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () => controller
                                                        .rewardDialogItemTap(
                                                            index),
                                                    child: Obx(() {
                                                      return Container(
                                                        width: 60.w,
                                                        height: 90.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.w),
                                                            border: Border.all(
                                                                color: index ==
                                                                        controller
                                                                            .rewardDialogItemIndex
                                                                            .value
                                                                    ? AppColors
                                                                        .c10A86A
                                                                    : AppColors
                                                                        .cTransparent,
                                                                width: 2)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                decoration: BoxDecoration(
                                                                    color: index ==
                                                                            controller
                                                                                .rewardDialogItemIndex.value
                                                                        ? AppColors
                                                                            .cTransparent
                                                                        : AppColors
                                                                            .cD9D9D9,
                                                                    borderRadius:
                                                                        BorderRadius.circular(16
                                                                            .w)),
                                                                child:
                                                                    ImageWidget(
                                                                  url: "url",
                                                                  imageFailedPath:
                                                                      Assets
                                                                          .uiBellePng,
                                                                  width: 58.w,
                                                                )),
                                                            Text(
                                                              controller
                                                                  .awardInfo[
                                                                      controller
                                                                          .selfInRankListIndex]
                                                                  .awardPickData[
                                                                      index]
                                                                  .propDefineEntity
                                                                  .propName,
                                                              style: 10.w4(
                                                                  color: index ==
                                                                          controller
                                                                              .rewardDialogItemIndex
                                                                              .value
                                                                      ? AppColors
                                                                          .c10A86A
                                                                      : AppColors
                                                                          .cB3B3B3),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                  5.vGap,
                                                  Text(
                                                    "x${controller.awardInfo[controller.selfInRankListIndex].awardPickData[index].num}",
                                                    style: 14.w4(
                                                        color:
                                                            AppColors.c262626,
                                                        height: 1),
                                                  )
                                                ],
                                              );
                                            }),
                                          ),
                                        ),
                                        24.vGap,
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            print('点击了confirm--');
                                          },
                                          child: SizedBox(
                                            width: 243.w,
                                            height: 44.w,
                                            child: BtnBackground(
                                                child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  left: 9.w,
                                                  child: SizedBox(
                                                    width: 26.w,
                                                    height: 26.w,
                                                    child: Stack(
                                                      children: [
                                                        IconWidget(
                                                            iconWidth: 26.w,
                                                            icon: Assets
                                                                .uiIconRingPng),
                                                        Positioned(
                                                            left: 7.w,
                                                            bottom: 7.w,
                                                            child: IconWidget(
                                                              iconWidth: 17.w,
                                                              icon: Assets
                                                                  .uiIconRuidgtPng,
                                                              iconColor:
                                                                  AppColors
                                                                      .c10A86A,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                    child: Text(
                                                  "CONFIRM",
                                                  style: 21.w7(
                                                      color: AppColors.cF2F2F2),
                                                ))
                                              ],
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 300.w,
                          ),
                          child: BtnBackground(
                              child: Center(
                            child: Text(
                              "GET",
                              style: 16.w7(color: AppColors.cFFFFFF),
                            ),
                          )),
                        ),
                      ),
                    ))
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
