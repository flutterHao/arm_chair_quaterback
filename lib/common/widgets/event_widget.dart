import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsEventWidget extends StatelessWidget {
  const NewsEventWidget(
      {super.key,
      required this.type,
      required this.hasRecieve,
      required this.onTap});
  final int type;
  final bool hasRecieve;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      minScale: 0.95,
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: 9.w),
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        // height: 145.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.w),
        ),
        child: Opacity(
          opacity: hasRecieve ? 0.5 : 1.0,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        color: AppColors.c262626),
                    child: Image.asset(
                      Assets.newsUiMangerNew216,
                      width: 19.w,
                      height: 19.w,
                    ),
                  ),
                  6.5.hGap,
                  Text(
                    "ARM CHAIR",
                    style: 14.w4(
                      color: AppColors.c000000,
                      fontFamily: FontFamily.fRobotoRegular,
                    ),
                  )
                ],
              ),
              14.5.vGap,
              Row(
                children: [
                  Container(
                    width: 105.w,
                    height: 71.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.w),
                        color: AppColors.c000000),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        OutlinedText(
                          text: "EVENT",
                          textStyle: 42.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium),
                          strokeColor: AppColors.c4c4c4c,
                          strokeWidth: 1.w,
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: IconWidget(
                              icon: Assets.managerUiMangerNew22,
                              iconWidth: 33.w,
                            )),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: IconWidget(
                              icon: Assets.managerUiMangerNew21,
                              iconWidth: 33.w,
                            )),
                        IconWidget(
                          icon: type == 1
                              ? Assets.commonUiCommonProp05
                              : Assets.managerUiManagerFreegift01,
                          iconWidth: 58.w,
                        )
                      ],
                    ),
                  ),
                  12.hGap,
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FEATURED UPCOMING EVENTS",
                        style: 16.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      ),
                      7.vGap,
                      Text(
                        "Click trigger",
                        style: 14.w4(
                          color: AppColors.c000000.withOpacity(0.5),
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      )
                    ],
                  )),
                  IconWidget(
                    iconWidth: 8.w,
                    icon: Assets.commonUiCommonIconSystemJumpto,
                    iconColor: AppColors.c000000,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
