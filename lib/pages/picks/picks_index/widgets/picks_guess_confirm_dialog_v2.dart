import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/guess_data.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/getsure_recognizer/custom_drag_gesture_recognizer.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

  double maxHeight = 750.h,
      minHeight = 620.h;
  double height = 620.h;

  ScrollController scrollController = ScrollController();
  Function? listener;

  // 开始滑动时候滚动位置的缓存
  double startPixels = 0;

  double startY = 0;

  var offsetY = 0.0.obs;

  late PicksIndexController picksIndexController;
  late LeagueController leagueController;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (listener == null) {
        scrollController.position.isScrollingNotifier
            .addListener(listener = () {
          print(
              'scrollController.position.isScrollingNotifier.value:${scrollController
                  .position.isScrollingNotifier.value}');
          if (scrollController.position.isScrollingNotifier.value) {
            startPixels = scrollController.position.pixels;
          } else {
            startPixels = 0;
          }
          if ((startPixels == scrollController.position.minScrollExtent &&
              height == maxHeight)) {}
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    picksIndexController = Get.find();
    leagueController = Get.find();
    var queryData = MediaQuery.of(context);
    maxHeight = min(
        maxHeight,
        queryData.size.height -
            queryData.padding.top -
            queryData.padding.bottom);
    onVerticalDragDown(DragDownDetails details) {
      print('onVerticalDragDown----------1111111');

      startY = details.localPosition.dy;
    }

    onVerticalDragStart(detail) {
      print('onVerticalDragStart----------1111111');
      startY = detail.localPosition.dy;
    }

    onVerticalDragUpdate(detail) {
      print('onVerticalDragUpdate----------1111111');

      print('---------:${offsetY.value}');
      print('height:$height , $maxHeight');
      print(
          'startPixels: $startPixels , ${scrollController.position
              .minScrollExtent}');
      if (height >= maxHeight &&
          startPixels != scrollController.position.minScrollExtent) {
        return;
      }
      offsetY.value = startY - detail.localPosition.dy;
    }

    onVerticalDragCancel() {
      print('onVerticalDragCancel----------1111111');

      var _height = offsetY.value + height;
      height = _height < minHeight
          ? minHeight
          : _height > maxHeight
          ? maxHeight
          : _height;
    }

    onVerticalDragEnd(detail) {
      print('onVerticalDragEnd----------1111111');

      var _height = offsetY.value + height;
      height = _height < minHeight
          ? minHeight
          : _height > maxHeight
          ? maxHeight
          : _height;
    }

    return SizedBox(
      width: double.infinity,
      height: queryData.size.height,
      child: GetBuilder<PicksIndexController>(
          id: PicksIndexController.idGuessConfirmDialog,
          builder: (_) {
        return GetBuilder<LeagueController>(
          id: LeagueController.idGameGuessConfirmDialog,
            builder: (_) {
              var guessPlayerList = picksIndexController
                  .getChoiceGuessPlayers();
              var guessGameList = leagueController.getAllChoiceData();
              List list = [...guessGameList, ...guessPlayerList];
              modelCurrentIndex.value = 1;
              var bottom = _buildBottom(context, list);
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              color: AppColors.cTransparent,
                            ),
                          )),
                      RawGestureDetector(
                        gestures: {
                          CustomDragGestureRecognizer:
                          GestureRecognizerFactoryWithHandlers<
                              CustomDragGestureRecognizer>(
                                () => CustomDragGestureRecognizer(),
                                (DragGestureRecognizer detector) {
                              detector
                                ..onDown = onVerticalDragDown
                                ..onStart = onVerticalDragStart
                                ..onUpdate = onVerticalDragUpdate
                                ..onEnd = onVerticalDragEnd
                                ..onCancel = onVerticalDragCancel();
                            },
                          )
                        },
                        child: Obx(() {
                          var h = height + offsetY.value;
                          h = min(h, maxHeight);
                          h = max(h, minHeight);

                          return SizedBox(
                            height: h,
                            child: DialogBackground(
                                frontColor: AppColors.cE6E6E6,
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
                                          width: 64.w,
                                        ),
                                        24.vGap,
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Picks Line Up",
                                                  style: 16.w7(
                                                      color: AppColors.c262626,
                                                      height: 1),
                                                ),
                                              ],
                                            )),
                                        14.vGap,
                                      ],
                                    ),
                                    Expanded(
                                        child: ListView.separated(
                                          itemCount: list.length,
                                          controller: scrollController,
                                          physics: OneBoundaryScrollPhysics(
                                              scrollController: scrollController),
                                          itemBuilder: (context, index) {
                                            var item = list[index];
                                            bool lastItem = index ==
                                                list.length - 1;
                                            if (item is GameGuess) {
                                              var homeTeamInfo = Utils
                                                  .getTeamInfo(
                                                  item.scoresEntity.homeTeamId);
                                              var awayTeamInfo = Utils
                                                  .getTeamInfo(
                                                  item.scoresEntity.awayTeamId);
                                              return _ScoresItemWidget(
                                                  item, lastItem,
                                                  homeTeamInfo, awayTeamInfo,
                                                  picksIndexController);
                                            }
                                            var player = list[index];
                                            int choice = player.status;
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  bottom: lastItem ? 20.w : 0),
                                              child: _PlayerItemWidget(
                                                index: index,
                                                choice: choice,
                                                player: player,
                                                picksIndexController:
                                                picksIndexController,
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                              int index) {
                                            return SizedBox(
                                              height: 9.w,
                                            );
                                          },
                                        )),
                                    bottom,
                                  ],
                                )),
                          );
                        }),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: bottom,
                  )
                ],
              );
            });
      }),
    );
  }

  Container buildContainer(bool lastItem, NbaTeamEntity homeTeamInfo,
      NbaTeamEntity awayTeamInfo) {
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
        color: AppColors.cF2F2F2,
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding:
        EdgeInsets.only(left: 16.w, right: 16.w, top: 13.w, bottom: 31.w),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (flexBet.isNotEmpty)
                    Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            modelCurrentIndex.value = 0;
                          },
                          child: Container(
                            height: 167.w,
                            constraints: BoxConstraints(maxWidth: 250.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 14.w),
                            decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(16.w),
                                border: Border.all(
                                    color: modelCurrentIndex.value == 0
                                        ? AppColors.c10A86A
                                        : AppColors.cTransparent,
                                    width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Flex play",
                                      style: 14.w7(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                    _buildSelect(modelCurrentIndex.value == 0),
                                  ],
                                ),
                                6.vGap,
                                const Divider(
                                  height: 1,
                                  color: AppColors.cE6E6E6,
                                ),
                                5.vGap,
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: flexBet.length,
                                      itemBuilder: (context, index) {
                                        var num = list.length - index;
                                        var bet =
                                        flexBet[flexBet.length - 1 - index];
                                        return _buildbet(
                                            num.toString(), bet.toString());
                                      }),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 11.w),
                                    child: Text(
                                      "Hit 3out of 5 in the lineup",
                                      style: 10.w4(
                                          color: AppColors.cB3B3B3, height: 1),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (flexBet.isNotEmpty && powerIndex != -1) 9.hGap,
                  if (powerIndex != -1)
                    Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            modelCurrentIndex.value = 1;
                          },
                          child: Container(
                            height: 167.w,
                            constraints: BoxConstraints(maxWidth: 250.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 14.w),
                            decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(16.w),
                                border: Border.all(
                                    color: modelCurrentIndex.value == 1
                                        ? AppColors.c10A86A
                                        : AppColors.cTransparent,
                                    width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
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
                                6.vGap,
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
                                        _buildbet(
                                            length.toString(),
                                            powerBet[powerIndex]
                                                .toString()),
                                      ],
                                    );
                                  }),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 11.w),
                                    child: Text(
                                      "Hit 3out of 5 in the lineup",
                                      style: 10.w4(
                                          color: AppColors.cB3B3B3, height: 1),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            10.vGap,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "${list.length}",
                          style: 18.w7(color: AppColors.c262626, height: 1),
                        ),
                        TextSpan(
                            text: "/6",
                            style: 14.w4(color: AppColors.c666666, height: 1))
                      ])),
                      2.vGap,
                      Text(
                        "Picks",
                        style: 10.w4(color: AppColors.c666666, height: 1),
                      )
                    ],
                  ),
                  25.hGap,
                  Flexible(
                    child: Container(
                      height: 40.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.cDCDCDC,
                          borderRadius: BorderRadius.circular(4.w)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Utils.formatChip(maxWin),
                            style: 18.w7(color: AppColors.c262626, height: 1),
                          ),
                          Text(
                            "To win",
                            style: 10.w4(color: AppColors.c666666, height: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (picksIndexController.guessWinningStreak > 0)
                    Flexible(
                        child: Container(
                          height: 40.w,
                          margin: EdgeInsets.only(left: 9.w),
                          padding: EdgeInsets.only(right: 6.w, top: 8.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.c10A86A,
                              borderRadius: BorderRadius.circular(4.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${picksIndexController
                                            .guessWinningStreak}",
                                        style: 18.w7(
                                            color: AppColors.cF1F1F1,
                                            height: 1),
                                      ),
                                      Text(
                                        "Streak",
                                        style: 10.w4(
                                            color: AppColors.cF1F1F1,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.formatChip(
                                        picksIndexController.streakReward),
                                    style:
                                    18.w7(color: AppColors.cF1F1F1, height: 1),
                                  ),
                                  Text(
                                    "streak bonus",
                                    style:
                                    10.w4(color: AppColors.cF1F1F1, height: 1),
                                  )
                                ],
                              ),
                              Container(
                                  width: 8.w,
                                  height: 8.w,
                                  margin: EdgeInsets.only(left: 2.w),
                                  child: Center(
                                      child: IconWidget(
                                          iconWidth: 8.w,
                                          icon: Assets.iconUiIconDetails)))
                            ],
                          ),
                        )),
                ],
              ),
            ),
            8.vGap,
            const Divider(
              color: AppColors.c666666,
              height: 1,
            ),
            17.vGap,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Obx(() {
                var value = picksIndexController.batchDeleteOpen.value;
                if (value) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () =>
                        picksIndexController.batchDeleteOpen.value = false,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.c262626,
                              borderRadius: BorderRadius.circular(22.w)),
                          height: 44.w,
                          width: 69.w,
                          child: IconWidget(
                            iconWidth: 18.w,
                            icon: Assets.iconIconClose,
                            iconColor: AppColors.cE72646,
                          ),
                        ),
                      ),
                      12.hGap,
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            //批量删除
                            Navigator.pop(context);
                            picksIndexController.cleanAll();
                            leagueController.cleanAll();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.circular(22.w)),
                            height: 44.w,
                            width: 69.w,
                            child: Center(
                              child: Text(
                                "CLEAN ALL",
                                style:
                                21.w7(color: AppColors.cF2F2F2, height: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print('batchDeleteOpen---');
                          picksIndexController.batchDeleteOpen.value = true;
                        },
                        child: Container(
                          height: 44.w,
                          width: 44.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.w),
                              border: Border.all(
                                  color: AppColors.cB3B3B3, width: 1)),
                          child: IconWidget(
                            iconWidth: 16.w,
                            icon: Assets.iconUiIconDelete02, // 批量删除
                            iconColor: AppColors.c262626,
                          ),
                        ),
                      ),
                      12.hGap,
                      Flexible(
                        child: SizedBox(
                          height: 44.w,
                          child: Builder(builder: (context) {
                            var money = Get
                                .find<HomeController>()
                                .userEntiry
                                .teamLoginInfo
                                ?.getMoney() ??
                                0;
                            if (money <
                                double.parse(
                                    picksIndexController.picksDefine.betCost)) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: AppColors.ccccccc,
                                    borderRadius: BorderRadius.circular(22.w)),
                                alignment: Alignment.center,
                                child: Text(
                                  "NOT SUFFICIENT FUNDS",
                                  style: 18.w7(color: AppColors.cF2F2F2),
                                ),
                              );
                            }
                            return InkWell(
                              onTap: () {
                                picksIndexController.guess(
                                    modelCurrentIndex.value == 0 ? 1 : 2);
                              },
                              child: BtnBackground(
                                child: SizedBox(
                                  height: 44.w,
                                  width: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              IconWidget(
                                                  iconWidth: 19.w,
                                                  icon: Assets.iconProp102),
                                              5.hGap,
                                              Text(
                                                picksIndexController
                                                    .picksDefine.betCost,
                                                style: 21.w7(
                                                    color: AppColors.cF2F2F2,
                                                    height: 1),
                                              ),
                                            ],
                                          ),
                                          2.vGap,
                                          Text(
                                            "CONFIRM",
                                            style: 10.w4(
                                                color: AppColors.cF2F2F2,
                                                height: 1),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                          left: 9.w,
                                          child: Stack(
                                            children: [
                                              IconWidget(
                                                  iconWidth: 26.w,
                                                  icon: Assets.iconUiIconRing),
                                              Positioned(
                                                  left: 7.w,
                                                  top: 5.5.w,
                                                  child: IconWidget(
                                                    iconWidth: 17.w,
                                                    icon: Assets
                                                        .iconUiIconConfirm,
                                                    iconColor:
                                                    AppColors.c31E99E,
                                                  ))
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  );
                }
              }),
            )
          ],
        ),
      );
    });
  }

  Widget _buildbet(String num, String bet) {
    return Container(
      height: 30.w,
      child: Row(
        children: [
          11.hGap,
          Text(
            num,
            style: 16.w7(color: AppColors.c282828, height: 1),
          ),
          8.hGap,
          Expanded(
              child: Text(
                "correct",
                style: 12.w4(color: AppColors.c666666),
              )),
          Container(
            height: 15.w,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.circular(5.w)),
            alignment: Alignment.center,
            child: Text(
              "${bet}x",
              style: 11.w4(color: AppColors.cF2F2F2, height: 1),
            ),
          ),
          11.hGap
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
  const _ScoresItemWidget(this.item,
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
  late SlidableController slidAbleController;

  late PicksIndexController picksIndexController;

  @override
  void initState() {
    super.initState();
    picksIndexController = widget.picksIndexController;
    slidAbleController = SlidableController(this);
    picksIndexController.batchDeleteOpen.listen(_listen);
  }

  void _listen(value) {
    if (!mounted) {
      return;
    }
    print('batchDeleteOpen--value:$value');
    if (value) {
      slidAbleController.openEndActionPane();
    } else {
      slidAbleController.close();
    }
  }

  @override
  void dispose() {
    slidAbleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.lastItem ? 20.w : 0),
      child: Slidable(
        controller: slidAbleController,
        key: ValueKey("${widget.item.scoresEntity.gameId}"),
        endActionPane: ActionPane(
            extentRatio: 64 / 375,
            motion: const ScrollMotion(),
            children: [
              InkWell(
                onTap: () async {
                  if (!Get
                      .find<PicksIndexController>()
                      .batchDeleteOpen
                      .value) {
                    await slidAbleController.close();
                  }
                  widget.item.choiceTeamId.value = 0;
                  Get.find<LeagueController>().deleteOne();
                },
                child: Container(
                  width: 64.w,
                  height: 70.w,
                  decoration: BoxDecoration(
                      color: AppColors.cF2F2F2,
                      borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(16.w))),
                  child: IconWidget(
                    iconWidth: 23.w,
                    icon: Assets.iconUiIconDelete02, //右滑删除按钮
                    iconColor: AppColors.c333333,
                  ),
                ),
              )
            ]),
        child: Container(
          height: 70.w,
          margin: EdgeInsets.only(
              left: 16.w, right: 16.w,),
          decoration: BoxDecoration(
              color: AppColors.cF2F2F2,
              borderRadius: BorderRadius.circular(16.w)),
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          alignment: FractionalOffset.centerLeft,
          child: Text(
            "${widget.homeTeamInfo.shortEname} VS ${widget.awayTeamInfo
                .shortEname}",
            style: 16.w5(color: AppColors.c000000),
          ),
        ),
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
  late SlidableController slidAbleController;

  late PicksIndexController picksIndexController;

  @override
  void initState() {
    super.initState();
    picksIndexController = widget.picksIndexController;
    slidAbleController = SlidableController(this);
    picksIndexController.batchDeleteOpen.listen(_listen);
  }

  void _listen(value) {
    if (!mounted) {
      return;
    }
    print('batchDeleteOpen--value:$value');
    if (value) {
      slidAbleController.openEndActionPane();
    } else {
      slidAbleController.close();
    }
  }

  @override
  void dispose() {
    slidAbleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var index = widget.index;
    var player = widget.player;
    var currentIndex = widget.choice;
    return Slidable(
      controller: slidAbleController,
      key: ValueKey("$index"),
      endActionPane: ActionPane(
          extentRatio: 64 / 375,
          motion: const ScrollMotion(),
          children: [
            InkWell(
              onTap: () async {
                if (!Get
                    .find<PicksIndexController>()
                    .batchDeleteOpen
                    .value) {
                  await slidAbleController.close();
                }
                player.status = -1;
                Get.find<PicksIndexController>().deleteChoice();
              },
              child: Container(
                width: 64.w,
                height: 70.w,
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(16.w))),
                child: IconWidget(
                  iconWidth: 23.w,
                  icon: Assets.iconUiIconDelete02, //右滑删除按钮
                  iconColor: AppColors.c333333,
                ),
              ),
            )
          ]),
      child: Container(
        height: 70.w,
        margin: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        decoration: BoxDecoration(
            color: AppColors.cF2F2F2,
            borderRadius: BorderRadius.circular(16.w)),
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        child: Row(
          children: [
            PlayerAvatarWidget(
              width: 42.w,
              playerId: player.baseInfoList.playerId,
            ),
            4.hGap,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.baseInfoList.ename,
                    style: 12.w4(
                        color: AppColors.c262626,
                        height: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  6.vGap,
                  Text(
                    "VS ${player.awayTeamInfo?.shortEname} ${MyDateUtils
                        .formatHM_AM(MyDateUtils.getDateTimeByMs(
                        player.guessInfo.gameStartTime))}",
                    style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                  )
                ],
              ),
            ),
            9.hGap,
            Container(
              width: 61.w,
              height: 46.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(width: 1, color: AppColors.ccccccc)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${player.guessInfo.guessReferenceValue[player.tabStr] ??
                        0}",
                    style: 18.w7(color: AppColors.c262626, height: 1),
                  ),
                  5.vGap,
                  Text(
                    player.tabStr.toUpperCase(),
                    style: 10.w7(color: AppColors.cB3B3B3, height: 1),
                  )
                ],
              ),
            ),
            11.hGap,
            Container(
              height: 46.w,
              width: 110.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.cFF7954),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                children: [
                  Flexible(
                      child: InkWell(
                        onTap: () {
                          player.status = 0;
                          picksIndexController.choiceOne(needRefreshList: true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentIndex == 0
                                  ? AppColors.cFF7954
                                  : AppColors.cTransparent,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(7.w))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 15.w,
                                icon: Assets.iconUiIconUp,
                                iconColor: currentIndex == 0
                                    ? AppColors.cF2F2F2
                                    : AppColors.cFF7954,
                              ),
                              5.vGap,
                              Text(
                                "MORE",
                                style: 12.w7(
                                    color: currentIndex == 0
                                        ? AppColors.cF2F2F2
                                        : AppColors.cFF7954,
                                    height: 1),
                              )
                            ],
                          ),
                        ),
                      )),
                  Divider(
                    height: 46.w,
                    color: AppColors.cFF7954,
                  ),
                  Flexible(
                      child: InkWell(
                        onTap: () {
                          player.status = 1;
                          picksIndexController.choiceOne(needRefreshList: true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentIndex == 1
                                  ? AppColors.cFF7954
                                  : AppColors.cTransparent,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(7.w))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 15.w,
                                icon: Assets.iconUiIconUp,
                                iconColor: currentIndex == 1
                                    ? AppColors.cF2F2F2
                                    : AppColors.cFF7954,
                                rotateAngle: 180,
                              ),
                              5.vGap,
                              Text(
                                "LESS",
                                style: 12.w7(
                                    color: currentIndex == 1
                                        ? AppColors.cF2F2F2
                                        : AppColors.cFF7954,
                                    height: 1),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
