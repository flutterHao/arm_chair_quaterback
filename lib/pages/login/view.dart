import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
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
            child: Column(
              children: [
                Expanded(
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
                      style:
                          56.w5(height: 1, fontFamily: FontFamily.fOswaldBold),
                    )
                  ],
                )),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
                  child: Column(
                    children: [
                      Container(
                        child: MtInkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10.w)),
                              height: 50.w,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign in with Apple'.toUpperCase(),
                                style: 23.w5(
                                    color: Colors.white,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                            )),
                      ),
                      10.vGap,
                      Container(
                        child: MtInkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10.w)),
                              height: 50.w,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign in as Guest'.toUpperCase(),
                                style: 23.w5(
                                    color: Colors.white,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                            )),
                      ),
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
}
