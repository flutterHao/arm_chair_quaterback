import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/11/13:06

class ReciveAwardDetailItem extends StatelessWidget {
  const ReciveAwardDetailItem(this.player, {super.key});

  final PicksPlayer player;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 109.w,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.w),
      padding:
          EdgeInsets.only(top: 13.w, bottom: 10.w, left: 13.w, right: 11.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(20.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  print('点击了头像');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.ce5e5e5,
                      borderRadius: BorderRadius.circular(26.w)),
                  child: Stack(children: [
                    Image.asset(
                      Assets.testTeamLogoPng, //todo 换网络图
                      width: 55.w,
                    ),
                    Text(player.baseInfoList.grade,
                        style: 14.w7(color: AppColors.c262626))
                  ]),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 89.w),
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.baseInfoList.ename,
                      style: 13.w4(
                          color: AppColors.c666666,
                          height: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    4.vGap,
                    Text(
                      "VS ${player.awayTeamInfo.shortEname} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(player.reciveAwardInfo.gameStartTime))}AM",
                      style: 9.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                    8.vGap,
                    Text(
                      "PPG: ${double.parse(player.dataAvgList.toJson()[ParamUtils.getProKey(player.reciveAwardInfo.guessData[0].guessAttr)].toString()).toStringAsFixed(0)}P",
                      style: 9.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                    3.vGap,
                    Text(
                      "L5: ${double.parse(player.reciveAwardInfo.l5Avg.toJson()[ParamUtils.getProKey(player.reciveAwardInfo.guessData[0].guessAttr)].toString()).toStringAsFixed(0)}P",
                      style: 9.w4(color: AppColors.cB3B3B3, height: 1),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 62.w,
                // height: 55.w,
                margin: EdgeInsets.only(left: 9.w),
                padding: EdgeInsets.symmetric(vertical: 8.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.w),
                    border: Border.all(color: AppColors.ce5e5e5, width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "${player.reciveAwardInfo.guessData[0].guessGameAttrValue}",
                        style: 18.w7(color: AppColors.c666666)),
                    Text(
                      player.reciveAwardInfo.guessData[0].guessAttr
                          .toUpperCase(),
                      style:
                          TextStyle(fontSize: 11.sp, color: AppColors.c666666),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconWidget(
                          // icon:Assets.uiTriangleGPng,
                          icon: player.reciveAwardInfo.guessData[0].awards
                              .isNotEmpty
                              ? Assets.uiTriangleGPng
                              : Assets.uiTriangleRPng,
                          iconWidth: 7.w,
                          iconColor: player.reciveAwardInfo.guessData[0].awards
                              .isNotEmpty
                              ? AppColors.c10A86A
                              : AppColors.cE72646,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "0.5",
                          style: TextStyle(
                              color: player.reciveAwardInfo.guessData[0].awards
                                      .isNotEmpty
                                  ? AppColors.c10A86A
                                  : AppColors.cE72646,
                              fontSize: 10.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 11.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 83.w,
                      height: 24.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(player.reciveAwardInfo.guessData[0].awards
                                  .isNotEmpty?Assets.uiBingoPng:Assets.testTeamLogoPng),// todo 换图s
                              fit: BoxFit.fitWidth)),
                      child:
                          Text("BINGO", style: 11.w7(color: player.reciveAwardInfo.guessData[0].awards
                              .isNotEmpty?AppColors.c10A86A:AppColors.cB3B3B3)),
                    ),
                    Text(
                      "winner ${player.reciveAwardInfo.guessData[0].winPro}%",
                      style:
                          TextStyle(fontSize: 10.sp, color: AppColors.cB3B3B3),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
