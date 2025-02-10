import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/widget/player_detail_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/11/22/14:14

class PlayerDetail extends StatefulWidget {
  const PlayerDetail(this.event, {super.key});

  final GameEvent event;

  @override
  State<PlayerDetail> createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeInfo = Get.find<TeamBattleV2Controller>().battleEntity.homeTeam;
    var awayInfo = Get.find<TeamBattleV2Controller>().battleEntity.awayTeam;
    return Column(
      children: [
        SizedBox(
          height: 40.w,
          child: TabBar(
              controller: tabController,
              indicatorColor: AppColors.cFF7954,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: AppColors.cD1D1D1,
              overlayColor: null,
              labelStyle:
                  16.w5(height: 1, fontFamily: FontFamily.fOswaldMedium),
              labelColor: AppColors.c000000,
              unselectedLabelStyle:
                  16.w5(height: 1, fontFamily: FontFamily.fOswaldMedium),
              unselectedLabelColor: AppColors.c000000.withOpacity(0.5),
              tabs: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.c1F8FE5, width: 1.w),
                          borderRadius: BorderRadius.circular(15.w)),
                      child: ImageWidget(
                        url: Utils.getAvatarUrl(homeInfo.teamLogo),
                        imageFailedPath: Assets.teamUiHead01,
                        width: 28.w,
                        height: 28.w,
                        borderRadius: BorderRadius.circular(14.w),
                      ),
                    ),
                    7.hGap,
                    Text(
                      homeInfo.teamName,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      awayInfo.teamName,
                    ),
                    7.hGap,
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.cD60D20, width: 1.w),
                          borderRadius: BorderRadius.circular(15.w)),
                      child: ImageWidget(
                        url: Utils.getAvatarUrl(awayInfo.teamLogo),
                        imageFailedPath: Assets.teamUiHead03,
                        width: 28.w,
                        height: 28.w,
                        borderRadius: BorderRadius.circular(14.w),
                      ),
                    ),
                  ],
                )
              ]),
        ),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            _buildTabViewItem(Get.find<TeamBattleV2Controller>()
                .pkResultUpdatedEntity!
                .homeTeamResult
                .scoreBoardDetailList),
            _buildTabViewItem(Get.find<TeamBattleV2Controller>()
                .pkResultUpdatedEntity!
                .awayTeamResult
                .scoreBoardDetailList),
          ]),
        )
      ],
    );
  }

  Widget _buildTabViewItem(List<ScoreBoardDetailList> playerScores) {
    List<String> keys = [
      "MIN",
      "PTS",
      "3PM",
      "REB",
      "AST",
      "STL",
      "BLK",
      "FTM",
      "TO",
      "FOUL",
      "FG",
      "FT",
      "3P"
    ];
    item(List<ScoreBoardDetailList> list) {
      return SizedBox(
        height: 29.w + 34.w * list.length,
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
              showHorizontalScrollbar: false,
              gridLinesVisibility: GridLinesVisibility.horizontal,
              source: PlayerDetailDatasource(list),
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
                        'Player',
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
          item(playerScores),
        ],
      ),
    );
  }
}
