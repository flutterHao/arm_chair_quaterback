import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/23/17:17

class ReciveAwardPicksPage extends StatelessWidget {
  const ReciveAwardPicksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top +
              63.w +
              88.w +
              6.w +
              14.w +
              34.w +
              18.w,
        ),
        margin: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 121.w,
              width: double.infinity,
              padding: EdgeInsets.only(left: 25.w, top: 21.w),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      alignment: Alignment.bottomRight,
                      opacity: .2,
                      image: AssetImage(Assets.testTeamLogoPng)),

                  ///todo 换图
                  borderRadius: BorderRadius.circular(16.w),
                  gradient: const LinearGradient(
                      colors: [AppColors.c8F2A17, AppColors.c191717])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "265,500,000",
                    style: 36.w7(color: AppColors.cFFE8DD, height: 1),
                  ),
                  Row(
                    children: [
                      Text(
                        "JETTON",
                        style: 10.w4(color: AppColors.c945D4A, height: 1),
                      ),
                      2.hGap,
                      IconWidget(
                          iconWidth: 10.w, icon: Assets.uiIconJettonPng)
                    ],
                  ),
                  12.vGap,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "256",
                            style: 16
                                .w7(color: AppColors.cFFE8DD, height: 1),
                          ),
                          3.vGap,
                          Text(
                            "WIN COUNT",
                            style: 10
                                .w4(color: AppColors.c945D4A, height: 1),
                          )
                        ],
                      ),
                      35.hGap,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "47%",
                            style: 16
                                .w7(color: AppColors.cFFE8DD, height: 1),
                          ),
                          3.vGap,
                          Text(
                            "SUCCESS",
                            style: 10
                                .w4(color: AppColors.c945D4A, height: 1),
                          )
                        ],
                      ),
                      40.hGap,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                                5,
                                    (index) => Container(
                                  width: 12.w,
                                  height: 12.w,
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: BoxDecoration(

                                    ///todo 判断条件
                                      color: index == 3
                                          ? AppColors.cE72646
                                          : AppColors.c10A86A,
                                      borderRadius:
                                      BorderRadius.circular(6.w)),
                                )),
                          ),
                          3.vGap,
                          Text(
                            "LAST5",
                            style: 10
                                .w4(color: AppColors.c945D4A, height: 1),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            24.vGap,
            Container(
              margin: EdgeInsets.only(
                  left: 13.w, right: 13.w, bottom: 10.w, top: 16.w),
              child: Text("Aug 1,2024",
                  style: 19.w7(color: AppColors.c262626)),
            ),
            ...List.generate(5, (index) => const ReciveAwardItem()),
            20.vGap
          ],
        ),
      ),
    );
  }
}
