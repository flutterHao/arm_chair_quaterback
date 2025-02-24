import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/o_v_r_rank_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/controller.dart';
import 'package:arm_chair_quaterback/pages/team/nba_player/controller.dart';
import 'package:arm_chair_quaterback/pages/team/nba_player/widgets/game_status_grid_soucre.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlayerTrendPage extends StatefulWidget {
  const PlayerTrendPage({super.key});

  @override
  State<PlayerTrendPage> createState() => _PlayerTrendPageState();
}

class _PlayerTrendPageState extends State<PlayerTrendPage> {
  late NbaPlayerInfosPlayerBaseInfoList playerInfo;
  late PlayerStrengthRankEntity playerStrengthRankEntity;
  late int playerId;
  int differenceStrength = 0;
  int differenceScore = 0;
  List<PlayerStrengthRankTrendList> trendList = [];
  List<PlayerStrengthRankTrendList> showTrendList = [];
  LoadDataStatus rankDialogloadingStatus = LoadDataStatus.loading;
  List trendTypeList = ['1W', '1M', '3M', '1Y', '3Y', 'ALL'];

  int selectedIndexType = 0;
  List<OVRRankPlayerInfoGameStats> gameStats = [];
  OVRRankPlayerInfoSeasonStats seasonStats = OVRRankPlayerInfoSeasonStats();
  NbaPlayerBaseInfoEntity? nbaPlayerBaseInfoEntity;
  GlobalKey globalKey = GlobalKey();
  NbaPlayerController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerStrengthRankEntity = Get.arguments;
    playerId = playerStrengthRankEntity.playerId;
    playerInfo = Utils.getPlayBaseInfo(playerId);
    differenceStrength =
        playerStrengthRankEntity.trendList[0].playerStrength - playerStrengthRankEntity.trendList[1].playerStrength;
    differenceScore =
        playerStrengthRankEntity.trendList[0].playerScore - playerStrengthRankEntity.trendList[1].playerScore;
    initData();
  }

  void initData() async {
    List<PlayerStrengthRankTrendList> resTrendList = await TeamApi.getPlayerTrends(playerId: playerId, day: -1);
    OVRRankPlayerInfoEntity ovrPlayerInfo = await TeamApi.getOVRRankPlayerInfo(playerId: playerId);
    nbaPlayerBaseInfoEntity = await PicksApi.getNBAPlayerBaseInfo(playerId);
    setState(() {
      rankDialogloadingStatus = LoadDataStatus.success;
      trendList = resTrendList;
      if (trendList.length > 7) {
        showTrendList = trendList.sublist(0, 7);
      } else {
        showTrendList = trendList;
      }
      gameStats = ovrPlayerInfo.gameStats;
      seasonStats = ovrPlayerInfo.seasonStats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
            UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
                child: rankDialogloadingStatus == LoadDataStatus.success
                    ? SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            _buildHeaderWidget(),
                            10.vGap,
                            _ovrTrendWidget(),
                            10.vGap,
                            _gameStatsWidget(),
                            10.vGap,
                            _statsWidget()
                          ],
                        ),
                      )
                    : Center(child: LoadStatusWidget(loadDataStatus: rankDialogloadingStatus)))));
  }

  ///球员趋势图
  Widget _ovrTrendWidget() {
    return Stack(
      children: [
        RepaintBoundary(
          key: globalKey,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.w),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.w), color: AppColors.cFFFFFF),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "OVR TREND",
                        style: 24.w7(height: 1, fontFamily: FontFamily.fOswaldBold),
                      )),
                  16.vGap,
                  Divider(color: AppColors.cE6E6E6, height: 1.w),
                  _playerOVRInfoWidget(),
                  16.vGap,
                  _playerchartWidget(showTrendList),
                  _trendTabWidget(),
                ],
              )),
        ),
        Positioned(top: 16.w, right: 16.w, child: ShareWidget(globalKey: globalKey))
      ],
    );
  }

  List<PlayerRegular> getSeasonAverageData() {
    var json = seasonStats.toJson();
    List<PlayerRegular> list = Constant.statTypeList.fold([], (p, e) {
      var key = e;
      if (key == "TO") {
        key = "TOV";
      }
      if (json.containsKey(key) == true && json.containsKey("${key}_RANK") == true) {
        var value = json[key];
        var rank = json["${key}_RANK"];
        p.add(PlayerRegular(rank ?? 0, value ?? 0, e));
      }
      return p;
    });
    return list;
  }

  Widget _statsWidget() {
    return MtInkWell(
        onTap: () {
          Get.toNamed(RouteNames.picksPlayerDetail, arguments: PlayerDetailPageArguments(playerId));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.w), color: AppColors.cFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      "${formatSeasonDate()} STATS",
                      style: 24.w7(height: 1, fontFamily: FontFamily.fOswaldBold),
                    ),
                    Spacer(),
                    IconWidget(iconWidth: 16.w, iconColor: Colors.black, icon: Assets.commonUiCommonIconSystemInfo)
                  ],
                ),
              ),
              Divider(color: AppColors.cE6E6E6, height: 1.w),
              Builder(builder: (context) {
                var seasonAverageData = getSeasonAverageData();
                return SizedBox(
                  width: double.infinity,
                  height: 101.w,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: seasonAverageData.length,
                        // controller: scrollController,
                        // physics: OneBoundaryScrollPhysics(scrollController: scrollController),
                        itemBuilder: (context, index) {
                          PlayerRegular item = seasonAverageData[index];
                          bool lastIndex = seasonAverageData.length - 1 == index;
                          return SizedBox(
                            height: 101.w,
                            width: 93.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.value.toStringAsFixed(1),
                                      style: 21.w5(height: 1, fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                    6.vGap,
                                    Text(
                                      item.key,
                                      style: 10.w4(
                                          color: AppColors.c666666, height: 1, fontFamily: FontFamily.fRobotoRegular),
                                    ),
                                    13.vGap,
                                    Opacity(
                                        opacity: item.rank <= 100 ? 1 : 0,
                                        child: Text(
                                          Utils.getSortWithInt(item.rank),
                                          style: 12.w5(
                                              color: AppColors.cFF7954,
                                              height: 1,
                                              fontFamily: FontFamily.fRobotoMedium),
                                        )),
                                    2.vGap
                                  ],
                                ),
                                if (!lastIndex)
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      color: AppColors.cE6E6E6,
                                      width: 1.w,
                                      height: 54.w,
                                    ),
                                  )
                              ],
                            ),
                          );
                        }),
                  ),
                );
              }),
            ],
          ),
        ));
  }

  ///比赛信息
  Widget _gameStatsWidget() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.w), color: AppColors.cFFFFFF),
        child: Column(children: [
          10.vGap,
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "GAME STATS",
                style: 24.w7(height: 1, fontFamily: FontFamily.fOswaldBold),
              )),
          20.vGap,
          SfDataGridTheme(
              data: const SfDataGridThemeData(
                  gridLineColor: AppColors.cTransparent,
                  frozenPaneLineColor: AppColors.cTransparent,
                  rowHoverColor: AppColors.c10A86A,
                  gridLineStrokeWidth: 0),
              child: SizedBox(
                height: 32.w * (gameStats.length + 1),
                child: SfDataGrid(
                  headerRowHeight: 32.w,
                  columnWidthMode: ColumnWidthMode.fill,
                  rowHeight: 32.w,
                  gridLinesVisibility: GridLinesVisibility.none,
                  source: GameStatusGridSoucre(gameStats, context),
                  horizontalScrollPhysics: const NeverScrollableScrollPhysics(),
                  verticalScrollPhysics: const NeverScrollableScrollPhysics(),
                  columns: [
                    GridColumn(
                        columnName: 'date',
                        width: 74.w,
                        autoFitPadding: EdgeInsets.zero,
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
                                  top: BorderSide(color: AppColors.cD1D1D1, width: 1.w))),
                          child: Text(
                            'DATE',
                            style: 12.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium),
                          ),
                        )),
                    GridColumn(
                        columnName: 'opp',
                        width: 74.w,
                        label: Container(
                          padding: EdgeInsets.only(left: 10.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
                                  top: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
                                  right: BorderSide(color: AppColors.cD1D1D1, width: 1.w))),
                          child: Text(
                            'OPP',
                            style: 12.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium),
                          ),
                        )),
                    GridColumn(
                        columnName: 'power',
                        label: Container(
                          width: 80.w,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 40.w),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
                                  top: BorderSide(color: AppColors.cD1D1D1, width: 1.w))),
                          child: Text(
                            'POWER',
                            style: 12.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium),
                          ),
                        )),
                    GridColumn(
                        columnName: 'ovr',
                        width: 84.w,
                        label: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
                                  top: BorderSide(color: AppColors.cD1D1D1, width: 1.w))),
                          child: Text(
                            'OVR',
                            style: 12.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium),
                          ),
                        )),
                  ],
                ),
              ))
        ]));
  }

  String formatSeasonDate() {
    var seasonDate = nbaPlayerBaseInfoEntity?.playerDataAvg.seasonId ?? 1971;
    return "${(seasonDate.toString()).substring(2)}-${((seasonDate + 1).toString()).substring(2)}";
  }

  ///切换趋势图日期
  void changeselectedIndexType(int index) {
    setState(() {
      selectedIndexType = index;
      switch (selectedIndexType) {
        case 0:
          if (trendList.length > 7) {
            showTrendList = trendList.sublist(0, 7);
          }
        case 1:
          if (trendList.length > 30) {
            showTrendList = trendList.sublist(0, 30);
          }
        case 2:
          if (trendList.length > 90) {
            showTrendList = trendList.sublist(0, 90);
          } else {
            showTrendList = trendList;
          }
        case 3:
          if (trendList.length > 365) {
            showTrendList = trendList.sublist(0, 365);
          } else {
            showTrendList = trendList;
          }
        case 4:
          if (trendList.length > 365 * 3) {
            showTrendList = trendList.sublist(0, 365 * 3);
          } else {
            showTrendList = trendList;
          }
        default:
          showTrendList = trendList;
      }
    });
  }

  ///趋势图切换
  Widget _trendTabWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...trendTypeList.mapIndexed((index, element) {
            return InkWell(
              onTap: () => changeselectedIndexType(index),
              child: Container(
                width: 46.w,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 4.w),
                foregroundDecoration: BoxDecoration(
                    border: Border(
                        bottom: selectedIndexType == index
                            ? BorderSide(
                                color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D, width: 2.w)
                            : BorderSide.none)),
                child: Text(
                  '${trendTypeList[index]}',
                  style: 16.w5(
                      fontFamily: FontFamily.fOswaldRegular,
                      color: selectedIndexType != index
                          ? AppColors.cB3B3B3
                          : differenceScore >= 0
                              ? AppColors.c0FA76C
                              : AppColors.cE34D4D),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  ///球员OVR信息
  Widget _playerOVRInfoWidget() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        child: IntrinsicHeight(
            child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  '${playerInfo.maxPlayerScore}',
                  style: 22.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                Text(
                  'H-OVR',
                  style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.c8A8A8A),
                )
              ],
            )),
            VerticalDivider(color: AppColors.cD1D1D1),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${playerInfo.playerScore}',
                      style: 22.w5(fontFamily: FontFamily.fOswaldMedium),
                    ),
                    6.hGap,
                    Column(
                      children: [
                        Text('${differenceScore.abs()}',
                            style: 14.w5(
                              height: 0.95,
                              color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                              fontFamily: FontFamily.fRobotoRegular,
                            )),
                        Transform.rotate(
                          angle: differenceScore >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
                          child: Image.asset(
                            Assets.commonUiCommonIconSystemArrow,
                            width: 5.w,
                            height: 8.w,
                            color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  'OVR',
                  style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.c8A8A8A),
                )
              ],
            )),
            VerticalDivider(color: AppColors.cD1D1D1),
            Expanded(
                child: Column(
              children: [
                Text(
                  '${playerInfo.minPlayerScore}',
                  style: 22.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                Text(
                  'L-OVR',
                  style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.c8A8A8A),
                )
              ],
            )),
          ],
        )));
  }

  Widget _playerchartWidget(List<PlayerStrengthRankTrendList> item) {
    var data = List.generate(item.length, (index) {
      return FlSpot(index.toDouble(), item[item.length - index - 1].playerScore.toDouble());
    });
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
          height: 154.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: LineChart(
            LineChartData(
              lineTouchData: const LineTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value == 0 || value == item.length - 1) {
                        String text = '';
                        if (value.toInt() == item.length - 1) {
                          text = MyDateUtils.formatDate(DateTime.fromMillisecondsSinceEpoch(item[0].updateTime),
                              format: 'MM/dd/yy');
                        } else {
                          text = MyDateUtils.formatDate(
                              DateTime.fromMillisecondsSinceEpoch(item[item.length - 1].updateTime),
                              format: 'MM/dd/yy');
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4.w,
                          child:
                              Text(text, style: 10.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.c4D4D4D)),
                        );
                      } else {
                        return Container(); // 不显示其它点
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 24.w,
                    getTitlesWidget: (value, meta) {
                      if (value == 0 || value == 50 || value == 100) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4.w,
                          child: Text('${value.toInt()}', style: 10.w5(fontFamily: FontFamily.fRobotoRegular)),
                        );
                      } else {
                        return Container(); // 不显示其它点
                      }
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                  show: true,
                  border:
                      Border(left: BorderSide(color: AppColors.cD1D1D1), bottom: BorderSide(color: AppColors.cD1D1D1))),
              minY: 0,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                    spots: data,
                    color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        // 如果是最后一个点，则返回一个特定样式的点
                        if (index == data.length - 1) {
                          return FlDotCirclePainter(
                              radius: 1.6,
                              color: differenceScore >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
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
                                ? [AppColors.c0FA76C.withOpacity(0.3), AppColors.c0FA76C.withOpacity(0.1)]
                                : [AppColors.cE34D4D.withOpacity(0.3), AppColors.cE34D4D.withOpacity(0.1)])))
              ],
              gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(color: AppColors.cB3B3B3, strokeWidth: 1, dashArray: [4, 2]);
                  },
                  horizontalInterval: 50,
                  checkToShowHorizontalLine: (value) {
                    return true;
                  },
                  checkToShowVerticalLine: (value) {
                    return false;
                  }),
            ),
          )),
    );
  }

  Widget _buildHeaderWidget() {
    return Column(
      children: [
        Container(
          height: 117.w,
          width: double.infinity,
          color: Utils.getTeamColor(playerInfo.teamId),
          child: Stack(
            children: [
              Row(
                children: [
                  20.hGap,
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 116.w,
                        width: 144.w,
                        child: ImageWidget(
                          url: Utils.getPlayUrl(playerId),
                          imageFailedPath: Assets.iconUiDefault04,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ],
                  ),
                  8.hGap,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        18.vGap,
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            getFirstName(),
                            style: 16.w4(color: AppColors.cFFFFFF, height: 1, fontFamily: FontFamily.fRobotoRegular),
                          ),
                        ),
                        4.vGap,
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            getLastName(),
                            style: 24.w5(color: AppColors.cFFFFFF, height: 1, fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                        11.vGap,
                        Row(
                          children: [
                            Text(
                              "${Utils.getTeamInfo(playerInfo.teamId).shortEname} · ${playerInfo.position}",
                              style: 12.w4(color: AppColors.cFFFFFF, height: 1, fontFamily: FontFamily.fRobotoRegular),
                            ),
                            10.hGap,
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 22.w,
                  left: 16.w,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "${playerInfo.playerScore}",
                            style: 24.w7(color: AppColors.cFFFFFF, fontFamily: FontFamily.fOswaldBold),
                          ),
                          Text(
                            LangKey.gameNameOvr.tr,
                            style: 10.w4(color: AppColors.cFFFFFF, fontFamily: FontFamily.fRobotoRegular),
                          )
                        ],
                      ),
                      8.vGap,
                      OutlinedText(
                        text: playerInfo.grade,
                        textStyle: 24.w4(
                          color: AppColors.c262626,
                          height: 0.8,
                          fontFamily: FontFamily.fRobotoBlack,
                        ),
                      )
                    ],
                  )),
              Positioned(
                  top: 20.w,
                  right: 16.w,
                  child: MtInkWell(
                    splashColor: Colors.transparent,
                    onTap: () => controller.changeLikePlayer(playerId),
                    child: Obx(() => IconWidget(
                        iconWidth: 16.w,
                        iconColor: controller.likePlayersList.contains(playerId) ? Colors.yellow : AppColors.c8A8A8A,
                        icon: controller.likePlayersList.contains(playerId)
                            ? Assets.commonUiCommonStatusBarStar02
                            : Assets.commonUiCommonStatusBarStar01)),
                  ))
            ],
          ),
        ),
        Container(
          height: 38.w,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(4.w)),
                  child: Row(
                    children: [
                      Text('star'.toUpperCase(),
                          style: 12.w5(
                            fontFamily: FontFamily.fOswaldRegular,
                          )),
                      8.hGap,
                      PlayerStartWidget(grade: 0),
                    ],
                  )),
              Spacer(),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
                  decoration: BoxDecoration(color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(4.w)),
                  child: Row(
                    children: [
                      Text('POWER',
                          style: 12.w5(
                            fontFamily: FontFamily.fOswaldRegular,
                          )),
                      8.hGap,
                      Text('${playerStrengthRankEntity.strength}',
                          style: 12.w5(
                            fontFamily: FontFamily.fOswaldRegular,
                          )),
                      4.hGap,
                      Transform.rotate(
                        angle: differenceStrength >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
                        child: Image.asset(
                          Assets.commonUiCommonIconSystemArrow,
                          width: 5.w,
                          height: 8.w,
                          color: differenceStrength >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                        ),
                      ),
                      2.hGap,
                      Text('${differenceStrength.abs()}',
                          style: 12.w5(
                            color: differenceStrength >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                            fontFamily: FontFamily.fOswaldRegular,
                          )),
                    ],
                  )),
              Spacer(),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
                  decoration: BoxDecoration(color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(4.w)),
                  child: Row(
                    children: [
                      Text('SAL ',
                          style: 12.w5(
                            fontFamily: FontFamily.fOswaldRegular,
                          )),
                      8.hGap,
                      IconWidget(iconWidth: 16.w, icon: Assets.commonUiCommonProp05),
                      2.hGap,
                      Text('${playerInfo.salary}K',
                          style: 12.w5(
                            fontFamily: FontFamily.fOswaldRegular,
                          )),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }

  String getLastName() {
    var split = playerInfo.elname.split(" ");
    return playerInfo.elname.contains(" ") ? split[1] : playerInfo.elname;
  }

  String getFirstName() {
    var split = playerInfo.elname.split(" ");
    return playerInfo.elname.contains(" ") ? split[0] : playerInfo.elname;
  }
}
