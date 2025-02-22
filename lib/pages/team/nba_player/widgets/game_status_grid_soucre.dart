import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/o_v_r_rank_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GameStatusGridSoucre extends DataGridSource {
  GameStatusGridSoucre(this.data, this.context);
  final List<OVRRankPlayerInfoGameStats> data;
  final BuildContext context;
  List<DataGridRow> _buildDataGridRows() {
    var list = data.map((e) {
      List<DataGridCell<dynamic>> data = [];
      data.add(DataGridCell<OVRRankPlayerInfoGameStats>(columnName: 'date', value: e));
      data.add(DataGridCell<OVRRankPlayerInfoGameStats>(columnName: 'opp', value: e));
      data.add(DataGridCell<OVRRankPlayerInfoGameStats>(columnName: 'power', value: e));
      data.add(DataGridCell<OVRRankPlayerInfoGameStats>(columnName: 'ovr', value: e));
      return DataGridRow(cells: data);
    }).toList();

    return list;
  }

  List<DataGridRow> get rows => _buildDataGridRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().map((e) {
      OVRRankPlayerInfoGameStats playerInfoGameStats = e.value as OVRRankPlayerInfoGameStats;
      if (e.columnName == "date") {
        return Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: AppColors.cD1D1D1,
          ))),
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            MyDateUtils.formatDate(DateTime.fromMillisecondsSinceEpoch(playerInfoGameStats.schedule.gameStartTime),
                format: 'MM/dd/yy'),
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.c4D4D4D,
              fontFamily: FontFamily.fRobotoRegular,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      } else if (e.columnName == "opp") {
        bool isWin = playerInfoGameStats.schedule.homeTeamScore >= playerInfoGameStats.schedule.awayTeamScore;
        return Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: AppColors.cD1D1D1,
                  ),
                  right: BorderSide(
                    color: AppColors.cD1D1D1,
                  ))),
          padding: EdgeInsets.only(left: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Utils.getTeamInfo(playerInfoGameStats.schedule.awayTeamId).shortEname,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.c4D4D4D,
                  fontFamily: FontFamily.fRobotoRegular,
                  decoration: TextDecoration.underline,
                ),
              ),
              4.hGap,
              isWin
                  ? Text(
                      'W',
                      style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.c0FA76C),
                    )
                  : Text(
                      'L',
                      style: 12.w5(fontFamily: FontFamily.fRobotoRegular, color: AppColors.cE34D4D),
                    )
            ],
          ),
        );
      } else if (e.columnName == "power") {
        int differencePower = playerInfoGameStats.power - playerInfoGameStats.afterPower;
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 40.w),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: AppColors.cD1D1D1),
          )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${playerInfoGameStats.power}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.c4D4D4D,
                  fontFamily: FontFamily.fRobotoRegular,
                  decoration: TextDecoration.underline,
                ),
              ),
              4.hGap,
              Row(
                children: [
                  Transform.rotate(
                    angle: differencePower >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
                    child: Image.asset(
                      Assets.commonUiCommonIconSystemArrow,
                      width: 5.w,
                      height: 8.w,
                      color: differencePower >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                    ),
                  ),
                  4.hGap,
                  Text(
                    '${differencePower.abs()}',
                    style: 12.w5(
                        fontFamily: FontFamily.fRobotoRegular,
                        color: differencePower >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D),
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        int differenceOVR = playerInfoGameStats.oVR - playerInfoGameStats.afterOVR;
        return Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: AppColors.cD1D1D1,
                  ),
                  right: BorderSide(
                    color: AppColors.cD1D1D1,
                  ))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${playerInfoGameStats.oVR}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.c4D4D4D,
                  fontFamily: FontFamily.fRobotoRegular,
                  decoration: TextDecoration.underline,
                ),
              ),
              4.hGap,
              Row(
                children: [
                  Transform.rotate(
                    angle: differenceOVR >= 0 ? -pi / 180 * 90 : pi / 180 * 90,
                    child: Image.asset(
                      Assets.commonUiCommonIconSystemArrow,
                      width: 5.w,
                      height: 8.w,
                      color: differenceOVR >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D,
                    ),
                  ),
                  4.hGap,
                  Text(
                    '${differenceOVR.abs()}',
                    style: 12.w5(
                        fontFamily: FontFamily.fRobotoRegular,
                        color: differenceOVR >= 0 ? AppColors.c0FA76C : AppColors.cE34D4D),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    }).toList();
    return DataGridRowAdapter(cells: cells);
  }
}
