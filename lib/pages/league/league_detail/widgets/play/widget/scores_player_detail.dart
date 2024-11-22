import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/play/widget/scores_player_detail_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/11/22/14:14

class ScoresPlayerDetail extends StatefulWidget {
  const ScoresPlayerDetail(this.gameData, {super.key});

  final NbaGameDetailGameData gameData;

  @override
  State<ScoresPlayerDetail> createState() => _ScoresPlayerDetailState();
}

class _ScoresPlayerDetailState extends State<ScoresPlayerDetail>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var homeTeamInfo = Utils.getTeamInfo(widget.gameData.homeTeamScore!.teamId);
    var awayTeamInfo = Utils.getTeamInfo(widget.gameData.awayTeamScore!.teamId);
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40.w,
            child: TabBar(
                controller: tabController,
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
                    url: Utils.getTeamUrl(homeTeamInfo.id),
                    width: 28.w,
                  ),
                  7.hGap,
                  Text(
                    homeTeamInfo.shortEname,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    awayTeamInfo.shortEname,
                  ),
                  7.hGap,
                  ImageWidget(
                    url: Utils.getTeamUrl(awayTeamInfo.id),
                    width: 28.w,
                  ),
                ],
              )
            ]),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
                children: [
                  _buildTabViewItem(widget.gameData.homePlayerScores),
                  _buildTabViewItem(widget.gameData.awayPlayerScores),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildTabViewItem(List<NbaGameDetailGameDataPlayerScores> playerScores) {
    var starterList = playerScores.where((e)=>e.isStarter).toList();
    var notStarterList = playerScores.where((e)=>!e.isStarter).toList();

    List<String> keys = ["MIN","PTS","3PM","REB","AST","STL","BLK","FTM","TO","FOUL","FG","FT","3P"];
        item(List<NbaGameDetailGameDataPlayerScores> list,bool isStarter){
      return SizedBox(
        height: 29.w+34.w*list.length,
        child: SfDataGridTheme(
            data: const SfDataGridThemeData(
                gridLineColor: AppColors.cE6E6E6,
                frozenPaneLineColor: Colors.transparent,
                rowHoverColor: Colors.blue,
                gridLineStrokeWidth: 0),
            child: SfDataGrid(
              frozenColumnsCount: 1,
              rowHeight: 34.w,
              headerRowHeight: 29.w,
              verticalScrollPhysics: const NeverScrollableScrollPhysics(),
              gridLinesVisibility: GridLinesVisibility.horizontal,
              source: ScoresPlayerDetailDatasource(list),
              columns: [
                GridColumn(
                    columnName: 'id',
                    width: 130.w,
                    label: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 19.w),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.cD1D1D1, width: 1))),
                      child: Text(
                        isStarter?'STARTERS':'BENCH',
                      ),
                    )),
                ...keys.map((e) {
                  return GridColumn(
                      columnName: e,
                      width: 50.w,
                      label: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.cD1D1D1, width: 1))),
                        child: Text(
                          e,
                        ),
                      ));
                })
              ],
            )),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          item(starterList,true),
          const Divider(color: AppColors.cE6E6E6,height: 1,),
          item(notStarterList,false),
        ],
      ),
    );
  }
}
