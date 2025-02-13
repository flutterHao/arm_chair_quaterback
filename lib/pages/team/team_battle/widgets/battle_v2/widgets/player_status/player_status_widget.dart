import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/player_status/controllr.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/player_status/player_status_grid_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2024/12/16/10:28

class PlayerStatusWidget extends GetView<PlayerStatusController> {
  const PlayerStatusWidget(this.teamBattleV2Controller, {super.key});

  final TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerStatusController>(
        init: PlayerStatusController(teamBattleV2Controller),
        builder: (logic) {
          return Obx(() {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: controller.isExpanded.value
                  ? (255.w + max(0, controller.getData().length - 5) * 34.w)
                  : 255.w,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 9.w),
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Column(
                children: [
                  Expanded(
                    child: SfDataGridTheme(
                        data: const SfDataGridThemeData(
                            gridLineColor: AppColors.cTransparent,
                            frozenPaneLineColor: AppColors.cTransparent,
                            rowHoverColor: AppColors.c10A86A,
                            gridLineStrokeWidth: 0),
                        child: SfDataGrid(
                          rowHeight: 34.w,
                          headerRowHeight: 31.w,
                          columnWidthMode: ColumnWidthMode.fill,
                          gridLinesVisibility: GridLinesVisibility.none,
                          horizontalScrollPhysics:
                              const NeverScrollableScrollPhysics(),
                          verticalScrollPhysics:
                              const NeverScrollableScrollPhysics(),
                          source: PlayerStatusGridSource(
                              controller.getData(), context),
                          columns: [
                            GridColumn(
                                columnName: 'player',
                                width: 159.w,
                                label: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 20.w),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.cD1D1D1,
                                              width: 1.w))),
                                  child: Text(
                                    LangKey.gameTabStarter.tr,
                                    style: 12.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium),
                                  ),
                                )),
                            // GridColumn(
                            //     columnName: 'morale',
                            //     width: 102.w,
                            //     label: Container(
                            //       alignment: Alignment.center,
                            //       decoration: BoxDecoration(
                            //           border: Border(
                            //               bottom: BorderSide(
                            //                   color: AppColors.cD1D1D1,
                            //                   width: 1.w))),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           IconWidget(
                            //               iconWidth: 8.w,
                            //               icon:
                            //               Assets.managerUiManagerIconRecover),
                            //           8.hGap,
                            //           Text(
                            //             'Morale',
                            //             style: 12.w5(
                            //                 color: AppColors.c000000,
                            //                 height: 1,
                            //                 fontFamily: FontFamily
                            //                     .fRobotoMedium),
                            //           ),
                            //         ],
                            //       ),
                            //     )),
                            GridColumn(
                                columnName: 'status',
                                label: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.cD1D1D1,
                                              width: 1.w))),
                                  child: Text(
                                    LangKey.gameMeanSkip.tr,
                                    style: 12.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium),
                                  ),
                                )),
                            GridColumn(
                                columnName: 'score',
                                label: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.cD1D1D1,
                                              width: 1.w))),
                                  child: Text(
                                    LangKey.gameMeanRating.tr,
                                    style: 12.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium),
                                  ),
                                )),
                          ],
                        )),
                  ),
                  Divider(
                    color: AppColors.cD1D1D1,
                    height: 1.w,
                  ),
                  InkWell(
                    onTap: () {
                      controller.isExpanded.value =
                          !controller.isExpanded.value;
                      if (controller.isExpanded.value) {
                        controller.expandedTurns.value += 0.5;
                      } else {
                        controller.expandedTurns.value -= 0.5;
                      }
                    },
                    child: SizedBox(
                      height: 56.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LangKey.gameButtonUnfold.tr,
                            style: 16.w7(
                                color: AppColors.c262626,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold),
                          ),
                          4.vGap,
                          AnimatedRotation(
                            turns: controller.expandedTurns.value,
                            duration: const Duration(milliseconds: 300),
                            child: IconWidget(
                              iconWidth: 5.w,
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.c000000,
                              rotateAngle: 90,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
