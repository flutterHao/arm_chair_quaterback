/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-11-08 09:51:37
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-09-29 16:03:41
 */

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPlayerList extends GetView<TeamController> {
  const MainPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position > 0)
        .toList();
    list.sort((a, b) => a.position.compareTo(b.position));
    return SizedBox(
      // width: 360.w,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PlayerItem(item: list[index]);
        },
        separatorBuilder: (context, index) => 9.vGap,
        itemCount: list.length,
      ),
    );
  }
}

class SubPlayerList extends GetView<TeamController> {
  const SubPlayerList({super.key});

  Widget _addPlayer(list) {
    bool canAdd = list.length < controller.myTeamEntity.benchCount;
    return InkWell(
        onTap: () {
          if (canAdd) {
            controller.addPlay();
          }
        },
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 343.w,
            height: 84.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.c323232,
                borderRadius: BorderRadius.circular(16.w),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.c666666,
                )),
            child: canAdd
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconWidget(
                        iconWidth: 15.w,
                        backgroudWitdh: 38.w,
                        backgroudheight: 38.w,
                        icon: Assets.iconUiIconPlus,
                        borderRadius: BorderRadius.circular(19.w),
                        backgroudColor: AppColors.c666666,
                        iconColor: AppColors.cFF7954,
                      ),
                      8.vGap,
                      Text(
                        "Add Player",
                        style: 12.w4(color: AppColors.cFF7954),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconWidget(
                        iconWidth: 15.w,
                        backgroudWitdh: 38.w,
                        backgroudheight: 38.w,
                        icon: Assets.iconUiIconLock,
                        borderRadius: BorderRadius.circular(19.w),
                        backgroudColor: AppColors.c666666,
                        iconColor: AppColors.cFF7954,
                      ),
                      8.vGap,
                      Text(
                        "The substitute is full",
                        style: 12.w4(color: AppColors.cFF7954),
                      )
                    ],
                  ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position == 0)
        .toList();
    return SizedBox(
      // width: 360.w,
      child: Column(
        children: [
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PlayerItem(item: list[index]);
            },
            separatorBuilder: (context, index) => 9.vGap,
            itemCount: list.length,
          ),
          _addPlayer(list)
        ],
      ),
    );
  }
}
