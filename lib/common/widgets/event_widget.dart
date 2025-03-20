/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-03-19 17:04:28
 * @LastEditTime: 2025-03-20 11:06:06
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../pages/team/team_battle/widgets/battle_v2/widgets/game_over_v2/widgets/event_widget.dart';

class NewsEventWidget extends GetView<NewListController> {
  const NewsEventWidget(
      {super.key, required this.type, required this.hasRecieve});
  final int type;
  final bool hasRecieve;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      // height: 145.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.w),
      ),
      child: Opacity(
        opacity: hasRecieve ? 0.5 : 1.0,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.w),
                      color: AppColors.c262626),
                  child: Image.asset(
                    Assets.newsUiMangerNew216,
                    width: 19.w,
                    height: 19.w,
                  ),
                ),
                6.5.hGap,
                Text(
                  "ARM CHAIR",
                  style: 14.w4(
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                )
              ],
            ),
            14.5.vGap,
            EventWidget(
              type: type,
              home: true,
              // onEnd: (v){
              //   newsDetail.re
              // },
            ),
          ],
        ),
      ),
    );
  }
}
