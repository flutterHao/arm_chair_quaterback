import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_grid_source.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/controller.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:collection/collection.dart';

class HistoryQuarterWidget extends StatelessWidget {
  const HistoryQuarterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var list = ['1st', '2nd', '3rd', '4th'];
    return Container(
      height: 122.w,
      // margin: EdgeInsets.only(top: hasTopMargin ? 9.w : 0),
      margin: EdgeInsets.only(top: 9.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: SfDataGridTheme(
          data: const SfDataGridThemeData(
              gridLineColor: AppColors.cTransparent,
              frozenPaneLineColor: AppColors.cTransparent,
              rowHoverColor: AppColors.c10A86A,
              gridLineStrokeWidth: 0),
          child: SfDataGrid(
            frozenColumnsCount: 1,
            footerFrozenColumnsCount: 1,
            rowHeight: 34.w,
            headerRowHeight: 30.w,
            gridLinesVisibility: GridLinesVisibility.none,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            source: HistoryQuarterGridSource(list),
            // source: DataGridSource(teamBattleV2Controller, list),
            columns: [
              GridColumn(
                  columnName: 'id',
                  width: 130.w,
                  label: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.cD1D1D1, width: 1))),
                    child: const Text(
                      '',
                    ),
                  )),
              ...list.map((e) {
                return GridColumn(
                    columnName: e,
                    width: 38.w,
                    label: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.cD1D1D1, width: 1))),
                      child: Text(
                        e,
                        style: 12.w5(
                            color: AppColors.c4D4D4D,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ));
              }),
              GridColumn(
                  columnName: 'total',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 16.w),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.cD1D1D1, width: 1))),
                    child: Text(
                      'Total',
                      style: 12.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium),
                    ),
                  )),
            ],
          )),
    );
  }
}

class HistoryLineOne {
  final GameResultInfoEntity team;
  final Color color;

  HistoryLineOne(this.team, this.color);
}

class HistoryQuarterGridSource extends DataGridSource {
  HistoryQuarterGridSource(this.quarter);

  // final TeamBattleV2Controller controller;
  final List<String> quarter;
  final TeamHistortyController controller = Get.find();
  List<DataGridRow> _buildDataGridRows() {
    List<DataGridRow> result = [];
    List<DataGridCell<dynamic>> list = getQuarters(true,
        HistoryLineOne(controller.gameResultInfoEntity, AppColors.c1F8FE5));
    List<DataGridCell<dynamic>> list2 = getQuarters(false,
        HistoryLineOne(controller.gameResultInfoEntity, AppColors.cD60D20));
    result.add(DataGridRow(cells: list));
    result.add(DataGridRow(cells: list2));
    return result;
  }

  List<DataGridCell<dynamic>> getQuarters(bool isHome, HistoryLineOne teamId) {
    List<DataGridCell<dynamic>> list = [];
    list.add(DataGridCell<HistoryLineOne>(columnName: 'id', value: teamId));
    var list2 = quarter.map((e) {
      int value = 0;
      // if (events.containsKey(e)) {
      //   var event = events[e]!;
      //   value =
      //       isHome ? event.last.quarterHomeScore : event.last.quarterAwayScore;
      // }
      return DataGridCell<int>(columnName: '4th', value: value);
    }).toList();
    list.addAll(list2);
    var value2 = 0;
    // if (events.isNotEmpty) {
    //   var key = events.keys.last;
    //   value2 =
    //       isHome ? events[key]!.last.homeScore : events[key]!.last.awayScore;
    // }
    list.add(DataGridCell<int>(columnName: 'total', value: value2));
    return list;
  }

  @override
  List<DataGridRow> get rows => _buildDataGridRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().mapIndexed((index, e) {
      if (e.columnName == "id") {
        HistoryLineOne teamInfo = e.value;
        return Container(
          margin: EdgeInsets.only(left: 16.w),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.cE6E6E6, width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.hGap,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.w),
                    border: Border.all(color: teamInfo.color, width: 1.w)),
                child: ImageWidget(
                  url:
                      Utils.getAvaterUrl(teamInfo.team.homeTeamResult.teamLogo),
                  borderRadius: BorderRadius.circular(10.w),
                  imageFailedPath: Assets.teamUiHead03,
                  width: 20.w,
                  height: 20.w,
                ),
              ),
              5.hGap,
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      teamInfo.team.homeTeamResult.teamName,
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
      if (e.columnName == "total") {
        return Container(
          margin: EdgeInsets.only(right: 16.w),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: AppColors.cE6E6E6, width: 1),
            left: BorderSide(color: AppColors.cE6E6E6, width: 1),
          )),
          child: Center(
            child: Text(
              (e.value == 0 ? "--" : e.value).toString(),
              style: 12.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoMedium),
            ),
          ),
        );
      }
      return Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.cE6E6E6, width: 1))),
        child: Center(
          child: Text(
            (e.value == 0 ? "--" : e.value).toString(),
            textAlign: TextAlign.center,
            style: 12.w5(
                color: AppColors.c4D4D4D,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          ),
        ),
      );
    }).toList();
    return DataGridRowAdapter(cells: cells);
  }
}
