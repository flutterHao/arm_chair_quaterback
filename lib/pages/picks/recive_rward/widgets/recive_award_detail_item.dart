import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
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
  const ReciveAwardDetailItem(this.player,this.newsDefineEntity, {super.key});

  final PicksPlayer player;
  final NewsDefineEntity newsDefineEntity;

  @override
  Widget build(BuildContext context) {
    var guessValueDiff =
        player.reciveAwardInfo.guessData[0].guessGameAttrValue -
            player.reciveAwardInfo.guessData[0].guessReferenceValue;
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
                    2.vGap,
                    Text(
                      "VS ${player.awayTeamInfo.shortEname} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(player.reciveAwardInfo.gameStartTime))}AM",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                    6.vGap,
                    Text(
                      "PPG: ${double.parse(player.dataAvgList.getValue(player.reciveAwardInfo.guessData[0].guessAttr).toString()).toStringAsFixed(0)}P",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                    Text(
                      "L5: ${double.parse(player.reciveAwardInfo.l5Avg.getValue(player.reciveAwardInfo.guessData[0].guessAttr).toString()).toStringAsFixed(0)}P",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
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
                    if (player.reciveAwardInfo.guessData[0].status != 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconWidget(
                            // icon:Assets.uiTriangleGPng,
                            icon: player.reciveAwardInfo.guessData[0].success
                                ? Assets.uiTriangleGPng
                                : Assets.uiTriangleRPng,
                            iconWidth: 7.w,
                            iconColor:
                                player.reciveAwardInfo.guessData[0].success
                                    ? AppColors.c10A86A
                                    : AppColors.cE72646,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            guessValueDiff.abs().toStringAsFixed(1),
                            style: TextStyle(
                                color:
                                    player.reciveAwardInfo.guessData[0].success
                                        ? AppColors.c10A86A
                                        : AppColors.cE72646,
                                fontSize: 10.sp),
                          )
                        ],
                      )
                  ],
                ),
              ),
              if (player.reciveAwardInfo.guessData[0].status == 1)
                Column(
                  children: [
                    Container(
                      width: 83.w,
                      height: 24.w,
                      margin: EdgeInsets.only(left: 11.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        border: Border.all(color: guessValueDiff<0?AppColors.c10A86A:AppColors.cE1E3E6,width: 1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("MORE",style: 11.w7(color: guessValueDiff<0?AppColors.c10A86A:AppColors.cB3B3B3),),
                          3.hGap,
                          //todo 注释这里需要修改赔率
                          // Text("+${newsDefineEntity.betOdds}",style: 9.w7(color: guessValueDiff<0?AppColors.c10A86A:AppColors.cB3B3B3))
                        ],
                      ),
                    ),
                    7.vGap,
                    Container(
                      width: 83.w,
                      height: 24.w,
                      margin: EdgeInsets.only(left: 11.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          border: Border.all(color: guessValueDiff>0?AppColors.c10A86A:AppColors.cE1E3E6,width: 1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("LESS",style: 11.w7(color: guessValueDiff>0?AppColors.c10A86A:AppColors.cB3B3B3),),
                          3.hGap,
                          //todo 注释这里需要修改赔率
                          // Text("+${newsDefineEntity.betOdds}",style: 9.w7(color: guessValueDiff>0?AppColors.c10A86A:AppColors.cB3B3B3))
                        ],
                      ),
                    ),
                  ],
                )
              else
                Container(
                  margin: EdgeInsets.only(left: 11.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                              icon: Assets.uiBingoPng,
                              iconColor:
                                  player.reciveAwardInfo.guessData[0].success
                                      ? AppColors.c10A86A
                                      : AppColors.cB3B3B3,
                            ),
                            Text("BINGO",
                                style: 11.w7(
                                    color: player.reciveAwardInfo.guessData[0]
                                            .success
                                        ? AppColors.c10A86A
                                        : AppColors.cB3B3B3)),
                          ],
                        ),
                      ),
                      Text(
                        "winner ${player.reciveAwardInfo.guessData[0].winPro}%",
                        style: TextStyle(
                            fontSize: 10.sp, color: AppColors.cB3B3B3),
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
