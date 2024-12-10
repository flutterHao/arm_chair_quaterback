import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/12/6/11:35
///

class LineOne{
  final BattleTeam team;
  final Color color;

  LineOne(this.team, this.color);
}

class QuarterGridSource extends DataGridSource {
  QuarterGridSource(this.controller, this.quarter);

  final TeamBattleV2Controller controller;
  final List<String> quarter;

  List<DataGridRow> _buildDataGridRows() {
    List<DataGridRow> result = [];
    List<DataGridCell<dynamic>> list = getQuarters(controller.eventOnScreenMap,
        true, LineOne(controller.battleEntity.homeTeam, AppColors.cD60D20));
    List<DataGridCell<dynamic>> list2 = getQuarters(controller.eventOnScreenMap,
        false, LineOne(controller.battleEntity.awayTeam, AppColors.c1F8FE5));
    result.add(DataGridRow(cells: list));
    result.add(DataGridRow(cells: list2));
    return result;
  }

  List<DataGridCell<dynamic>> getQuarters(
      Map<String, List<GameEvent>> events, bool isHome, LineOne teamId) {
    List<DataGridCell<dynamic>> list = [];
    list.add(DataGridCell<LineOne>(columnName: 'id', value: teamId));
    var list2 = quarter.map((e) {
      int value = 0;
      if (events.containsKey(e)) {
        var event = events[e]!;
        value =
            isHome ? event.last.quarterHomeScore : event.last.quarterAwayScore;
      }
      return DataGridCell<int>(columnName: '4th', value: value);
    }).toList();
    list.addAll(list2);
    var value2 = 0;
    if (events.isNotEmpty) {
      var key = events.keys.last;
      value2 =
          isHome ? events[key]!.last.homeScore : events[key]!.last.awayScore;
    }
    list.add(DataGridCell<int>(columnName: 'total', value: value2));
    return list;
  }

  @override
  List<DataGridRow> get rows => _buildDataGridRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().map((e) {
      if (e.columnName == "id") {
        LineOne teamInfo = e.value;
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
                  border: Border.all(color: teamInfo.color,width: 1.w)
                ),
                child: ImageWidget(
                  url: Utils.getAvaterUrl(teamInfo.team.teamLogo),
                  borderRadius: BorderRadius.circular(10.w),
                  width: 20.w,
                  height: 20.w,
                ),
              ),
              5.hGap,
              Text(
                teamInfo.team.teamName,
                style: 12.w4(
                    color: AppColors.c000000,
                    height: 1,
                    overflow: TextOverflow.ellipsis,
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
