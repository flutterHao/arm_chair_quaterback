/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 15:05:31
 * @LastEditTime: 2025-01-03 10:34:20
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RosterTab extends GetView<TeamDetailController> {
  const RosterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          9.vGap,
          ...controller.positionList.map((e) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 9.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.w)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.5.vGap,
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        e,
                        style: 24.w4(
                            fontFamily: FontFamily.fOswaldBold, height: 0.9),
                      ),
                    ),
                    SizedBox(height: 16.w),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColors.cD1D1D1,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            height: 94.w,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                24.hGap,
                                Container(
                                  width: 55.w,
                                  height: 74.w,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.w)),
                                  child: ImageWidget(
                                    url: Utils.getPlayUrl(2800),
                                    width: 55.w,
                                    height: 74.w,
                                  ),
                                ),
                                13.hGap,
                                Expanded(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'LEBRON JAMES',
                                          style: 21.w4(
                                            height: 0.8,
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                          ),
                                        ),
                                        9.hGap,
                                        Text(
                                          '#24',
                                          style: 12.w4(
                                              height: 0.8,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                              color: AppColors.c4D4D4D),
                                        ),
                                      ]),
                                ),
                                Text("SG",
                                    style: 14.w4(
                                      height: 0.8,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    )),
                                18.hGap,
                              ],
                            ),
                          );
                        })
                  ]),
            );
          }),
          Container(
            width: double.infinity,
            height: 146.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 16.5.w, top: 25.w, bottom: 25.w),
                  child: Text(
                    "player count".toUpperCase(),
                    style: 24.w4(
                      fontFamily: FontFamily.fOswaldBold,
                      height: 0.9,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "COUNT",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoMedium,
                        height: 0.8,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "AVG AGE",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoMedium,
                        height: 0.8,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "AVG HT",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoMedium,
                        height: 0.8,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "AVG WT",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoMedium,
                        height: 0.8,
                      ),
                    ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.w, bottom: 18.w),
                  width: double.infinity,
                  height: 1.w,
                  color: AppColors.cD1D1D1,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "10",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.8,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "10",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.8,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "10",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.8,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "10",
                      textAlign: TextAlign.center,
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.8,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
          45.vGap
        ],
      ),
    );
  }
}
