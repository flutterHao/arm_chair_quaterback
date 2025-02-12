import 'dart:async';
import 'dart:ui';

import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:43

class GuessItemV2 extends StatefulWidget {
  const GuessItemV2(
      {super.key,
      required this.playerV2,
      required this.index,
      this.mainRoute = false,
      this.isInScoreDetail = false,
      this.isInPlayerDetail = false})
      : assert(!isInPlayerDetail || (isInPlayerDetail && isInScoreDetail),
            "if 'isInPlayerDetail' true,'isInScoreDetail' must be true");

  final PicksPlayerV2 playerV2;
  final int index;
  final bool mainRoute;
  final bool isInScoreDetail;
  final bool isInPlayerDetail;

  @override
  State<GuessItemV2> createState() => _GuessItemV2State();
}

class _GuessItemV2State extends State<GuessItemV2> with WidgetsBindingObserver {
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  late StreamSubscription<int> subscription;

  late PicksPlayerV2 playerV2;

  RxInt currentIndex = RxInt(-1);

  var gameStartTimeStr = "".obs;
  Timer? timer;

  guessItemTap(int i) {
    print('guessItemTap----:$i');
    // 0 more 1 less
    if (currentIndex.value == i) {
      currentIndex.value = playerV2.status = -1;
    } else {
      currentIndex.value = playerV2.status = i;
      SoundServices.to.playSound(Assets.soundUseCoin);
    }
    Get.find<PicksIndexController>().choiceOne(player: playerV2);
  }

