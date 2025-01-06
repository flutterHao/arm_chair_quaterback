import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/player_status/controllr.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/big_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/12/16/10:35

class PlayerStatusGridSource extends DataGridSource {
  PlayerStatusGridSource(this.data, this.context);

  final List<PlayerStatus> data;
  final BuildContext context;

  List<DataGridRow> _buildDataGridRows() {
    var list = data.map((e) {
      List<DataGridCell<dynamic>> data = [];
      data.add(DataGridCell<dynamic>(columnName: 'player', value: e));
      data.add(DataGridCell<dynamic>(columnName: 'morale', value: e.morale));
      data.add(DataGridCell<dynamic>(columnName: 'status', value: e.status));
      data.add(DataGridCell<dynamic>(columnName: 'score', value: e));
      return DataGridRow(cells: data);
    }).toList();

    return list;
  }

  List<DataGridRow> get rows => _buildDataGridRows();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    List<Widget> cells = row.getCells().map((e) {
      if (e.columnName == "player") {
        PlayerStatus playerStatus = e.value as PlayerStatus;
        return Container(
          padding: EdgeInsets.only(left: 20.w, right: 5.w),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
            right: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MtInkwell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: BigPlayerCard(
                            playerId: playerStatus.playerId,
                          ),
                        );
                      });
                },
                child: Container(
                  constraints: BoxConstraints(maxWidth: 70.w),
                  child: Text(
                    playerStatus.playerInfo.elname.isEmpty
                        ? playerStatus.playerInfo.ename
                        : playerStatus.playerInfo.elname,
                    style: TextStyle(
                        color: AppColors.c000000,
                        height: 1,
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                        fontFamily: FontFamily.fRobotoRegular,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
              if (playerStatus.playerInfo.number > 0)
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "#${playerStatus.playerInfo.number}",
                    style: TextStyle(
                        color: AppColors.cB3B3B3,
                        height: 1,
                        fontSize: 12.sp,
                        fontFamily: FontFamily.fRobotoRegular,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              if (playerStatus.isMvp)
                Container(
                  margin: EdgeInsets.only(left: 7.w),
                  child: Text(
                    "MVP",
                    style: 14.w7(
                      color: AppColors.cFF7954,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold,
                    ),
                  ),
                )
            ],
          ),
        );
      } else if (e.columnName == "morale") {
        return Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(e.value as double).formatToString()}%",
                style: 12.w4(
                    color: AppColors.c4D4D4D,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular),
              ),
              4.hGap,
              Container(
                width: 34.w,
                height: 6.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.cD1D1D1, width: 1.w),
                    borderRadius: BorderRadius.circular(3.w)),
                child: LinearProgressIndicator(
                  value: e.value / 100,
                  backgroundColor: AppColors.cFFFFFF,
                  color: Utils.getChartColor(e.value),
                ),
              )
            ],
          ),
        );
      } else if (e.columnName == "status") {
        return Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
            )),
            child:
                IconWidget(iconWidth: 20.w, icon: Utils.getStatusUrl(e.value)));
      }
      PlayerStatus playerStatus = e.value as PlayerStatus;
      return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: AppColors.cD1D1D1, width: 1.w),
        )),
        child: Center(
          child: Text(
            playerStatus.score.toStringAsFixed(1),
            style: 12.w5(
                color:
                    playerStatus.isMvp ? AppColors.c000000 : AppColors.c4D4D4D,
                fontFamily: playerStatus.isMvp
                    ? FontFamily.fRobotoMedium
                    : FontFamily.fRobotoRegular,
                height: 1),
          ),
        ),
      );
    }).toList();
    return DataGridRowAdapter(cells: cells);
  }
}
