import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2025/2/27/19:29

class StarUpgradeGameTurntable extends StatelessWidget {
  const StarUpgradeGameTurntable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 508.w,
      width: 375.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// 弹框背景
          Positioned(
            bottom: 0,
            child: Container(
              height: 305.w,
              width: 375.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.managerUiManagerRisingstar10))),
            ),
          ),

          /// 转盘背景
          Positioned(
            top: 0,
            child: Container(
              height: 426.w,
              width: 426.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.managerUiManagerRisingstar03))),
            ),
          ),

          /// 转盘
          Positioned(
              top: 20.w,
              child: Container(
                width: 385.w,
                height: 385.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(Assets.managerUiManagerRisingstar07))),
                child: Center(
                  child: Text("ROLL",style: 32.w5(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),),
                ),
              ),),

          /// 指针
          Positioned(
              top: 0.w,
              child: IconWidget(
                icon: Assets.managerUiManagerRisingstar05,
                iconWidth: 37.w,
              ))
        ],
      ),
    );
  }
}
