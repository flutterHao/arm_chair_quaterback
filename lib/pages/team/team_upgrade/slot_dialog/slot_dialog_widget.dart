import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
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
          init: SlotDialogController(),
          builder: (logic) {
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
                          return AnimatedPositioned(
                            bottom: controller.tvShow.value
                                ? 0
                                : (232.w + 327.w + 6.w + 309.w),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            onEnd: () {
                              if (controller.isInBackStatus) {
                                Get.back();
                              } else {
                                Future.delayed(
                                    const Duration(milliseconds: 600), () {
                                  controller.doorAnimationController.forward();
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
                                            height: 232.w,
                                            width: 4.w,
                                            color: AppColors.c434343,
                                          ),
                                          Container(
                                            height: 232.w,
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
                                                            "62%",
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
                                                                  min(1, 0.62),
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
                          Container(
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
                                  controller.propertys.length, (index) {
                                var borderSide = BorderSide(
                                  width: 1.w,
                                  color: AppColors.cE6E6E6,
                                );
                                var item = controller.propertys[index];
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
                                          alignment: Alignment.center,
                                          child: Text(
                                            item,
                                            style: 12.w5(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fRobotoMedium,
                                            ),
                                          ),
                                        ),
                                        //表内容
                                        Expanded(
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children:
                                                  List.generate(3, (tIndex) {
                                                return Container(
                                                  height: 17.w,
                                                  width: 34.w,
                                                  margin:
                                                      EdgeInsets.only(top: 7.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.w),
                                                      color: AppColors.c67A517),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "+20.1",
                                                    style: 10.w5(
                                                        color:
                                                            AppColors.cFFFFFF,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoMedium),
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
                          ),
                          59.vGap,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "TIMES:5",
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: Assets.fontsRobotoRegular),
                                  ),
                                  7.vGap,
                                  MtInkwell(
                                    onTap: () => controller.doorAnimationController.reverse(),
                                    child: Container(
                                      height: 51.w,
                                      width: 118.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.cEEEEEE,
                                          borderRadius:
                                              BorderRadius.circular(9.w)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "DONE",
                                        style: 25.w5(
                                            color: AppColors.ccccccc,
                                            fontFamily: FontFamily.fOswaldMedium,
                                            height: 1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              MtInkwell(
                                onTap: ()=> controller.slotMachineController.spin(index: 0),
                                child: Container(
                                  height: 51.w,
                                  width: 216.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.c000000,
                                      borderRadius: BorderRadius.circular(9.w)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CONTINUE",
                                    style: 25.w5(
                                        color: AppColors.cF2F2F2,
                                        fontFamily: FontFamily.fOswaldMedium,
                                        height: 1),
                                  ),
                                ),
                              )
                            ],
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
                              "5",
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
                              "6",
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
                      TextSpan(text: "U",style: TextStyle(
                        color: AppColors.cFF7954
                      )),
                      TextSpan(text: "PDATE"),
                      TextSpan(text: " S",style: TextStyle(
                          color: AppColors.cFF7954
                      )),
                      TextSpan(text: "UCCESSFUL"),
                    ]),
                    style: 21.w7(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  )
                ],
              );

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
                          children: List.generate(1, (index){
                            return Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.5.w),
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
                                    controller: controller.slotMachineController,
                                    itemCount: controller.propertys.length,
                                    onEnd: (value){
                                      print('slot end -----$value');
                                    },
                                    itemBuilder: (context,index,selectIndex){
                                      return Container(
                                        height: 46.w,
                                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1.w,
                                                    color: AppColors.c333333
                                                )
                                            )
                                        ),
                                        child: Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              controller.propertys[index],
                                              style: 16.w7(
                                                  color: index == selectIndex
                                                      ? AppColors.cFFFFFF.withOpacity(0.6)
                                                      : AppColors.cFFFFFF.withOpacity(0.6),
                                                  height: 1,
                                                  fontFamily: FontFamily.fOswaldBold),
                                            ),
                                          ),
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
                          left: controller.doorAnimationController.value.value *
                              -112.w,
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
                          right: controller.doorAnimationController.value.value *
                              -112.w,
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
                                        color: AppColors.c848484, width: 1.5.w)),
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
