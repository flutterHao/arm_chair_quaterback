import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
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
          return Container(
            margin: EdgeInsets.only(top: 12.w),
            height: 112.w,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CardPackInfoCard item = controller.cardPackInfo.card[index];
                  Widget child = const SizedBox.shrink();
                  if (item.status == 2) {
                    child = Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.uiManagerGift_03Png,
                          width: 79.w,
                        ),
                        3.vGap,
                        IconWidget(
                          iconWidth: 5.w,
                          icon: Assets.uiIconShrinkPng,
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
                          Assets.uiManagerGift_01Png,
                          width: 79.w,
                        ),
                        // 9.vGap,
                        Text(
                          "09:51",
                          style: 16.w4(
                            color: AppColors.c262626,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        )
                      ],
                    );
                  } else if (item.status == 0) {
                    child = Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.uiManagerGift_02Png,
                          width: 79.w,
                          fit: BoxFit.fitWidth,
                        ),
                        // 15.vGap,
                        Text(
                          "WAITING",
                          style: 16.w4(
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
                          icon: Assets.uiIconPlusPng,
                          iconColor: AppColors.c000000,
                        ),
                        // 14.vGap,
                        Text(
                          "GO MATCH",
                          style: 10.w4(color: AppColors.cB2B2B2, height: 1),
                        )
                      ],
                    );
                  }

                  return MtInkwell(
                    onTap: () async {
                      if (item.status == -1) {
                        await Get.toNamed(RouteNames.teamTeamBattle);
                        controller.getBattleBox();
                      }
                    },
                    child: Container(
                        width: 79.w,
                        height: 112.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(
                            width: 1,
                            color: AppColors.c666666,
                          ),
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
