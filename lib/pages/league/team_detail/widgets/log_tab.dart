/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 15:05:53
 * @LastEditTime: 2025-01-03 19:03:25
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LogTab extends GetView<TeamDetailController> {
  const LogTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTabViewItem([]);
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: controller.yearList.length,
        separatorBuilder: (context, index) {
          return Container(
            height: 1,
            width: double.infinity,
            color: AppColors.cD1D1D1,
          );
        },
        itemBuilder: (context, index) {
          return Theme(
            data: ThemeData(
              dividerColor: AppColors.cTransparent,
            ),
            child: ExpansionTile(
                title: Text(
                  controller.yearList[index],
                  style: 24.w4(
                    fontFamily: FontFamily.fOswaldBold,
                    color: AppColors.c262626,
                  ),
                ),
                children: [_Item()]),
          );
        });
  }
}

class _Item extends GetView<TeamDetailController> {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.cD1D1D1,
            ),
          ),
        ),
        child: _buildTabViewItem([]));
  }
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
                  width: 70.w,
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

class PlayerDetailDatasource extends DataGridSource {
  PlayerDetailDatasource(this.playerScores);

  final List<ScoreBoardDetailList> playerScores;

  List<DataGridRow> _buildRows() {
    List<List<DataGridCell>> map = playerScores.map((e) {
      List<DataGridCell> cells = [];
      cells.add(DataGridCell(columnName: "id", value: e.playerId));
      cells.add(DataGridCell(columnName: "MIN", value: e.min));
      cells.add(DataGridCell(columnName: "PTS", value: e.pts));
      cells.add(DataGridCell(columnName: "3PM", value: e.threePm));
      cells.add(DataGridCell(columnName: "REB", value: e.reb));
      cells.add(DataGridCell(columnName: "AST", value: e.ast));
      cells.add(DataGridCell(columnName: "STL", value: e.stl));
      cells.add(DataGridCell(columnName: "BLK", value: e.blk));
      cells.add(DataGridCell(columnName: "FTM", value: e.ftm));
      cells.add(DataGridCell(columnName: "TO", value: e.to));
      cells.add(DataGridCell(columnName: "FOUL", value: e.pf));
      cells.add(DataGridCell(columnName: "FG", value: "${e.fgm}-${e.fga}"));
      cells.add(DataGridCell(columnName: "FT", value: "${e.ftm}-${e.fta}"));
      cells.add(
          DataGridCell(columnName: "3P", value: "${e.threePm}-${e.threePa}"));
      return cells;
    }).toList();
    List<DataGridRow> list = map.fold(<DataGridRow>[], (p, e) {
      p.add(DataGridRow(cells: e));
      return p;
    });
    return list;
  }

  @override
  List<DataGridRow> get rows => _buildRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().map((e) {
      if (e.columnName == "id") {
        var baseInfo = Utils.getPlayBaseInfo(e.value);
        return Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(color: AppColors.cE6E6E, width: 1))),
            padding: EdgeInsets.only(left: 19.w, right: 9.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    baseInfo.ename,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.c000000,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontFamily.fRobotoRegular,
                        decoration: TextDecoration.underline),
                  ),
                ),
                9.hGap,
                if (baseInfo.number > 0)
                  Text(
                    "#${baseInfo.number}",
                    style: 12.w4(
                        color: AppColors.cB3B3B3,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                  )
              ],
            ));
      }
      return FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
              child: Text(
            "${e.value}",
            style: 12.w4(
                color: AppColors.c4D4D4D,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          )));
    }).toList();
    return DataGridRowAdapter(cells: cells);
  }
}
