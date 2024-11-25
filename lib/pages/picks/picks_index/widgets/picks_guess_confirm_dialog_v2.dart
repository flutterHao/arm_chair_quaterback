import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/pick_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/18:08

class PicksGuessConfirmDialogV2 extends StatefulWidget {
  const PicksGuessConfirmDialogV2({super.key});

  @override
  State<PicksGuessConfirmDialogV2> createState() =>
      _PicksGuessConfirmDialogV2State();
}

class _PicksGuessConfirmDialogV2State extends State<PicksGuessConfirmDialogV2> {
  var modelCurrentIndex = 0.obs;
  late PicksIndexController picksIndexController;
  late LeagueController leagueController;

  @override
  Widget build(BuildContext context) {
    picksIndexController = Get.find();
    leagueController = Get.find();
    var queryData = MediaQuery.of(context);

    return SizedBox(
      width: double.infinity,
      height: queryData.size.height,
      child: GetBuilder<PicksIndexController>(
          id: PicksIndexController.idGuessConfirmDialog,
          builder: (_) {
            return GetBuilder<LeagueController>(
                id: LeagueController.idGameGuessConfirmDialog,
                builder: (_) {
                  var guessPlayerList =
                      picksIndexController.getChoiceGuessPlayers();
                  var guessGameList = leagueController.getAllChoiceData();
                  List list = [...guessGameList, ...guessPlayerList];
                  modelCurrentIndex.value = 1;
                  var bottom = _buildBottom(context, list);
                  return Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(minHeight: 65.w),
                          ),
                        ),
                      ),
                      Container(
                          constraints: BoxConstraints(
                              minHeight: Utils.getDialogHeight()),
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(9.w))),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  12.vGap,
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.ccccccc,
                                        borderRadius:
                                            BorderRadius.circular(2.w)),
                                    height: 4.w,
                                    width: 44.w,
                                  ),
                                  13.vGap,
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Picks",
                                            style: 19.w5(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium),
                                          ),
                                          Obx(() {
                                            return AnimatedCrossFade(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                firstChild: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        //批量删除
                                                        Navigator.pop(context);
                                                        picksIndexController
                                                            .cleanAll();
                                                        leagueController
                                                            .cleanAll();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.w),
                                                        child: Text(
                                                          "Clear all",
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 16.w,
                                                            decorationColor:
                                                                AppColors
                                                                    .cCB1842,
                                                            color: AppColors
                                                                .cCB1842,
                                                            fontFamily: FontFamily
                                                                .fOswaldRegular,
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    30.hGap,
                                                    InkWell(
                                                      onTap: () =>
                                                          picksIndexController
                                                              .batchDeleteOpen
                                                              .value = false,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.w),
                                                        child: Text(
                                                          "Down",
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 16.w,
                                                            color: AppColors
                                                                .c000000,
                                                            fontFamily: FontFamily
                                                                .fOswaldRegular,
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                secondChild: InkWell(
                                                  onTap: () =>
                                                      picksIndexController
                                                          .batchDeleteOpen
                                                          .value = true,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.w),
                                                    child: Text(
                                                      "Edit",
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 16.w,
                                                        color:
                                                            AppColors.c000000,
                                                        fontFamily: FontFamily
                                                            .fOswaldRegular,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                crossFadeState:
                                                    picksIndexController
                                                            .batchDeleteOpen
                                                            .value
                                                        ? CrossFadeState
                                                            .showFirst
                                                        : CrossFadeState
                                                            .showSecond);
                                          })
                                        ],
                                      )),
                                  9.vGap,
                                ],
                              ),
                              const Divider(
                                color: AppColors.cE6E6E,
                                height: 1,
                              ),
                              SizedBox(
                                  height: min(
                                      queryData.size.height - 396.w - 84.w,
                                      list.length * 66.w),
                                  child: ListView.separated(
                                    itemCount: list.length,
                                    itemBuilder: (context, index) {
                                      var item = list[index];
                                      bool lastItem = index == list.length - 1;
                                      if (item is GameGuess) {
                                        var homeTeamInfo = Utils.getTeamInfo(
                                            item.scoresEntity.homeTeamId);
                                        var awayTeamInfo = Utils.getTeamInfo(
                                            item.scoresEntity.awayTeamId);
                                        return _ScoresItemWidget(
                                            item,
                                            lastItem,
                                            homeTeamInfo,
                                            awayTeamInfo,
                                            picksIndexController);
                                      }
                                      var player = list[index];
                                      int choice = player.status;
                                      return _PlayerItemWidget(
                                        index: index,
                                        choice: choice,
                                        player: player,
                                        picksIndexController:
                                            picksIndexController,
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 0.w,
                                      );
                                    },
                                  )),
                              bottom,
                            ],
                          )),
                    ],
                  );
                });
          }),
    );
  }

  Container buildContainer(
      bool lastItem, NbaTeamEntity homeTeamInfo, NbaTeamEntity awayTeamInfo) {
    return Container(
      height: 70.w,
      margin:
          EdgeInsets.only(left: 16.w, right: 16.w, bottom: lastItem ? 20.w : 0),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(16.w)),
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      alignment: FractionalOffset.centerLeft,
      child: Text(
        "${homeTeamInfo.shortEname} VS ${awayTeamInfo.shortEname}",
        style: 16.w5(color: AppColors.c000000),
      ),
    );
  }

  Widget _buildBottom(BuildContext context, List list) {
    return Obx(() {
      var json = picksIndexController.picksDefine.toJson();
      var key = "flexBet${list.length}";
      List<double> flexBet = [];
      if (json.containsKey(key)) {
        flexBet = json[key];
      }
      List<double> powerBet = picksIndexController.picksDefine.powerBetWin;
      var length = list.length;
      var powerIndex = length - 1;
      if (powerIndex < 0) {
        powerIndex = 0;
      }
      double maxBet = modelCurrentIndex.value == 0
          ? flexBet.isEmpty
              ? 0
              : flexBet[flexBet.length - 1]
          : powerBet[powerIndex];
      double maxWin =
          maxBet * double.parse(picksIndexController.picksDefine.betCost);
      return Container(
        color: AppColors.cFFFFFF,
        width: double.infinity,
        height: 336.w,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 30.w),
        child: Column(
          children: [
            MtInkwell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 61.w,
                margin: EdgeInsets.only(left: 5.w),
                child: Row(
                  children: [
                    Container(
                      height: 28.w,
                      width: 28.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.w),
                          border:
                              Border.all(color: AppColors.c666666, width: 1)),
                      child: IconWidget(
                        iconWidth: 16.w,
                        icon: Assets.commonUiCommonIconSystemAdd,
                        iconColor: AppColors.cFF7954,
                      ),
                    ),
                    14.hGap,
                    Text(
                      "Add stake to Combo",
                      style: 14.w5(
                          color: AppColors.cB3B3B3,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          if (flexBet.isEmpty) {
                            return;
                          }
                          modelCurrentIndex.value = 0;
                        },
                        child: Container(
                          height: 117.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(
                                  color: flexBet.isEmpty
                                      ? AppColors.cD9D9D9
                                      : modelCurrentIndex.value == 0
                                          ? AppColors.c10A86A
                                          : AppColors.c666666,
                                  width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 34.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Flex play",
                                      style: 14.w7(
                                          color: flexBet.isEmpty
                                              ? AppColors.cB3B3B3
                                              : AppColors.c262626,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                    flexBet.isEmpty
                                        ? IconWidget(
                                            iconWidth: 14.w,
                                            icon: Assets.iconUiIconLock,
                                            iconColor: AppColors.cB3B3B3,
                                          )
                                        : _buildSelect(
                                            modelCurrentIndex.value == 0),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.cE6E6E6,
                              ),
                              5.vGap,
                              if (flexBet.isEmpty)
                                Text(
                                  "Choose 3+ picks first.",
                                  style: 14.w5(
                                      color: AppColors.cB3B3B3,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                )
                              else
                                Expanded(
                                  child: MediaQuery.removePadding(
                                    removeTop: true,
                                    context: context,
                                    child: ListView.builder(
                                        itemCount: flexBet.length,
                                        itemBuilder: (context, index) {
                                          var num = list.length - index;
                                          var bet = flexBet[
                                              flexBet.length - 1 - index];
                                          return _buildBet(
                                              num.toString(), bet.toString());
                                        }),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  9.hGap,
                  Expanded(
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          modelCurrentIndex.value = 1;
                        },
                        child: Container(
                          height: 117.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(
                                  color: modelCurrentIndex.value == 1
                                      ? AppColors.c10A86A
                                      : AppColors.c666666,
                                  width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 34.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Power play",
                                      style: 14.w7(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                    _buildSelect(modelCurrentIndex.value == 1),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: AppColors.cE6E6E6,
                              ),
                              5.vGap,
                              Expanded(
                                child: Builder(builder: (context) {
                                  return powerIndex == -1
                                      ? const SizedBox.shrink()
                                      : Column(
                                          children: [
                                            _buildBet(
                                                length.toString(),
                                                powerBet[powerIndex]
                                                    .toString()),
                                          ],
                                        );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            9.vGap,
            Row(
              children: [
                Container(
                  width: 71.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: AppColors.cF2F2F2),
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Correct",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                      2.vGap,
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "${list.length}",
                          style: 18.w5(
                              color: AppColors.c262626,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                        TextSpan(
                            text: "/6",
                            style: 14.w4(
                                color: AppColors.c666666,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium))
                      ])),
                    ],
                  ),
                ),
                9.hGap,
                Expanded(
                    child: Container(
                  height: 44.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: AppColors.cF2F2F2),
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Amount",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                      2.vGap,
                      Row(
                        children: [
                          IconWidget(
                              iconWidth: 17.w,
                              icon: Assets.commonUiCommonIconCurrency02),
                          4.hGap,
                          Text(
                            Utils.formatChip(int.parse(
                                picksIndexController.picksDefine.betCost)),
                            style: 18.w5(
                                color: AppColors.c262626,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                9.hGap,
                Expanded(
                    child: Container(
                  height: 44.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: AppColors.cF2F2F2),
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Payout",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                      2.vGap,
                      Row(
                        children: [
                          IconWidget(
                              iconWidth: 17.w,
                              icon: Assets.commonUiCommonIconCurrency02),
                          4.hGap,
                          Text(
                            Utils.formatChip(maxWin),
                            style: 18.w5(
                                color: AppColors.c262626,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
            14.vGap,
            Builder(builder: (context) {
              var money = Get.find<HomeController>()
                      .userEntiry
                      .teamLoginInfo
                      ?.getMoney() ??
                  0;
              if (money <
                  double.parse(picksIndexController.picksDefine.betCost)) {
                return Container(
                  height: 51.w,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.cEEEEEE),
                  child: Text(
                    "NOT SUFFICIENT FUNDS",
                    style: 23.w5(
                        color: AppColors.ccccccc,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                );
              }
              return MtInkwell(
                onTap: () => picksIndexController
                    .guess(modelCurrentIndex.value == 0 ? 1 : 2, () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: AppColors.cTransparent,
                      context: context,
                      builder: (context) {
                        return const PickSuccessWidget();
                      });
                }),
                child: Container(
                  height: 51.w,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.c000000),
                  child: Text(
                    "CONFIRM",
                    style: 23.w5(
                        color: AppColors.cF2F2F2,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              );
            })
          ],
        ),
      );
    });
  }

  Widget _buildBet(String num, String bet) {
    return SizedBox(
      height: 22.w,
      child: Row(
        children: [
          6.hGap,
          Text(
            num,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.c282828,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          ),
          8.hGap,
          Expanded(
              child: Text(
            "correct",
            style: 12.w4(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          )),
          Container(
            height: 15.w,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.circular(4.w)),
            alignment: Alignment.center,
            child: Text(
              "${bet}x",
              style: 11.w5(
                  color: AppColors.cF2F2F2,
                  height: 1,
                  fontFamily: FontFamily.fOswaldMedium),
            ),
          ),
          4.hGap
        ],
      ),
    );
  }

  Container _buildSelect(bool select) {
    return Container(
      height: 15.w,
      width: 15.w,
      decoration: BoxDecoration(
          border: Border.all(
              color: select ? AppColors.c10A86A : AppColors.cB3B3B3,
              width: 1.5),
          borderRadius: BorderRadius.circular(8.w)),
      child: Visibility(
        visible: select,
        child: Center(
          child: Container(
            height: 9.w,
            width: 9.w,
            decoration: BoxDecoration(
                color: AppColors.c10A86A,
                borderRadius: BorderRadius.circular(5.w)),
          ),
        ),
      ),
    );
  }
}

class _ScoresItemWidget extends StatefulWidget {
  const _ScoresItemWidget(
    this.item,
    this.lastItem,
    this.homeTeamInfo,
    this.awayTeamInfo,
    this.picksIndexController, {
    super.key,
  });

  final GameGuess item;
  final bool lastItem;
  final NbaTeamEntity homeTeamInfo;
  final NbaTeamEntity awayTeamInfo;
  final PicksIndexController picksIndexController;

  @override
  State<_ScoresItemWidget> createState() => _ScoresItemWidgetState();
}

class _ScoresItemWidgetState extends State<_ScoresItemWidget>
    with SingleTickerProviderStateMixin {
  late PicksIndexController picksIndexController;

  @override
  void initState() {
    super.initState();
    picksIndexController = widget.picksIndexController;
    picksIndexController.batchDeleteOpen.listen(_listen);
  }

  void _listen(value) {
    if (!mounted) {
      return;
    }
    print('batchDeleteOpen--value:$value');
    if (value) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.w,
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cE6E6E, width: 1)),
      ),
      alignment: FractionalOffset.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageWidget(
                url: Utils.getTeamUrl(widget.item.choiceTeamId.value),
                width: 34.w,
              ),
              12.hGap,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Who do you support?",
                    style: 12.w4(
                        color: AppColors.c262626,
                        height: 1,
                        fontFamily: FontFamily.fOswaldRegular),
                  ),
                  6.vGap,
                  Text(
                    "${widget.homeTeamInfo.shortEname} @ ${widget.awayTeamInfo.shortEname}",
                    style: 14.w5(
                        color: AppColors.c262626,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ],
              ),
            ],
          ),
          Obx(() {
            var teamInfo =
                widget.item.choiceTeamId.value == widget.homeTeamInfo.id
                    ? widget.homeTeamInfo
                    : widget.awayTeamInfo;
            return ConfirmChangeBtn(
              "${teamInfo.shortEname} WIN",
              () {
                var change =
                    widget.item.choiceTeamId.value == widget.homeTeamInfo.id
                        ? widget.awayTeamInfo
                        : widget.homeTeamInfo;
                widget.item.choiceTeamId.value = change.id;
              },
              deleteTap: () {
                widget.item.choiceTeamId.value = 0;
                Get.find<LeagueController>().deleteOne();
              },
              picksIndexController: widget.picksIndexController,
            );
          }),
        ],
      ),
    );
  }
}

class _PlayerItemWidget extends StatefulWidget {
  const _PlayerItemWidget({
    required this.index,
    required this.player,
    required this.choice,
    required this.picksIndexController,
  });

  final int index;
  final PicksPlayerV2 player;
  final int choice;
  final PicksIndexController picksIndexController;

  @override
  State<_PlayerItemWidget> createState() => _PlayerItemWidgetState();
}

class _PlayerItemWidgetState extends State<_PlayerItemWidget>
    with SingleTickerProviderStateMixin {
  late PicksIndexController picksIndexController;

  @override
  void initState() {
    super.initState();
    picksIndexController = widget.picksIndexController;
    picksIndexController.batchDeleteOpen.listen(_listen);
  }

  void _listen(value) {
    if (!mounted) {
      return;
    }
    print('batchDeleteOpen--value:$value');
    if (value) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var player = widget.player;
    return Container(
      height: 66.w,
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cE6E6E, width: 1)),
      ),
      alignment: FractionalOffset.centerLeft,
      child: Row(
        children: [
          PlayerAvatarWidget(
            width: 37.w,
            playerId: player.baseInfoList.playerId,
            backgroundColor: AppColors.cFFFFFF,
            canTap: false,
          ),
          10.hGap,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      player.baseInfoList.ename,
                      style: 12.w4(
                          color: AppColors.c262626,
                          height: 1,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    9.hGap,
                    Text(
                      "${Utils.getTeamInfo(player.baseInfoList.teamId).shortEname} @ ${Utils.getTeamInfo(player.guessInfo.awayTeamId).shortEname}",
                      style: 10.w4(
                          color: AppColors.c808080,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular),
                    ),
                  ],
                ),
                6.vGap,
                Text(
                  "${player.guessInfo.guessReferenceValue[player.tabStr] ?? 0} ${player.tabStr.toUpperCase()} Made",
                  style: 14.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                )
              ],
            ),
          ),
          ConfirmChangeBtn(
            widget.choice == 0 ? "MORE" : "LESS",
            () {
              player.status = player.status == 0 ? 1 : 0;
              picksIndexController.choiceOne(needRefreshList: true);
            },
            deleteTap: () {
              player.status = -1;
              Get.find<PicksIndexController>().deleteChoice();
            },
            picksIndexController: widget.picksIndexController,
          )
        ],
      ),
    );
  }
}

class ConfirmChangeBtn extends StatelessWidget {
  const ConfirmChangeBtn(
    this.text,
    this.tap, {
    super.key,
    required this.deleteTap,
    required this.picksIndexController,
  });

  final String text;
  final GestureTapCallback tap;
  final PicksIndexController picksIndexController;
  final GestureTapCallback deleteTap;

  @override
  Widget build(BuildContext context) {
    return confirmChangeBtn(text, tap, deleteTap);
  }

  Widget confirmChangeBtn(
      String text, GestureTapCallback tap, GestureTapCallback deleteTap) {
    return Obx(() {
      var value = picksIndexController.batchDeleteOpen.value;
      return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: Row(
            children: [
              Container(
                width: 70.w,
                height: 28.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 11.w),
                decoration: BoxDecoration(
                    color: AppColors.cEEEEEE,
                    borderRadius: BorderRadius.circular(7.w)),
                child: Text(
                  text,
                  style: 14.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
              8.hGap,
              MtInkwell(
                onTap: deleteTap,
                child: Container(
                  height: 28.w,
                  width: 28.w,
                  decoration: BoxDecoration(
                      color: AppColors.cD60D20,
                      borderRadius: BorderRadius.circular(7.w)),
                  child: IconWidget(
                      iconWidth: 12.w, icon: Assets.iconUiIconDelete02),
                ),
              )
            ],
          ),
          secondChild: Container(
            width: 107.w,
            height: 28.w,
            padding: EdgeInsets.only(left: 11.w),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.c666666, width: 1),
                borderRadius: BorderRadius.circular(7.w)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: 14.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  MtInkwell(
                    onTap: tap,
                    child: Container(
                      height: 28.w,
                      width: 28.w,
                      margin: EdgeInsets.only(right: 2.w),
                      child: Center(
                        child: IconWidget(
                          iconWidth: 13.w,
                          icon: Assets.commonUiCommonIconSystemExchange,
                          iconColor: AppColors.cFF7954,
                          rotateAngle: 90,
                        ),
                      ),
                    ),
                  )
                ]),
          ),
          crossFadeState:
              value ? CrossFadeState.showFirst : CrossFadeState.showSecond);
    });
  }
}
