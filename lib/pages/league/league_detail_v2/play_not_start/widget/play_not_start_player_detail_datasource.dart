import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/11/22/14:53

class PlayNotStartPlayerDetailDatasource extends DataGridSource{
  PlayNotStartPlayerDetailDatasource(this.playerScores);

  final List<TeamPlayer> playerScores;

  List<DataGridRow> _buildRows(){
    List<List<DataGridCell>> map = playerScores.map((e){
      List<DataGridCell> cells = [];
      cells.add(DataGridCell(columnName: "id", value: e.playerId));
      cells.add(DataGridCell(columnName: "MIN", value: e.min));
      cells.add(DataGridCell(columnName: "PTS", value: e.pts));
      cells.add(DataGridCell(columnName: "3PM", value: e.fg3M));
      cells.add(DataGridCell(columnName: "REB", value: e.reb));
      cells.add(DataGridCell(columnName: "AST", value: e.ast));
      cells.add(DataGridCell(columnName: "STL", value: e.stl));
      cells.add(DataGridCell(columnName: "BLK", value: e.blk));
      cells.add(DataGridCell(columnName: "FTM", value: e.ftm));
      cells.add(DataGridCell(columnName: "TO", value: e.tov));
      cells.add(DataGridCell(columnName: "FOUL", value: e.pf));
      cells.add(DataGridCell(columnName: "FG", value: "${e.fgm}-${e.fga}"));
      cells.add(DataGridCell(columnName: "FT", value: "${e.ftm}-${e.fta}"));
      cells.add(DataGridCell(columnName: "3P", value: "${e.fgm}-${e.fga}"));
      return cells;
    }).toList();
    List<DataGridRow> list = map.fold(<DataGridRow>[], (p,e){
      p.add(DataGridRow(cells: e));
      return p;
    });
    return list;
  }

  @override
  List<DataGridRow> get rows => _buildRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().map((e){
      if(e.columnName == "id"){
        return Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(
              color: AppColors.cE6E6E,
              width: 1
            ))
          ),
          padding: EdgeInsets.only(left: 19.w,right: 5.w),
            child: Text(Utils.getPlayBaseInfo(e.value).ename,maxLines:2,style: TextStyle(
              fontSize: 12.sp,
                color: AppColors.c000000,fontFamily: FontFamily.fRobotoRegular,
              decoration: TextDecoration.underline
            ),));
      }
      return FittedBox(
        fit: BoxFit.scaleDown,
          child: Center(child: Text("${e.value}",style: 12.w4(color: AppColors.c4D4D4D,height: 1,fontFamily: FontFamily.fRobotoRegular),)));
    }).toList();
    return DataGridRowAdapter(cells: cells);
  }
}