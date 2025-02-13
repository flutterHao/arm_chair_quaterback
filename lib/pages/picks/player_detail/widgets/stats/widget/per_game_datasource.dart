import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/stats/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2025/1/16/11:02

class PerGameDatasource extends DataGridSource {
  PerGameDatasource(this.data);

  final List<SeasonItem> data;

  List<DataGridRow> _buildRows() {
    List<List<DataGridCell>> map = data.map((e) {
      List<DataGridCell> cells = [];
      cells.add(DataGridCell(columnName: "season", value: e.season));
      cells.add(DataGridCell(columnName: "value", value: e.value));
      cells.add(DataGridCell(columnName: "gp", value: e.gp));
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
      if (e.columnName == "season") {
        var start = e.value%100;
        var end = start +1;
        return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border: Border(
              right: BorderSide(color: AppColors.cE6E6E6, width: 1),
              bottom: BorderSide(color: AppColors.cE6E6E6, width: 1),
            )),
            margin: EdgeInsets.only(left: 16.w),
            child: Text(
              "$start-$end",
              style: 12.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            ));
      }else if (e.columnName == "value") {
        return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 16.w),
            decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.cE6E6E6, width: 1),
                )),
            child: Text(
              "${(e.value as double).format()}",
              style: 12.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoMedium),
            ));
      }else{
        return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.cE6E6E6, width: 1),
                )),
            margin: EdgeInsets.only(right: 16.w),
            child: Container(
              padding: EdgeInsets.only(
                right: 29.w,left: 16.w),
              child: Text(
                "${e.value}",
                style: 12.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular),
              ),
            ));
      }
    }).toList();
    return DataGridRowAdapter(cells: cells);
  }
}
