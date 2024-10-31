import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/up_start_team_player_response_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/game/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/21/21:14

class UpStarSuccess extends StatelessWidget {
  const UpStarSuccess({super.key, required this.response});

  final UpStartTeamPlayerResponseEntity response;

  @override
  Widget build(BuildContext context) {
    var gameController = Get.find<GameController>();
    return Center(
      child: Container(
        height: 492.w,
        constraints: BoxConstraints(maxWidth: 303.w),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Text(
              "SUCCESS",
              style: 52.w7(color: AppColors.cFFBD54, height: 1),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.w),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.cFFC467,
                        AppColors.cFFFFFF,
                        AppColors.cFFFFFF
                      ],
                      stops: [
                        0.1,
                        0.2,
                        1
                      ]),
                  borderRadius: BorderRadius.circular(20.w)),
            ),
            Positioned(
              right: 8.w,
              top: 8.w,
              child: SizedBox(
                  width: 128.w,
                  height: 128.w,
                  child: IconWidget(
                    iconWidth: 128.w,
                    icon: Assets.uiIconStar_01Png,
                    iconColor: AppColors.cFF7954,
                    rotateAngle: 20,
                  )),
            ),
            Positioned(
                left: 0,
                top: 44.w,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 63.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${gameController.uuidPlayerInfo?.getBreakThroughGrade()}",
                        style: 56.w7(color: AppColors.c262626, height: 1),
                      ),
                      Flexible(
                          child: IconWidget(
                        iconWidth: 13.w,
                        icon: Assets.uiTriangleGPng,
                        iconColor: AppColors.c262626,
                        rotateAngle: 90,
                      )),
                      Text(
                        "${gameController.uuidPlayerInfo?.getNextBreakThroughGrade()}",
                        style: 56.w7(color: AppColors.c262626),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 110.w,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: 23.w, bottom: 19.w, left: 15.w, right: 15.w),
                  decoration: BoxDecoration(
                      color: AppColors.cF2F2F2,
                      borderRadius: BorderRadius.circular(20.w),
                      border: Border.all(color: AppColors.cFF7954, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ability",
                        style: 19.w7(color: AppColors.c262626, height: 1),
                      ),
                      Container(
                        height: 125.w,
                        margin: EdgeInsets.only(left: 15.w),
                        child: GridView.builder(
                            itemCount:
                                response.before.upStarBase.toJson().keys.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10.w,
                                    childAspectRatio: 6 / 8,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              var key = response.before.upStarBase
                                  .toJson()
                                  .keys
                                  .toList()[index];
                              var after =
                                  response.after.upStarBase.toJson()[key];
                              double diff = after -
                                  response.before.upStarBase.toJson()[key];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    diff<=0?"":"+$diff",
                                    style: 12.w4(
                                        color: AppColors.c10A86A, height: 1),
                                  ),
                                  2.vGap,
                                  Text(
                                    "$after",
                                    style: 19.w7(
                                        color: AppColors.c262626, height: 1),
                                  ),
                                  6.vGap,
                                  Text(
                                    Utils.getName(key),
                                    style: 10.w4(
                                        color: AppColors.cFF7954, height: 1),
                                  )
                                ],
                              );
                            }),
                      ),
                      Text(
                        "Potential",
                        style: 19.w7(color: AppColors.c262626, height: 1),
                      ),
                      Container(
                        height: 125.w,
                        margin: EdgeInsets.only(left: 15.w),
                        child: GridView.builder(
                            itemCount:
                                response.before.potential.toJson().keys.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10.w,
                                    childAspectRatio: 6 / 8,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              var key = response.before.potential
                                  .toJson()
                                  .keys
                                  .toList()[index];
                              double after =
                                  response.after.potential.toJson()[key];
                              double before =
                                  response.before.potential.toJson()[key];
                              double percent = ((after - before) / (before==0?1:before) * 100);
                              var target = (before * (gameController.starUpDefineEntity?.getPotantialMax()??0));
                              double value = after==0?0:after/target;
                              return Opacity(
                                opacity: percent<=0?0.7:1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      percent<=0?" ":percent.toStringAsFixed(0),
                                      style: 12.w4(
                                          color: AppColors.c10A86A, height: 1),
                                    ),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: "$after",
                                          style: 19.w7(
                                              color: AppColors.c262626,
                                              height: 1)),
                                      TextSpan(
                                          text:
                                              "/${target.toStringAsFixed(0)}",
                                          style: 10.w4(
                                              color: AppColors.cB3B3B3,
                                              height: 1)),
                                    ])),
                                    2.vGap,
                                    Container(
                                      height: 7.w,
                                      constraints: BoxConstraints(maxWidth: 63.w),
                                      child: LinearProgressIndicator(
                                        value: value,
                                        borderRadius: BorderRadius.circular(4.w),
                                        color: value<0.3?AppColors.cE72646:value<0.6?AppColors.cFFBD54:AppColors.c10A86A,
                                        backgroundColor: AppColors.cB3B3B3,
                                      ),
                                    ),
                                    4.vGap,
                                    Text(
                                      Utils.getName(key),
                                      style: 10.w4(
                                          color: AppColors.cFF7954, height: 1),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 44.w,
                              constraints: BoxConstraints(maxWidth: 243.w),
                              child: BtnBackground(
                                child: Container(
                                  height: 44.w,
                                  width: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        "CONFIRM",
                                        style: 18.w7(color: AppColors.cF2F2F2),
                                      ),
                                      Positioned(
                                          left: 9.w,
                                          child: Stack(
                                            children: [
                                              IconWidget(
                                                  iconWidth: 26.w,
                                                  icon: Assets.uiIconRingPng),
                                              Positioned(
                                                  left: 7.w,
                                                  top: 5.5.w,
                                                  child: IconWidget(
                                                    iconWidth: 17.w,
                                                    icon:
                                                        Assets.uiIconConfirmPng,
                                                    iconColor:
                                                        AppColors.c31E99E,
                                                  ))
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
