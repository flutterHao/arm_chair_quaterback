import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
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
        DataGridCell<int>(
            columnName: 'id',
            value: items.playerSeasonGameEntity.gameStartTime),
        DataGridCell<Map>(columnName: 'opp', value: {
          "id": i,
          "text": items.teamEntity.shortEname,
          "win": items.playerSeasonGameEntity.teamId ==
                  items.playerSeasonGameEntity.homeTeamId
              ? (items.playerSeasonGameEntity.homeTeamScore >
                  items.playerSeasonGameEntity.awayTeamScore)
              : (items.playerSeasonGameEntity.awayTeamScore >
                  items.playerSeasonGameEntity.homeTeamScore)
        }),
      ];
      list.add(DataGridCell<dynamic>(
          columnName: 'MIN',
          value: {"id": i, "value": items.playerSeasonGameEntity.min}));
      list.add(DataGridCell<dynamic>(
          columnName: 'PTS',
          value: {"id": i, "value": items.playerSeasonGameEntity.pts}));
      list.add(DataGridCell<dynamic>(
          columnName: 'FGM',
          value: {"id": i, "value": items.playerSeasonGameEntity.fgm}));
      list.add(DataGridCell<dynamic>(
          columnName: 'FGA',
          value: {"id": i, "value": items.playerSeasonGameEntity.fga}));
      list.add(DataGridCell<dynamic>(
          columnName: 'REB',
          value: {"id": i, "value": items.playerSeasonGameEntity.reb}));
      list.add(DataGridCell<dynamic>(
          columnName: 'OREB',
          value: {"id": i, "value": items.playerSeasonGameEntity.oreb}));
      list.add(DataGridCell<dynamic>(
          columnName: 'DREB',
          value: {"id": i, "value": items.playerSeasonGameEntity.dreb}));
      list.add(DataGridCell<dynamic>(
          columnName: 'AST',
          value: {"id": i, "value": items.playerSeasonGameEntity.ast}));
      list.add(DataGridCell<dynamic>(
          columnName: 'BLK',
          value: {"id": i, "value": items.playerSeasonGameEntity.blk}));
      list.add(DataGridCell<dynamic>(
          columnName: 'STL',
          value: {"id": i, "value": items.playerSeasonGameEntity.stl}));
      list.add(DataGridCell<dynamic>(
          columnName: 'FTM',
          value: {"id": i, "value": items.playerSeasonGameEntity.ftm}));
      list.add(DataGridCell<dynamic>(
          columnName: 'FTA',
          value: {"id": i, "value": items.playerSeasonGameEntity.fta}));
      list.add(DataGridCell<dynamic>(
          columnName: 'PF',
          value: {"id": i, "value": items.playerSeasonGameEntity.pf}));
      list.add(DataGridCell<dynamic>(
          columnName: 'TO',
          value: {"id": i, "value": items.playerSeasonGameEntity.to}));
      var dataGridRow = DataGridRow(cells: list);
      result.add(dataGridRow);
    }
    return result;
  }

  static List<String> get ppKeys => [
        "MIN",
        "PTS",
        "FGM",
        "FGA",
        "REB",
        "OREB",
        "DREB",
        "AST",
        "BLK",
        "STL",
        "FTM",
        "FTA",
        "PF",
        "TO"
      ];

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
        widget = Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16.w),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 1.w,
            color: value == rows.length
                ? AppColors.cTransparent
                : AppColors.cE6E6E6,
          ))),
          child: Text(
            MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(value),
                format: DateFormats.PARAM_M_D),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                map['text'].toString(),
                style: 10.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular,
                    overflow: TextOverflow.ellipsis),
              ),
              5.hGap,
              Text(
                map['win']?"W":"L",
                style: 10.w4(
                    color: map['win']?AppColors.c0FA76C:AppColors.cE71629,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
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
            (map["value"] as double).formatToString(),
            style: 12.w4(
                color: map["value"] > avgValue
                    ? AppColors.c000000
                    : AppColors.c4D4D4D,
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
