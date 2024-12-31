import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/widgets/guess_history_item/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/31/17:36

class GuessHistoryItem extends StatelessWidget {
  GuessHistoryItem({required this.guessInfo, super.key});

  final ReciveAwardV2GuessInfo guessInfo;
  late GuessHistoryItemController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(
      GuessHistoryItemController(guessInfo),
      tag: "${guessInfo.id}_${guessInfo.createTime}",
    );
    return GetBuilder<GuessHistoryItemController>(
        init: controller,
        builder: (logic) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(6.w),
            child: Stack(
              children: [
                RepaintBoundary(
                  key: controller.globalKey,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(6.w),
                      border: Border.all(
                        color: AppColors.cD1D1D1,
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 77.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(6.w)),
                            color: AppColors.cF2F2F2,
                          ),
                          child: Column(
                            children: [
                              10.vGap,
                              Container(
                                margin: EdgeInsets.only(left: 9.w, right: 11.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${controller.getTypeString()} ${controller.getBetCount()}X",
                                      style: 19.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                  ],
                                ),
                              ),
                              16.vGap,
                              Container(
                                margin:
                                    EdgeInsets.only(left: 11.w, right: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildCoinWidget(),
                                    Row(
                                      children: List.generate(
                                          controller.guessInfo.guessData.length,
                                          (index) {
                                        Color iconColor;
                                        if (controller.guessInfo.status == 1) {
                                          iconColor = AppColors.cB3B3B3;
                                        } else if (controller.guessInfo
                                            .guessData[index].success) {
                                          iconColor = AppColors.c10A86A;
                                        } else {
                                          iconColor = AppColors.cE71629;
                                        }
                                        return IconWidget(
                                          iconWidth: 20.w,
                                          icon: Assets.picksUiPicksHistoryPick,
                                          iconColor: iconColor,
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ...List.generate(guessInfo.guessData.length, (index) {
                          var item = guessInfo.guessData[index];
                          bool lastIndex =
                              guessInfo.guessData.length - 1 == index;
                          return _buildPlayerItemWidget(item, lastIndex);
                        }),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10.w,
                  right: 11.w,
                  child: ShareWidget(
                    globalKey: controller.globalKey,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Row _buildCoinWidget() {
    if (controller.guessInfo.status != 1 && !controller.guessInfo.success) {
      return Row(
        children: [
          IconWidget(
              iconWidth: 15.w, icon: Assets.commonUiCommonIconCurrency02),
          6.hGap,
          Text(
            "${controller.picksDefineEntity.betCost} LOST",
            style: 16.w5(
                color: AppColors.cE71629,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium),
          )
        ],
      );
    }
    return Row(
      children: [
        IconWidget(iconWidth: 15.w, icon: Assets.commonUiCommonIconCurrency02),
        6.hGap,
        Text(
          controller.picksDefineEntity.betCost,
          style: 16.w5(
              color: AppColors.c000000,
              fontFamily: FontFamily.fOswaldMedium,
              height: 1),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: IconWidget(
              iconWidth: 15.w,
              icon: Assets.picksUiPicksHistoryArrowsBig,
              iconColor: AppColors.c000000.withOpacity(0.5),
            )),
        IconWidget(iconWidth: 15.w, icon: Assets.commonUiCommonIconCurrency02),
        6.hGap,
        Text(
          "${controller.getWinCoin().format()}",
          style: 16.w5(
              color: AppColors.c000000,
              fontFamily: FontFamily.fOswaldMedium,
              height: 1),
        ),
      ],
    );
  }

  Widget _buildPlayerItemWidget(
      ReciveAwardV2GuessInfoGuessData item, bool lastIndex) {
    if(item.type == 2){
      return const SizedBox.shrink();
    }
    var baseInfo = Utils.getPlayBaseInfo(item.playerId);
    var homeTeamInfo = Utils.getTeamInfo(item.homeTeamId);
    var awayTeamInfo = Utils.getTeamInfo(item.awayTeamId);
    return Container(
      height: 95.w,
      decoration: lastIndex
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.cE6E6E6,
                  width: 1.w,
                ),
              ),
            ),
      child: Row(
        children: [
          15.hGap,
          PlayerAvatarWidget(
            width: 48.w,
            height: 61.w,
            radius: 4.w,
            playerId: baseInfo.playerId,
          ),
          16.hGap,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: baseInfo.ename,
                        style: 14.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        )),
                    TextSpan(
                        text:
                            "  ${homeTeamInfo.shortEname}@${awayTeamInfo.shortEname}",
                        style: 10.w4(
                          color: AppColors.c808080,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ))
                  ])),
                  _buildResultWidget()
                ],
              ),
              8.vGap,
              Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "${Utils.getLongName(item.guessAttr)} ",
                    ),
                    TextSpan(
                        text: "${item.guessChoice == 1 ? "MORE" : "LESS"} ",
                        style: const TextStyle(
                            fontFamily: FontFamily.fRobotoMedium)),
                    TextSpan(
                      text: "${item.guessReferenceValue}",
                    )
                  ]),
                  style: 10.w4(
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fRobotoRegular,
                    height: 1,
                  )),
              12.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "11/08/01  8:00 AM  FINAL",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c000000,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                        // style: 10.w4(
                        //   color: AppColors
                        //       .c000000,
                        //   fontFamily: FontFamily
                        //       .fRobotoRegular,
                        //   height: 1,
                        // ),
                      ),
                      6.hGap,
                      IconWidget(
                        iconWidth: 5.w,
                        icon: Assets.commonUiCommonIconSystemJumpto,
                        iconColor: AppColors.c000000,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconWidget(
                        iconWidth: 17.w,
                        icon: Assets.picksUiPicksHistoryComment,
                        iconColor: AppColors.c000000,
                      ),
                      6.hGap,
                      Text(
                        "100k",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
          13.hGap,
        ],
      ),
    );
  }

  Widget _buildResultWidget() {
    if (controller.guessInfo.status == 1) {
      return Row(
        children: [
          IconWidget(
            iconWidth: 13.w,
            icon: Assets.commonUiCommonCountdown,
            iconColor: AppColors.cB3B3B3,
          ),
          3.hGap,
          Text(
            "08:56:32",
            style: 14.w5(
                color: AppColors.cB3B3B3, fontFamily: FontFamily.fOswaldMedium),
          )
        ],
      );
    }
    return Text(
      "Result: 36",
      style: 14.w5(color: AppColors.c0FA76C),
    );
  }
}
