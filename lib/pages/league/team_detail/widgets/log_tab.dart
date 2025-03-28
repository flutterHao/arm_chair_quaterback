/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 15:05:53
 * @LastEditTime: 2025-01-24 17:45:14
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/last5_avg_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LogTab extends StatefulWidget {
  const LogTab({super.key});

  @override
  State<LogTab> createState() => _LogTabState();
}

class _LogTabState extends State<LogTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamDetailController>(
        tag: Get.arguments.toString(),
        id: "logTab",
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 9.w),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.logMap.entries.length,
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cD1D1D1,
                  );
                },
                itemBuilder: (context, index) {
                  String season =
                      controller.logMap.entries.elementAt(index).key;
                  return Theme(
                    data: ThemeData(
                      dividerColor: AppColors.cTransparent,
                    ),
                    child: ExpansionTile(
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        initiallyExpanded: controller.openList[index],
                        onExpansionChanged: (value) {
                          controller.openList[index] = value;
                          if (value) controller.getSeasonLog(season);
                        },
                        title: Text(
                          season,
                          style: 24.w4(
                            fontFamily: FontFamily.fOswaldBold,
                            color: AppColors.c262626,
                          ),
                        ),
                        children: [_Item(season)]),
                  );
                }),
          );
        });
  }
}

class _Item extends StatelessWidget {
  const _Item(this.season, {super.key});
  final String season;

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(left: 16.w),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.cD1D1D1,
            ),
          ),
        ),
        child: _buildTabViewItem());
  }

  Widget _buildTabViewItem() {
    final controller =
        Get.find<TeamDetailController>(tag: Get.arguments.toString());
    if ((controller.logMap[season] ?? []).isEmpty) {
      return SizedBox(
        height: 250.w,
        child: const Center(
          child: LoadStatusWidget(
            loadDataStatus: LoadDataStatus.loading,
          ),
        ),
      );
    }
    return SizedBox(
      height: 29.w + 34.w * controller.logMap[season]!.length,
      child: SfDataGridTheme(
          data: const SfDataGridThemeData(
              gridLineColor: AppColors.cE6E6E6,
              frozenPaneLineColor: Colors.transparent,
              gridLineStrokeWidth: 1),
          child: SfDataGrid(
            frozenColumnsCount: 2,
            rowHeight: 34.w,
            headerRowHeight: 29.w,
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            showHorizontalScrollbar: false,
            gridLinesVisibility: GridLinesVisibility.horizontal,
            source: PlayerDetailDatasource(controller.logMap[season]!),
            columns: [
              GridColumn(
                  columnName: 'WK',
                  width: 50.w,
                  label: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'WK',
                      style: 12.w4(fontFamily: FontFamily.fRobotoMedium),
                    ),
                  )),
              GridColumn(
                  columnName: 'id',
                  width: 50.w,
                  label: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'OPP',
                      style: 12.w4(fontFamily: FontFamily.fRobotoMedium),
                    ),
                  )),
              ...controller.columns.map((e) {
                return GridColumn(
                    columnName: e,
                    width: 50.w,
                    label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        style: 12.w4(fontFamily: FontFamily.fRobotoMedium),
                      ),
                    ));
              })
            ],
          )),
    );
  }
}

class PlayerDetailDatasource extends DataGridSource {
  PlayerDetailDatasource(this.datas);

  final List<Last5AvgEntity> datas;

  List<DataGridRow> _buildRows() {
    final ctrl = Get.find<TeamDetailController>(tag: Get.arguments.toString());
    int i = 0;
    List<List<DataGridCell>> map = datas.map((e) {
      String teamName = e.mATCHUP.split(" ").last;
      List<DataGridCell> cells = [];
      cells.add(DataGridCell(columnName: "WK", value: i + 1));
      cells.add(DataGridCell(columnName: "OPP", value: teamName));
      for (var col in ctrl.columns) {
        cells.add(DataGridCell(columnName: col, value: e.getRankValue(col)));
      }
      i++;
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
            // decoration: const BoxDecoration(
            //     border: Border(
            //         right: BorderSide(color: AppColors.cE6E6E, width: 1))),
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
