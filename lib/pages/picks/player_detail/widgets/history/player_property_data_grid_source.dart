import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlayerPropertyDataGridSource extends DataGridSource {
  PlayerPropertyDataGridSource({required this.data});

  final List<SeasonHistoryItems> data;

  /// Build DataGridRows
  List<DataGridRow> _buildDataGridRows() {
    List<DataGridRow> result = [];
    for (int i = 0; i < data.length; i++) {
      var items = data[i];
      var list = <DataGridCell<dynamic>>[
        DataGridCell<int>(columnName: 'id', value: i),
        DataGridCell<Map>(columnName: 'opp', value: {
          "id": i,
          "text": items.teamEntity.shortEname,
        }),
      ];
      var list2 = items.playerSeasonGameEntity
          .toJson()
          .keys
          .map((e) => DataGridCell<dynamic>(columnName: e, value: {
                "id": i,
                "value": items.playerSeasonGameEntity.toJson()[e]
              }))
          .toList();
      list.addAll(list2);
      var where =
          list.where((e) => !excludeKeys.contains(e.columnName)).toList();
      var dataGridRow = DataGridRow(cells: where);
      result.add(dataGridRow);
    }
    return result;
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
  List<DataGridRow> get rows => _buildDataGridRows();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    var playerSeasonGameRankEntity = data[0].playerSeasonGameRankEntity;
    List<Widget> cells = [];
    for (int i = 0; i < row.getCells().length; i++) {
      var value = row.getCells()[i].value;
      var columnName = row.getCells()[i].columnName;
      var avgValue = playerSeasonGameRankEntity.toJson()[
              (columnName == "to" ? "TOV" : columnName).toUpperCase()] ??
          0;
      Widget widget;
      if (i == 0) {
        value = value + 1;
        widget = Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 1.w,
            color: value == rows.length
                ? AppColors.cTransparent
                : AppColors.cE6E6E6,
          ))),
          child: Text(
            value.toString(),
            style: 10.w4(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular,
                overflow: TextOverflow.ellipsis),
          ),
        );
      } else if (i == 1) {
        Map map = value;
        widget = Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    width: 1.w,
                    color: value["id"] == rows.length - 1
                        ? AppColors.cTransparent
                        : AppColors.cE6E6E6,
                  ),
                  right: BorderSide(
                    color: AppColors.cE6E6E6,
                    width: 1.w,
                  ))),
          child: Text(
            map['text'].toString(),
            style: 10.w4(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular,
                overflow: TextOverflow.ellipsis),
          ),
        );
      } else {
        Map map = value;
        widget = Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: map['id'] == rows.length - 1
                  ? AppColors.cTransparent
                  : AppColors.cE6E6E6,
              width: 1.w,
            ),
          )),
          child: Text(
            map["value"].toString(),
            style: 12.w4(
                color: map["value"] > avgValue ? AppColors.c000000 : AppColors.c4D4D4D,
                height: 1,
                fontFamily: map["value"] > avgValue
                    ? FontFamily.fRobotoMedium
                    : FontFamily.fRobotoRegular,
                overflow: TextOverflow.ellipsis),
          ),
        );
      }
      cells.add(widget);
    }
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
