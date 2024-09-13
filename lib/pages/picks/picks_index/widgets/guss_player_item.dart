import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/10/15:13

class GussPlayerItem extends StatelessWidget {
  const GussPlayerItem(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90.w,
          child: Row(
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (index <= 2)
                      Image.asset(
                        width: 26.w,
                        fit: BoxFit.fitWidth,
                        index == 0
                            ? Assets.iconRankGoldPng
                            : index == 1
                                ? Assets.iconRankSilverPng
                                : Assets.iconRankCopperPng,
                      ),
                    if (index > 2)
                      Container(
                        width: 26.w,
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${index + 1}",
                            style: 18.w7(
                                color: index > 2
                                    ? AppColors.c262626
                                    : Colors.white)),
                        SizedBox(
                          height: 5.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(left: 7.w),
                  decoration: BoxDecoration(
                      color: AppColors.cB3B3B3,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: Image.asset(Assets.testTeamLogoPng)),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Player Name", style: 12.w7(color: AppColors.c262626)),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  "WIN  256",
                  style: TextStyle(color: AppColors.cB3B3B3, fontSize: 10.sp),
                ),
                Text(
                  "SUCCESS  47%",
                  style: TextStyle(color: AppColors.cB3B3B3, fontSize: 10.sp),
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 55.w,
          child: Text(
            "256K",
            style: 18.w7(color: AppColors.c262626),
          ),
        )
      ],
    );
  }
}
