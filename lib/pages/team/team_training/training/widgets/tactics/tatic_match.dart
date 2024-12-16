/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-11 18:44:33
 * @LastEditTime: 2024-12-16 19:36:10
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///构成牌型弹窗
class TacticMatch extends GetView<TrainingController> {
  const TacticMatch({super.key});

  @override
  Widget build(BuildContext context) {
    var list = controller.trainingInfo.buff.where((e) {
      int index = controller.trainingInfo.buff.indexOf(e);
      return TacticUtils.matchedIndices.contains(index);
    }).toList();

    return Container(
      width: 344.w,
      height: 70.w,
      decoration: BoxDecoration(
        color: AppColors.c000000,
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: Row(
        children: [
          10.hGap,
          Text(
            controller.tacticType,
            style: 22.w4(
              color: AppColors.cFFFFFF,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
          12.hGap,
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              separatorBuilder: (context, index) => 6.hGap,
              itemBuilder: (context, index) {
                var e = list[index];
                return Center(
                    child: SmallTacticCard(
                  num: e.face,
                  color: e.color,
                  width: 28.w,
                ));
              }),
          13.5.hGap,
        ],
      ),
    );
  }
}
