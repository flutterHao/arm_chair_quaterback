import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spine_flutter/spine_widget.dart';

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

  final spineController = SpineWidgetController(onInitialized: (controller) {
    controller.animationState.getData().setDefaultMix(0.2);
    controller.animationState.setAnimationByName(0, "loading", true);
  });
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
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                      width: 50.w,
                      height: 50.w,
                      child: SpineWidget.fromAsset(Assets.spineLoadingLoading,
                          'assets/spine/loading/loading.json', spineController))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
