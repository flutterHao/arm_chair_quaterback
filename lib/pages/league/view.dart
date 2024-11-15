import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
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
import 'package:arm_chair_quaterback/pages/league/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
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
        height: MediaQuery.of(context).size.height / 2,
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
              children: [
                16.hGap,
                Expanded(
                    child: Container(
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: MtInkwell(
                          onTap: () => controller.prePage(),
                          child: IconWidget(
                              iconWidth: 8.w,
                              icon: Assets.playerUiIconArrows02),
                        ),
                      ),
                      Expanded(
                          child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.pageText.length,
                              onPageChanged: (index) =>
                                  controller.onPageChanged(index),
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Text(
                                    controller.pageText[index],
                                    style: 16.w5(
                                        color: AppColors.cB3B3B3,
                                        fontFamily: FontFamily.fOswaldMedium),
                                  ),
                                );
                              })),
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: MtInkwell(
                          onTap: () => controller.nextPage(),
                          child: IconWidget(
                              iconWidth: 8.w,
                              icon: Assets.playerUiIconArrows01),
                        ),
                      )
                    ],
                  ),
                )),
                9.hGap,
                Container(
                  width: 112.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: AppColors.c3B3B3B,
                      borderRadius: BorderRadius.circular(9.w)),
                  child: Center(
                    child: Text(
                      "STANDINGS",
                      style: 16.w5(
                          color: AppColors.cFFFFFF,
                          fontFamily: FontFamily.fOswaldMedium),
                    ),
                  ),
                ),
                16.hGap,
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

class _ItemWidgetState extends State<_ItemWidget> {
  late GameGuess gameGuess;
  late ScoresEntity item;
  var globalKey = GlobalKey();

  Timer? timer;
  var gameStartTimeStr = "".obs;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Column _buildTeamInfo(bool home) {
    return Column(
      children: [
        ImageWidget(
          url: Utils.getTeamUrl(home ? item.homeTeamId : item.awayTeamId),
          imageFailedPath: Assets.iconUiDefault06,
          width: 44.w,
        ),
        10.vGap,
        Text(
          Utils.getTeamInfo(home ? item.homeTeamId : item.awayTeamId)
              .shortEname,
          style: 12.w4(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular),
        ),
        4.vGap,
        Text(
          home ? item.homeTeamWL : item.awayTeamWL,
          style: 10.w4(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular),
        ),
      ],
    );
  }

  Widget getStatus() {
    Color color;
    if (item.status == 2) {
      color = AppColors.c000000;
      gameStartTimeStr.value = "FINAL";
    } else if (item.status == 1) {
      color = AppColors.c10A86A;
      gameStartTimeStr.value =
          "In the game: ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
    } else {
      color = AppColors.c000000;
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
                "In the game: ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
          }
          gameStartTimeStr.value =
              "Coming ${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(lastTimeMs), format: DateFormats.M_S)}";
        });
      } else if (MyDateUtils.isTomorrow(MyDateUtils.getNowDateTime(),
          MyDateUtils.getDateTimeByMs(item.gameStartTime))) {
        gameStartTimeStr.value =
            "Tomorrow ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
      } else {
        gameStartTimeStr.value =
            "${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(item.gameStartTime), format: DateFormats.PARAM_M_D)} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
      }
    }

    return Obx(() {
      return Text(
        gameStartTimeStr.value,
        style: 12
            .w4(color: color, height: 1, fontFamily: FontFamily.fRobotoRegular),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    item = widget.gameGuess.scoresEntity;
    gameGuess = widget.gameGuess;
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
                  "NBA",
                  style: 12.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
                8.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getStatus(),
                    6.hGap,
                    IconWidget(
                      iconWidth: 5.w,
                      icon: Assets.playerUiIconArrows01,
                      iconColor: AppColors.c000000,
                    )
                  ],
                ),
                8.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTeamInfo(true),
                    12.hGap,
                    Container(
                      height: 44.w,
                      alignment: Alignment.center,
                      child: Text(
                        "${item.status == 2 ? item.homeTeamScore : "   "}",
                        style: 30.w7(
                            color: AppColors.cB3B3B3,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                    Container(
                      height: 44.w,
                      width: 70.w,
                      alignment: Alignment.center,
                      child: Text(
                        item.status == 2 ? "" : "VS",
                        style: 30.w7(
                            color: AppColors.cB3B3B3,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                    Container(
                      height: 44.w,
                      alignment: Alignment.center,
                      child: Text(
                        "${item.status == 2 ? item.awayTeamScore : "   "}",
                        style: 30.w7(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                    12.hGap,
                    _buildTeamInfo(false)
                  ],
                ),
                16.vGap,
                if (item.status == 0) _buildGuess(),
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
                    child: IconWidget(
                      iconWidth: 19.w,
                      icon: Assets.commonUiCommonIconPick,
                      iconColor: AppColors.cFFFFFF,
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
