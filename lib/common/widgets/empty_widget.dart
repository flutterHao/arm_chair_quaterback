import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 缺省页视图
///@auther gejiahui
///created at 2024/9/23/11:22

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({this.icon=Assets.testTeamLogoPng,this.text='空空如也～',super.key});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.w,
      width: 100.w,
      child: Column(
        children: [
          IconWidget(iconWidth: 70.w, icon: icon),
          5.vGap,
          Text(text,style: 15.w4(color: AppColors.cB3B3B3.withOpacity(.7)),),
        ],
      ),
    );
  }
}
