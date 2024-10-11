import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/30/17:43

class ScorePanel extends StatelessWidget {
  const ScorePanel({super.key, required this.leftScore, required this.rightScore});

  final int leftScore;
  final int rightScore;

  @override
  Widget build(BuildContext context) {
    return _buildScore();
  }

  Widget _buildScore() {
    return Container(
      height: 81.h,
      constraints: BoxConstraints(
        maxWidth: 343.w,
      ),
      decoration: BoxDecoration(
          color: AppColors.c262626,
          borderRadius: BorderRadius.circular(16.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          9.hGap,
          Container(
            width: 99.w,
            height: 63.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF.withOpacity(.1),
                borderRadius: BorderRadius.circular(9.h)),
            child: Text(
              "$leftScore",
              style: 40.w7(color: AppColors.c3B93FF),
            ),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  var section = index == 0
                      ? "1ST"
                      : index == 1
                      ? "2ND"
                      : index == 2
                      ? "3RD"
                      : "4TH";
                  var score = index == 0 ? 99 : -1;
                  return Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${score > 0 ? score : "--"}",
                          style: 14.w7(
                              color: score > 0
                                  ? AppColors.c3B93FF
                                  : AppColors.c666666,
                              height: 1),
                        ),
                        14.hGap,
                        Row(
                          children: [
                            SizedBox(
                              width: 5.h,
                              height: 5.h,
                              child: Visibility(
                                  visible: score > 0,
                                  child: IconWidget(
                                    iconWidth: 5.h,
                                    icon: Assets.uiTriangleGPng,
                                    rotateAngle: -90,
                                    iconColor: AppColors.cB3B3B3,
                                  )),
                            ),
                            4.hGap,
                            Text(
                              section,
                              style: 10.w4(
                                  color: score > 0
                                      ? AppColors.cB3B3B3
                                      : AppColors.c666666,
                                  height: 1),
                            ),
                            4.hGap,
                            SizedBox(
                                width: 5.h,
                                height: 5.h,
                                child: Visibility(
                                    visible: score > 0,
                                    child: IconWidget(
                                      iconWidth: 5.h,
                                      icon: Assets.uiTriangleGPng,
                                      rotateAngle: 90,
                                      iconColor: AppColors.cB3B3B3,
                                    ))),
                          ],
                        ),
                        14.hGap,
                        Text(
                          "${score > 0 ? score : "--"}",
                          style: 14.w7(
                              color: score > 0
                                  ? AppColors.c3B93FF
                                  : AppColors.c666666,
                              height: 1),
                        ),
                      ],
                    ),
                  );
                }),
              )),
          Container(
            width: 99.w,
            height: 63.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF.withOpacity(.1),
                borderRadius: BorderRadius.circular(9.h)),
            child: Text(
              "$rightScore",
              style: 40.w7(color: AppColors.cFF7954),
            ),
          ),
          9.hGap,
        ],
      ),
    );
  }

}
