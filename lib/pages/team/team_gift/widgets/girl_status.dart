import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_gift/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GirlStatusWidget extends GetView<TeamGiftController> {
  GirlStatusWidget({super.key});
  final beautyController = Get.find<BeautyController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 48.w + 40.h,
      left: 16.w,
      child: Obx(() {
        ///当前亲密度等级
        var nowIntimacyLevel = controller.queryGirlDefine.value.intimacyLevel;
        var maxIntimacyLevel = controller.gGirlDefine.value.maxIntimacyLevel;
        var progress = ((nowIntimacyLevel / maxIntimacyLevel) * 100).round();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.gGirlDefine.value.eName,
                style: 30.w5(
                  color: Colors.white,
                  fontFamily: FontFamily.fOswaldMedium,
                )),
            4.vGap,
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16.w)),
                child: Row(
                  children: [
                    OutlinedText(
                      text: beautyController.currentGirl.grade,
                      textStyle: TextStyle(
                          fontFamily: FontFamily.fRobotoBlack, letterSpacing: 0, height: 1, fontSize: 21.spMin),
                    ),
                    12.hGap,
                    IconWidget(
                      icon: Assets.cheerleadersUiCheerleadersIconType01,
                      iconWidth: 18.h,
                    )
                  ],
                )),
            20.vGap,
            Column(
              children: [
                CircleProgressView(
                    backgroundColor: AppColors.c333333,
                    progressColor: AppColors.cFF5672,
                    progressWidth: 4.h,
                    progress: progress * 1.0,
                    width: 43.h,
                    height: 43.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconWidget(
                          iconWidth: 21.h,
                          icon: Assets.cheerleadersUiCheerleadersIconIntimacy,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "$progress%",
                          style: TextStyle(
                              fontFamily: FontFamily.fRobotoMedium,
                              color: AppColors.cFFFFFF,
                              height: 0.8,
                              fontSize: 10.h),
                        ),
                      ],
                    )),
                16.vGap,
                IconWidget(
                  icon: Assets.managerUiManagerIconStar04,
                  iconWidth: 28.h,
                  iconHeight: 32.h,
                ),
                SizedBox(height: 2),
                Text(
                  controller.gGirlDefine.value.initialCharm,
                  style: 12.w5(color: Colors.white, fontFamily: FontFamily.fRobotoMedium),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
