/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 15:06:38
 * @LastEditTime: 2025-01-07 18:29:06
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_stats_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamHeadCard extends StatelessWidget {
  const TeamHeadCard({super.key, required this.teamId});
  final int teamId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamDetailController>(
        tag: Get.arguments.toString(),
        id: "stats",
        builder: (controller) {
          int rank = 1;
          TeamRankEntity teamStats = TeamRankEntity();
          var list = controller.confRankList
              .where((e) => e.force == Utils.getTeamInfo(teamId).force)
              .toList();
          for (var element in list) {
            if (teamId == element.teamID) {
              rank = list.indexOf(element) + 1;
              teamStats = element;
            }
          }

          return Container(
            width: double.infinity,
            height: 139.5.w,
            // color: AppColors.c266AB4,
            color: Utils.getTeamColor(teamId),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 19.w,
                  child: ImageWidget(
                    width: 64.w,
                    url: Utils.getTeamUrl(teamId),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  top: 15.w,
                  right: 15.w,
                  child: IconWidget(
                    iconWidth: 19.w,
                    icon: Assets.commonUiCommonStatusBarStar,
                    iconColor: AppColors.cFFFFFF,
                  ),
                ),
                Positioned(
                  top: 88.w,
                  child: Text(
                    Utils.getTeamInfo(teamId).longEname.toUpperCase(),
                    style: 21.w4(
                      height: 0.8,
                      color: AppColors.cFFFFFF,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
                  ),
                ),
                Positioned(
                    top: 114.5.w,
                    child: Text(
                      "${teamStats.wINS}-${teamStats.lOSSES}  ${Utils.getRankText(rank)} IN ${teamStats.force == 1 ? "WESTERN" : "EASTERN"} CONFERENCE"
                          .toUpperCase(),
                      style: 10.w4(
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fRobotoRegular,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
