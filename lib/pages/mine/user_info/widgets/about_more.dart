import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/common/term_user_page.dart';
import 'package:arm_chair_quaterback/pages/common/web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutMoreWidget extends StatelessWidget {
  const AboutMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9.w), topRight: Radius.circular(9.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.vGap,
          Text(
            'About more'.toUpperCase(),
            style: 16.w5(fontFamily: FontFamily.fOswaldMedium, height: 1),
          ),
          4.vGap,
          MtInkWell(
              onTap: () {
                Get.to(WebPage('Connect us', Address.connectUsUrl));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: Row(
                  children: [
                    Text(
                      'Connect us',
                      style: 14.w5(
                          fontFamily: FontFamily.fOswaldRegular,
                          height: 1,
                          color: AppColors.cA1A1A1),
                    ),
                    Spacer(),
                    IconWidget(
                      icon: Assets.commonUiCommonIconSystemJumpto,
                      iconWidth: 7.w,
                      iconColor: AppColors.c666666,
                    )
                  ],
                ),
              )),
          Divider(height: 1, color: AppColors.cE6E6E6),
          MtInkWell(
              onTap: () {
                Get.to(WebPage('Privacy policy', Address.privacyPolicyUrl));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: Row(
                  children: [
                    Text(
                      'Privacy policy',
                      style: 14.w5(
                          fontFamily: FontFamily.fOswaldRegular,
                          height: 1,
                          color: AppColors.cA1A1A1),
                    ),
                    Spacer(),
                    IconWidget(
                      icon: Assets.commonUiCommonIconSystemJumpto,
                      iconWidth: 7.w,
                      iconColor: AppColors.c666666,
                    )
                  ],
                ),
              )),
          Divider(height: 1, color: AppColors.cE6E6E6),
          MtInkWell(
              onTap: () {
                Get.to(TermUserPage());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: Row(
                  children: [
                    Text(
                      'Term of use',
                      style: 14.w5(
                          fontFamily: FontFamily.fOswaldRegular,
                          height: 1,
                          color: AppColors.cA1A1A1),
                    ),
                    Spacer(),
                    IconWidget(
                      icon: Assets.commonUiCommonIconSystemJumpto,
                      iconWidth: 7.w,
                      iconColor: AppColors.c666666,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
