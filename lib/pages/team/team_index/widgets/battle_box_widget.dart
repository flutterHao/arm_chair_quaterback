import 'dart:convert';

import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
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
            margin: EdgeInsets.only(top: 12.w),
            height: 112.w,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = controller.cardPackInfo.card[index];
                  Widget child = const SizedBox.shrink();
                  child = Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(top: 3.w, child: _cardPackImage(item.cardId)),
                      if (item.status == 0)
                        noWait
                            ? Positioned(
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
                                      "UNLOCK",
                                      style: 16.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Positioned(
                                bottom: 10.w,
                                child: Text(
                                  "WAITING",
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
                                icon: Assets.commonUiCommonIconSystemArrow,
                                iconColor: AppColors.cFF7954,
                                rotateAngle: -90,
                              ),
                              3.vGap,
                              Text(
                                "OPEN",
                                style: 16.w4(
                                  color: AppColors.cFF7954,
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
                        14.vGap,
                        Text(
                          "GO MATCH",
                          style: 10.w4(color: AppColors.cB2B2B2, height: 1),
                        )
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
                        controller.scroToMatch();
                      } else if (item.status == 2) {
                        // var a = item.toString();
                        controller.toOpenBoxPage(item);
                      } else {
                        showModalBottomSheet(
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
          );
        });
  }
}
