import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_gift/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GirlDescWidget extends GetView<TeamGiftController> {
  const GirlDescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 210.h,
        left: 214.w,
        child: Obx(() => controller.sendGift.value
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 140.w),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                    child: Text(
                      '${controller.girlGiftDefineList[0].girlDesc[controller.giftType]}',
                      style: 12.w4(fontFamily: FontFamily.fRobotoRegular),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: -6.w,
                      child: IconWidget(
                        icon: Assets.managerUiManagerBubble,
                        iconWidth: 13.w,
                        iconColor: Colors.white,
                      ))
                ],
              )
            : SizedBox()));
  }
}
