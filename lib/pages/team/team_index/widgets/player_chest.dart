/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-03-14 17:44:10
 * @LastEditTime: 2025-03-15 16:07:41
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerChestWidget extends GetView<OpenBoxSimpleController> {
  const PlayerChestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 9.w),
      width: 375.w,
      height: 116.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.cFFFFFF,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12.w),
            width: 105.5.w,
            height: 71.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: AppColors.c000000),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 18.w,
                  left: -15.w,
                  child: OutlinedText(
                      strokeWidth: 1.w,
                      strokeColor: AppColors.c4c4c4c,
                      text: "reward ".toUpperCase(),
                      textStyle: TextStyle(
                        fontFamily: FontFamily.fOswaldMedium,
                        fontSize: 42.sp,
                        height: 0.8,
                        color: Colors.transparent,
                      )),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    Assets.managerUiMangerNew21,
                    width: 33.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.managerUiMangerNew22,
                    width: 33.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 6.w,
                  child: Image.asset(
                    Assets.managerUiManagerGift00,
                    width: 64.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Player chest".toUpperCase(),
                  style: 16.w4(
                    fontFamily: FontFamily.fOswaldMedium,
                    height: 0.8,
                  ),
                ),
                8.vGap,
                Row(
                  children: [
                    Image.asset(
                      Assets.commonUiCommonProp05,
                      width: 20.w,
                      fit: BoxFit.fitWidth,
                    ),
                    5.5.hGap,
                    Text(
                      Utils.formatMoney(
                          (Utils.getGameConstant(10022)?.constantValue ?? 0)
                              .ceil()),
                      style: 14.w4(fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                )
              ],
            ),
          ),
          MtInkWell(
            onTap: () {
              controller.buyCardPack();
              // TeamController controller = Get.find();
              // controller.showExChange = true;
              // controller.update();
              // HomeController.to.updateMoney();
            },
            child: Container(
              width: 74.w,
              height: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(width: 1.w, color: AppColors.c666666),
              ),
              child: Text(
                "BUY",
                style: 16.w4(fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
