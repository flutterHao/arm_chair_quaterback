import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.content,
    this.comfirmBtn,
  });
  final String title;
  final Widget content;
  final Widget? comfirmBtn;

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>
    with SingleTickerProviderStateMixin {
  late EasyAnimationController animationController;

  @override
  void initState() {
    super.initState();
    SoundServices.to.playSound(Assets.soundOpenwindow);
    animationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut);
    animationController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            animationController.forward(from: 0.0);
          }
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 350), () {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    // SoundServices.to.playSound(Assets.soundWindowClose);
    SoundServices.to.playSound(Assets.soundDelete);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBottomDialog(
      height: 553.5.w,
      child: Column(
        children: [
          28.vGap,
          Container(
            height: 144.w,
            width: 144.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(72.w),
                color: AppColors.c53CF8A.withOpacity(0.19)),
            child: Center(
              child: Obx(() {
                return Transform.scale(
                  scale: animationController.value.value,
                  child: Container(
                    height: 115.w,
                    width: 115.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(58.w),
                        color: AppColors.c10A86A),
                    child: Center(
                      child: Container(
                        height: 45.w,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23.w),
                            color: AppColors.cFFFFFF),
                        child: Center(
                          child: IconWidget(
                            iconWidth: 23.w,
                            icon: Assets.iconUiIconRuidgt,
                            iconColor: AppColors.c10A86A,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          17.vGap,
          Text(
            widget.title,
            style: 27.w5(
              color: AppColors.c000000,
              height: 0.9,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
          Expanded(child: widget.content),
          widget.comfirmBtn ??
              MtInkWell(
                onTap: () {
                  // SoundServices.to.playSound(Assets.soundClick);
                  Get.back();
                },
                child: Container(
                  height: 51.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "CONFIRM",
                    style: 23.w5(
                      color: AppColors.cFFFFFF,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
                  ),
                ),
              ),
          41.vGap,
        ],
      ),
    );
  }
}
