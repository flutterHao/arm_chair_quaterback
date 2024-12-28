import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
///@auther gejiahui
///created at 2024/11/19/11:02

class ScorePage extends StatefulWidget {
  const ScorePage(this.time, {super.key});

  final DateTime time;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage>
    with AutomaticKeepAliveClientMixin {
  late ScorePageController controller;

  @override
  Widget build(BuildContext context) {
    print('_ScorePageState----build-----$this');
    controller = Get.put(
      ScorePageController(widget.time),
      tag: widget.time.millisecondsSinceEpoch.toString(),
    );
    return GetBuilder<ScorePageController>(
        init: controller,
        id: controller.idScorePageMain,
        tag: widget.time.millisecondsSinceEpoch.toString(),
        builder: (_) {
          return SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.loading,
              child: controller.scoreList.isEmpty
                  ? Center(
                      child: Obx(() {
                        return LoadStatusWidget(
                          loadDataStatus: controller.loadStatus.value,
                        );
                      }),
                    )
                  : ListView.separated(
                      controller: ScrollController(),
                      itemCount: controller.scoreList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool lastIndex =
                            index == controller.scoreList.length - 1;
                        var item = controller.scoreList[index];
                        return Container(
                            margin: EdgeInsets.only(
                                top: index == 0 ? 9.w : 0,
                                bottom: lastIndex ? 94.w : 0),
                            child: ScoreItemWidget(gameGuess: item));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 9.vGap;
                      },
                    ));
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class ScoreItemWidget extends StatefulWidget {
  const ScoreItemWidget({super.key, required this.gameGuess});

  final GameGuess gameGuess;

  @override
  State<ScoreItemWidget> createState() => _ScoreItemWidgetState();
}

class _ScoreItemWidgetState extends State<ScoreItemWidget>
    with WidgetsBindingObserver {
  late GameGuess gameGuess;
  late ScoresEntity item;
  var globalKey = GlobalKey();

  Timer? timer;
  var gameStartTimeStr = "".obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Get.find<HomeController>().tabIndex.listen((value) {
      if (value == 1) {
        setGameStartTimeStr();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var value = Get.find<HomeController>().tabIndex.value;
    if (state == AppLifecycleState.resumed && value == 1) {
      setGameStartTimeStr();
    }
    super.didChangeAppLifecycleState(state);
  }

  void setGameStartTimeStr() {
    var nowDateMs = MyDateUtils.getNowDateMs();
    var gameStart = MyDateUtils.getDateTimeByMs(item.gameStartTime);
    var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
    if (lastTimeMs <= 15 * 60 * 1000 && lastTimeMs > 0) {
      //距离比赛开始时间小于15分钟开始倒计时
      timer?.cancel();
      gameStartTimeStr.value =
          "Coming ${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(lastTimeMs), format: DateFormats.M_S)}";
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        var nowDateMs = MyDateUtils.getNowDateMs();
        var gameStart = MyDateUtils.getDateTimeByMs(item.gameStartTime);
        var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
        if (lastTimeMs == 0) {
          t.cancel();
          gameStartTimeStr.value =
              "Today ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
        }
        gameStartTimeStr.value =
            "Coming ${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(lastTimeMs), format: DateFormats.M_S)}";
      });
    } else if (MyDateUtils.isToday(item.gameStartTime)) {
      gameStartTimeStr.value =
          "Today ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
    } else if (MyDateUtils.isTomorrow(item.gameStartTime)) {
      gameStartTimeStr.value =
          "Tomorrow ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
    } else {
      gameStartTimeStr.value =
          "${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(item.gameStartTime), format: DateFormats.PARAM_M_D)} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
    }
  }

  @override
  Widget build(BuildContext context) {
    item = widget.gameGuess.scoresEntity;
    gameGuess = widget.gameGuess;
    setGameStartTimeStr();
    return Stack(
      alignment: Alignment.center,
      children: [
        RepaintBoundary(
          key: globalKey,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                18.vGap,
                MtInkwell(
                  minScale: 1,
                  onTap: () {
                    Get.toNamed(RouteNames.leagueLeagueDetail,
                        arguments: {"item": item});
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 52.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 52.w,
                              alignment: Alignment.center,
                              child: Text(
                                Utils.getTeamInfo(item.homeTeamId).shortEname,
                                style: 24.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                            ),
                            Expanded(
                              child: Obx(() {
                                gameStartTimeStr.value;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 3.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        gameStartTimeStr.value,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.c000000,
                                            decoration:
                                                TextDecoration.underline,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoRegular),
                                        // style: 12.w4(
                                        //     color: AppColors.c000000,
                                        //     height: 1,
                                        //     fontFamily:
                                        //         FontFamily.fRobotoRegular),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 6.w),
                                        child: IconWidget(
                                          iconWidth: 5.w,
                                          icon: Assets.playerUiIconArrows01,
                                          iconColor: AppColors.c000000,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ),
                            Container(
                              width: 52.w,
                              alignment: Alignment.center,
                              child: Text(
                                Utils.getTeamInfo(item.awayTeamId).shortEname,
                                style: 24.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        gameStartTimeStr.value;
                        return Text(
                          item.status == 0
                              ? ""
                              : item.status == 1
                                  ? "In the game"
                                  : "FINAL",
                          style: 12.w4(
                              color: item.status == 2
                                  ? AppColors.c000000
                                  : AppColors.c10A86A,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        );
                      }),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 52.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageWidget(
                              url: Utils.getTeamUrl(item.homeTeamId),
                              imageFailedPath: Assets.iconUiDefault06,
                              width: 52.w,
                            ),
                            12.hGap,
                            Container(
                              height: 52.w,
                              alignment: Alignment.center,
                              child: Text(
                                "${item.status != 0 ? item.homeTeamScore : "   "}",
                                style: 30.w7(
                                    color: AppColors.cB3B3B3,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldBold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 52.w,
                                alignment: Alignment.center,
                                child: Text(
                                  item.status == 2 ? "" : "VS",
                                  style: 30.w7(
                                      color: AppColors.cB3B3B3,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldBold),
                                ),
                              ),
                            ),
                            Container(
                              height: 52.w,
                              alignment: Alignment.center,
                              child: Text(
                                "${item.status != 0 ? item.awayTeamScore : "   "}",
                                style: 30.w7(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldBold),
                              ),
                            ),
                            12.hGap,
                            ImageWidget(
                              url: Utils.getTeamUrl(item.awayTeamId),
                              imageFailedPath: Assets.iconUiDefault06,
                              width: 52.w,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 52.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 52.w,
                              child: Center(
                                child: Text(
                                  item.homeTeamWL,
                                  style: 10.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 52.w,
                              child: Center(
                                child: Text(
                                  item.awayTeamWL,
                                  style: 10.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.vGap,
                      _buildGuess(),
                    ],
                  ),
                ),
                if (item.status != 0) ...[
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cE6E6E,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  11.vGap,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        UserAvaterWidget(
                          url: Utils.getAvaterUrl(
                              item.guessTopReviews?.teamLogo),
                          width: 26.w,
                          height: 26.w,
                          radius: 13.w,
                        ),
                        5.hGap,
                        Expanded(
                            child: Text(
                          item.guessTopReviews?.context ??
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
                          getChip(),
                          style: 12.w5(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoMedium,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  11.vGap,
                ]
              ],
            ),
          ),
        ),
        Positioned(
            top: 11.w, right: 10.w, child: ShareWidget(globalKey: globalKey))
      ],
    );
  }

  String getChip() => Utils.formatChip((item.awayTeamWins + item.homeTeamWins) *
      int.parse(
          Get.find<LeagueController>().picksDefineEntity?.betCost ?? "0"));

  Widget _buildGuess() {
    var nowDateTime = MyDateUtils.getNowDateTime();
    var nextDay = MyDateUtils.nextDay(nowDateTime);
    var dayStartTimeMS =
        MyDateUtils.getDayStartTimeMS(MyDateUtils.nextDay(nextDay));

    var count = item.homeTeamWins + item.awayTeamWins;
    var homePercent = 0;
    if (item.homeTeamWins == 0 && item.awayTeamWins == 0) {
      homePercent = 50;
    } else if (item.homeTeamWins == 0) {
      homePercent = 0;
    } else if (item.awayTeamWins == 0) {
      homePercent = 100;
    } else {
      homePercent =
          int.parse((item.homeTeamWins / count * 100).toStringAsFixed(0));
    }
    var homeTeamInfo = Utils.getTeamInfo(item.homeTeamId);
    var awayTeamInfo = Utils.getTeamInfo(item.awayTeamId);
    return Column(
      children: [
        Builder(builder: (context) {
          ///只能猜今明两天未开始的赛程
          if (item.gameStartTime >= dayStartTimeMS ||
              (item.gameStartTime < MyDateUtils.getNowDateMs() &&
                  item.isGuess == 0 &&
                  item.status != 0)) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              Obx(() {
                return Row(
                  children: [
                    29.hGap,
                    _buildBtn(gameGuess.choiceTeamId.value == homeTeamInfo.id,
                        homeTeamInfo.id,
                        isGuessIdEqualTeamId: item.isGuess == homeTeamInfo.id),
                    9.hGap,
                    _buildBtn(gameGuess.choiceTeamId.value == awayTeamInfo.id,
                        awayTeamInfo.id,
                        isGuessIdEqualTeamId: item.isGuess == awayTeamInfo.id),
                    29.hGap,
                  ],
                );
              }),
              16.vGap,
            ],
          );
        }),
        if (item.status != 0)
          Column(
            children: [
              Row(
                children: [
                  29.hGap,
                  Text(
                    homeTeamInfo.shortEname,
                    style: 10.w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "WHO WILL WIN",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ),
                  ),
                  Text(
                    awayTeamInfo.shortEname,
                    style: 10.w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                  29.hGap,
                ],
              ),
              3.vGap,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  29.hGap,
                  Text(
                    "$homePercent%",
                    style: 14.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  3.hGap,
                  Expanded(
                      child: SupportPercentProgressWidget(
                          leftPercent: homePercent,
                          rightPercent: 100 - homePercent)),
                  3.hGap,
                  Text(
                    "${100 - homePercent}%",
                    style: 14.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  29.hGap,
                ],
              ),
              21.vGap,
            ],
          )
      ],
    );
  }

  Expanded _buildBtn(bool isChoice, int teamId,
      {bool isGuessIdEqualTeamId = false}) {
    return Expanded(
      child: MtInkwell(
        vibrate: true,
        onTap: () {
          if (item.isGuess != 0) {
            return;
          }
          Get.find<LeagueController>().btnTap(gameGuess, teamId);
        },
        child: Container(
          height: 41.w,
          decoration: BoxDecoration(
              color: item.isGuess != 0
                  ? isGuessIdEqualTeamId
                      ? AppColors.c000000
                      : AppColors.cEEEEEE
                  : isChoice
                      ? AppColors.c000000
                      : AppColors.cTransparent,
              borderRadius: BorderRadius.circular(9.w),
              border: Border.all(color: AppColors.c666666, width: 1)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "${Utils.getTeamInfo(teamId).shortEname} WIN",
                style: 19.w5(
                    color: item.isGuess != 0
                        ? isGuessIdEqualTeamId
                            ? AppColors.cFFFFFF
                            : AppColors.ccccccc
                        : isChoice
                            ? AppColors.cFFFFFF
                            : AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
              if (isGuessIdEqualTeamId)
                Positioned(
                    left: 11.w,
                    child: Builder(builder: (context) {
                      if (item.guessStatus != 1) {
                        var winId = item.homeTeamScore > item.awayTeamScore
                            ? item.homeTeamId
                            : item.awayTeamId;
                        bool isChoiceSuccess = winId == teamId;
                        return Container(
                          width: 19.w,
                          height: 19.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: isChoiceSuccess
                                ? AppColors.c10A86A
                                : AppColors.cD60D20,
                          ),
                          child: IconWidget(
                              iconWidth: 11.w,
                              icon: isChoiceSuccess
                                  ? Assets.iconUiIconRuidgt
                                  : Assets.iconIconClose),
                        );
                      }
                      return IconWidget(
                        iconWidth: 19.w,
                        icon: Assets.commonUiCommonIconPick,
                        iconColor: AppColors.cFFFFFF,
                      );
                    }))
            ],
          ),
        ),
      ),
    );
  }
}
