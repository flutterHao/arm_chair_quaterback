import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/league/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.LEAGUESTabGlobalKey,
      initialRoute: RouteNames.league,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.league:
            return GetPageRoute(
              opaque: false,
              settings: setting,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const LeagueIndexPage(),
            );
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
          case RouteNames.statsRank:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const StatsRankPage(),
                binding: RankBinding());
        }
      },
    );
  }
}

class LeagueIndexPage extends StatefulWidget {
  const LeagueIndexPage({super.key});

  @override
  State<LeagueIndexPage> createState() => _LeagueIndexPageState();
}

class _LeagueIndexPageState extends State<LeagueIndexPage>
    with AutomaticKeepAliveClientMixin {
  late LeagueController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
  }

  // 主视图
  Widget _buildView() {
    var listView = SliverList.separated(
      itemCount: controller.scoreList.length,
      itemBuilder: (context, index) {
        bool lastIndex = index == controller.scoreList.length - 1;
        var item = controller.scoreList[index];
        return Container(
            margin: EdgeInsets.only(
                top: index == 0 ? 9.w : 0, bottom: lastIndex ? 20.w : 0),
            child: _ItemWidget(gameGuess: item));
      },
      separatorBuilder: (BuildContext context, int index) {
        return 9.vGap;
      },
    );
    var emptyWidget = SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height -
            75.w -
            58.w -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom -
            46.w),
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.loading(),
          child: Center(
            child: Obx(() {
              return LoadStatusWidget(
                loadDataStatus: controller.loadStatus.value,
              );
            }),
          ),
        ),
      ),
    );
    return Expanded(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          buildHeader(),
          if (controller.scoreList.isNotEmpty &&
              controller.picksDefineEntity != null)
            listView
          else
            emptyWidget
        ],
      ),
    );
  }

  SliverPersistentHeader buildHeader() {
    return SliverPersistentHeader(
      floating: true,
      delegate: FixedHeightSliverHeaderDelegate(
          child: Container(
            height: 58.w,
            width: double.infinity,
            color: AppColors.c262626,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                16.hGap,
                Expanded(
                    child: Container(
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    labelStyle: 12.w4(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                    unselectedLabelStyle: 12.w4(
                        color: AppColors.c808080,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                        color: AppColors.c262626,
                        borderRadius: BorderRadius.circular(7.w)),
                    indicatorPadding: EdgeInsets.symmetric(vertical: 3.w),
                    onTap: controller.onPageChanged,
                    tabs: controller.getDataTimes().map((e) {
                      var today = MyDateUtils.isToday(e.millisecondsSinceEpoch);
                      int index = controller.getDataTimes().indexOf(e);
                      return Obx(() {
                        var currentIndex = controller.currentPageIndex.value;
                        var select = currentIndex == index;
                        return SizedBox(
                          width: select ? 78.w : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (today
                                        ? "TODAY"
                                        : MyDateUtils.getWeekday(e,
                                            short: true))
                                    .toUpperCase(),
                                style: 12.w4(
                                    color: today
                                        ? AppColors.cFF7954
                                        : select
                                            ? AppColors.cFFFFFF
                                            : AppColors.c808080,
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoRegular),
                              ),
                              2.vGap,
                              Text(
                                e.day.toString(),
                                style: 16.w5(
                                    color: select
                                        ? AppColors.cFFFFFF
                                        : AppColors.c808080,
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 1),
                              )
                            ],
                          ),
                        );
                      });
                    }).toList(),
                  ),
                )),
                21.hGap,
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.c666666, width: 1),
                      borderRadius: BorderRadius.circular(9.w)),
                  child: MtInkwell(
                      onTap: () => Get.toNamed(
                            RouteNames.statsRank,
                            id: GlobalNestedKey.LEAGUES,
                          ),
                      child: IconWidget(
                          iconWidth: 21.w,
                          icon: Assets.scoresUiScoresIconSystemRank)),
                ),
                10.hGap,
              ],
            ),
          ),
          height: 58.w),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueController>(
        id: LeagueController.idLeagueMain,
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              title: "COMMUNITIES",
              routeId: GlobalNestedKey.LEAGUES,
            ),
            bodyWidget: _buildView(),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class _ItemWidget extends StatefulWidget {
  const _ItemWidget({required this.gameGuess});

  final GameGuess gameGuess;

  @override
  State<_ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<_ItemWidget> with WidgetsBindingObserver {
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
      gameStartTimeStr.value = MyDateUtils.formatDate(
          MyDateUtils.getDateTimeByMs(lastTimeMs),
          format: DateFormats.M_S);
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
            "Coming ${(lastTimeMs / 1000 ~/ 60).toStringAsFixed(0).padLeft(2, "0")}:${(lastTimeMs / 1000 % 60).toStringAsFixed(0).padLeft(2, "0")}";
      });
    }else if(MyDateUtils.isToday(item.gameStartTime)){
      gameStartTimeStr.value =
      "Today ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
    } else if (MyDateUtils.isTomorrow(MyDateUtils.getNowDateTime(),
        MyDateUtils.getDateTimeByMs(item.gameStartTime))) {
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
                Text(
                  "${Utils.getTeamInfo(item.homeTeamId).shortEname} @ ${Utils.getTeamInfo(item.awayTeamId).shortEname}",
                  style: 24.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
                7.vGap,
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
                      12.hGap,
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
                      Obx(() {
                        gameStartTimeStr.value;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              gameStartTimeStr.value,
                              style: 12.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            if (item.status != 2)
                              Container(
                                margin: EdgeInsets.only(left: 6.w),
                                child: IconWidget(
                                  iconWidth: 5.w,
                                  icon: Assets.playerUiIconArrows01,
                                  iconColor: AppColors.c000000,
                                ),
                              )
                          ],
                        );
                      }),
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
                Obx(() {
                  gameStartTimeStr.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.status == 0
                            ? ""
                            : item.status == 1
                                ? "In the game"
                                : "FINAL",
                        style: 12.w4(
                            color: item.status == 2
                                ? AppColors.c000000
                                : AppColors.c10A86A,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                      if (item.status == 2)
                        Container(
                          margin: EdgeInsets.only(left: 6.w),
                          child: IconWidget(
                            iconWidth: 5.w,
                            icon: Assets.playerUiIconArrows01,
                            iconColor: AppColors.c000000,
                          ),
                        )
                    ],
                  );
                }),
                12.vGap,
                if (item.status == 0 || item.isGuess != 0) _buildGuess(),
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
                        url: Utils.getAvaterUrl(item.guessTopReviews?.teamLogo),
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
                          iconWidth: 18.w, icon: Assets.iconUiIconJetton),
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
              ],
            ),
          ),
        ),
        Positioned(
            top: 11.w,
            right: 10.w,
            child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    border: Border.all(color: AppColors.c666666, width: 1)),
                child: MtInkwell(
                    vibrate: true,
                    onTap: () => Utils.generateAndShareImage(globalKey),
                    child: IconWidget(
                      iconWidth: 15.w,
                      icon: Assets.commonUiCommonIconSystemShare,
                      iconColor: AppColors.c000000,
                    ))))
      ],
    );
  }

  String getChip() => Utils.formatChip((item.awayTeamWins + item.homeTeamWins) *
      int.parse(
          Get.find<LeagueController>().picksDefineEntity?.betCost ?? "0"));

  Column _buildGuess() {
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
        Obx(() {
          return Row(
            children: [
              29.hGap,
              _buildBtn(gameGuess.choiceTeamId.value == homeTeamInfo.id,
                  homeTeamInfo.id,
                  isGuessed: item.isGuess == homeTeamInfo.id),
              9.hGap,
              _buildBtn(gameGuess.choiceTeamId.value == awayTeamInfo.id,
                  awayTeamInfo.id,
                  isGuessed: item.isGuess == awayTeamInfo.id),
              29.hGap,
            ],
          );
        }),
        16.vGap,
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
                child: Row(
              children: [
                Expanded(
                    flex: max(2, homePercent),
                    child: Container(
                      height: 18.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.c000000,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(9.w))),
                    )),
                2.hGap,
                Expanded(
                    flex: max(2, 100 - homePercent),
                    child: Container(
                      height: 18.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.cB3B3B3,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(9.w))),
                    )),
              ],
            )),
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
    );
  }

  Expanded _buildBtn(bool isChoice, int teamId, {bool isGuessed = false}) {
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
                  ? isGuessed
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
                        ? isGuessed
                            ? AppColors.cFFFFFF
                            : AppColors.ccccccc
                        : isChoice
                            ? AppColors.cFFFFFF
                            : AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
              if (isGuessed)
                Positioned(
                    left: 11.w,
                    child: Builder(
                      builder: (context) {
                        // if(item.status == 2){
                        //   return Container(
                        //     width: 19.w,
                        //     height: 19.w,
                        //     child: IconWidget(iconWidth: 11.w, icon: :Assets.iconUiIconRuidgt),
                        //   );
                        // }
                        return IconWidget(
                          iconWidth: 19.w,
                          icon: Assets.commonUiCommonIconPick,
                          iconColor: AppColors.cFFFFFF,
                        );
                      }
                    ))
            ],
          ),
        ),
      ),
    );
  }

  String formatDate() {
    var gameStartTime = MyDateUtils.getDateTimeByMs(item.gameStartTime);
    var formatDate =
        MyDateUtils.formatDate(gameStartTime, format: DateFormats.PARAM_M_D);
    var formatHmAm = MyDateUtils.formatHM_AM(gameStartTime);
    if (MyDateUtils.isToday(item.gameStartTime)) {
      return "Today $formatHmAm";
    } else if (MyDateUtils.isTomorrow( DateTime.now(),gameStartTime)) {
      return "Tomorrow $formatHmAm";
    } else {
      return "$formatDate $formatHmAm";
    }
  }
}
