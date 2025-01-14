import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LegendaryManagerWidget extends StatefulWidget {
  const LegendaryManagerWidget({super.key});

  @override
  State<LegendaryManagerWidget> createState() => _LegendaryManagerWidgetState();
}

class _LegendaryManagerWidgetState extends State<LegendaryManagerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 9.w),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
              decoration: const BoxDecoration(
                color: AppColors.cFFFFFF,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Legendary Manager 3',
                    style: 24.w5(fontFamily: FontFamily.fOswaldMedium),
                  ),
                  22.vGap,
                  Stack(
                    children: [
                      67.vGap,
                      Row(children: [
                        const Spacer(),
                        SizedBox(
                            height: 67.w,
                            width: 282.w,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 4.w),
                                  padding: EdgeInsets.only(top: 4.w),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      IconWidget(
                                          iconWidth: 20.w,
                                          icon: Assets
                                              .managerUiManagerIconCurrency04),
                                      5.hGap,
                                      Text(
                                        '15300/20000',
                                        style: 14.w5(
                                            fontFamily:
                                                FontFamily.fOswaldMedium),
                                      ),
                                      const Spacer(),
                                      IconWidget(
                                          iconWidth: 14.w,
                                          iconColor: Colors.black,
                                          icon: Assets
                                              .scoresUiScoresIconSystemRank),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 0.w,
                                      left: -4.w,
                                      child: CustomLinearProgressBar(
                                          width: 282.w,
                                          height: 14.w,
                                          progressColor: AppColors.c000000,
                                          backgroundColor: AppColors.cFFFFFF,
                                          progress: 0.2),
                                    ),
                                    Positioned(
                                      top: 0.w,
                                      left: -4.w,
                                      child: Container(
                                        width: 282.w,
                                        height: 14.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.w),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.cD1D1D1)),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            )),
                      ]),
                      Positioned(
                        left: 0,
                        child: IconWidget(
                            iconWidth: 57.w,
                            iconHeight: 67.w,
                            icon: Assets.managerUiManagerGameGrade01),
                      )
                    ],
                  ),
                  22.vGap,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              'Contests Won',
                              style:
                                  12.w5(fontFamily: FontFamily.fRobotoRegular),
                            ),
                            Text(
                              '172',
                              style: 35.w5(fontFamily: FontFamily.fOswaldBold),
                            )
                          ],
                        )),
                        const VerticalDivider(
                          width: 1, // 增加宽度
                          color: AppColors.cD1D1D1,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 59.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'win Rate',
                                style: 12
                                    .w5(fontFamily: FontFamily.fRobotoRegular),
                              ),
                              Text.rich(TextSpan(
                                  text: '17',
                                  style:
                                      35.w5(fontFamily: FontFamily.fOswaldBold),
                                  children: [
                                    TextSpan(
                                      text: '%',
                                      style: 20.w5(
                                          fontFamily: FontFamily.fOswaldBold),
                                    )
                                  ]))
                            ],
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: 10.w,
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  border: Border.all(color: AppColors.c666666.withOpacity(0.3)),
                ),
                child: IconWidget(
                  iconWidth: 16.w,
                  icon: Assets.commonUiCommonIconSystemShare,
                  iconColor: AppColors.c000000,
                ),
              ),
            )
          ],
        ));
  }
}
