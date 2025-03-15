import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Container(
          color: AppColors.cF2F2F2,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.managerUiMangerNew28))),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: 160.h),
                      Text(
                        'Welcome to'.toUpperCase(),
                        style: 30.w5(
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                            color: AppColors.cD42915),
                      ),
                      SizedBox(height: 20.w),
                      Text(
                        'arm chair'.toUpperCase(),
                        style: 56
                            .w5(height: 1, fontFamily: FontFamily.fOswaldBold),
                      )
                    ],
                  ),
                )),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
                  child: Column(
                    children: [
                      _appleOrGoogleLoginWidget(),
                      10.vGap,
                      _guestLoginWidget(),
                      20.vGap,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _guestLoginWidget() {
    return MtInkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.c000000),
              borderRadius: BorderRadius.circular(10.w)),
          height: 50.w,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconWidget(
                icon: Assets.commonUiCommonLoginIcon,
                iconWidth: 22.w,
              ),
              8.hGap,
              Text(
                'Sign in as Guest',
                style: 23.w5(fontFamily: FontFamily.fOswaldMedium),
              )
            ],
          ),
        ));
  }

  Widget _appleOrGoogleLoginWidget() {
    if (GetPlatform.isIOS) {
      return MtInkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.w)),
            height: 50.w,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  icon: Assets.commonUiCommonLoginIcon02,
                  iconWidth: 22.w,
                ),
                8.hGap,
                Text(
                  'Sign in with Apple',
                  style: 23.w5(
                      color: Colors.white,
                      fontFamily: FontFamily.fOswaldMedium),
                )
              ],
            ),
          ));
    } else {
      return MtInkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.w)),
            height: 50.w,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  icon: Assets.commonUiCommonLoginIcon01,
                  iconWidth: 22.w,
                ),
                8.hGap,
                Text(
                  'Sign in with Google',
                  style: 23.w5(
                      color: Colors.white,
                      fontFamily: FontFamily.fOswaldMedium),
                )
              ],
            ),
          ));
    }
  }
}
