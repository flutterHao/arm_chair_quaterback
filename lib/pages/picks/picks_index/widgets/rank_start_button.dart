import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/13/11:09

class RankStartButton extends StatelessWidget {
  const RankStartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.w,
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.w,
            child: Container(
              height: 40.w,
              decoration: BoxDecoration(
                  color: AppColors.cFF7954,
                  borderRadius: BorderRadius.circular(20.w)),
            ),
          ),
          Container(
            height: 40.w,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.c000000,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 35.w,
                  width: 35.w,
                  margin: EdgeInsets.only(left: 3.w),
                  decoration: BoxDecoration(
                      color: AppColors.cFF7954,
                      borderRadius: BorderRadius.circular(18.w)),
                  alignment: Alignment.center,
                  child: Text.rich(
                      textAlign: TextAlign.end,
                      TextSpan(children: [
                        TextSpan(
                            text: "3",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ])),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CONFIRM", style: 16.w7(color: AppColors.cFFFFFF)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.uiIconJettonPng,
                            width: 12.w,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "999k",
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.sp),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 10.w,
              top: 0,
              bottom: 0,
              child: Center(
                  child: Text(
                "99.5x",
                style: 14.w7(color: AppColors.cFF7954),
              )))
        ],
      ),
    );
  }
}
