import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/10/15:13

class GussPlayerItem extends StatelessWidget {
  const GussPlayerItem(this.index, this.rankInfoEntity, this.selfIndex,
      {super.key});

  final RankInfoEntity rankInfoEntity;
  final int index;
  final int selfIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90.w,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  if (index <= 2)
                    Image.asset(
                      width: 26.w,
                      fit: BoxFit.fitWidth,
                      index == 0
                          ? Assets.iconRankGoldPng
                          : index == 1
                              ? Assets.iconRankSilverPng
                              : Assets.iconRankCopperPng,
                    ),
                  if (index > 2)
                    Container(
                      width: 26.w,
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${index + 1}",
                          style: 18.w7(
                              color: index > 2
                                  ? AppColors.c262626
                                  : Colors.white)),
                      SizedBox(
                        height: 5.w,
                      )
                    ],
                  )
                ],
              ),
              Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(left: 7.w),
                  decoration: BoxDecoration(
                      color: AppColors.cB3B3B3,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: Image.asset(Assets.testTeamLogoPng)),

              ///todo 换网络图
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(rankInfoEntity.teamName,
                  style: 12.w7(
                      color: selfIndex == index
                          ? AppColors.cFF7954
                          : AppColors.c262626)),
              SizedBox(
                height: 3.w,
              ),
              Text(
                "WIN  ${rankInfoEntity.getWin}",
                style: TextStyle(color: AppColors.cB3B3B3, fontSize: 10.sp),
              ),
              Text(
                "SUCCESS  ${rankInfoEntity.getSuccess}%",
                style: TextStyle(color: AppColors.cB3B3B3, fontSize: 10.sp),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 55.w,
          child: Text(
            rankInfoEntity.chip.toDouble().toStringAsFixed(0),
            style: 18.w7(color: AppColors.c262626),
          ),
        )
      ],
    );
  }
}
