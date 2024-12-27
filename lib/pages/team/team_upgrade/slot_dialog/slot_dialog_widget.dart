import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/slot_dialog/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/slot_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/25/10:18

class SlotDialogWidget extends GetView<SlotDialogController> {
  const SlotDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        back();
      },
      child: GetBuilder<SlotDialogController>(
          id: SlotDialogController.idSlotDialogMain,
          init: SlotDialogController(),
          builder: (logic) {
            if (LoadDataStatus.success != controller.loadStatus.value) {
              return const SizedBox.shrink();
            }
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    /// 顶部半透明背景
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          back();
                        },
                      ),
                    ),

                    /// 白色背景
                    Container(
                      height: 615.w,
                      decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(9.w))),
                    )
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// tv和吊线
                        Obx(() {
                          var b = controller.tvShow.value
                              ? 0.0
                              : (400.w + 327.w + 6.w + 309.w);
                          return AnimatedPositioned(
                            bottom: b,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            onEnd: () {
                              if (controller.isInBackStatus) {
                                Get.back();
                              } else {
                                Future.delayed(
                                    const Duration(milliseconds: 600), () {
                                  controller.openDoor();
                                });
                              }
                            },
                            child: Center(
                              child: SizedBox(
                                width: 327.w,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 400.w,
                                            width: 4.w,
                                            color: AppColors.c434343,
                                          ),
                                          Container(
                                            height: 400.w,
                                            width: 4.w,
                                            color: AppColors.c434343,
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconWidget(
                                        iconWidth: 327.w,
                                        icon: Assets
                                            .managerUiManagerPlayerinfoBg),
                                    Container(
                                      height: 6.w,
                                      width: 297.w,
                                      color: AppColors.c000000,
                                    ),
                                    //tv
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        IconWidget(
                                            iconWidth: 309.w,
                                            icon: Assets
                                                .managerUiManagerPlayerinfoBg01),
                                        Positioned(
                                          top: 0,
                                          child: SizedBox(
                                            width: 241.w,
                                            child: Column(
                                              children: [
                                                15.vGap,
                                                _buildSlotWidget(),
                                                10.vGap,
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Special training status",
                                                            style: 10.w4(
                                                                color: AppColors
                                                                    .cFFFFFF,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular),
                                                          ),
                                                          Text(
                                                            "${(controller.startUpItem.successRate * 100).format()}%",
                                                            style: 12.w5(
                                                                color: AppColors
                                                                    .cFFFFFF,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fOswaldMedium),
                                                          )
                                                        ],
                                                      ),
                                                      5.vGap,
                                                      Container(
                                                        height: 9.w,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .c333333,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.5.w)),
                                                        child: Row(
                                                          children: [
                                                            AnimatedContainer(
                                                              height: 9.w,
                                                              width: 225.w *
                                                                  min(
                                                                      1,
                                                                      controller
                                                                          .startUpItem
                                                                          .successRate),
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .cFFFFFF,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.5.w)),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    )),

                    ///底部
                    SizedBox(
                      // width: 343.w,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 343.w,
                            child: Column(
                              children: [
                                51.vGap,
                                Row(
                                  children: [
                                    Text(
                                      "SPARRING RESULT",
                                      style: 19.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                  ],
                                ),
                                15.vGap,

                                ///表格
                                GetBuilder<SlotDialogController>(
                                    id: SlotDialogController.idSparringResult,
                                    builder: (logic) {
                                      return Container(
                                        height: 110.w,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              width: 1.w,
                                              color: AppColors.cE6E6E6,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: List.generate(
                                              controller.propertys.length - 3,
                                              (index) {
                                            var borderSide = BorderSide(
                                              width: 1.w,
                                              color: AppColors.cE6E6E6,
                                            );
                                            var item =
                                                controller.propertys[index];
                                            var list =
                                                controller.slotResult[item] ??
                                                    [];
                                            return Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    top: borderSide,
                                                    right: borderSide,
                                                    bottom: borderSide,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    //表头
                                                    Container(
                                                      height: 21.w,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: borderSide,
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        item,
                                                        style: 12.w5(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoMedium,
                                                        ),
                                                      ),
                                                    ),
                                                    //表内容
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children:
                                                              List.generate(
                                                                  list.length,
                                                                  (tIndex) {
                                                            Property prop =
                                                                list[tIndex];
                                                            return AnimatedScale(
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              scale: 1,
                                                              child: Container(
                                                                height: 17.w,
                                                                width: 34.w,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 7
                                                                            .w),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(4
                                                                            .w),
                                                                    color: controller.isGameOver.value &&
                                                                            !controller
                                                                                .isSuccess
                                                                        ? AppColors
                                                                            .cB2B2B2
                                                                        : prop
                                                                            .color),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "+${(prop.bet * controller.upStarTeamPlayerV2Entity.addRate).toStringAsFixed(1)}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColors
                                                                          .cFFFFFF,
                                                                      height: 1,
                                                                      decorationColor:
                                                                          AppColors
                                                                              .cFFFFFF,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .fRobotoMedium,
                                                                      decoration: controller.isGameOver.value &&
                                                                              !controller.isSuccess
                                                                          ? TextDecoration.lineThrough
                                                                          : null),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          59.vGap,
                          SizedBox(
                            height: 70.w,
                            child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controller.btnPageController,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (controller
                                                  .upStarTeamPlayerV2Entity
                                                  .starUpList
                                                  .isNotEmpty &&
                                              !controller.isGameOver.value &&
                                              controller.slotCount < 8)
                                            Text(
                                              "TIMES:${max(0, 8 - controller.slotCount.value)}",
                                              style: 12.w4(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily: Assets
                                                      .fontsRobotoRegular),
                                            ),
                                          7.vGap,
                                          MtInkwell(
                                            onTap: () => controller.done(),
                                            child: Container(
                                              height: 51.w,
                                              width: 118.w,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .slotCount.value >
                                                          8
                                                      ? AppColors.cFF7954
                                                      : AppColors.cEEEEEE,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.w)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "DONE",
                                                style: 25.w5(
                                                    color: controller.slotCount
                                                                .value >
                                                            8
                                                        ? AppColors.cFFFFFF
                                                        : AppColors.ccccccc,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                    height: 1),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          MtInkwell(
                                            onTap: () => controller.startSlot(),
                                            child: Container(
                                              height: 51.w,
                                              width: 216.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.c000000,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.w)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "CONTINUE",
                                                style: 25.w5(
                                                    color: AppColors.cF2F2F2,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                    height: 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MtInkwell(
                                        onTap: () => controller.goBack(),
                                        child: Container(
                                          height: 51.w,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.c666666,
                                                width: 1.w,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(9.w)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "GO BACK",
                                            style: 23.w5(
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                                height: 1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          35.vGap
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }

  Widget _buildSlotWidget() {
    return Obx(() {
      var shadow = Shadow(
          color: AppColors.c000000.withOpacity(0.78),
          blurRadius: 4.w,
          offset: Offset(1.5.w, 0.w));
      if (controller.isGameOver.value) {
        /// 结算
        return InnerShadow(
          shadows: [
            shadow,
          ],
          child: Container(
            height: 106.w,
            width: 225.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: AppColors.c323232,
            ),
            child: Builder(builder: (context) {
              if (controller.isSuccess) {
                /// 成功
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconWidget(
                                iconWidth: 38.w,
                                icon: Assets.managerUiManagerPlayerstar),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.w),
                              child: Text(
                                "${Get.find<TeamUpgradeController>().teamPlayerUpStarVoEntity.breakThroughGrade + 1}",
                                style: 21.w7(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold,
                                ),
                              ),
                            )
                          ],
                        ),
                        18.hGap,
                        Row(
                          children: [
                            IconWidget(
                              iconWidth: 10.w,
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.cFF7954.withOpacity(0.2),
                            ),
                            IconWidget(
                              iconWidth: 10.w,
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.cFF7954.withOpacity(0.6),
                            ),
                            IconWidget(
                              iconWidth: 10.w,
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.cFF7954,
                            ),
                          ],
                        ),
                        18.hGap,
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconWidget(
                                iconWidth: 38.w,
                                icon: Assets.managerUiManagerPlayerstar),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.w),
                              child: Text(
                                "${Get.find<TeamUpgradeController>().teamPlayerUpStarVoEntity.breakThroughGrade + 2}",
                                style: 21.w7(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    10.vGap,
                    Text.rich(
                      const TextSpan(children: [
                        TextSpan(
                            text: "U",
                            style: TextStyle(color: AppColors.cFF7954)),
                        TextSpan(text: "PDATE"),
                        TextSpan(
                            text: " S",
                            style: TextStyle(color: AppColors.cFF7954)),
                        TextSpan(text: "UCCESSFUL"),
                      ]),
                      style: 21.w7(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fOswaldBold),
                    )
                  ],
                );
              }

              /// 失败
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                      iconWidth: 80.w,
                      icon: Assets.managerUiManagerPlayerinfoFailure),
                  8.vGap,
                  Text(
                    "UPDATE FAILURE",
                    style: 21.w7(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  )
                ],
              );
            }),
          ),
        );
      }
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 106.w,
            width: 241.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: InnerShadow(
                shadows: [
                  shadow,
                ],
                child: Container(
                  height: 106.w,
                  width: 225.w,
                  decoration: BoxDecoration(
                    color: AppColors.c323232,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 199.w,
                        height: 106.w,
                        child: Row(
                          children: List.generate(
                              controller.selectIndexList.length, (outIndex) {
                            var slotMachineController =
                                controller.slotMachineControllers[outIndex];
                            return Expanded(
                              child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 1.5.w),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.c000000,
                                          AppColors.c262626,
                                          AppColors.c000000
                                        ]),
                                  ),
                                  child: SlotListViewWidget(
                                    controller: slotMachineController,
                                    itemCount: controller.propertys.length,
                                    onEnd: (value) {
                                      print('slot end -----$value');
                                      controller.onSpinEnd();
                                    },
                                    itemBuilder: (context, index, selectIndex) {
                                      Widget child = FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "${controller.propertys[index]} ${index < 8 && controller.selectIndexList.length == 1 ? "+${controller.upStarTeamPlayerV2Entity.addRate.format()}" : ""}",
                                          style: 16.w7(
                                              color: slotMachineController
                                                      .isAnimating
                                                  ? AppColors.cFFFFFF
                                                      .withOpacity(0.6)
                                                  : index == selectIndex
                                                      ? AppColors.cFFFFFF
                                                      : AppColors.cFFFFFF
                                                          .withOpacity(0.2),
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldBold),
                                        ),
                                      );
                                      if (index >= 8 &&
                                          controller.selectIndexList.length ==
                                              1) {
                                        var iconName = Assets
                                            .managerUiManagerPlayerinfoIcon04;
                                        if (index == 9) {
                                          iconName = Assets
                                              .managerUiManagerPlayerinfoIcon03;
                                        } else if (index == 10) {
                                          iconName = Assets
                                              .managerUiManagerPlayerinfoIcon01;
                                        }
                                        Widget icon = Opacity(
                                          opacity:
                                              slotMachineController.isAnimating
                                                  ? 0.6
                                                  : index == selectIndex
                                                      ? 1
                                                      : 0.2,
                                          child: IconWidget(
                                              iconWidth: 20.w, icon: iconName),
                                        );
                                        child = Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            icon,
                                            7.hGap,
                                            child,
                                          ],
                                        );
                                      }
                                      return Container(
                                        height: 46.w,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        decoration: BoxDecoration(
                                            image: !slotMachineController
                                                        .isAnimating &&
                                                    8 == selectIndex &&
                                                    index == selectIndex
                                                ? const DecorationImage(
                                                    image: AssetImage(Assets
                                                        .managerUiManagerPlayerinfoFrame))
                                                : null,
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1.w,
                                                    color: AppColors.c333333))),
                                        child: Center(
                                          child: child,
                                        ),
                                      );
                                    },
                                  )),
                            );
                          }),
                        ),
                      ),

                      // 左边门
                      Obx(() {
                        return Positioned(
                          left: controller.doorOffset.value * -112.w,
                          child: Container(
                            width: 112.w,
                            height: 106.w,
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: AppColors.c848484, width: 1.5.w)),
                              color: AppColors.c323232,
                              image: const DecorationImage(
                                alignment: Alignment.centerRight,
                                image: AssetImage(
                                    Assets.managerUiManagerPlayerinfoBg02),
                              ),
                            ),
                          ),
                        );
                      }),
                      // 右边门
                      Obx(() {
                        return Positioned(
                          right: controller.doorOffset.value * -112.w,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(-1.0, 1.0),
                            child: Container(
                              width: 112.w,
                              height: 106.w,
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: AppColors.c848484,
                                        width: 1.5.w)),
                                color: AppColors.c323232,
                                image: const DecorationImage(
                                  alignment: Alignment.centerRight,
                                  image: AssetImage(
                                      Assets.managerUiManagerPlayerinfoBg02),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              child: IconWidget(
                iconWidth: 16.w,
                icon: Assets.commonUiCommonArrow,
                rotateAngle: -90,
              )),
          Positioned(
              right: 0,
              child: IconWidget(
                iconWidth: 16.w,
                icon: Assets.commonUiCommonArrow,
                rotateAngle: 90,
              ))
        ],
      );
    });
  }

  void back() {
    controller.tvShow.value = false;
    controller.isInBackStatus = true;
  }
}
