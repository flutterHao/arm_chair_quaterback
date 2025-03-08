import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_pass_reward_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/claim_status.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BattlePassPage extends StatefulWidget {
  const BattlePassPage({super.key});

  @override
  State<BattlePassPage> createState() => _BattlePassPageState();
}

class _BattlePassPageState extends State<BattlePassPage> {
  int get currentIndex => 2;
  Color currentBgColor(int index) {
    return currentIndex >= index ? AppColors.c000000 : AppColors.cFFFFFF;
  }

  Color currentTextColor(int index) {
    return currentIndex >= index ? AppColors.cFFFFFF : AppColors.cD2D2D2;
  }

  List<BattlePassRewardEntity> battleRewardList = [];
  initData() async {
    List<BattlePassRewardEntity> res = await CacheApi.getBattlePassReward();
    setState(() {
      battleRewardList = res;
    });
  }

  @override
  initState() {
    super.initState();
    initData();
    _updateRemainingTime();
    // 每秒更新一次剩余时间
    _timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => _updateRemainingTime());
  }

  Widget _buildView() {
    return Column(
      children: [
        _battleTopWidget(),
        _levelWidget(),
        Divider(height: 1, color: AppColors.cD1D1D1),
        Expanded(
            child: Container(
          child: ListView.builder(
              padding: EdgeInsets.only(right: 16.w),
              itemCount: battleRewardList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [_leftWidget(index), _rightWidget(index)],
                );
              }),
        )),
        _bottomRewardWidget()
      ],
    );
  }

  Widget _bottomRewardWidget() {
    var rewardList = [];
    if (battleRewardList.length > 1) {
      rewardList =
          battleRewardList[battleRewardList.length - 1].fixReward.split('|');
    }

    return Container(
      height: 94.w + Utils.getPaddingBottom(),
      padding: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 5)
      ]),
      child: Row(
        children: [
          Container(
            width: 64.w,
            padding: EdgeInsets.only(left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.vGap,
                Container(
                  width: 24.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.c3B5FA7,
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  child: Text(
                    '${battleRewardList.length}',
                    style: 14.w5(
                        color: Colors.white,
                        fontFamily: FontFamily.fOswaldRegular),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              12.hGap,
              Expanded(
                  child: SizedBox(
                child: Row(
                  children: rewardList
                      .map((cupItem) {
                        int propId = int.tryParse(cupItem.split('_')[1]) ?? 0;
                        int propNum = int.tryParse(cupItem.split('_')[2]) ?? 1;
                        return Container(
                          child: Column(
                            children: [
                              26.vGap,
                              IconWidget(
                                  iconWidth: 40.w,
                                  iconHeight: 40.w,
                                  fit: BoxFit.contain,
                                  fieldPath: Assets.managerUiManagerGift00,
                                  icon: Utils.getPropIconUrl(propId)),
                              4.vGap,
                              Text(
                                  '${propId == 102 ? Utils.formatMoney(propNum) : propNum}',
                                  style: 14.w5(
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular)),
                            ],
                          ),
                        );
                      })
                      .expand((Widget child) sync* {
                        yield 20.hGap;
                        yield child;
                      })
                      .skip(1)
                      .toList(),
                ),
              )),
              ClaimStatusWidget(BattleRewardType.canReceived),
              12.hGap,
            ],
          )),
        ],
      ),
    );
  }

  Widget _levelWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
      child: IntrinsicHeight(
          child: Row(
        children: [
          Container(
            height: 54.w,
            width: 54.w,
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(8.w)),
            child: Column(
              children: [
                7.vGap,
                Text(
                  '10',
                  style: 24.w5(fontFamily: FontFamily.fOswaldBold, height: .8),
                ),
                6.vGap,
                Text(
                  'level'.toUpperCase(),
                  style: 16.w5(fontFamily: FontFamily.fOswaldBold, height: .8),
                )
              ],
            ),
          ),
          14.hGap,
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'CONTESTS Win'.toUpperCase(),
                      style: 13.w4(fontFamily: FontFamily.fRobotoRegular),
                    ),
                    Spacer(),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: '51'.toUpperCase(),
                            style: 13.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                color: AppColors.c808080)),
                        TextSpan(
                            text: '/100'.toUpperCase(),
                            style: 13.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                color: AppColors.c000000)),
                      ]),
                    ),
                    20.hGap
                  ],
                ),
                OutLineProgressWidget(
                  width: 260.w,
                  height: 12.w,
                  progress: .8,
                  progressColor: AppColors.c000000,
                  border: Border.all(color: AppColors.c000000, width: 1),
                ),
              ],
            ),
          )),
        ],
      )),
    );
  }

  Widget _battleTopWidget() {
    return Container(
        height: 144.w,
        color: AppColors.c204794,
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          children: [
            Positioned(
                left: -130.w,
                bottom: -110.w,
                child: Opacity(
                  opacity: .05,
                  child: ImageWidget(
                    url: Utils.getTeamUrl(105),
                    width: 290.w,
                    height: 290.w,
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.vGap,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ImageWidget(
                          url: Utils.getTeamUrl(105),
                          width: 124.w,
                          height: 124.w,
                        ),
                        10.hGap,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            22.vGap,
                            Text(
                              'BATTLT PASS',
                              style: 27.w4(
                                  height: .8,
                                  color: Colors.white,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                            4.vGap,
                            Text(
                              'Win the game and get rewards.',
                              style: 12.w4(
                                  color: Colors.white,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            6.vGap,
                            Row(children: [
                              Container(
                                width: 34.w,
                                height: 37.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    color: Colors.white.withOpacity(.1)),
                                child: Text(
                                  '$days',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  ':',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Container(
                                width: 34.w,
                                height: 37.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    color: Colors.white.withOpacity(.1)),
                                child: Text(
                                  '$hours',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  ':',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Container(
                                width: 34.w,
                                height: 37.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    color: Colors.white.withOpacity(.1)),
                                child: Text(
                                  '$twoDigitMinutes',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  ':',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Container(
                                width: 34.w,
                                height: 37.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    color: Colors.white.withOpacity(.1)),
                                child: Text(
                                  '$twoDigitSeconds',
                                  style: 20.w5(
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              )
                            ])
                          ],
                        )),
                      ],
                    ),
                  ),
                  10.vGap,
                ],
              ),
            ),
          ],
        ));
  }

  Widget _rightWidget(int index) {
    var rewardList = battleRewardList[index].fixReward.split('|');
    return Expanded(
        child: SizedBox(
            height: 98.w + 1,
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    12.hGap,
                    Expanded(
                        child: SizedBox(
                      child: Row(
                        children: rewardList
                            .map((cupItem) {
                              int propId =
                                  int.tryParse(cupItem.split('_')[1]) ?? 0;
                              int propNum =
                                  int.tryParse(cupItem.split('_')[2]) ?? 1;
                              return Container(
                                child: Column(
                                  children: [
                                    26.vGap,
                                    IconWidget(
                                        iconWidth: 40.w,
                                        iconHeight: 40.w,
                                        fit: BoxFit.contain,
                                        fieldPath:
                                            Assets.managerUiManagerGift00,
                                        icon: Utils.getPropIconUrl(propId)),
                                    4.vGap,
                                    Text(
                                        '${propId == 102 ? Utils.formatMoney(propNum) : propNum}',
                                        style: 14.w5(
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoRegular)),
                                  ],
                                ),
                              );
                            })
                            .expand((Widget child) sync* {
                              yield 20.hGap;
                              yield child;
                            })
                            .skip(1)
                            .toList(),
                      ),
                    )),
                    ClaimStatusWidget(
                      index < 2
                          ? BattleRewardType.received
                          : index == 2
                              ? BattleRewardType.canReceived
                              : BattleRewardType.notReceived,
                    ),
                    12.hGap,
                  ],
                )),
                Opacity(
                    opacity: index != battleRewardList.length - 1 ? 1 : 0,
                    child: Divider(height: 1, color: AppColors.cE6E6E6))
              ],
            )));
  }

  Widget _leftWidget(int index) {
    return Container(
        width: 64.w,
        height: 98.w + 1,
        padding: EdgeInsets.only(left: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: index == 0 ? 0 : 1,
              child: Container(
                width: 5.w,
                decoration: BoxDecoration(
                    color: currentIndex >= index
                        ? AppColors.c000000
                        : AppColors.cE6E6E6,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.w),
                        bottomRight: Radius.circular(5.w))),
                height: 26.w,
                margin: EdgeInsets.only(left: 9.w),
              ),
            ),
            Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: currentBgColor(index),
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  foregroundDecoration: currentIndex < index
                      ? BoxDecoration(
                          border:
                              Border.all(color: AppColors.cD1D1D1, width: 1),
                          borderRadius: BorderRadius.circular(12.w),
                        )
                      : null,
                  child: Text(
                    '${index + 1}',
                    style: 14.w5(
                        color: currentTextColor(index),
                        fontFamily: FontFamily.fOswaldRegular),
                  ),
                ),
                Visibility(
                    visible: index == currentIndex,
                    child: Positioned(
                        left: -3.w,
                        top: -3.w,
                        child: Container(
                          width: 30.w,
                          height: 30.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.c000000, width: 1),
                            borderRadius: BorderRadius.circular(28.w),
                          ),
                        ))),
              ],
            ),
            Spacer(),
            Opacity(
              opacity: index == battleRewardList.length - 1 ? 0 : 1,
              child: Container(
                width: 5.w,
                decoration: BoxDecoration(
                    color: currentIndex > index
                        ? AppColors.c000000
                        : AppColors.cE6E6E6,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.w),
                        topRight: Radius.circular(5.w))),
                height: 26.w,
                margin: EdgeInsets.only(left: 9.w),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
      UserInfoBar(showPop: true),
      backgroundColor: Colors.white,
      bodyWidget: Expanded(child: _buildView()),
    ));
  }

  late Timer _timer;
  late Duration _remaining;
  String days = '';
  String hours = ''; // 获取除去整天后的小时数
  String twoDigitMinutes = '';
  String twoDigitSeconds = '';
  void formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    setState(() {
      // 计算天数、剩余的小时数、分钟数和秒数
      days = twoDigits(d.inDays);
      hours = twoDigits(d.inHours.remainder(24)); // 获取除去整天后的小时数
      twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
      twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    });

    // return "${days}:${hours}:${twoDigitMinutes}:${twoDigitSeconds}";
  }

  void _updateRemainingTime() {
    DateTime now = DateTime.now();
    DateTime midnight = DateTime(now.year, now.month, now.day + 3); // 明天凌晨
    Duration remaining = midnight.difference(now);
    _remaining = remaining;
    formatDuration(_remaining);
  }

  @override
  void dispose() {
    _timer.cancel(); // 当组件销毁时取消定时器
    super.dispose();
  }
}

enum BattleRewardType {
  ///可领取
  canReceived,

  ///已领取
  received,

  ///未达到领取条件
  notReceived
}
