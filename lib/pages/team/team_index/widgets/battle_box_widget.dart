import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/open_box_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/box_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/entities/card_pack_info_entity.dart';

class BattleBoxWidget extends GetView<TeamIndexController> {
  const BattleBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
        id: "battleBox",
        builder: (context) {
          if (controller.cardPackInfo.card.isEmpty) {
            return const SizedBox.shrink();
          }
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
                  if (item.status == 2) {
                    child = Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.managerUiManagerGift03,
                          width: 61.w,
                          fit: BoxFit.fitWidth,
                        ),
                        3.vGap,
                        IconWidget(
                          iconWidth: 5.w,
                          icon: Assets.iconUiIconShrink,
                          iconColor: AppColors.cFF7954,
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
                    );
                  } else if (item.status == 1) {
                    child = Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.managerUiManagerGift01,
                          width: 61.w,
                          fit: BoxFit.fitWidth,
                        ),
                        // 9.vGap,
                        Obx(() {
                          return Column(
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
                          );
                        })
                      ],
                    );
                  } else if (item.status == 0) {
                    child = noWait
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.managerUiManagerGift03,
                                width: 61.w,
                                fit: BoxFit.fitWidth,
                              ),
                              3.vGap,
                              IconWidget(
                                iconWidth: 5.w,
                                icon: Assets.iconUiIconShrink,
                                iconColor: AppColors.c000000,
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
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.managerUiManagerGift02,
                                width: 61.w,
                                fit: BoxFit.fitWidth,
                              ),
                              // 15.vGap,
                              Text(
                                "WAITING",
                                style: 12.w4(
                                  color: AppColors.c262626,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular,
                                ),
                              )
                            ],
                          );
                  } else if (item.status == -1) {
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

                  return MtInkwell(
                    minScale: 0.9,
                    onTap: () async {
                      if (item.status == -1) {
                        controller.scroToMatch();
                      } else if (item.status == 2) {
                        controller.step = 0;
                        for (var e in item.playerCards) {
                          e.isOpen.value = false;
                          e.isSelect.value = false;
                        }
                        Get.to(
                            opaque: false,
                            () => OpenBoxPage(item: item),
                            duration: 300.milliseconds,
                            transition: Transition.fadeIn);
                        // Get.toNamed(RouteNames.openBoxPage, arguments: item);
                      } else {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: Get.context!,
                            builder: (context) {
                              return BattleBoxDialog(item: item, index: index);
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
