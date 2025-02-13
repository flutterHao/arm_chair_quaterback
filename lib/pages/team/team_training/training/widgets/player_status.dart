/*
 * @Description: 球员状态
 * @Author: lihonghao
 * @Date: 2024-12-12 17:53:08
 * @LastEditTime: 2024-12-14 20:32:44
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerStatus extends GetView<TeamController> {
  const PlayerStatus({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<int> statusList = [101, 102, 103, 104, 105, 106];
    final List<int> statusList = [106, 105, 104, 103, 102, 101];
    return GetBuilder<TeamController>(builder: (_) {
      return Container(
        width: double.infinity,
        height: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: AppColors.cFFFFFF,
        ),
        child: Row(
          children: [
            34.hGap,
            Text(
              "Player Status",
              style: 14.w4(
                fontFamily: FontFamily.fOswaldRegular,
              ),
            ),
            30.hGap,
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  int count = controller.myTeamEntity.teamPlayers
                      .where((e) => e.playerStatus == statusList[index])
                      .length;
                  return Column(
                    children: [
                      13.vGap,
                      IconWidget(
                          iconWidth: 27.w,
                          icon: Utils.getStatusUrl(statusList[index])),
                      2.5.vGap,
                      Text(
                        "$count",
                        style: 12.w4(
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium,
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => 12.hGap,
                itemCount: statusList.length)
          ],
        ),
      );
    });
  }
}
