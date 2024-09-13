import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/11/11:36

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 11.w,bottom: 11.w),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.w)),
              ),
              SizedBox(
                width: 34.w,
                height: 34.w,
                child: const CircularProgressIndicator(
                  color: AppColors.cFF7954,
                  backgroundColor: AppColors.ce5e5e5,
                  value: .4,
                  strokeWidth: 2,
                ),
              ),
              //todo
              Image.asset(
                Assets.testTeamLogoPng,
                width: 27.w,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 6.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "LV20",
                      style: TextStyle(
                          color: AppColors.cFF7954,
                          fontSize: 12.sp),
                    ),
                    Container(
                      // height: 12.w,
                      // width: 66.w,
                      constraints:
                      BoxConstraints(minWidth: 66.w),
                      margin: EdgeInsets.only(left: 9.w),
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                          BorderRadius.circular(8.w)),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Assets.uiIconMoneyPng,
                            width: 11.5.w,
                          ),
                          Text(
                            "999k",
                            style: TextStyle(
                                color: AppColors.cF2F2F2,
                                fontSize: 10.sp),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // height: 12.w,
                      width: 66.w,
                      margin: EdgeInsets.only(left: 3.w),
                      padding:
                      EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                          BorderRadius.circular(6.2)),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Assets.uiIconJettonPng,
                            width: 10.w,
                          ),
                          Text(
                            "999k",
                            style: TextStyle(
                                color: AppColors.cF2F2F2,
                                fontSize: 10.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "NEW YORK YANKEES",
                  style: 21.w7(color: AppColors.cF2F2F2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
