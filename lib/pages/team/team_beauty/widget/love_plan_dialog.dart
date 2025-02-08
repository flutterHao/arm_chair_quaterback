import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/success_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LovePlanDialog extends StatelessWidget {
  const LovePlanDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBottomDialog(
        height: 434.w,
        child: Column(
          children: [
            27.vGap,
            Text(
              "love plan".toUpperCase(),
              style: 27.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.85),
            ),
            14.vGap,
            Text(
              "Finish the plan,Change her costume",
              style: 12.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.85),
            ),
            12.5.vGap,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 29.w),
              child: SizedBox(
                width: double.infinity,
                height: 32.w,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Positioned(
                      left: 0,
                      top: 2.5.w,
                      child: IconWidget(
                          iconWidth: 23.5.w,
                          icon:
                              Assets.cheerleadersUiCheerleadersIconLoveletter),
                    ),
                    7.hGap,
                    Positioned(
                      left: 31.w,
                      right: 31.w,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 9.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(4.5.w)),
                                border: Border.all(
                                    width: 1, color: AppColors.cD1D1D1)),
                          ),
                          CustomLinearProgressBar(
                              backgroundColor: Colors.transparent,
                              height: 9.w,
                              progress: 0.8,
                              progressColor: AppColors.cE24C4B,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(4.5.w)),
                              width: double.infinity),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.w),
                            color: AppColors.cE6E6E),
                        child: Image.asset(
                          Assets.cheerleadersUiCheerleadersIconClothing04,
                          height: 23.w,
                          color: AppColors.c000000,
                        ),
                      ),
                    ),
                    15.vGap,
                  ],
                ),
              ),
            ),
            22.vGap,
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.cD1D1D1,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _Item();
                  },
                  separatorBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors.cE6E6E,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                  itemCount: 3),
            ),
          ],
        ));
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 29.5.w, vertical: 16.w),
      width: double.infinity,
      child: Column(
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
                text:
                    'Signed 10 top girls Signed 10 Signed 10 top Signed 10 girls Signed 10(',
                style: 12.w4(
                  fontFamily: FontFamily.fRobotoRegular,
                  height: 1,
                )),
            TextSpan(
              text: '5',
              style: 12.w4(
                color: AppColors.cE72646,
                fontFamily: FontFamily.fRobotoRegular,
                height: 1,
              ),
            ),
            TextSpan(
                text: '/10)',
                style: 12.w4(
                  fontFamily: FontFamily.fRobotoRegular,
                  height: 1,
                )),
          ])),
          16.vGap,
          Row(
            children: [
              7.5.hGap,
              Expanded(
                child: Row(
                  children: [
                    _award(
                      Assets.teamUiMoney02,
                      Utils.formatMoney(500),
                    ),
                    42.5.hGap,
                    _award(
                      Assets.cheerleadersUiCheerleadersIconLoveletter,
                      "1",
                    ),
                  ],
                ),
              ),
              MtInkWell(
                onTap: () {
                  BottomTipDialog.showWithSound(
                      isScrollControlled: true,
                      context: Get.context!,
                      builder: (context) {
                        return SuccessDialog(
                          title: "Congratulations".toUpperCase(),
                          content: Container(
                            margin: EdgeInsets.only(top: 74.w),
                            child: Column(
                              children: [
                                Text(
                                  "reward",
                                  style: 19.w4(
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 0.9,
                                  ),
                                ),
                                10.vGap,
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  color: AppColors.cE6E6E,
                                ),
                                23.vGap,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _award(
                                      Assets.teamUiMoney02,
                                      Utils.formatMoney(500),
                                    ),
                                    42.5.hGap,
                                    _award(
                                      Assets
                                          .cheerleadersUiCheerleadersIconLoveletter,
                                      "1",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          comfirmBtn: MtInkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              height: 51.w,
                              margin: EdgeInsets.symmetric(horizontal: 16.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.c000000,
                                borderRadius: BorderRadius.circular(9.w),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "receive reward".toUpperCase(),
                                style: 23.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 59.w,
                  height: 40.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.w),
                      border: Border.all(color: AppColors.c666666)),
                  child: Text(
                    "GO TO",
                    style: 12.w4(
                      color: AppColors.c000000,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _award(String img, String num) {
  return Column(
    children: [
      Image.asset(
        img,
        height: 32.w,
      ),
      14.vGap,
      Text(
        num,
        style: 14.w4(
          fontFamily: FontFamily.fRobotoRegular,
          height: 0.85,
        ),
      )
    ],
  );
}
