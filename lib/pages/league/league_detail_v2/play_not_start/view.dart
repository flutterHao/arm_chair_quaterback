import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_page_scroll_physics.dart';
import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_not_start/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_not_start/widget/play_not_start_player_detail.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/22/16:21
class PlayNotStartPage extends StatefulWidget {
  const PlayNotStartPage(this.item, {super.key});

  final ScoresEntity item;

  @override
  State<PlayNotStartPage> createState() => _PlayNotStartPageState();
}

class _PlayNotStartPageState extends State<PlayNotStartPage>
    with AutomaticKeepAliveClientMixin {

  late PlayNotStartController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(PlayNotStartController(widget.item));
    return GetBuilder<PlayNotStartController>(builder: (_) {
      if (controller.scoresNotStartGameEntity == null) {
        return Obx(() {
          return Center(
            child: LoadStatusWidget(
              loadDataStatus: controller.loadStatus.value,
            ),
          );
        });
      }
      return Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    LayoutBuilder(
                      builder: (context,c) {
                        return Row(
                          children: [
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..scale(-1.0, 1.0),
                              child: IconWidget(
                                  iconWidth: c.maxWidth / 2,
                                  fit: BoxFit.fitWidth,
                                  icon: Assets.scoresUiScoresBattleBg),
                            ),
                            IconWidget(
                                iconWidth: c.maxWidth / 2,
                                icon: Assets.scoresUiScoresBattleBg),
                          ],
                        );
                      }
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 15.w,
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(9.w))),
                        )),
                    Column(
                      children: [
                        Text(
                          "TIP OFF IN",
                          style: 14.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                        9.vGap,
                        Obx(() {
                          controller.gameStartTimesCountDown.value;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controller.twoDigits(controller.day),
                                    style: 40.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    ),
                                  ),
                                  5.vGap,
                                  Text(
                                    "DAY",
                                    style: 10.w4(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                " : ",
                                style: 40.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.twoDigits(controller.hh),
                                    style: 40.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    ),
                                  ),
                                  5.vGap,
                                  Text(
                                    "HRS",
                                    style: 10.w4(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                " : ",
                                style: 40.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.twoDigits(controller.minute),
                                    style: 40.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    ),
                                  ),
                                  5.vGap,
                                  Text(
                                    "MIN",
                                    style: 10.w4(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        })
                      ],
                    ),
                  ],
                ),

                ///mvp竞猜
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(9.w))),
                  child: Column(
                    children: [
                      14.vGap,
                      Text(
                        controller.getGuessStr(),
                        style: 16.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                      Builder(builder: (context) {
                        if (controller
                            .scoresNotStartGameEntity!.chooses.isNotEmpty) {
                          /// 已经预测过了mvp，显示支持率
                          return Column(
                            children: [
                              7.vGap,
                              Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Divider(
                                    height: 1.w,
                                    color: AppColors.cD1D1D1,
                                  )),
                              9.vGap,
                              ...List.generate(
                                  controller.scoresNotStartGameEntity!.questions
                                      .length, (index) {
                                Question item = controller
                                    .scoresNotStartGameEntity!.questions[index];
                                var baseInfo =
                                    Utils.getPlayBaseInfo(item.playerId);
                                var supportPercent = (item.supportCount /
                                        controller.getMVPTotalSupportCount())
                                    .handlerNaNInfinity();
                                bool isNotChoose = controller
                                    .scoresNotStartGameEntity!.chooses
                                    .where((e) => e.playerId != item.playerId)
                                    .isNotEmpty;
                                return Container(
                                  height: 39.w,
                                  width: 263.w,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 9.w),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: AppColors.cE6E6E6,
                                    width: 1.w,
                                  ))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ImageWidget(
                                            url:
                                                Utils.getPlayUrl(item.playerId),
                                            width: 35.w,
                                            height: 29.w,
                                            imageFailedPath:
                                                Assets.iconUiDefault05,
                                          ),
                                          9.hGap,
                                          Text(
                                            baseInfo.ename,
                                            style: 12.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldRegular,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.w),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 70.w,
                                                  height: 9.w,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors.cD1D1D1,
                                                      width: 1.w,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.w),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: -70.w +
                                                      supportPercent * 70.w,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    width: 70.w,
                                                    decoration: BoxDecoration(
                                                      color: isNotChoose
                                                          ? AppColors.cD5D5D5
                                                          : AppColors.c000000,
                                                      border: Border.all(
                                                        color: isNotChoose
                                                            ? AppColors.cD5D5D5
                                                            : AppColors.c000000,
                                                        width: 1.w,
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      5.w)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          5.hGap,
                                          Container(
                                              height: 29.w,
                                              width: 35.w,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${(supportPercent * 100).format()}%",
                                                style: 14.w4(
                                                  color: isNotChoose
                                                      ? AppColors.cB3B3B3
                                                      : AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldRegular,
                                                ),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                              25.vGap,
                              Container(
                                width: 343.w,
                                height: 36.w,
                                padding:
                                    EdgeInsets.only(left: 5.w, right: 12.w),
                                decoration: BoxDecoration(
                                  color: AppColors.cF2F2F2,
                                  borderRadius: BorderRadius.circular(6.w),
                                ),
                                child: Row(
                                  children: [
                                    UserAvaterWidget(
                                      url: Utils.getAvaterUrl(""),
                                      width: 26.w,
                                      height: 26.w,
                                      radius: 13.w,
                                    ),
                                    6.hGap,
                                    Expanded(
                                        child: Text(
                                      "Add a comment about this stake about ...",
                                      style: 14.w4(
                                        color: AppColors.c4D4D4D,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoRegular,
                                      ),
                                    )),
                                    20.hGap,
                                    IconWidget(
                                      iconWidth: 17.w,
                                      icon: Assets
                                          .commonUiCommonIconSystemLikeComment,
                                      iconColor: AppColors.c000000,
                                    )
                                  ],
                                ),
                              ),
                              21.vGap,
                            ],
                          );
                        }

                        /// 预测mvp
                        return Column(
                          children: [
                            17.vGap,
                            ...List.generate(
                                controller.scoresNotStartGameEntity!.questions
                                    .length, (index) {
                              Question item = controller
                                  .scoresNotStartGameEntity!.questions[index];
                              var baseInfo =
                                  Utils.getPlayBaseInfo(item.playerId);
                              return MtInkWell(
                                onTap: () => controller.scheduleChoose(item),
                                child: Container(
                                  height: 46.w,
                                  width: 259.w,
                                  margin: EdgeInsets.only(bottom: 9.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    border: Border.all(
                                      color: AppColors.cD1D1D1,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      12.hGap,
                                      ImageWidget(
                                        url: Utils.getPlayUrl(item.playerId),
                                        width: 47.w,
                                        height: 41.w,
                                        imageFailedPath: Assets.iconUiDefault05,
                                      ),
                                      8.hGap,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            baseInfo.ename,
                                            style: 14.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldRegular,
                                            ),
                                          ),
                                          5.vGap,
                                          Text(
                                            "${Utils.getTeamInfo(baseInfo.teamId).shortEname} · ${baseInfo.position}",
                                            style: 10.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldRegular,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                            21.vGap,
                          ],
                        );
                      })
                    ],
                  ),
                ),

                /// 赛程竞猜
                Builder(builder: (context) {
                  var nowDateTime = MyDateUtils.getNowDateTime();
                  var nextDay = MyDateUtils.nextDay(nowDateTime);
                  var dayStartTimeMS = MyDateUtils.getDayStartTimeMS(
                      MyDateUtils.nextDay(nextDay));
                  var item = controller.getGameGuess().scoresEntity;

                  /// 有时区问题
                  if (item.gameStartTime >= dayStartTimeMS ||
                      (item.gameStartTime < MyDateUtils.getNowDateMs() &&
                          item.isGuess == 0 &&
                          item.status != 0)) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    margin: EdgeInsets.only(top: 9.w),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    height: 232.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.w),
                        color: AppColors.cFFFFFF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        22.vGap,
                        Text(
                          "WINNER PICK",
                          style: 24.w7(
                              height: 1, fontFamily: FontFamily.fOswaldBold),
                        ),
                        16.vGap,
                        ScoreItemWidget(
                          gameGuess: controller.getGameGuess(),
                          isInScoreDetail: true,
                        ),
                      ],
                    ),
                  );
                }),

                /// 球员竞猜
                if (controller.getPlayerV2().isNotEmpty &&
                    controller.getPlayerMaxLength() != 0) ...[
                  Container(
                    margin: EdgeInsets.only(top: 9.w),
                    height: 114.w + 159.w * controller.getPlayerMaxLength(),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(9.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 114.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              22.vGap,
                              Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  "PLAYER PICK",
                                  style: 24.w7(
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldBold),
                                ),
                              ),
                              25.vGap,
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TLBuildWidget(
                                    controller: controller.tabController!,
                                    builder: (int current, int next,
                                        double progress, double totalProgress) {
                                      return SingleChildScrollView(
                                        controller: controller.scrollController,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children:
                                              controller.getTabs().map((e) {
                                            int index =
                                                controller.getTabs().indexOf(e);
                                            Color bgColor = index == current
                                                ? Color.lerp(
                                                    AppColors.c000000,
                                                    AppColors.cFFFFFF,
                                                    progress)!
                                                : index == next
                                                    ? Color.lerp(
                                                        AppColors.cFFFFFF,
                                                        AppColors.c000000,
                                                        progress)!
                                                    : AppColors.cFFFFFF;
                                            Color color = index == current
                                                ? Color.lerp(
                                                    AppColors.cFFFFFF,
                                                    AppColors.c000000,
                                                    progress)!
                                                : index == next
                                                    ? Color.lerp(
                                                        AppColors.c000000,
                                                        AppColors.cFFFFFF,
                                                        progress)!
                                                    : AppColors.c000000;
                                            return MtInkWell(
                                              onTap: () {
                                                if (controller
                                                        .tabController!.index !=
                                                    index) {
                                                  controller.tabController!
                                                      .animateTo(index);
                                                }
                                              },
                                              child: Container(
                                                height: 28.w,
                                                width: 76.w,
                                                margin: EdgeInsets.only(
                                                    left: index == 0 ? 16.w : 0,
                                                    right: 10.w),
                                                decoration: BoxDecoration(
                                                  color: bgColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.w),
                                                  border: Border.all(
                                                      color: AppColors.c666666,
                                                      width: 1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    e.replaceAll(",", "+"),
                                                    style: 16.w5(
                                                        color: color,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: controller.tabController,
                              children: controller.getTabs().map((e) {
                                List<PicksPlayerV2> list =
                                    controller.getPlayerV2()[e] ?? [];
                                return MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: list.map((e) {
                                      var i = list.indexOf(e);
                                      return GuessItemV2(
                                        playerV2: e,
                                        index: i,
                                        mainRoute: true,
                                        isInScoreDetail: true,
                                      );
                                    }).toList(),
                                  ),
                                );
                              }).toList()),
                        )
                      ],
                    ),
                  ),
                  9.vGap
                ],

                /// team data
                Container(
                  margin: EdgeInsets.only(top: 9.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.cFFFFFF),
                  child: _buildTeamDataWidget(context),
                ),

                /// history
                Container(
                  margin: EdgeInsets.only(top: 9.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.cFFFFFF),
                  child: _buildHistoryWidget(context),
                ),

                Container(
                  height: 343.w,
                  margin: EdgeInsets.only(top: 9.w),
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(9.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          22.vGap,
                          Container(
                            margin: EdgeInsets.only(left: 15.w),
                            child: Text(
                              "RECENT GAME",
                              style: 24.w7(
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                          ),
                          16.vGap,
                        ],
                      ),
                      SizedBox(
                        height: 40.w,
                        child: TabBar(
                            controller: controller.teamL5GameTabController,
                            indicatorColor: AppColors.cFF7954,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: AppColors.cD1D1D1,
                            overlayColor: null,
                            labelStyle: 16.w5(
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                            labelColor: AppColors.c000000,
                            unselectedLabelStyle: 16.w5(
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                            unselectedLabelColor: AppColors.cB2B2B2,
                            tabs: [
                              Row(
                                children: [
                                  ImageWidget(
                                    url: Utils.getTeamUrl(
                                        controller.item.homeTeamId),
                                    width: 28.w,
                                  ),
                                  7.hGap,
                                  Text(
                                    Utils.getTeamInfo(
                                            controller.item.homeTeamId)
                                        .shortEname,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    Utils.getTeamInfo(
                                            controller.item.awayTeamId)
                                        .shortEname,
                                  ),
                                  7.hGap,
                                  ImageWidget(
                                    url: Utils.getTeamUrl(
                                        controller.item.awayTeamId),
                                    width: 28.w,
                                  ),
                                ],
                              )
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(
                            controller: controller.teamL5GameTabController,
                            children: [
                              _buildL5GamePageWidget(
                                  context,
                                  controller.scoresNotStartGameEntity!
                                          .teamHistoryMap[
                                      controller.item.homeTeamId.toString()],
                                  controller.item.homeTeamId),
                              _buildL5GamePageWidget(
                                  context,
                                  controller.scoresNotStartGameEntity!
                                          .teamHistoryMap[
                                      controller.item.awayTeamId.toString()],
                                  controller.item.awayTeamId),
                            ]),
                      ),
                      21.vGap,
                    ],
                  ),
                ),
                Container(
                  height: getTeamPlayerMaxLength() * 34.w +
                      29.w +
                      20.w +
                      40.w +
                      20.w,
                  padding: EdgeInsets.only(top: 0.w, bottom: 20.w),
                  margin: EdgeInsets.only(top: 9.w),
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(9.w)),
                  child: PlayNotStartPlayerDetail(
                      controller.scoresNotStartGameEntity!.teamPlayerMap,
                      controller.item),
                ),
                Obx(() {
                  var picksIndexController = Get.find<PicksIndexController>();
                  var leagueController = Get.find<LeagueController>();
                  var value = picksIndexController.choiceSize.value;
                  value += leagueController.choiceSize.value;
                  if (value > 0) {
                    return 94.vGap;
                  }
                  return 9.vGap;
                })
              ],
            ),
          ),
          // 竞猜选择确认弹框
          BottomGuessTipWidget(
            bottomValue: 9.w,
          ),
        ],
      );
    });
  }

  int getTeamPlayerMaxLength() {
    var teamPlayerMap = controller.scoresNotStartGameEntity!.teamPlayerMap;
    var keys = teamPlayerMap.keys;
    var len = 0;
    for (int i = 0; i < keys.length; i++) {
      var key = keys.toList()[i];
      var list = teamPlayerMap[key]!;
      len = max(len, list.length);
    }
    return len;
  }

  MediaQuery _buildL5GamePageWidget(
      BuildContext context, List<GameSchedulesInfo>? historyMap, int homeId) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: (historyMap ?? []).length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = historyMap![index];
              var isHome = homeId == item.homeTeamId;
              int leftId = isHome ? item.homeTeamId : item.awayTeamId;
              int rightId = isHome ? item.awayTeamId : item.homeTeamId;
              int leftScore = isHome ? item.homeTeamScore : item.awayTeamScore;
              int rightScore = isHome ? item.awayTeamScore : item.homeTeamScore;
              return Container(
                height: 46.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        isHome ? "HOME" : "AWAY",
                        style: 10.w4(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ImageWidget(
                          url: Utils.getTeamUrl(leftId),
                          width: 25.w,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        leftScore.toString(),
                        style: 21.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          MyDateUtils.formatDate(
                              MyDateUtils.getDateTimeByMs(item.gameStartTime),
                              format: DateFormats.DOT_Y_M_D),
                          style: 10.w4(
                              color: AppColors.c4D4D4D,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ImageWidget(
                        url: Utils.getTeamUrl(rightId),
                        width: 25.w,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        rightScore.toString(),
                        style: 21.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        isHome ? "AWAY" : "HOME",
                        style: 10.w4(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  Container _buildTeamDataWidget(BuildContext context) {
    var leftItem = controller.scoresNotStartGameEntity!.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == controller.item.homeTeamId);
    var rightItem = controller.scoresNotStartGameEntity!.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == controller.item.awayTeamId);
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          22.vGap,
          Container(
            margin: EdgeInsets.only(left: 15.w),
            child: Text(
              "TEAM DATA",
              style: 24.w7(
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold),
            ),
          ),
          16.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 29.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageWidget(
                      url: Utils.getTeamUrl(controller.item.homeTeamId),
                      width: 28.w,
                    ),
                    7.hGap,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.getTeamInfo(controller.item.homeTeamId)
                              .shortEname,
                          style: 16.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1),
                        ),
                        3.vGap,
                        Text(
                          "${leftItem?.conference} ${leftItem == null ? "" : Utils.getSortWithInt(leftItem.division)}",
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Utils.getTeamInfo(controller.item.awayTeamId)
                              .shortEname,
                          style: 16.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1),
                        ),
                        3.vGap,
                        Text(
                          "${rightItem?.conference} ${rightItem == null ? "" : Utils.getSortWithInt(rightItem.division)}",
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )
                      ],
                    ),
                    7.hGap,
                    ImageWidget(
                      url: Utils.getTeamUrl(controller.item.awayTeamId),
                      width: 28.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          9.vGap,
          const Divider(
            color: AppColors.cD1D1D1,
            height: 1,
          ),
          Obx(() {
            bool expanded = controller.isExpanded.value;
            return AnimatedContainer(
              height: !expanded
                  ?  6 * 60.w
                  : (controller.getTeamStatsData().length + 1) * 60.w,
              duration: const Duration(milliseconds: 100),
              child: _buildDataPageWidget(context),
            );
          })
        ],
      ),
    );
  }

  Container _buildHistoryWidget(BuildContext context) {
    var leftItem = controller.scoresNotStartGameEntity!.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == controller.item.homeTeamId);
    var rightItem = controller.scoresNotStartGameEntity!.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == controller.item.awayTeamId);
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              22.vGap,
              Container(
                margin: EdgeInsets.only(left: 15.w),
                child: Text(
                  "HISTORY",
                  style: 24.w7(
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
              ),
              16.vGap,
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 29.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageWidget(
                      url: Utils.getTeamUrl(controller.item.homeTeamId),
                      width: 28.w,
                    ),
                    7.hGap,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.getTeamInfo(controller.item.homeTeamId)
                              .shortEname,
                          style: 16.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1),
                        ),
                        3.vGap,
                        Text(
                          "${leftItem?.conference} ${leftItem == null ? "" : Utils.getSortWithInt(leftItem.division)}",
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Utils.getTeamInfo(controller.item.awayTeamId)
                              .shortEname,
                          style: 16.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 1),
                        ),
                        3.vGap,
                        Text(
                          "${rightItem?.conference} ${rightItem == null ? "" : Utils.getSortWithInt(rightItem.division)}",
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )
                      ],
                    ),
                    7.hGap,
                    ImageWidget(
                      url: Utils.getTeamUrl(controller.item.awayTeamId),
                      width: 28.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          9.vGap,
          const Divider(
            color: AppColors.cD1D1D1,
            height: 1,
          ),
          SizedBox(
            height: 60.w * 5 + 25.w,
              child: _buildHistoryPageWidget(context))
        ],
      ),
    );
  }



  MediaQuery _buildHistoryPageWidget(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              controller.scoresNotStartGameEntity!.nbaGameSchedules.length,
          itemBuilder: (context, index) {
            var gameSchedule =
                controller.scoresNotStartGameEntity!.nbaGameSchedules[index];
            return Container(
              height: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${gameSchedule.homeTeamScore}",
                    style: 21.w5(
                        color: AppColors.cB2B2B2,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  Text(
                    MyDateUtils.formatDate(
                        MyDateUtils.getDateTimeByMs(gameSchedule.gameStartTime),
                        format: DateFormats.DOT_Y_M_D),
                    style: 10.w4(
                        color: AppColors.c4D4D4D,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                  Text(
                    "${gameSchedule.awayTeamScore}",
                    style: 21.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  )
                ],
              ),
            );
          }),
    );
  }

  Column _buildDataPageWidget(BuildContext context) {
    var teamStatsData = controller.getTeamStatsData();
    return Column(
      children: [
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(teamStatsData.length, (index) {
                var item = teamStatsData[index];
                return _teamStatsItemWidget(item);
              }),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            controller.isExpanded.value = !controller.isExpanded.value;
          },
          child: Container(
            height: 60.w,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UNFOLD",
                  style: 16.w7(
                      color: AppColors.c262626,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
                4.vGap,
                Obx(() {
                  return IconWidget(
                    iconWidth: 9.w,
                    icon: Assets.commonUiCommonIconSystemJumpto,
                    iconColor: AppColors.c000000,
                    rotateAngle: controller.isExpanded.value ? -90 : 90,
                  );
                })
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _teamStatsItemWidget(TeamStats item) {
    var leftPercent = (item.leftValue+2) / (item.rightValue+item.leftValue+4) *100;
    return Container(
      height: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${item.leftValue}",
                style: 16.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              ),
              Text(
                item.name,
                style: 10.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular),
              ),
              Text(
                "${item.rightValue}",
                style: 16.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              )
            ],
          ),
          3.5.vGap,
          SupportPercentProgressWidget(
            height: 12.w,
            leftPercent: leftPercent.toInt(),
            leftColor: AppColors.cB3B3B3,
            rightPercent: (100 - leftPercent).toInt(),
            rightColor: AppColors.c000000,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
