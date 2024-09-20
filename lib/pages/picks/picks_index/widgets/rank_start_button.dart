import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/13/11:09

class RankStartButton extends StatelessWidget {
  const RankStartButton(this.size,this.cost,this.bet,{
    super.key,
  });

  final int size;
  final double cost;
  final double bet;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.find<PicksIndexController>().guess(),
      child: BtnBackground(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: Container(
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
                          text: "$size",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    ])),
              ),
            ),
            Column(
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
                      "${cost}k",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: 11.w),
                child: Text(
                  "${bet}x",
                  style: 14.w7(color: AppColors.cFF7954),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
