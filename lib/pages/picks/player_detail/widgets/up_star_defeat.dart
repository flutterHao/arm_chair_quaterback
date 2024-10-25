import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/game/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/21/22:05

class UpStarDefeat extends StatelessWidget {
  const UpStarDefeat({super.key});

  @override
  Widget build(BuildContext context) {
    var gameController = Get.find<GameController>();
    return Center(
      child: Container(
        height: 394.w,
        constraints: BoxConstraints(maxWidth: 303.w),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Text(
              "DEFEAT",
              style: 52.w7(color: AppColors.cB3B3B3, height: 1),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.c262626,
                      AppColors.cFFFFFF,
                      AppColors.cFFFFFF
                    ],
                    stops: [
                      0.06,
                      0.3,
                      1
                    ]),
              ),
            ),
            Positioned(
                top: 20.w,
                child:
                    IconWidget(iconWidth: 111.w, icon: Assets.uiWindowsLosePng)),
            Container(
              margin: EdgeInsets.only(top: 99.w),
              child: DialogBackground(
                borderHeight: 2,
                borderRadius: BorderRadius.circular(20.w),
                backgroundColor: AppColors.c262626,
                frontColor: AppColors.cF2F2F2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 40.w,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 97.w,
                                icon: Assets.uiIconStar_01Png,
                                iconColor: AppColors.cBFBFBF,
                              ),
                              Positioned(
                                  top: 30.w,
                                  child: Text(
                                    "${gameController.uuidPlayerInfo?.getBreakThroughGrade()}",
                                    style: 56.w7(
                                        color: AppColors.c262626, height: 1),
                                  ))
                            ],
                          ),
                          19.vGap,
                          Text(
                            "Remains Unchanged",
                            style: 14.w4(color: AppColors.cB2B2B2, height: 1),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 19.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 44.w,
                              constraints: BoxConstraints(maxWidth: 243.w),
                              child: BtnBackground(
                                child: SizedBox(
                                  height: 44.w,
                                  width: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        "CONFIRM",
                                        style: 18.w7(color: AppColors.cF2F2F2),
                                      ),
                                      Positioned(
                                          left: 9.w,
                                          child: Stack(
                                            children: [
                                              IconWidget(
                                                  iconWidth: 26.w,
                                                  icon: Assets.uiIconRingPng),
                                              Positioned(
                                                  left: 7.w,
                                                  top: 5.5.w,
                                                  child: IconWidget(
                                                    iconWidth: 17.w,
                                                    icon:
                                                        Assets.uiIconConfirmPng,
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
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