  formatGameStartTime() {
    var nowDateMs = MyDateUtils.getNowDateMs();
    var gameStart =
        MyDateUtils.getDateTimeByMs(playerV2.guessInfo.gameStartTime);
    var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
    if (lastTimeMs <= 15 * 60 * 1000 && lastTimeMs > 0) {
      //距离比赛开始时间小于15分钟开始倒计时
      timer?.cancel();
      gameStartTimeStr.value = MyDateUtils.formatDate(
          MyDateUtils.getDateTimeByMs(lastTimeMs),
          format: DateFormats.M_S);
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        var nowDateMs = MyDateUtils.getNowDateMs();
        var gameStart =
            MyDateUtils.getDateTimeByMs(playerV2.guessInfo.gameStartTime);
        var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
        if (lastTimeMs == 0) {
          t.cancel();
          gameStartTimeStr.value =
              "In the game: ${MyDateUtils.formatHM_AM(gameStart)}";
        }
        gameStartTimeStr.value = MyDateUtils.formatDate(
            MyDateUtils.getDateTimeByMs(lastTimeMs),
            format: DateFormats.M_S);
      });
    } else if (MyDateUtils.isTomorrow(playerV2.guessInfo.gameStartTime)) {
      gameStartTimeStr.value = "Tomorrow ${MyDateUtils.formatHM_AM(gameStart)}";
    } else {
      gameStartTimeStr.value =
          "${MyDateUtils.formatDate(gameStart, format: DateFormats.PARAM_M_D)} ${MyDateUtils.formatHM_AM(gameStart)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    PicksPlayerV2 player = widget.playerV2;
    return Builder(builder: (logic) {
      PicksIndexController picksIndexController = Get.find();
      var count = player.guessInfo.moreCount + player.guessInfo.lessCount;

      var morePercent = (player.guessInfo.moreCount + 2) /
          (player.guessInfo.moreCount + player.guessInfo.lessCount + 4) *
          100;
      Future.delayed(Duration.zero, () {
        currentIndex.value = widget.playerV2.status;
        formatGameStartTime();
      });
      if (widget.isInScoreDetail) {
        return _buildScoreDetailItem(
            player, picksIndexController, morePercent, count);
      }
      return Stack(
        children: [
          RepaintBoundary(
            key: _repaintBoundaryKey,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(16.w)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  25.vGap,
                  InkWell(
                    onTap: () => Get.toNamed(RouteNames.picksPlayerDetail,
                        arguments: PlayerDetailPageArguments(
                            player.guessInfo.playerId,
                            tabStr: player.tabStr)),
                    child: Row(
                      children: [
                        29.hGap,
                        Stack(
                          children: [
                            PlayerAvatarWidget(
                              width: 73.w,
                              height: 93.w,
                              radius: 9.w,
                              playerId: player.guessInfo.playerId,
                              backgroundColor: AppColors.cD9D9D9,
                              tabStr: player.tabStr,
                            ),
                            Positioned(
                                top: 4.w,
                                right: 4.w,
                                child: Container(
                                  height: 16.w,
                                  width: 16.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFFFFFF,
                                      borderRadius: BorderRadius.circular(4.w)),
                                  child: IconWidget(
                                    iconWidth: 9.w,
                                    icon: Assets.iconUiIconRead,
                                    iconColor: AppColors.c000000,
                                  ),
                                ))
                          ],
                        ),
                        14.hGap,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                player.baseInfoList.ename,
                                style: 16.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fOswaldRegular,
                                    height: 1),
                                overflow: TextOverflow.ellipsis,
                              ),
                              8.vGap,
                              Row(
                                children: [
                                  Text(
                                    "${player.guessInfo.guessReferenceValue[player.tabStr] ?? 0}",
                                    style: 24.w7(
                                        color: AppColors.c262626,
                                        fontFamily: FontFamily.fOswaldMedium,
                                        height: 1),
                                  ),
                                  14.hGap,
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // Utils.getLongName(player.tabStr),
                                        LangKey.pickNameTotalPoints.tr,
                                        style: 19.w7(
                                          color: AppColors.c262626,
                                          fontFamily: FontFamily.fOswaldMedium,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              6.vGap,
                              Obx(() {
                                return MtInkWell(
                                  splashColor: AppColors.ce5e5e5,
                                  onTap: () => Get.toNamed(
                                      RouteNames.leagueLeagueDetail,
                                      arguments: {
                                        "gameId": player.guessInfo.gameId
                                      }),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 30.w,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "${Utils.getTeamInfo(player.baseInfoList.teamId).shortEname}@${player.awayTeamInfo?.shortEname ?? ""}   ${gameStartTimeStr.value}",
                                            // style: 12.w4(
                                            //     color: AppColors.c000000,
                                            //     fontFamily: FontFamily.fRobotoRegular,
                                            //     height: 1),
                                            style: TextStyle(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular,
                                                fontSize: 12.sp,
                                                decoration:
                                                    TextDecoration.underline),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      7.hGap,
                                      IconWidget(
                                        iconWidth: 5.w,
                                        icon: Assets.playerUiIconArrows01,
                                        iconColor: AppColors.c000000,
                                      ),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  11.vGap,
                  _buildBtn(picksIndexController, player),
                  16.vGap,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 29.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LangKey.pickButtonMore.tr,
                              style: 10.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            Text(
                              LangKey.scoreTipsRate.tr,
                              style: 10.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            Text(
                              LangKey.pickButtonLess.tr,
                              style: 10.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            )
                          ],
                        ),
                        2.vGap,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${morePercent.format()}%",
                              style: 14.w5(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                            3.hGap,
                            Expanded(
                              child: SupportPercentProgressWidget(
                                  leftPercent: morePercent.toInt(),
                                  rightPercent: 100 - morePercent.toInt()),
                            ),
                            3.hGap,
                            Text(
                              "${(100 - morePercent).format()}%",
                              style: 14.w5(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  21.vGap,
                  ...[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 1.w,
                      width: double.infinity,
                      color: AppColors.cE6E6E,
                    ),
                    11.vGap,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        children: [
                          UserAvaterWidget(
                            url: Utils.getAvatarUrl(
                                player.guessTopReviews?.teamLogo),
                            width: 26.w,
                            height: 26.w,
                            radius: 13.w,
                          ),
                          5.hGap,
                          Expanded(
                              child: Text(
                            player.guessTopReviews?.context ??
                                "Add a comment about this stake about",
                            style: 14.w4(
                              color: AppColors.c4D4D4D,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          9.hGap,
                          IconWidget(
                              iconWidth: 18.w,
                              icon: Assets.commonUiCommonIconCurrency02),
                          2.hGap,
                          Text(
                            Utils.formatChip((double.parse(
                                    picksIndexController.picksDefine.betCost) *
                                count)),
                            style: 12.w5(
                              color: AppColors.c4D4D4D,
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    11.vGap
                  ]
                ],
              ),
            ),
          ),
          Positioned(
              top: 11.w,
              right: 10.w,
              child: ShareWidget(
                globalKey: _repaintBoundaryKey,
                type: ShareType.guess,
              ))
        ],
      );
    });
  }

  Container _buildScoreDetailItem(
      PicksPlayerV2 player,
      PicksIndexController picksIndexController,
      double morePercent,
      int count) {
    Widget header;
    if (widget.isInPlayerDetail) {
      header = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${player.guessInfo.guessReferenceValue[player.tabStr] ?? 0}",
                style: 24.w5(
                    color: AppColors.c262626,
                    fontFamily: FontFamily.fOswaldMedium,
                    height: 1),
              ),
              11.hGap,
              Text(
                Utils.getLongName(player.tabStr),
                style: 19.w5(
                  color: AppColors.c262626,
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 1,
                ),
              ),
            ],
          ),
          11.vGap,
          MtInkWell(
            onTap: () => Get.toNamed(RouteNames.leagueLeagueDetail,
                arguments: {"gameId": player.guessInfo.gameId}),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${Utils.getTeamInfo(player.baseInfoList.teamId).shortEname}@${player.awayTeamInfo?.shortEname ?? ""}",
                  style: 12.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                ),
                13.hGap,
                Row(
                  children: [
                    Obx(() {
                      return Text(
                        gameStartTimeStr.value,
                        style: TextStyle(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline),
                      );
                    }),
                    7.hGap,
                    IconWidget(
                      iconWidth: 5.w,
                      icon: Assets.playerUiIconArrows01,
                      iconColor: AppColors.c000000,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      header = InkWell(
        onTap: () => Get.toNamed(RouteNames.picksPlayerDetail,
            arguments: PlayerDetailPageArguments(player.guessInfo.playerId,
                tabStr: player.tabStr)),
        child: Row(
          children: [
            53.hGap,
            PlayerAvatarWidget(
              width: 53.w,
              height: 46.w,
              radius: 0.w,
              playerId: player.guessInfo.playerId,
              backgroundColor: AppColors.cFFFFFF,
              tabStr: player.tabStr,
            ),
            14.hGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    player.baseInfoList.ename,
                    style: 14.w4(
                        color: AppColors.c000000,
                        fontFamily: FontFamily.fOswaldRegular,
                        height: 1),
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.vGap,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${player.guessInfo.guessReferenceValue[player.tabStr] ?? 0}",
                        style: 24.w5(
                            color: AppColors.c262626,
                            fontFamily: FontFamily.fOswaldMedium,
                            height: 1),
                      ),
                      11.hGap,
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Utils.getLongName(player.tabStr),
                            style: 19.w5(
                              color: AppColors.c262626,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return Container(
      height: 150.w,
      margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 9.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        border: Border.all(
          color: AppColors.cD9D9D9,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header,
          18.vGap,
          Container(
              margin: EdgeInsets.symmetric(horizontal: 13.w),
              child: _buildBtn(picksIndexController, player)),
          13.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 42.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${morePercent.format()}%",
                  style: 12.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
                10.hGap,
                Expanded(
                    child: SupportPercentProgressWidget(
                        height: 9.w,
                        leftPercent: morePercent.toInt(),
                        rightPercent: 100 - morePercent.toInt())),
                10.hGap,
                Text(
                  "${(100 - morePercent).format()}%",
                  style: 12.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBtn(
      PicksIndexController picksIndexController, PicksPlayerV2 player) {
    if (player.guessInfo.guessData.isNotEmpty) {
      getBtn(bool choice, String text) {
        var bgColor = choice ? AppColors.c000000 : AppColors.cEEEEEE;
        var textColor = choice ? AppColors.cFFFFFF : AppColors.ccccccc;
        return Expanded(
          child: Container(
            height: widget.isInScoreDetail ? 32.w : 41.w,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(9.w)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: widget.isInScoreDetail ? 16.sp : 19.sp,
                      color: textColor,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
                if (choice)
                  Positioned(
                      left: 11.w,
                      child: IconWidget(
                        iconWidth: 19.w,
                        icon: Assets.commonUiCommonIconPick,
                        iconColor: AppColors.cFFFFFF,
                      )),
              ],
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 29.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getBtn(player.guessInfo.guessData[0].guessChoice == 1,
                LangKey.pickButtonMore.tr),
            9.hGap,
            getBtn(player.guessInfo.guessData[0].guessChoice != 1,
                LangKey.pickButtonLess.tr),
          ],
        ),
      );
    }
    return Obx(() {
      return Container(
        height: widget.isInScoreDetail ? 32.w : 41.w,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 29.w),
        child: Row(
          children: [
            Expanded(
              child: MtInkWell(
                vibrate: true,
                onTap: () {
                  if (maxLimit(picksIndexController, player)) {
                    return;
                  }
                  guessItemTap(0);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: currentIndex.value == 0
                        ? AppColors.c000000
                        : AppColors.cTransparent,
                    border: Border.all(color: AppColors.c666666, width: 1),
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: Text(
                    LangKey.pickButtonMore.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: widget.isInScoreDetail ? 16.sp : 19.sp,
                        color: currentIndex.value == 0
                            ? AppColors.cFFFFFF
                            : AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              ),
            ),
            9.hGap,
            Expanded(
              child: MtInkWell(
                vibrate: true,
                onTap: () {
                  if (maxLimit(picksIndexController, player)) {
                    return;
                  }
                  guessItemTap(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: currentIndex.value == 1
                        ? AppColors.c000000
                        : AppColors.cTransparent,
                    border: Border.all(color: AppColors.c666666, width: 1),
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LangKey.pickButtonLess.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: widget.isInScoreDetail ? 16.sp : 19.sp,
                            color: currentIndex.value == 1
                                ? AppColors.cFFFFFF
                                : AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  maxLimit(PicksIndexController picksIndexController, PicksPlayerV2 player) {
    var length = picksIndexController.getChoiceGuessPlayers().length;
    if (length >= 6 && player.status == -1) {
      EasyLoading.showToast("Select up to 6");
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    playerV2 = widget.playerV2;
    WidgetsBinding.instance.addObserver(this);
    subscription = Get.find<HomeController>().tabIndex.listen((value) {
      if (value == 3) {
        formatGameStartTime();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    var value = Get.find<HomeController>().tabIndex.value;
    if (state == AppLifecycleState.resumed && value == 0) {
      formatGameStartTime();
    }
  }
}
