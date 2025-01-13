import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/13/20:12

class WeekPrizeWidget extends StatefulWidget {
  const WeekPrizeWidget({super.key});

  @override
  State<WeekPrizeWidget> createState() => _WeekPrizeWidgetState();
}

class _WeekPrizeWidgetState extends State<WeekPrizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
              onTap: () => Get.back(),
              child: Container(
                width: double.infinity,
              )),
        ),
        Container(
          height: 534.w,
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(9.w),
            ),
          ),
          child: Column(
            children: [
              const DialogTopBtn(),
              17.vGap,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Week Prize",
                      style: 19.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                    Row(
                      children: [
                        IconWidget(
                            iconWidth: 16.w,
                            icon: Assets.commonUiCommonCountdown02),
                        6.hGap,
                        Text(
                          "6D 23:59:59",
                          style: 16.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldRegular,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              9.vGap,
              Divider(
                color: AppColors.cD1D1D1,
                height: 1.w,
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.vGap,
                      SizedBox(
                        width: 29.w,
                        height: 29.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconWidget(
                                iconWidth: 24.w,
                                icon: Assets.commonUiCommonIconTask),
                          ],
                        ),
                      ),
                      ...List.generate(15, (index) {
                        //todo
                        bool isFirst = index == 0;
                        bool isLast = index == 14;
                        int level = 3;
                        return SizedBox(
                          height: 83.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 9.w,
                                    height: 83.w,
                                    decoration: BoxDecoration(
                                      color: index > level
                                          ? AppColors.cFFFFFF
                                          : AppColors.c000000,
                                      borderRadius: isFirst
                                          ? BorderRadius.vertical(
                                              top: Radius.circular(4.5.w))
                                          : isLast
                                              ? BorderRadius.vertical(
                                                  bottom:
                                                      Radius.circular(4.5.w))
                                              : null,
                                      border: Border(
                                          left: BorderSide(
                                            color: AppColors.cD1D1D1,
                                            width: 1.w,
                                          ),
                                          right: BorderSide(
                                            color: AppColors.cD1D1D1,
                                            width: 1.w,
                                          )),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 29.w,
                                        height: 29.w,
                                        decoration: BoxDecoration(
                                          color: index > level
                                              ? AppColors.cTransparent
                                              : AppColors.cFFFFFF,
                                          borderRadius:
                                              BorderRadius.circular(14.5.w),
                                        ),
                                      ),
                                      Container(
                                        width: 23.w,
                                        height: 23.w,
                                        decoration: BoxDecoration(
                                          color: index > level
                                              ? AppColors.cFFFFFF
                                              : AppColors.c000000,
                                          borderRadius:
                                              BorderRadius.circular(11.5.w),
                                          border: index > level
                                              ? Border.all(
                                                  color: AppColors.cD1D1D1,
                                                  width: 1.w,
                                                )
                                              : null,
                                        ),
                                        child: Center(
                                            child: Text(
                                          "$index",
                                          style: 14.w5(
                                            color: index > level
                                                ? AppColors.c000000
                                                : AppColors.cFFFFFF,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 236.w,
                                height: 64.w,
                                margin: EdgeInsets.only(bottom: 19.w),
                                padding:
                                    EdgeInsets.only(left: 23.w, right: 18.w),
                                decoration: BoxDecoration(
                                  color: AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.circular(9.w),
                                  border: Border.all(
                                    color: AppColors.c10A86A,
                                    width: 1.w,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconWidget(
                                            iconWidth: 43.w,
                                            icon:
                                                Assets.managerUiManagerGift02),
                                        14.hGap,
                                        Text(
                                          "5",
                                          style: 14.w4(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoRegular,
                                          ),
                                        )
                                      ],
                                    ),
                                    IconWidget(
                                      iconWidth: 21.w,
                                      icon: Assets
                                          .commonUiCommonStatusBarMission02,
                                      iconColor: AppColors.c10A86A,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      9.vGap,
                    ],
                  ),
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
