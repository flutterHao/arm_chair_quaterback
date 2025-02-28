/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-26 15:48:56
 * @LastEditTime: 2025-02-27 19:59:46
 */
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constant/font_family.dart';
import 'index.dart';

class BeautyChatPage extends GetView<BeautyChatController> {
  const BeautyChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var showMessage = false.obs;
    Future.delayed(const Duration(milliseconds: 500), () {
      showMessage.value = true;
    });
    return GetBuilder<BeautyChatController>(
      init: BeautyChatController(),
      id: "beauty_chat",
      builder: (_) {
        var girl = controller.getCurrentGirl();
        return Container(
            color: Colors.black.withOpacity(0.7),
            width: 375.w,
            height: 707.h,
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  width: 375.w,
                  height: 707.h,
                  Assets.cheerleadersUiCheerleadersChatBg,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 57.5.h,
                  child: Image.asset(
                    Assets.managerUiManagerIconUnlock,
                    width: 28.5.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 109.5.w,
                  child: Text(
                    MyDateUtils.formatDate(DateTime.now(), format: "HH:mm"),
                    style: 57.5.w4(
                      fontFamily: FontFamily.fOswaldRegular,
                      height: 0.8,
                      color: AppColors.cFFFFFF,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 82.h,
                  child: MtInkWell(
                    minScale: 0.9,
                    onTap: () {
                      controller.toChat();
                    },
                    child: Obx(() {
                      return AnimatedScale(
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        scale: showMessage.value ? 1 : 0,
                        child: Container(
                          width: 314.w,
                          height: 70.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(9.w),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 46.w,
                                height: 46.w,
                                margin: EdgeInsets.only(top: 12.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: AppColors.cED4873),
                                child: Image.asset(
                                  Assets.cheerleadersUiCheerleaders02,
                                  width: 46.w,
                                  height: 46.w,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              9.hGap,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    14.vGap,
                                    Text(
                                      girl.eName,
                                      style: 19.w4(
                                          fontFamily: FontFamily.fRobotoMedium,
                                          color: AppColors.c000000,
                                          height: 0.8),
                                    ),
                                    11.vGap,
                                    Text(
                                      "You have a new message",
                                      style: 14.w4(
                                          fontFamily: FontFamily.fRobotoRegular,
                                          color: AppColors.c000000,
                                          height: 0.8),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12.5.w),
                                child: Text(
                                  "now",
                                  style: 12.w4(
                                      fontFamily: FontFamily.fRobotoRegular,
                                      color: AppColors.c000000,
                                      height: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
