import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///启动页
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    style: 56.w5(height: 1, fontFamily: FontFamily.fOswaldBold),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
