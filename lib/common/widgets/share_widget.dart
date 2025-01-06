import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 分享组件
/// globalKey 组件的key
///@auther gejiahui
///created at 2024/12/19/16:56

class ShareWidget extends StatelessWidget {
  const ShareWidget({super.key, required this.globalKey});

  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(color: AppColors.c666666, width: 1.w)),
        child: MtInkWell(
            vibrate: true,
            onTap: () => Utils.generateAndShareImage(globalKey),
            child: IconWidget(
              iconWidth: 15.w,
              icon: Assets.commonUiCommonIconSystemShare,
              iconColor: AppColors.c000000,
            )));
  }
}
