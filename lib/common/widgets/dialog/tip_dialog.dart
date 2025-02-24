import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///底部弹窗
///@auther gejiahui
///created at 2024/12/12/10:49

class BottomTipDialog {
  static Future show({
    required BuildContext context,
    required Function onTap,
    Widget? icon,
    String? title,
    String? desc,
    String? confirmStr,
    String? cancelStr,
    Color? confirmBtnColor,
    Widget? centerWidget,
    Function? cancelTap,
    Axis? btnDirection,
    double? height,
    Color? cancelBgColor,
  }) {
    return BottomTipDialog.showWithSound(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return _BottomTipDialog(
            onTap: onTap,
            icon: icon,
            title: title,
            desc: desc,
            confirmStr: confirmStr,
            cancelStr: cancelStr,
            confirmBtnColor: confirmBtnColor,
            centerWidget: centerWidget,
            cancelTap: cancelTap,
            btnDirection: btnDirection ?? Axis.vertical,
            height: height,
            cancelBgColor: cancelBgColor,
          );
        });
  }

  static Future showWithSound({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
    Color? barrierColor,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = false,
  }) {
    SoundServices.to.playSound(Assets.soundWindowOpen);
    Completer<bool?> completer = Completer();
    showModalBottomSheet(
            isScrollControlled: isScrollControlled,
            backgroundColor: AppColors.cTransparent,
            barrierColor: barrierColor,
            isDismissible: isDismissible,
            enableDrag: enableDrag,
            context: context,
            builder: builder)
        .then((v) {
      SoundServices.to.playSound(Assets.soundDelete);
      completer.complete(v);
    },onError: (e){
      completer.complete(null);
    });
    return completer.future;
  }
}

class _BottomTipDialog extends StatefulWidget {
  const _BottomTipDialog({
    required this.onTap,
    this.icon,
    this.title,
    this.desc,
    this.confirmStr,
    this.cancelStr,
    this.confirmBtnColor,
    this.centerWidget,
    this.cancelTap,
    this.btnDirection = Axis.vertical,
    this.height,
    this.cancelBgColor,
  });

  final Function onTap;
  final Function? cancelTap;
  final Widget? icon;
  final String? title;
  final String? desc;
  final String? confirmStr;
  final String? cancelStr;
  final Color? confirmBtnColor;
  final Widget? centerWidget;
  final Axis btnDirection;
  final double? height;
  final Color? cancelBgColor;

  @override
  _BottomTipDialogState createState() => _BottomTipDialogState();
}

class _BottomTipDialogState extends State<_BottomTipDialog> {
  @override
  void initState() {
    super.initState();
    // 播放打开音效
    SoundServices.to.playSound(Assets.soundWindowOpen);
  }

  @override
  void dispose() {
    // 播放关闭音效
    // SoundServices.to.playSound(Assets.soundWindowClose);
    // SoundServices.to.playSound(Assets.soundDelete);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height ?? 419.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          const DialogTopBtn(),
          38.vGap,
          widget.icon ??
              IconWidget(
                iconWidth: 62.w,
                icon: Assets.commonUiCommonIconSystemDanger,
                iconColor: AppColors.c000000,
              ),
          25.vGap,
          Text(
            widget.title ?? LangKey.gameTabSkip.tr,
            textAlign: TextAlign.center,
            style: 27.w5(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium),
          ),
          if (widget.desc != null)
            Container(
              margin: EdgeInsets.only(top: 10.w),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Text(
                  widget.desc!,
                  textAlign: TextAlign.center,
                  style: 14.w4(
                      color: AppColors.c000000,
                      // height: 1,
                      fontFamily: FontFamily.fRobotoRegular),
                ),
              ),
            ),
          widget.centerWidget ?? const Expanded(child: SizedBox.shrink()),
          if (widget.btnDirection == Axis.vertical)
            verticalBtnWidget()
          else
            horizontalBtnWidget(),
        ],
      ),
    );
  }

  Widget verticalBtnWidget() {
    return Column(
      children: [
        7.5.vGap,
        Container(
          height: 51.w,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          constraints: BoxConstraints(maxWidth: 343.w),
          decoration: BoxDecoration(
              color: widget.confirmBtnColor ?? AppColors.c000000,
              borderRadius: BorderRadius.circular(9.w)),
          child: MtInkWell(
            onTap: () {
              SoundServices.to.playSound(Assets.soundClick);
              widget.onTap.call();
            },
            child: Center(
              child: Text(
                widget.confirmStr ?? LangKey.pickButtonConfirm.tr,
                style: 23.w5(
                    color: AppColors.cF2F2F2,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
        ),
        9.vGap,
        Container(
          height: 51.w,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          constraints: BoxConstraints(maxWidth: 343.w),
          decoration: BoxDecoration(
              color: widget.cancelBgColor,
              borderRadius: BorderRadius.circular(9.w),
              border: Border.all(
                  color: widget.cancelBgColor != null
                      ? AppColors.cTransparent
                      : AppColors.c666666,
                  width: 1.w)),
          child: MtInkWell(
            onTap: () {
              SoundServices.to.playSound(Assets.soundClick);
              widget.cancelTap != null ? widget.cancelTap!.call() : Get.back();
            },
            child: Center(
              child: Text(
                widget.cancelStr ?? LangKey.gameButtonCancel.tr,
                style: 23.w5(
                    color: widget.cancelBgColor != null
                        ? AppColors.cFFFFFF
                        : AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
        ),
        41.vGap,
      ],
    );
  }

  Widget horizontalBtnWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 9.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 167.w,
            height: 51.w,
            decoration: BoxDecoration(
                color: widget.cancelBgColor,
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(
                    color: widget.cancelBgColor != null
                        ? AppColors.cTransparent
                        : AppColors.c666666,
                    width: 1.w)),
            child: MtInkWell(
              onTap: () {
                SoundServices.to.playSound(Assets.soundClick);
                widget.cancelTap != null ? widget.cancelTap!.call() : Get.back();
              },
              child: Center(
                child: Text(
                  widget.cancelStr ?? "CANCEL",
                  style: 23.w5(
                      color: widget.cancelBgColor != null
                          ? AppColors.cFFFFFF
                          : AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          ),
          9.hGap,
          Container(
            width: 167.w,
            height: 51.w,
            decoration: BoxDecoration(
                color: widget.confirmBtnColor ?? AppColors.c000000,
                borderRadius: BorderRadius.circular(9.w)),
            child: MtInkWell(
              onTap: () {
                SoundServices.to.playSound(Assets.soundClick);
                widget.onTap.call();
              },
              child: Center(
                child: Text(
                  widget.confirmStr ?? "CONFIRM",
                  style: 23.w5(
                      color: AppColors.cF2F2F2,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
