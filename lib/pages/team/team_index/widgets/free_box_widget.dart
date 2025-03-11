import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';

import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FreeGiftBox extends StatelessWidget {
  const FreeGiftBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
        id: "battleBox",
        builder: (ctrl) {
          return MtInkWell(
            onTap: () async {
              if (ctrl.recieved) return;
              ctrl.openFreeGift();
            },
            child: Column(
              children: [
                SizedBox(
                  height: 58.5.w,
                  width: 60.w,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 24.w,
                        child: Image.asset(
                          Assets.managerUiManagerIconPlate,
                          width: 60.w,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: SizedBox(
                          width: 45.w,
                          height: 37.5.w,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Image.asset(
                                    ctrl.recieved
                                        ? Assets.teamUiTeamBox04
                                        : Assets.teamUiTeamBox03,
                                    width: 22.w,
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Image.asset(
                                  ctrl.cardPackInfo.freeGiftCount >= 1 ||
                                          ctrl.recieved
                                      ? Assets.teamUiTeamBox02
                                      : Assets.teamUiTeamBox01,
                                  width: 35.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                4.vGap,
                !ctrl.recieved
                    ? Column(
                        children: [
                          IconWidget(
                            iconWidth: 5.w,
                            icon: Assets.iconUiIconShrink,
                            iconColor: AppColors.cFF7954,
                            // rotateAngle: 90,
                          ),
                          2.vGap,
                          Text(
                            LangKey.teamButtonGift.tr,
                            style:
                                10.w4(color: AppColors.cFF7954, height: 0.75),
                          ),
                        ],
                      )
                    : Obx(() {
                        return Text(
                          ctrl.cardPackInfo.freeTimeString.value,
                          style: 10.w4(
                            color: AppColors.c000000,
                            fontFamily: FontFamily.fRobotoMedium,
                            height: 0.75,
                          ),
                        );
                      }),
              ],
            ),
          );
        });
  }
}
