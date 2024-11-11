import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlayerPropertyDataGridSource extends DataGridSource {
  PlayerPropertyDataGridSource({required this.data}) {
    _buildDataGridRows();
  }

  final List<SeasonHistoryItems> data;

  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  /// Build DataGridRows
  void _buildDataGridRows() {
    List<DataGridRow> result = [];
    for (int i = 0; i < data.length; i++) {
      var items = data[i];
      var list = <DataGridCell<dynamic>>[
        DataGridCell<int>(columnName: 'id', value: i),
        DataGridCell<String>(
            columnName: 'opp', value: items.teamEntity.shortEname),
      ];
      var list2 = items.playerSeasonGameEntity
          .toJson()
          .keys
          .map((e) => DataGridCell<dynamic>(
              columnName: e, value: items.playerSeasonGameEntity.toJson()[e]))
          .toList();
      list.addAll(list2);
      var where =
          list.where((e) => !excludeKeys.contains(e.columnName)).toList();
      var dataGridRow = DataGridRow(cells: where);
      result.add(dataGridRow);
    }
    _dataGridRows = result;
  }

  static List<String> get excludeKeys => [
        "espnId",
        "isStarter",
        "playerId",
        "gameId",
        "updateTime",
        "ename",
        "createTime",
        "teamId",
        "awayTeamId",
        "threePm",
        "threePa"
      ];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    var playerSeasonGameRankEntity = data[0].playerSeasonGameRankEntity;
    List<Widget> cells = [];
    for (int i = 0; i < row.getCells().length; i++) {
      var value = row.getCells()[i].value;
      var columnName = row.getCells()[i].columnName;
      var avgValue = playerSeasonGameRankEntity
          .toJson()[(columnName == "to" ? "TOV" : columnName).toUpperCase()]??0;
      Widget widget;
      if (i == 0 || i == 1) {
        if(i == 0){
          value = value+1;
        }
        widget = Container(
          alignment: Alignment.center,
          child: Text(
            value.toString(),
            style: 10.w4(
                color: AppColors.c666666,
                height: 1,
                overflow: TextOverflow.ellipsis),
          ),
        );
      } else if (i == 2) {
        widget = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 8.w, bottom: 1.w),
          decoration: BoxDecoration(
              color: value > avgValue
                  ? AppColors.c6DE9B6
                  : value == avgValue
                      ? AppColors.cF2E2AC
                      : AppColors.cFEC4C8,
              borderRadius: BorderRadius.circular(2.w)),
          child: Text(
            value.toString(),
            style: 10.w4(
                color: AppColors.c666666,
                height: 1,
                overflow: TextOverflow.ellipsis),
          ),
        );
      } else {
        widget = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 2.w, bottom: 1.w),
          decoration: BoxDecoration(
              color: value > avgValue
                  ? AppColors.c6DE9B6
                  : value == avgValue
                      ? AppColors.cF2E2AC
                      : AppColors.cFEC4C8,
              borderRadius: BorderRadius.circular(2.w)),
          child: Text(
            value.toString(),
            style: 10.w4(
                color: AppColors.c262626,
                height: 1,
                overflow: TextOverflow.ellipsis),
          ),
        );
      }
      cells.add(widget);
    }
    print('cells:${cells.length}');
    return DataGridRowAdapter(cells: cells);
  }

  /// Update DataSource
  void updateDataSource() {
    notifyListeners();
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    return super.compare(a, b, sortColumn);
  }
}
