import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/11/21/16:22

class GameGridSource extends DataGridSource {
  GameGridSource(this.nbaGameDetailEntity, this.controller);

  final NbaGameDetailEntity nbaGameDetailEntity;
  final LeagueDetailPlayController controller;

  List<DataGridRow> _buildDataGridRows() {
    List<DataGridRow> result = [];
    List<DataGridCell<dynamic>> list =
        getQuarters(nbaGameDetailEntity.gameData.homeTeamScore!);
    List<DataGridCell<dynamic>> list2 =
        getQuarters(nbaGameDetailEntity.gameData.awayTeamScore!);
    result.add(DataGridRow(cells: list));
    result.add(DataGridRow(cells: list2));
    return result;
  }

  List<DataGridCell<dynamic>> getQuarters(
      NbaGameDetailGameDataTeamScore teamScore) {
    List<DataGridCell<dynamic>> list = [];
    list.add(DataGridCell<int>(columnName: 'id', value: teamScore.teamId));
    var list2 = controller.getQuarterColumnNames().map((e) {
      int value = 0;
      if (e == "1st") {
        value = teamScore.quarter1;
      } else if (e == "2nd") {
        value = teamScore.quarter2;
      } else if (e == "3rd") {
        value = teamScore.quarter3;
      } else if (e == "4th") {
        value = teamScore.quarter4;
      } else {
        value = teamScore.toJson()[e] ?? 0;
      }
      return DataGridCell<int>(columnName: '4th', value: value);
    }).toList();
    list.addAll(list2);
    list.add(DataGridCell<int>(columnName: 'total', value: teamScore.total));
    return list;
  }

  @override
  List<DataGridRow> get rows => _buildDataGridRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().map((e) {
      if (e.columnName == "id") {
        var teamInfo = Utils.getTeamInfo(e.value);
        return Container(
          margin: EdgeInsets.only(left: 16.w),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                  color: AppColors.cE6E6E6,width: 1
              ))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                url: Utils.getTeamUrl(teamInfo.id),
                width: 20.w,
              ),
              Text(
                teamInfo.shortEname,
                style: 12.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              )
            ],
          ),
        );
      }
      if (e.columnName == "total") {
        return Container(
          margin: EdgeInsets.only(right: 16.w),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(
                  color: AppColors.cE6E6E6,width: 1
              ),left: BorderSide(
                  color: AppColors.cE6E6E6,width: 1
              ),)
          ),
          child: Center(
            child: Text(
              (e.value==0?"--":e.value).toString(),
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
            border: Border(bottom: BorderSide(
                color: AppColors.cE6E6E6,width: 1
            ))
        ),
        child: Center(
          child: Text(
            (e.value==0?"--":e.value).toString(),
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
