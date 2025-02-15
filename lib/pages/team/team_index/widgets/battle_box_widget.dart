import 'dart:convert';

import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/open_box_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/box_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BattleBoxWidget extends GetView<TeamIndexController> {
  const BattleBoxWidget({super.key});

  Widget _cardPackImage(int cardId) {
    return Image.asset(
      Utils.getBoxImageUrl(cardId),
      width: 80.w,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
        id: "battleBox",
        builder: (context) {
          // if (controller.cardPackInfo.card.isEmpty) {
          //   return const SizedBox.shrink();
          // }
          bool noWait =
              controller.cardPackInfo.card.where((e) => e.status == 1).isEmpty;
          return Container(
            color: Colors.white,
            height: 157.5.w,
            child: Column(
              children: [
                SemiCircleList(),
                Container(
                  margin: EdgeInsets.only(top: 16.w),
                  height: 112.w,
                  alignment: Alignment.center,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = controller.cardPackInfo.card[index];
                        Widget child = const SizedBox.shrink();
                        child = Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                                top: 3.w, child: _cardPackImage(item.cardId)),
                            if (item.status == 0)
                              noWait
                                  ? Positioned(
                                      bottom: 10.w,
                                      child: Column(
                                        children: [
                                          IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets
                                                .commonUiCommonIconSystemArrow,
                                            iconColor: AppColors.c000000,
                                            rotateAngle: -90,
                                          ),
                                          3.vGap,
                                          Text(
                                            LangKey.teamButtonUnlocked.tr
                                                .toUpperCase(),
                                            style: 16.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Positioned(
                                      bottom: 15.5.w,
                                      child: Text(
                                        LangKey.gameTabWaiting.tr.toUpperCase(),
                                        style: 12.w4(
                                          color: AppColors.c262626,
                                          height: 1,
                                          fontFamily: FontFamily.fRobotoRegular,
                                        ),
                                      ),
                                    ),
                            if (item.status == 1)
                              Obx(() {
                                return Positioned(
                                  bottom: 10.w,
                                  child: Column(
                                    children: [
                                      Text(
                                        item.remainTime.value,
                                        style: 12.w4(
                                          color: AppColors.c262626,
                                          height: 1,
                                          fontFamily: FontFamily.fRobotoRegular,
                                        ),
                                      ),
                                      5.vGap,
                                      CustomLinearProgressBar(
                                        progress: item.progress,
                                        height: 6.w,
                                        width: 68.w,
                                        milliseconds: 1000,
                                        backgroundColor: AppColors.ccccccc,
                                        progressColor: AppColors.c262626,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            if (item.status == 2)
                              Positioned(
                                bottom: 10.w,
                                child: Column(
                                  children: [
                                    IconWidget(
                                      iconWidth: 5.w,
                                      icon:
                                          Assets.commonUiCommonIconSystemArrow,
                                      iconColor: AppColors.c000000,
                                      rotateAngle: -90,
                                    ),
                                    3.vGap,
                                    Text(
                                      LangKey.cardpackButtonOpen.tr,
                                      style: 16.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium,
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ],
                        );
                        if (item.status == -1) {
                          child = Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 20.w,
                                icon: Assets.iconUiIconPlus,
                                iconColor: AppColors.c000000,
                              ),
                              // 14.vGap,
                              // Text(
                              //   LangKey.teamButtonGoMatch.tr,
                              //   style:
                              //       10.w4(color: AppColors.cB2B2B2, height: 1),
                              // )
                            ],
                          );
                        }
                        bool canOpen =
                            item.status == 2 || (item.status == 0 && noWait);

                        return MtInkWell(
                          minScale: 0.9,
                          onTap: () async {
                            // item.status = 1;
                            if (item.status == -1) {
                              controller.scroToSlot();
                            } else if (item.status == 2) {
                              // var a = item.toString();
                              controller.toOpenBoxPage(context, item);
                            } else {
                              BottomTipDialog.showWithSound(
                                  isScrollControlled: true,
                                  context: Get.context!,
                                  builder: (context) {
                                    return BattleBoxDialog(item: item);
                                  });
                            }
                          },
                          child: Container(
                              width: 79.w,
                              height: 112.w,
                              decoration: BoxDecoration(
                                color: canOpen ? null : AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(9.w),
                                border: canOpen
                                    ? Border.all(
                                        width: 1,
                                        color: AppColors.c666666,
                                      )
                                    : null,
                              ),
                              child: child),
                        );
                      },
                      separatorBuilder: (context, index) => 9.hGap,
                      itemCount: controller.cardPackInfo.card.length),
                ),
              ],
            ),
          );
        });
  }
}

class SemiCircleList extends StatelessWidget {
  // 假设屏幕宽度为 375.w（可以根据实际情况调整）

  // 计算半圆直径
  final double circleDiameter = 8.5.w;

  // 计算半圆间距
  final double circleSpacing = 8.5.w;

  // 计算左右边距
  final double horizontalPadding = 6.w;

  @override
  Widget build(BuildContext context) {
    // 计算每个半圆的宽度（包括间距）
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = circleDiameter + circleSpacing;

    // 计算可用的总宽度
    final double availableWidth = screenWidth - 2 * horizontalPadding;

    // 计算可以显示多少个半圆
    final int itemCount = (availableWidth + circleSpacing / itemWidth).floor();

    return Container(
      height: circleDiameter / 2, // 半圆的高度为直径的一半
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // 水平滚动
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            width: circleDiameter, // 半圆的宽度
            height: circleDiameter / 2, // 半圆的高度
            decoration: BoxDecoration(
              color: AppColors.cF2F2F2, // 半圆的颜色
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(circleDiameter / 2)),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: circleSpacing); // 半圆之间的间距
        },
      ),
    );
  }
}
