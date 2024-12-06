import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_grid_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/12/6/11:28

class QuarterScoreWidget extends StatelessWidget {
  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    var list = ['1st', '2nd', '3rd', '4th', "ot1"];
    if (teamBattleV2Controller.quarter.value > list.length) {
      var i = teamBattleV2Controller.quarter.value - list.length;
      var list2 = List.generate(i, (index) {
        return Utils.getSortWithInt(
            teamBattleV2Controller.quarter.value + index + 1);
      });
      list.addAll(list2);
    }
    return Container(
      height: 122.w,
      margin: EdgeInsets.only(top: 9.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: SfDataGridTheme(
          data: const SfDataGridThemeData(
              gridLineColor: AppColors.cTransparent,
              frozenPaneLineColor: AppColors.cTransparent,
              rowHoverColor: AppColors.c10A86A,
              gridLineStrokeWidth: 0),
          child: SfDataGrid(
            frozenColumnsCount: 1,
            footerFrozenColumnsCount: 1,
            rowHeight: 34.w,
            headerRowHeight: 30.w,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            source: QuarterGridSource(teamBattleV2Controller, list),
            columns: [
              GridColumn(
                  columnName: 'id',
                  width: 130.w,
                  label: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.cD1D1D1, width: 1))),
                    child: const Text(
                      '',
                    ),
                  )),
              ...list.map((e) {
                return GridColumn(
                    columnName: e,
                    width: 38.w,
                    label: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.cD1D1D1, width: 1))),
                      child: Text(
                        e,
                        style: 12.w5(
                            color: AppColors.c4D4D4D,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ));
              }),
              GridColumn(
                  columnName: 'total',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 16.w),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.cD1D1D1, width: 1))),
                    child: Text(
                      'Total',
                      style: 12.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium),
                    ),
                  )),
            ],
          )),
    );
  }
}
