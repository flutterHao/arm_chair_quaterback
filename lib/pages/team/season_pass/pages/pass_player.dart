import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/battle_pass.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/nba_player/controller.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/controller.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/battle_pass.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/routers/names.dart';

class PassPlayerPage extends StatefulWidget {
  const PassPlayerPage({super.key});

  @override
  State<PassPlayerPage> createState() => _PassPlayerPageState();
}

class _PassPlayerPageState extends State<PassPlayerPage> {
  var gradesList = ['S', 'A', 'B', 'C', 'D'];
  List<PlayerStrengthRankEntity> playerRankList = [];
  final NbaPlayerController nbaController = Get.find();
  final controller = Get.find<SeasonPassController>();
  List<PlayerStrengthRankEntity> allPlayerRank = [];
  int teamId = 101;
  @override
  void initState() {
    // TODO: implement initState
    teamId = Get.arguments;
    super.initState();
    initData();
  }

  initData() async {
    allPlayerRank = nbaController.allPlayerRank;
    playerRankList = allPlayerRank.where((PlayerStrengthRankEntity e) {
      /// 球队
      var t = Utils.getPlayBaseInfo(e.playerId).teamId;
      return t == teamId;
    }).toList();
    getGrades();
    setState(() {});
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _topPlayerGradeWidget(),
        Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'Player Information'.toUpperCase(),
              style: 24.w5(fontFamily: FontFamily.fOswaldMedium),
            )),
        Divider(
          color: Colors.grey,
          height: 1,
        ),
        Expanded(
            child: Container(
                color: Colors.white,
                child: ListView.separated(
                  itemCount: playerRankList.length,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _playerItemWidget(index);
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: AppColors.ce5e5e5,
                  ),
                ))),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 7.w,
              bottom: 14.w + Utils.getPaddingBottom()),
          child: MtInkWell(
              onTap: () async {
                await BattlePassApi.chooseHomeTeam(teamId);
                Get.to(BattlePassPage());
                controller.teamId = teamId;
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.w),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.w)),
                alignment: Alignment.center,
                child: Text(
                  'CONFIRM',
                  style: 24.w5(
                      color: Colors.white,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
      UserInfoBar(showPop: true),
      bodyWidget: Expanded(child: _buildView()),
    ));
  }

  Widget _topPlayerGradeWidget() {
    return InkWell(
        onTap: () => Get.toNamed(RouteNames.teamDetailPage, arguments: teamId),
        child: Stack(
          children: [
            Container(
              height: 198.w,
              color: controller.getTeamColor(teamId),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.vGap,
                  Row(
                    children: [
                      ImageWidget(
                        url: Utils.getTeamUrl(teamId),
                        width: 76.w,
                        height: 76.w,
                      ),
                      10.hGap,
                      Expanded(
                          child: SizedBox(
                        height: 70.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.vGap,
                            Row(
                              children: [
                                Text(
                                  Utils.getTeamInfo(110).longEname,
                                  style: 24.w4(
                                      height: .8,
                                      color: Colors.white,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                Spacer(),
                                MtInkWell(
                                    onTap: () {
                                      getGrades();
                                    },
                                    splashColor: Colors.transparent,
                                    child: IconWidget(
                                      icon: Assets.commonUiCommonIconSystemInfo,
                                      iconWidth: 14.w,
                                      iconHeight: 12.w,
                                    ))
                              ],
                            ),
                            16.vGap,
                            Text(
                              '24-15 4th western conference'.toUpperCase(),
                              style: 14.w4(
                                  color: Colors.white,
                                  fontFamily: FontFamily.fRobotoRegular),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  20.vGap,
                  Row(
                      children: gradesMap.entries
                          .map((MapEntry<GradesTypes, int> element) {
                            return Expanded(
                                child: SizedBox(
                              height: 80.w,
                              child: Column(
                                children: [
                                  Text(element.key.name,
                                      style: 35.w5(
                                          color: Colors.white,
                                          fontFamily:
                                              FontFamily.fOswaldMedium)),
                                  Text('${element.value}',
                                      style: 19.w5(
                                          color: Colors.white,
                                          fontFamily:
                                              FontFamily.fRobotoRegular))
                                ],
                              ),
                            ));
                          })
                          .expand((Widget child) sync* {
                            yield Container(
                                width: 1,
                                height: 48.w,
                                color: Colors.white.withOpacity(.5));
                            yield child;
                          })
                          .skip(1)
                          .toList()),
                ],
              ),
            ),
            Positioned(
                right: 0,
                bottom: -80.w,
                child: Opacity(
                  opacity: .05,
                  child: ImageWidget(
                    url: Utils.getTeamUrl(teamId),
                    width: 230.w,
                    height: 230.w,
                  ),
                ))
          ],
        ));
  }

  Widget _playerItemWidget(int index) {
    NbaPlayerInfosPlayerBaseInfoList player =
        Utils.getPlayBaseInfo(playerRankList[index].playerId);
    return MtInkWell(
      onTap: () async {
        Get.toNamed(RouteNames.playerTrendPage,
            arguments: playerRankList[index]);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.w),
        height: 92.w,
        child: Row(
          children: [
            _playRankWidget(index),
            6.hGap,
            _playerCardWidget(player),
            10.hGap,
            Expanded(child: _playerInfoWidget(index, player)),
            10.hGap,
            _playerOvrRightWidget(index, player)
          ],
        ),
      ),
    );
  }

  Widget _playerInfoWidget(int index, NbaPlayerInfosPlayerBaseInfoList player) {
    List<PlayerStrengthRankTrendList> item = playerRankList[index].trendList;

    ///最后两天分数差值
    int differenceScore = item[0].playerScore - item[1].playerScore;
    int differenceStrength = item[0].playerStrength - item[1].playerStrength;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
                child: Text(
              Utils.getPlayBaseInfo(playerRankList[index].playerId)
                  .ename
                  .toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
            )),
            4.hGap,
            player.injuries
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColors.cFF5454,
                        borderRadius: BorderRadius.circular(4.w)),
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'INJ',
                      style: 12.w5(
                          fontFamily: FontFamily.fRobotoRegular,
                          color: Colors.white),
                    ),
                  )
                : SizedBox()
          ],
        ),
        Text(
          ' ${Utils.getTeamInfo(player.teamId).shortEname} · ${player.position}  SAL ${Utils.formatMoney(player.salary)}'
              .toUpperCase(),
          style: 10.w5(
              fontFamily: FontFamily.fRobotoRegular, color: AppColors.c8A8A8A),
        ),
        6.vGap,
        Expanded(
            child: _playerchartWidget(
                playerRankList[index].trendList, differenceScore)),
        Row(
          children: [
            Text(
              'POW ${playerRankList[index].strength}',
              style: 10.w5(fontFamily: FontFamily.fRobotoMedium),
            ),
            4.hGap,
            Transform.rotate(
              angle: differenceStrength >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
              child: IconWidget(
                iconWidth: 5.w,
                iconHeight: 8.w,
                icon: Assets.commonUiCommonIconSystemArrow,
                iconColor: differenceStrength >= 0
                    ? AppColors.c0FA76C
                    : AppColors.cFF5D54,
              ),
            ),
            4.hGap,
            Text(
              '${differenceStrength.abs()}',
              style: 10.w5(fontFamily: FontFamily.fRobotoMedium),
            ),
          ],
        )
      ],
    ));
  }

  Widget _playerOvrRightWidget(
      int index, NbaPlayerInfosPlayerBaseInfoList player) {
    List<PlayerStrengthRankTrendList> item = playerRankList[index].trendList;
    int differenceScore = item[0].playerScore - item[1].playerScore;
    return SizedBox(
      width: 82.w,
      child: Column(
        children: [
          Spacer(),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 55.w,
                  decoration: BoxDecoration(
                      color: AppColors.c333333,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.w),
                          bottomLeft: Radius.circular(6.w))),
                  child: Column(
                    children: [
                      Text(
                        '${player.playerScore}',
                        style: 19.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                      Text(
                        'OVR',
                        style: 12.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldRegular),
                      ),
                      2.vGap
                    ],
                  ),
                ),
                3.hGap,
                Container(
                  width: 24.w,
                  decoration: BoxDecoration(
                      color: differenceScore >= 0
                          ? AppColors.c0FA76C
                          : AppColors.cE34D4D,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(6.w),
                          topRight: Radius.circular(6.w))),
                  child: Column(
                    children: [
                      Text(
                        '${differenceScore.abs()}',
                        style: 19.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                      Transform.rotate(
                        angle: differenceScore >= 0
                            ? -pi / 180 * 90
                            : pi / 180 * 90,
                        child: IconWidget(
                            iconWidth: 8.w,
                            iconHeight: 12.w,
                            icon: Assets.commonUiCommonIconSystemArrow),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          7.vGap
        ],
      ),
    );
  }

  Widget _playRankWidget(int index) {
    return Container(
        width: 30.w,
        height: 30.w,
        alignment: Alignment.center,
        child: index == 0
            ? IconWidget(
                iconWidth: 30.w,
                icon: Assets.commonUiManagerIconMedal01,
              )
            : index == 1
                ? IconWidget(
                    iconWidth: 30.w,
                    icon: Assets.commonUiManagerIconMedal02,
                  )
                : index == 2
                    ? IconWidget(
                        iconWidth: 30.w,
                        icon: Assets.commonUiManagerIconMedal03,
                      )
                    : Text("${index + 1}",
                        style: 19.w5(fontFamily: FontFamily.fOswaldMedium)));
  }

  Widget _playerCardWidget(NbaPlayerInfosPlayerBaseInfoList player) {
    return Stack(
      children: [
        PlayerAvatarWidget(
          width: 73.w,
          height: 93.w,
          radius: 9.w,
          playerId: player.playerId,
          backgroundColor: AppColors.cD9D9D9,
        ),
        Positioned(
            left: 3.5.w,
            top: 4.w,
            child: OutlinedText(
              text: Utils.getPlayBaseInfo(player.playerId).grade,
              textStyle: 21.w4(
                color: AppColors.c262626,
                height: 0.8,
                fontFamily: FontFamily.fRobotoBlack,
              ),
            )),
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
    );
  }

  Widget _playerchartWidget(
      List<PlayerStrengthRankTrendList> item, int differenceScore) {
    List<int> scores = item.map((element) => element.playerScore).toList();
    // 获取最大值
    int maxScore = scores.reduce(max);
    var horizontalInterval = maxScore / 2;
    var data = List.generate(item.length, (index) {
      if (index == 0) {
        FlSpot(index.toDouble(), horizontalInterval);
      }
      return FlSpot(index.toDouble(),
          item[item.length - index - 1].playerScore.toDouble());
    });
    return Stack(
      children: [
        Container(
            height: 32.w,
            margin: EdgeInsets.only(
              right: 32.w,
            ),
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                      spots: data,
                      color: differenceScore >= 0
                          ? AppColors.c0FA76C
                          : AppColors.cE34D4D,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          // 如果是最后一个点，则返回一个特定样式的点
                          if (index == data.length - 1) {
                            return FlDotCirclePainter(
                                radius: 1.6,
                                color: differenceScore >= 0
                                    ? AppColors.c0FA76C
                                    : AppColors.cE34D4D,
                                strokeColor: Colors.white,
                                strokeWidth: 1.6);
                          } else {
                            return FlDotCirclePainter(radius: 0);
                          }
                        },
                      ),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                              colors: differenceScore >= 0
                                  ? [
                                      AppColors.c0FA76C.withOpacity(0.3),
                                      AppColors.c0FA76C.withOpacity(0.1)
                                    ]
                                  : [
                                      AppColors.cE34D4D.withOpacity(0.3),
                                      AppColors.cE34D4D.withOpacity(0.1)
                                    ])))
                ],
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                          color: AppColors.cB3B3B3,
                          strokeWidth: 1,
                          dashArray: [4, 2]);
                    },
                    horizontalInterval: horizontalInterval,
                    checkToShowHorizontalLine: (value) {
                      return true;
                    },
                    checkToShowVerticalLine: (value) {
                      return false;
                    }),
              ),
            )),
      ],
    );
  }

  final List<String> grades = [
    "S+",
    "S",
    "S-",
    "A+",
    "A",
    "A-",
    "B+",
    "B",
    "B-",
    "C+",
    "C",
    "C-",
    "D+",
    "D",
    "D-"
  ];

  Map<GradesTypes, int> gradesMap = {
    GradesTypes.S: 0,
    GradesTypes.A: 0,
    GradesTypes.B: 0,
    GradesTypes.C: 0,
    GradesTypes.D: 0
  };
  Future getGrades() async {
    gradesMap = {
      GradesTypes.S: 0,
      GradesTypes.A: 0,
      GradesTypes.B: 0,
      GradesTypes.C: 0,
      GradesTypes.D: 0
    };
    await Future.forEach(playerRankList, (element) {
      var g = Utils.getPlayBaseInfo(element.playerId).grade;
      if (g == grades[0] || g == grades[1] || g == grades[2]) {
        gradesMap[GradesTypes.S] = gradesMap[GradesTypes.S]! + 1;
      } else if (g == grades[3] || g == grades[4] || g == grades[5]) {
        gradesMap[GradesTypes.A] = gradesMap[GradesTypes.A]! + 1;
      } else if (g == grades[6] || g == grades[7] || g == grades[8]) {
        gradesMap[GradesTypes.B] = gradesMap[GradesTypes.B]! + 1;
      } else if (g == grades[9] || g == grades[10] || g == grades[11]) {
        gradesMap[GradesTypes.C] = gradesMap[GradesTypes.C]! + 1;
      } else if (g == grades[12] || g == grades[13] || g == grades[14]) {
        gradesMap[GradesTypes.D] = gradesMap[GradesTypes.D]! + 1;
      }
    });
  }
}

enum GradesTypes { S, A, B, C, D }
