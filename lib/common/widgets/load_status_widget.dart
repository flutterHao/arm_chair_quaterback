import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 缺省页视图
///@auther gejiahui
///created at 2024/9/23/11:22

class LoadStatusWidget extends StatelessWidget {
  const LoadStatusWidget(
      {this.icon = Assets.testTeamLogoPng,
      this.text = 'Data Lost ~~',
      super.key});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.w,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconWidget(iconWidth: 70.w, icon: icon),
          5.vGap,
          Text(
            text,
            style: 12.w4(color: AppColors.cB3B3B3.withOpacity(.7)),
          ),
        ],
      ),
    );
  }
}
