import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/11/13:06

class ReceiveAwardDetailItem extends StatelessWidget {
  const ReceiveAwardDetailItem(this.player, this.picksDefineEntity, {super.key});

  final PicksPlayer player;
  final PicksDefineEntity picksDefineEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.w,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 9.w),
      padding: EdgeInsets.only(left: 12.w, right: 10.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(20.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PlayerAvatarWidget(
                width: 42.w,
                playerId: player.baseInfoList.playerId,
                backgroundColor: AppColors.cE6E6E6,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 89.w),
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      player.baseInfoList.ename,
                      style: 13.w4(
                          color: AppColors.c666666,
                          height: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    6.vGap,
                    Text(
                      "VS ${player.awayTeamInfo.shortEname} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(player.guessData?.gameStartTime ?? 0))}",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 61.w,
                  height: 46.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.ce5e5e5, width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${player.guessData?.guessReferenceValue}",
                          style: 18.w7(color: AppColors.c262626, height: 1)),
                      3.vGap,
                      Text(
                        "${player.guessData?.guessAttr.toUpperCase()}",
                        style: 10.w7(color: AppColors.cB3B3B3, height: 1),
                      ),
                    ],
                  ),
                ),
                if (player.guessData?.status == 1)
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    height: 46.w,
                    constraints: BoxConstraints(minWidth: 80.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        border:
                            Border.all(width: 0.5, color: AppColors.ccccccc)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconWidget(
                            iconWidth: 9.w,
                            icon: Assets.iconUiIconUp,
                            iconColor: AppColors.cFF7954,
                            rotateAngle:
                                player.guessData?.guessChoice == 1 ? 0 : 180),
                        9.hGap,
                        Text(
                          player.guessData?.guessChoice == 1 ? "MORE" : "LESS",
                          style: 14.w7(color: AppColors.cFF7954, height: 1),
                        )
                      ],
                    ),
                  )
                else
                  Container(
                    margin: EdgeInsets.only(left: 11.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 83.w,
                          height: 24.w,
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 83.w,
                                icon: Assets.picksUiBingo,
                                iconColor: player.guessData?.success ?? false
                                    ? AppColors.c10A86A
                                    : AppColors.cB3B3B3,
                              ),
                              Text(
                                  player.guessData?.guessChoice == 1
                                      ? "MORE"
                                      : "LESS",
                                  style: 11.w7(
                                      color: player.guessData?.success ?? false
                                          ? AppColors.c10A86A
                                          : AppColors.cB3B3B3)),
                            ],
                          ),
                        ),
                        if (player.guessData?.status == 1)
                          Text(
                            "Result:${player.guessData?.guessGameAttrValue}",
                            style: TextStyle(
                                fontSize: 10.sp, color: AppColors.cB3B3B3),
                          )
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
