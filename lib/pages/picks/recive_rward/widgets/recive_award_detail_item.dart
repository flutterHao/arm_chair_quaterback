import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/11/13:06

class ReciveAwardDetailItem extends StatelessWidget {
  const ReciveAwardDetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 109.w,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.w),
      padding:
          EdgeInsets.only(top: 13.w, bottom: 10.w, left: 13.w, right: 11.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(20.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              print('点击了头像');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.ce5e5e5,
                  borderRadius: BorderRadius.circular(26.w)),
              child: Stack(children: [
                Image.asset(
                  Assets.testTeamLogoPng,
                  width: 55.w,
                ),
                Text("SS", style: 14.w7(color: AppColors.c262626))
              ]),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 89.w),
            margin: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYER NAME",
                  style: TextStyle(
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.c666666),
                ),
                Text(
                  "vs nop 8:05am",
                  style: TextStyle(color: AppColors.cB3B3B3, fontSize: 8.sp),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  "PPG: 26P",
                  style: TextStyle(color: AppColors.cB3B3B3, fontSize: 8.sp),
                ),
                Text(
                  "L10: 26.7P",
                  style: TextStyle(color: AppColors.cB3B3B3, fontSize: 8.sp),
                )
              ],
            ),
          ),
          Container(
            width: 62.w,
            // height: 55.w,
            margin: EdgeInsets.only(left: 9.w),
            padding: EdgeInsets.symmetric(vertical: 8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(color: AppColors.ce5e5e5, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("25.6", style: 18.w7(color: AppColors.c666666)),
                Text(
                  "PTS",
                  style: TextStyle(fontSize: 11.sp, color: AppColors.c666666),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.uiTriangleGPng,
                      width: 7.w,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "0.5",
                      style:
                          TextStyle(color: AppColors.c10A86A, fontSize: 10.sp),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 11.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.uiIconMoneyBPng,
                      width: 11.w,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      "+500",
                      style:
                          TextStyle(color: AppColors.c545454, fontSize: 12.sp),
                    )
                  ],
                ),
                Container(
                  width: 83.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.uiBingoPng),
                          fit: BoxFit.fitWidth)),
                  child: Text(
                    "BINGO",
                    style: 11.w7(color: AppColors.c10A86A)
                  ),
                ),
                Text(
                  "winner 45.3%",
                  style: TextStyle(fontSize: 10.sp, color: AppColors.cB3B3B3),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
