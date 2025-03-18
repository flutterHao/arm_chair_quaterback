import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score_v2/quarter_grid_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/12/6/11:28

class QuarterScoreWidgetV2 extends StatelessWidget {
  final bool hasTopMargin;
  late TeamBattleV2Controller teamBattleV2Controller;

  QuarterScoreWidgetV2({super.key, this.hasTopMargin = true});

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    var list = ['1st', '2nd', '3rd', '4th'];
    if (teamBattleV2Controller.quarter.value > list.length) {
      var i = teamBattleV2Controller.quarter.value - list.length;
      var list2 = List.generate(i, (index) {
        return Utils.getSortWithInt(
            teamBattleV2Controller.quarter.value + index + 1);
      });
      list.addAll(list2);
    }
    return Container(
      height: 95.w,
      margin: EdgeInsets.only(top: hasTopMargin ? 9.w : 0),
      alignment: Alignment.center,
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
            gridLinesVisibility: GridLinesVisibility.none,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            source: QuarterGridSourceV2(teamBattleV2Controller, list),
            columns: [
              GridColumn(
                  columnName: 'id',
                  width: 130.w,
                  label: const Text(
                    '',
                  )),
              ...list.map((e) {
                return GridColumn(
                    columnName: e,
                    columnWidthMode: ColumnWidthMode.fill,
                    label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        style: 12.w5(
                            color: AppColors.cFFFFFF,
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
                    child: Text(
                      LangKey.gameTabTotal.tr,
                      style: 12.w5(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium),
                    ),
                  )),
            ],
          )),
    );
  }
}
