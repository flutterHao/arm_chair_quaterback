import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/comfirm_button.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/*
 * @Description: 自定义弹窗
 * @Author: lihonghao
 * @Date: 2024-09-28 15:59:52
 * @LastEditTime: 2025-01-14 20:43:04
 */

class CustomBottomDialog extends StatelessWidget {
  const CustomBottomDialog(
      {super.key,
      this.height,
      required this.title,
      this.desc,
      this.content,
      required this.onComfirm,
      this.comfirmText = "CONFIRM",
      this.isShowCancelButton = true});
  final double? height;
  final String title;
  final String? desc;
  final Widget? content;
  final Function onComfirm;
  final String comfirmText;
  final bool isShowCancelButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 489.w,
      // constraints: BoxConstraints(
      //   maxHeight: MediaQuery.of(context).size.height * 0.8, // 最大高度为屏幕高度的80%
      // ),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          // 12.vGap,
          // Container(
          //   decoration: BoxDecoration(
          //       color: AppColors.ccccccc,
          //       borderRadius: BorderRadius.circular(2.w)),
          //   height: 4.w,
          //   width: 44.w,
          // ),
          const DialogTopBtn(),
          24.vGap,
          Text(
            title,
            style: 27.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
          ),
          if (ObjectUtil.isNotEmpty(desc))
            Column(
              children: [
                14.5.vGap,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.w),
                  child: Text(
                    desc!,
                    textAlign: TextAlign.center,
                    style: 14.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        color: AppColors.c000000),
                  ),
                ),
                21.vGap,
              ],
            ),
          Expanded(
            child: Container(
              child: content,
            ),
          ),
          7.5.vGap,
          MtInkWell(
            onTap: () {
              onComfirm();
              Navigator.pop(context);
            },
            child: Container(
              height: 51.w,
              width: 343.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.c000000,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Text(
                "CONFIRM",
                style: 23.w5(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
          if (isShowCancelButton) 9.vGap,
          if (isShowCancelButton)
            MtInkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 51.w,
                width: 343.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: AppColors.c666666),
                    borderRadius: BorderRadius.circular(9.w)),
                child: Text(
                  "CANCEL",
                  style: 23.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          41.vGap,
        ],
      ),
    );
  }
}

class SimpleBottomDialog extends StatefulWidget {
  const SimpleBottomDialog({
    super.key,
    this.height,
    required this.child,
    this.onComfirm,
    this.onCencel,
  });

  final double? height;
  final Widget child;
  final Function? onComfirm;
  final Function? onCencel;

  @override
  _SimpleBottomDialogState createState() => _SimpleBottomDialogState();
}

class _SimpleBottomDialogState extends State<SimpleBottomDialog> {
  @override
  void initState() {
    super.initState();
    // 播放打开音效
    SoundServices.to.playSound(Assets.soundOpenwindow);
  }

  @override
  void dispose() {
    // 播放关闭音效
    SoundServices.to.playSound(Assets.soundDelete);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height ?? 489.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          const DialogTopBtn(),
          Expanded(child: widget.child),
          if (widget.onComfirm != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: MtInkWell(
                      onTap: () {
                        SoundServices.to.playSound(Assets.soundDelete);

                        if (widget.onCencel != null) {
                          widget.onCencel!();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 51.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.w),
                            border: Border.all(
                                width: 1.w, color: AppColors.c000000)),
                        child: Text(
                          LangKey.gameButtonReset.tr,
                          style: 23.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              color: AppColors.c000000),
                        ),
                      ),
                    ),
                  ),
                  9.hGap,
                  Expanded(
                    child: MtInkWell(
                      minScale: 0.95,
                      onTap: () {
                        if (widget.onComfirm != null) {
                          widget.onComfirm!();
                        }
                      },
                      child: Container(
                        height: 51.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          color: AppColors.c000000,
                        ),
                        child: Text(
                          LangKey.pickButtonConfirm.tr,
                          style: 23.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              color: AppColors.cFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
