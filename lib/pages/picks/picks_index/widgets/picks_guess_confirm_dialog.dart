import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/9/19:29

class PicksGuessConfirmDialog extends StatefulWidget {
  const PicksGuessConfirmDialog({super.key});

  @override
  State<PicksGuessConfirmDialog> createState() =>
      _PicksGuessConfirmDialogState();
}

class _PicksGuessConfirmDialogState extends State<PicksGuessConfirmDialog>
    with TickerProviderStateMixin {
  var pageController = PageController();

  var slideDeleteX = 0.0.obs;

  double startX = 0;

  late AnimationController animationController;
  late Animation<double> animation;

  late Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    tween = Tween(begin: 1.0, end: 0);
    animation = tween.animate(animationController)
      ..addListener(_animationListener);
    Get.find<PicksIndexController>()
        .batchDeleteOpen.value = false;
  }

  _onRelease(double begin) {
    if (begin == (260.w - 44.w)) {
      Get.find<PicksIndexController>().deleteAll();
      Get.find<PicksIndexController>()
          .batchDeleteOpen
          .value = false;
      return;
    }
    tween.begin = begin;
    animationController.reset();
    animationController.forward();
  }

  _animationListener() {
    slideDeleteX.value = animation.value;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 675.h,
      child: Stack(
        children: [
          Container(
            height: 42.w,
            decoration: BoxDecoration(
                color: AppColors.cFF7954,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22.w),
                    topLeft: Radius.circular(22.w))),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 2.w),
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22.w),
                    topLeft: Radius.circular(22.w))),
            child: Column(
              children: [
                8.vGap,
                Container(
                  width: 64.w,
                  height: 4.w,
                  decoration: BoxDecoration(
                      color: AppColors.c666666,
                      borderRadius: BorderRadius.circular(2.w)),
                ),
                20.vGap,
                Text(
                  "PICKS CONFIRMATION",
                  style: 14.w7(color: AppColors.cD9D9D9),
                ),
                18.vGap,
                GetBuilder<PicksIndexController>(
                    id: PicksIndexController.idGuessList,
                    builder: (controller) {
                      return Expanded(
                          child: controller.choiceData.isEmpty
                              ? Center(
                                  child: LoadStatusWidget(
                                    text: LoadDataStatus.noData.desc,
                                  ),
                                )
                              : ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.choiceData.length,
                                  itemBuilder: (context, index) {
                                    var key = controller.choiceData.keys
                                        .toList()[index];
                                    double value = controller.choiceData[key]!;
                                    var player = controller.picksPlayers[key];
                                    return _buildSlidable(
                                        index, player, key, value);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      height: 9.w,
                                      color: AppColors.cTransparent,
                                    );
                                  },
                                ));
                    }),
                Obx(() {
                  PicksIndexController controller = Get.find();
                  HomeController homeController = Get.find();
                  bool btnActive = (homeController
                              .userEntiry.teamLoginInfo?.teamPropList
                              ?.firstWhere((e) => e.propId == 5)
                              .num ??
                          0) >=
                      controller.costCount.value;
                  if(controller.choiceData.isEmpty) {
                    btnActive = false;
                  }
                  return Container(
                    height: 165.w,
                    color: AppColors.c404040,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15.w, right: 18.w),
                          height: 59.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  10.hGap,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.choiceData.length}",
                                        style: 21.w7(
                                            color: AppColors.cB3B3B3,
                                            height: 1),
                                      ),
                                      Text(
                                        "CORRECT",
                                        style: 10.w4(color: AppColors.cB3B3B3),
                                      )
                                    ],
                                  ),
                                  15.hGap,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.betCount.value}x",
                                        style: 21.w7(
                                            color: AppColors.cB3B3B3,
                                            height: 1),
                                      ),
                                      Text(
                                        "ODDS",
                                        style: 10.w4(color: AppColors.cB3B3B3),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 19.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.costCount.value}",
                                      style: 21.w7(
                                          color: AppColors.cF2F2F2, height: 1),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Anticipated income",
                                          style:
                                              10.w4(color: AppColors.cB3B3B3),
                                        ),
                                        4.hGap,
                                        IconWidget(
                                          iconWidth: 9.w,
                                          icon: Assets.uiIconJettonPng,
                                          iconColor: AppColors.cB3B3B3,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.w, right: 18.w),
                          child: const Divider(
                            color: AppColors.c666666,
                            height: 1,
                          ),
                        ),
                        22.vGap,
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 8.w, right: 5.w),
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 18.w),
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.find<PicksIndexController>()
                                            .batchDeleteOpen
                                            .value = true;
                                        pageController.animateToPage(1,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Container(
                                        height: 44.w,
                                        width: 44.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.c666666,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(22.w),
                                        ),
                                        child: IconWidget(
                                          iconWidth: 16.w,
                                          icon: Assets.uiIconDelete_02Png,
                                          iconColor: AppColors.cB3B3B3,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Get.find<PicksIndexController>().guess(inDialog: true);
                                      },
                                      child: Container(
                                        width: 263.w,
                                        height: 44.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: btnActive
                                                ? AppColors.cFFFFFF
                                                : AppColors.c666666,
                                            borderRadius:
                                                BorderRadius.circular(22.w)),
                                        child: Text(
                                          btnActive
                                              ? "CONFIRM"
                                              : "NOT SUFFICIENT FUNDS",
                                          style: 18.w7(
                                              color: btnActive
                                                  ? AppColors.c000000
                                                  : AppColors.cB3B3B3),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8.w, right: 5.w),
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 18.w),
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 44.w,
                                          width: 260.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.c666666,
                                              borderRadius:
                                                  BorderRadius.circular(22.w)),
                                        ),
                                        Positioned(
                                            left: 60.w,
                                            child: Text(
                                              "CLEAR ALL",
                                              style: 16
                                                  .w4(color: AppColors.cB3B3B3),
                                            )),
                                        Positioned(
                                            right: 15.w,
                                            child: Row(
                                              children: [
                                                IconWidget(
                                                  iconWidth: 8.w,
                                                  icon:
                                                      Assets.uiIconArrows_01Png,
                                                  iconColor: AppColors.cF2F2F2
                                                      .withOpacity(.2),
                                                ),
                                                IconWidget(
                                                  iconWidth: 8.w,
                                                  icon:
                                                      Assets.uiIconArrows_01Png,
                                                  iconColor: AppColors.cF2F2F2
                                                      .withOpacity(.5),
                                                ),
                                                IconWidget(
                                                    iconWidth: 8.w,
                                                    icon: Assets
                                                        .uiIconArrows_01Png),
                                              ],
                                            )),
                                        Positioned(
                                            left: slideDeleteX.value,
                                            child: GestureDetector(
                                              onHorizontalDragStart: (detail) {
                                                startX =
                                                    detail.localPosition.dx;
                                              },
                                              onHorizontalDragUpdate: (detail) {
                                                var diffX =
                                                    detail.localPosition.dx -
                                                        startX;
                                                slideDeleteX.value =
                                                    diffX > (260.w - 44.w)
                                                        ? 260.w - 44.w
                                                        : diffX;
                                              },
                                              onHorizontalDragCancel: () {
                                                _onRelease(slideDeleteX.value);
                                              },
                                              onHorizontalDragDown: (detail) {
                                                startX =
                                                    detail.localPosition.dx;
                                              },
                                              onHorizontalDragEnd: (detail) {
                                                _onRelease(slideDeleteX.value);
                                              },
                                              child: Container(
                                                height: 44.w,
                                                width: 44.w,
                                                decoration: BoxDecoration(
                                                    color: AppColors.cFFFFFF,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22.w)),
                                                child: IconWidget(
                                                  iconWidth: 16.w,
                                                  icon:
                                                      Assets.uiIconDelete_01Png,
                                                  iconColor: AppColors.c333333,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.find<PicksIndexController>()
                                            .batchDeleteOpen
                                            .value = false;
                                        pageController.animateToPage(0,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Container(
                                        height: 44.w,
                                        width: 44.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.c666666,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(22.w)),
                                        child: IconWidget(
                                            iconWidth: 18.w,
                                            icon: Assets.uiIconRuidgtPng),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlidable(int index, PicksPlayer player, int key, double value) {
    return _Item(
        itemIndex: index, player: player, parentIndex: key, value: value);
  }
}

class _Item extends StatefulWidget {
  _Item(
      {required this.itemIndex,
      required this.player,
      required this.parentIndex,
      required this.value});

  final int itemIndex; //在列表的下标
  final PicksPlayer player;
  final int parentIndex; //在PicksIndexController中picksPlayers的下标
  final double value;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> with TickerProviderStateMixin {
  late int itemIndex; //在列表的下标
  late PicksPlayer player;
  late int parentIndex; //在PicksIndexController中picksPlayers的下标
  late double value;

  /// 整数位代表选中的tab下标，小数位代表选择的more(1)/less(2)
  late RxDouble gameChoiceFlag;

  late SlidableController slidableController;

  @override
  void initState() {
    super.initState();
    slidableController = SlidableController(this);
    Get.find<PicksIndexController>()
        .batchDeleteOpen
        .listen((value){
      print('---------aa-----dd------');
      if (value) {
        slidableController.openEndActionPane();
      } else {
        slidableController.close();
      }
    });
  }

  @override
  void dispose() {
    slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    itemIndex = widget.itemIndex;
    player = widget.player;
    parentIndex = widget.parentIndex;
    value = widget.value;
    gameChoiceFlag = RxDouble(value);

    var index = int.parse(value.toString().split(".")[0]);
    var child = Container(
        height: 82.w,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColors.c333333,
            borderRadius: BorderRadius.circular(16.w)),
        child: Container(
          margin: EdgeInsets.only(left: 13.w, right: 11.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PlayerAvatarWidget(
                playerBaseInfo: player.baseInfoList,
                width: 55.w,
                backgroundColor: AppColors.c666666,
                showGrade: false,
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 89.w),
                  margin: EdgeInsets.only(left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        player.baseInfoList.ename,
                        style: 13.w4(
                            color: AppColors.cE6E6E6,
                            height: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      2.vGap,
                      Text(
                        "VS ${player.awayTeamInfo.shortEname}   ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(player.guessInfo.gameStartTime))}",
                        style: 10.w4(
                            color: AppColors.cB3B3B3,
                            height: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      8.vGap,
                      Text(
                        "PPG: ${double.parse(((player.dataAvgList.toJson()[ParamUtils.getProKey(player.betData[index].toLowerCase())]) ?? 0).toString()).toStringAsFixed(1)}P",
                        style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                      ),
                      Text(
                        "L5: ${double.parse(((player.guessInfo.l5Avg.toJson()[ParamUtils.getProKey(player.betData[index].toLowerCase())]) ?? 0).toString()).toStringAsFixed(1)}P",
                        style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 62.w,
                height: 55.w,
                margin: EdgeInsets.only(left: 9.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.w),
                    border: Border.all(color: AppColors.c404040, width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        double.parse(((player.guessInfo.guessReferenceValue
                                        .getValue(player.betData[index])) ??
                                    0)
                                .toString())
                            .toStringAsFixed(0),
                        style: 18.w7(color: AppColors.cD9D9D9)),
                    Text(
                      player.betData[index],
                      style:
                          TextStyle(fontSize: 11.sp, color: AppColors.cD9D9D9),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 11.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBtn(index, "MORE", "1", player),
                    7.vGap,
                    _buildBtn(index, "LESS", "2", player)
                  ],
                ),
              )
            ],
          ),
        ));
    return Slidable(
        controller: slidableController,
        key: ValueKey("$itemIndex"),
        endActionPane: ActionPane(
            extentRatio: 64 / 375,
            motion: const ScrollMotion(),
            children: [
              InkWell(
                onTap: () async {
                  if(!Get.find<PicksIndexController>()
                      .batchDeleteOpen.value) {
                    await slidableController.close();
                  }
                  Get.find<PicksIndexController>().deleteOne(parentIndex);
                },
                child: Container(
                  width: 64.w,
                  height: 81.w,
                  decoration: BoxDecoration(
                      color: AppColors.c333333,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(16.w))),
                  child: IconWidget(
                    iconWidth: 23.w,
                    icon: Assets.uiIconDelete_02Png,
                    iconColor: AppColors.cEF4040,
                  ),
                ),
              )
            ]),
        child: child);
  }

  Widget _buildBtn(int index, String text, String ml, PicksPlayer player) {
    var gdIsEmpty = player.guessInfo.guessData.isEmpty;
    var isChoice = gdIsEmpty
        ? false
        : player.guessInfo.guessData[0].guessChoice == int.parse(ml) &&
            player.guessInfo.guessData[0].guessAttr.toLowerCase() ==
                ParamUtils.getProKey(player.betData[index].toLowerCase())
                    .toLowerCase();
    return Obx(() {
      return InkWell(
        onTap: () {
          if (!gdIsEmpty) {
            return;
          }
          var choice = double.parse("$index.$ml");
          if (gameChoiceFlag.value == choice) {
            // gameChoiceFlag.value = -1.0;
          } else {
            gameChoiceFlag.value = choice;
          }
          Get.find<PicksIndexController>()
              .choiceOne(parentIndex, choice, needRefreshList: true);
        },
        child: Container(
          height: 24.w,
          width: 83.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: gdIsEmpty
                  ? gameChoiceFlag.value == double.parse("$index.$ml")
                      ? AppColors.cFF7954
                      : AppColors.cFFFFFF.withOpacity(0)
                  : isChoice
                      ? AppColors.cFFFFFF.withOpacity(0)
                      : AppColors.cF2F2F2,
              border: Border.all(
                  width: 1,
                  color: gdIsEmpty
                      ? gameChoiceFlag.value == double.parse("$index.$ml")
                          ? AppColors.cFF7954
                          : AppColors.cE6E6E6
                      : isChoice
                          ? AppColors.c10A86A
                          : AppColors.cB3B3B3),
              borderRadius: BorderRadius.circular(12.w)),
          child: Text.rich(
              textAlign: TextAlign.start,
              style: TextStyle(
                color: gdIsEmpty
                    ? gameChoiceFlag.value == double.parse("$index.$ml")
                        ? AppColors.cFFFFFF
                        : AppColors.cE6E6E6
                    : isChoice
                        ? AppColors.c10A86A
                        : AppColors.cB3B3B3,
              ),
              TextSpan(children: [
                TextSpan(
                    text: text,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        "   +${gameChoiceFlag.value != 100 ? player.betOdds : ''}",

                    /// 这个条件是为了obx不报错，可以去了试试看
                    style: TextStyle(fontSize: 9.sp))
              ])),
        ),
      );
    });
  }
}
