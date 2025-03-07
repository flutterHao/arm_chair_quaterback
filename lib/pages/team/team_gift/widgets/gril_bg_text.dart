import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GrilBgTextWidget extends StatelessWidget {
  GrilBgTextWidget({super.key});
  final beautyController = Get.find<BeautyController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -14.w,
      left: -25.w,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: beautyController.currentGirl.backGroundColor.map((e) => Color(e)).toList())
              .createShader(bounds);
        },
        child: Text(
          "cheerle".toUpperCase(),
          style: TextStyle(
              fontSize: 122.sp,
              letterSpacing: 0,
              color: Colors.white,
              height: 0.95,
              fontFamily: FontFamily.fOswaldBold),
        ),
      ),
    );
  }
}
