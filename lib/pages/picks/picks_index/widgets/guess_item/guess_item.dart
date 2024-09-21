import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/rank_start_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/10/10:58

class GuessItem extends StatefulWidget {
  const GuessItem(this.parentIndex, this.pickPlayer, {this.onTap, super.key});

  final int parentIndex;
  final PicksPlayer pickPlayer;
  final Function(int tabIndex, int choice)? onTap;

  @override
  State<GuessItem> createState() => _GuessItemState();
}

class _GuessItemState extends State<GuessItem>
    with SingleTickerProviderStateMixin {
  late GuessItemController guessItemController;

  /// 整数位代表选中的tab下标，小数位代表选择的more(1)/less(2)
  var gameChoiceFlag = RxDouble(-1.0);

  @override
  Widget build(BuildContext context) {
    guessItemController = Get.put(GuessItemController(widget.pickPlayer),tag: widget.pickPlayer.guessInfo.playerId.toString());
    if (guessItemController.player.guessInfo.guessData.isNotEmpty) {
      /// 如果已选择则直接滚动到对应tab
      var index = guessItemController.player.betData.indexWhere((e) =>
          ParamUtils.getProKey(e.toLowerCase()).toLowerCase() ==
          guessItemController.player.guessInfo.guessData[0].guessAttr
              .toLowerCase());
      guessItemController.tabController
          .animateTo(index, duration: Duration.zero);
    }
    gameChoiceFlag = RxDouble(-1.0);
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.w),
      padding: EdgeInsets.only(
        top: 13.w,
        bottom: 10.w,
      ),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(20.w)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _gussItemDetailDialog(context);
            },
            child: SizedBox(
              height: 55.w,
              child: TabBarView(
                  controller: guessItemController.tabController,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    guessItemController.tabController.length,
                    (index) => Container(
                      margin: EdgeInsets.only(left: 13.w, right: 11.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              // print('点击了头像');
                              Get.toNamed(RouteNames.picksPlayerDetail,
                                  id: GlobalNestedKey.PICKS);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.ce5e5e5,
                                  borderRadius: BorderRadius.circular(26.w)),
                              child: Stack(children: [
                                Image.asset(
                                  Assets.testTeamLogoPng,
                                  width: 55.w,

                                  /// todo 换成网络图
                                ),
                                Text(
                                    guessItemController
                                        .player.baseInfoList.grade,
                                    style: 14.w7(color: AppColors.c262626))
                              ]),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 89.w),
                              margin: EdgeInsets.only(left: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    guessItemController
                                        .player.baseInfoList.ename,
                                    style: 13.w4(
                                        color: AppColors.c666666,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  4.vGap,
                                  Text(
                                    "VS ${guessItemController.player.awayTeamInfo.shortEname}   ${MyDateUtils.formatHM(MyDateUtils.getDateTimeByMs(guessItemController.player.guessInfo.gameStartTime))}",
                                    style: 9.w4(
                                        color: AppColors.cB3B3B3, height: 1),
                                  ),
                                  8.vGap,
                                  Text(
                                    "PPG: ${double.parse(((guessItemController.player.dataAvgList.toJson()[ParamUtils.getProKey(guessItemController.player.betData[index].toLowerCase())]) ?? 0).toString()).toStringAsFixed(1)}",
                                    style: 9.w4(
                                        color: AppColors.cB3B3B3, height: 1),
                                  ),
                                  3.vGap,
                                  Text(
                                    "L5: ${double.parse(((guessItemController.player.guessInfo.l5Avg.toJson()[ParamUtils.getProKey(guessItemController.player.betData[index].toLowerCase())]) ?? 0).toString()).toStringAsFixed(1)}",
                                    style: 9.w4(
                                        color: AppColors.cB3B3B3, height: 1),
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
                                border: Border.all(
                                    color: AppColors.ce5e5e5, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    double.parse(((guessItemController
                                                        .player
                                                        .guessInfo
                                                        .guessReferenceValue
                                                        .toJson()[
                                                    ParamUtils.getProKey(
                                                        guessItemController
                                                            .player
                                                            .betData[index]
                                                            .toLowerCase())]) ??
                                                0)
                                            .toString())
                                        .toStringAsFixed(0),
                                    style: 18.w7(color: AppColors.cFF7954)),
                                Text(
                                  guessItemController.player.betData[index],
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.cFF7954),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11.w),
                            child: Column(
                              children: [
                                _buildBtn(index, "MORE", "1"),
                                7.vGap,
                                _buildBtn(index, "LESS", "2")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          //滚动指示器
          Container(
            margin: EdgeInsets.only(top: 12.w, right: 4.w, left: 4.w),
            child: TLBuildWidget(
                controller: guessItemController.tabController,
                builder: (current, next, progress, totalProgress) {
                  int TABLENGTH = guessItemController.tabController.length;
                  return Column(
                    children: [
                      LayoutBuilder(builder: (context, constraints) {
                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 1.w,
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: AppColors.cD8D8D8),
                            ),
                            Container(
                              width: 8.w,
                              height: 2.w,
                              margin: EdgeInsets.only(
                                  left:
                                      (constraints.maxWidth / TABLENGTH - 8.w) /
                                              2 +
                                          (constraints.maxWidth / TABLENGTH) *
                                              totalProgress),
                              decoration: BoxDecoration(
                                  color: AppColors.cFF7954,
                                  borderRadius: BorderRadius.circular(1.w)),
                            )
                          ],
                        );
                      }),
                      // SizedBox(
                      //   height: 8.w,
                      // ),
                      SizedBox(
                        height: 24.w,
                        width: double.infinity,
                        child: Row(
                          children: List.generate(TABLENGTH, (index) {
                            var activeColor = AppColors.c1A1A1A;
                            var normalColor = AppColors.cB3B3B3;
                            return Expanded(
                              flex: 1,
                              child: index >=
                                      guessItemController.tabController.length
                                  ? const SizedBox.shrink()
                                  : InkWell(
                                      onTap: () => guessItemController
                                          .tabController
                                          .animateTo(index),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        alignment: Alignment.center,
                                        child: Text(
                                            guessItemController
                                                .player.betData[index],
                                            style: TextStyle(
                                                //逻辑：不做动画时animationValue等于index，currentIndex设置激活状态；做动画时，
                                                //     比较animationValue和currentIndex的大小来判断滚动方向，
                                                //     animationValue大于currentIndex时滚动到下一个，小于时滚动到上一个；
                                                //     获取到即将到来的index做进入动画，currentIndex做推出动画，其他项保持未激活状态
                                                color: current == index
                                                    ? Color.lerp(activeColor,
                                                        normalColor, progress)
                                                    : next == index
                                                        ? Color.lerp(
                                                            normalColor,
                                                            activeColor,
                                                            progress)
                                                        : normalColor,
                                                fontSize: 11.sp)),
                                      ),
                                    ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildBtn(int index, String text, String ml) {
    var gdIsEmpty = guessItemController.player.guessInfo.guessData.isEmpty;
    var isChoice = gdIsEmpty
        ? false
        : guessItemController.player.guessInfo.guessData[0].guessChoice ==
                int.parse(ml) &&
            guessItemController.player.guessInfo.guessData[0].guessAttr
                    .toLowerCase() ==
                ParamUtils.getProKey(
                        guessItemController.player.betData[index].toLowerCase())
                    .toLowerCase();
    return Obx(() {
      return InkWell(
        onTap: () {
          if (!gdIsEmpty) {
            return;
          }
          var choice = double.parse("$index.$ml");
          if (gameChoiceFlag.value == choice) {
            gameChoiceFlag.value = -1.0;
          } else {
            gameChoiceFlag.value = choice;
          }
          Get.find<PicksIndexController>()
              .choiceOne(widget.parentIndex, choice);
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
                      ? AppColors.cFF7954
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
                        : AppColors.cFF7954
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
                        "   +${gameChoiceFlag.value != 100 ? guessItemController.player.betOdds : ''}",

                    /// 这个条件是为了obx不报错，可以去了试试看
                    style: TextStyle(fontSize: 9.sp))
              ])),
        ),
      );
    });
  }

  void _gussItemDetailDialog(BuildContext context) {
    PicksIndexController picksIndexController = Get.find();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            constraints: BoxConstraints(maxHeight: 500.w),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.cE6E6E6,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22.w),
                          topLeft: Radius.circular(22.w))),
                ),
                Container(
                  height: 42.w,
                  decoration: BoxDecoration(
                      color: AppColors.cFF7954,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22.w),
                          topLeft: Radius.circular(22.w))),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 2.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(22.w),
                              topLeft: Radius.circular(22.w))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back(id: GlobalNestedKey.PICKS);
                                },
                                child: Container(
                                    height: 42.w,
                                    width: 42.w,
                                    child: Image.asset(
                                      Assets.iconClosePng,
                                      width: 13.w,
                                    )),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 27.w, bottom: 17.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 70.w,
                                      height: 70.w,
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: Container(
                                            width: 60.w,
                                            height: 60.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        32.w))),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 6.w,
                                        child: Container(
                                            width: 63.w,
                                            height: 55.w,
                                            alignment: Alignment.bottomCenter,
                                            child: Image.asset(
                                              Assets.testTeamLogoPng,
                                              width: 55.w,
                                              fit: BoxFit.fitWidth,

                                              ///todo 换网络图
                                            ))),
                                    Text(
                                      guessItemController
                                          .player.baseInfoList.grade,
                                      style: TextStyle(
                                          color: AppColors.cF2F2F2,
                                          fontSize: 21.w,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        guessItemController
                                            .player.baseInfoList.ename,
                                        style: TextStyle(
                                            color: AppColors.cD9D9D9,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${guessItemController.player.selfTeamInfo.shortEname}   ${guessItemController.player.baseInfoList.position}",
                                        style: TextStyle(
                                            color: AppColors.c666666,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "How will ${guessItemController.player.baseInfoList.ename} do vs MIN Twins?",
                                        style: TextStyle(
                                            color: AppColors.cFF7954,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: guessItemController.player.betData.length,
                          itemBuilder: (_, index) {
                            return Column(
                              children: [
                                if (index == 0) 9.vGap,
                                Container(
                                  height: 75.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  padding: EdgeInsets.only(left: 9.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 62.w,
                                                height: 32.w,
                                                child: Stack(
                                                  children: [
                                                    IconWidget(
                                                      iconWidth: 62.w,
                                                      icon: Assets
                                                          .uiPickArrowsPng,
                                                      iconColor: AppColors
                                                          .c000000
                                                          .withOpacity(.2),
                                                    ),
                                                    BarChart(BarChartData(
                                                        barGroups: guessItemController.barGroups[guessItemController.player.betData[index]],
                                                        titlesData: guessItemController.titlesData,
                                                        borderData: FlBorderData(show: false)))
                                                  ],
                                                ),
                                              ),
                                              3.vGap,
                                              Text(
                                                  "L5 ${double.parse(((guessItemController.player.guessInfo.l5Avg.toJson()[ParamUtils.getProKey(guessItemController.player.betData[index].toLowerCase())]) ?? 0).toString()).toStringAsFixed(1)}",
                                                  style: 10.w4(
                                                      color: AppColors.c666666))
                                            ],
                                          ),
                                          18.hGap,
                                          Container(
                                            width: 62.w,
                                            height: 55.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9.w),
                                                border: Border.all(
                                                    color: AppColors.ce5e5e5,
                                                    width: 1)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  double.parse(((guessItemController
                                                                      .player
                                                                      .guessInfo
                                                                      .guessReferenceValue
                                                                      .toJson()[
                                                                  ParamUtils.getProKey(guessItemController
                                                                      .player
                                                                      .betData[
                                                                          index]
                                                                      .toLowerCase())]) ??
                                                              0)
                                                          .toString())
                                                      .toStringAsFixed(0),
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.cFF7954),
                                                ),
                                                Text(
                                                  guessItemController
                                                      .player.betData[index],
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: AppColors.cFF7954),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            _buildBtn(index, "MORE", "1"),
                                            4.hGap,
                                            _buildBtn(index, "LESS", "2")
                                          ],
                                        ),
                                      ),
                                      9.hGap,
                                    ],
                                  ),
                                ),
                                //底部留边距
                                Divider(
                                  height: index ==
                                          guessItemController
                                                  .player.betData.length -
                                              1
                                      ? 70.w
                                      : 9.w,
                                  color: AppColors.cE6E6E6,
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
                //下注
                Obx(() {
                  var value = picksIndexController.costCount.value;
                  if (value <= 0) {
                    return const SizedBox.shrink();
                  }
                  return Positioned(
                      left: 63.w,
                      right: 63.w,
                      bottom: 20.w,
                      child: Center(
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 300.w,
                              ),
                              child: RankStartButton(
                                picksIndexController.choiceData.length,
                                picksIndexController.costCount.value,
                                picksIndexController.betCount.value,
                                isDialog: true,
                              ))));
                })
              ],
            ),
          );
        });
  }
}
