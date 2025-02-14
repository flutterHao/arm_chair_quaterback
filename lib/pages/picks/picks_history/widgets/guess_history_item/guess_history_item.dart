import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
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

class GuessHistoryItem extends StatefulWidget {
  const GuessHistoryItem({required this.guessInfo, super.key});

  final ReciveAwardV2GuessInfo guessInfo;

  @override
  State<GuessHistoryItem> createState() => _GuessHistoryItemState();
}

class _GuessHistoryItemState extends State<GuessHistoryItem>
    with WidgetsBindingObserver {
  late ReciveAwardV2GuessInfo guessInfo;
  late GuessHistoryItemController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      controller.startCountDown();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    guessInfo = widget.guessInfo;
    return GetBuilder<GuessHistoryItemController>(
        init: controller = GuessHistoryItemController(guessInfo),
        tag: "${guessInfo.id}_${guessInfo.createTime}",
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
                        color: controller.guessInfo.status != 1 &&
                                controller.guessInfo.success
                            ? AppColors.c53BE94
                            : AppColors.cD1D1D1,
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
                            color: controller.guessInfo.status == 1
                                ? AppColors.cF2F2F2
                                : controller.guessInfo.success
                                    ? AppColors.cEFF6F0
                                    : AppColors.cF6EFF0,
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
                                      "${controller.getTypeString()} ${controller.getBetCount() > 0 ? "${controller.getBetCount()}X" : ""}",
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
                    type: ShareType.guess,
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
    var bottom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MtInkWell(
          onTap: ()=>Get.toNamed(RouteNames.leagueLeagueDetail,arguments: {
            "gameId":item.gameId
          }),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.formatGameStartTime(item.gameStartTime),
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
              "${item.reviewsCount}",
              style: 10.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            )
          ],
        )
      ],
    );

    if (item.type == 2) {
      NbaTeamEntity guessTeamInfo;
      NbaTeamEntity awayTeamInfo;
      if (item.guessChoice == item.homeTeamId) {
        guessTeamInfo = Utils.getTeamInfo(item.homeTeamId);
        awayTeamInfo = Utils.getTeamInfo(item.awayTeamId);
      } else {
        guessTeamInfo = Utils.getTeamInfo(item.awayTeamId);
        awayTeamInfo = Utils.getTeamInfo(item.homeTeamId);
      }
      return SizedBox(
        height: 90.w,
        width: double.infinity,
        child: Row(
          children: [
            13.hGap,
            MtInkWell(
              onTap: () => Get.toNamed(RouteNames.teamDetailPage,
                  arguments: guessTeamInfo.id),
              child: ImageWidget(
                url: Utils.getTeamUrl(item.guessChoice),
                width: 50.w,
                height: 50.w,
              ),
            ),
            15.hGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${guessTeamInfo.shortEname} WIN",
                        style: 14.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                      _buildResultWidget(item)
                    ],
                  ),
                  6.vGap,
                  Text(
                    "${guessTeamInfo.shortEname}${item.homeTeamScore == 0 ? "" : " ${item.homeTeamScore} "} @ ${item.awayTeamScore == 0 ? "" : " ${item.awayTeamScore}"} ${awayTeamInfo.shortEname}",
                    style: 10.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoMedium),
                  ),
                  12.vGap,
                  bottom,
                ],
              ),
            ),
            13.hGap,
          ],
        ),
      );
    }
    var baseInfo = Utils.getPlayBaseInfo(item.playerId);
    var homeTeamInfo = Utils.getTeamInfo(baseInfo.teamId);
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
                  _buildResultWidget(item)
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
              bottom
            ],
          )),
          13.hGap,
        ],
      ),
    );
  }

  Widget _buildResultWidget(ReciveAwardV2GuessInfoGuessData item) {
    if (controller.guessInfo.status == 1) {
      if (item.type == 2) {
        return Obx(() {
          var value = controller.openTime.value;
          return Text(
            controller.getGameStatus(item.gameStartTime) == 1
                ? "Gaming"
                : value,
            style: 14.w5(color: AppColors.cB3B3B3),
          );
        });
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconWidget(
            iconWidth: 13.w,
            icon: Assets.commonUiCommonCountdown,
            iconColor: AppColors.cB3B3B3,
          ),
          Obx(() {
            return Container(
              width: 50.w,
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.openTime.value,
                  style: 14.w5(
                      color: AppColors.cB3B3B3,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            );
          })
        ],
      );
    } else {
      if (item.type == 2) {
        NbaTeamEntity winTeamInfo = item.homeTeamScore > item.awayTeamScore
            ? Utils.getTeamInfo(item.homeTeamId)
            : Utils.getTeamInfo(item.awayTeamId);
        return Text(
          "Result: ${winTeamInfo.shortEname} Win",
          style: 14
              .w5(color: item.success ? AppColors.c0FA76C : AppColors.cE71629),
        );
      }
      return Text(
        "Result: ${item.guessGameAttrValue}",
        style:
            14.w5(color: item.success ? AppColors.c0FA76C : AppColors.cE71629),
      );
    }
  }
}
