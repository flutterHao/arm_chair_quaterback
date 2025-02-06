import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/stats/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/stats/widget/per_game_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
///@auther gejiahui
///created at 2025/1/7/14:08

class StatsPage extends StatefulWidget {
  const StatsPage({super.key, required this.playerDetailController});

  final PlayerDetailController playerDetailController;

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage>
    with AutomaticKeepAliveClientMixin {
  late StatsController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
      init: controller = StatsController(widget.playerDetailController),
      builder: (logic) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              9.vGap,
              ...List.generate(controller.getStats().length, (index) {
                StatsItem statsItem = controller.getStats()[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  color: AppColors.cFFFFFF,
                  child: MtInkWell(
                    onTap: () {
                      ///todo
                      controller.tabController.animateTo(0);
                      controller.getRegularData();
                      controller.getOffData();
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(9.w))),
                              child: Column(
                                children: [
                                  const DialogTopBtn(),
                                  18.vGap,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      16.hGap,
                                      Text(
                                        "${statsItem.name} per game",
                                        style: 19.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  22.vGap,
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: TLBuildWidget(
                                        controller: controller.tabController,
                                        builder: (int current,
                                            int next,
                                            double progress,
                                            double totalProgress) {
                                          return Row(
                                            children:
                                                controller.getTitles().map((e) {
                                              int index = controller
                                                  .getTitles()
                                                  .indexOf(e);
                                              Color bgColor = index == current
                                                  ? Color.lerp(
                                                      AppColors.c262626,
                                                      AppColors.cFFFFFF,
                                                      progress)!
                                                  : index == next
                                                      ? Color.lerp(
                                                          AppColors.cFFFFFF,
                                                          AppColors.c262626,
                                                          progress)!
                                                      : AppColors.cFFFFFF;
                                              Color color = index == current
                                                  ? Color.lerp(
                                                      AppColors.cF2F2F2,
                                                      AppColors.c262626,
                                                      progress)!
                                                  : index == next
                                                      ? Color.lerp(
                                                          AppColors.c262626,
                                                          AppColors.cF2F2F2,
                                                          progress)!
                                                      : AppColors.c262626;

                                              // String fontFamily = index == current
                                              //     ? FontFamily.fOswaldMedium
                                              //     : FontFamily.fOswaldRegular;
                                              String fontFamily =
                                                  FontFamily.fOswaldMedium;
                                              return MtInkWell(
                                                onTap: () {
                                                  if (controller.tabController
                                                          .index !=
                                                      index) {
                                                    controller.tabController
                                                        .animateTo(index);
                                                  }
                                                },
                                                child: Container(
                                                  height: 28.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 21.w),
                                                  margin: EdgeInsets.only(
                                                      right: 4.w,
                                                      left: index == 0
                                                          ? 16.w
                                                          : 0),
                                                  decoration: BoxDecoration(
                                                    color: bgColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.w),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.c666666,
                                                        width: 1),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      e,
                                                      style: 16.w5(
                                                          color: color,
                                                          height: 1,
                                                          fontFamily:
                                                              fontFamily),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        }),
                                  ),
                                  10.vGap,
                                  Divider(
                                    color: AppColors.cD1D1D1,
                                    height: 1.w,
                                  ),
                                  Expanded(
                                      child: TabBarView(
                                          controller: controller.tabController,
                                          children: [
                                        /// 常规赛
                                        Obx(() {
                                          if (controller
                                                  .regularLoadStatus.value ==
                                              LoadDataStatus.success) {
                                            var data = controller
                                                .getRegularDataByKey(statsItem);
                                            return SfDataGridTheme(
                                                data: const SfDataGridThemeData(
                                                    gridLineColor:
                                                        AppColors.cE6E6E6,
                                                    frozenPaneLineColor:
                                                        Colors.transparent,
                                                    rowHoverColor: Colors.blue,
                                                    gridLineStrokeWidth: 0),
                                                child: SfDataGrid(
                                                  rowHeight: 34.w,
                                                  headerRowHeight: 34.w,
                                                  horizontalScrollPhysics:
                                                      const NeverScrollableScrollPhysics(),
                                                  verticalScrollPhysics:
                                                      const BouncingScrollPhysics(),
                                                  gridLinesVisibility:
                                                      GridLinesVisibility.none,
                                                  showHorizontalScrollbar:
                                                      false,
                                                  source:
                                                      PerGameDatasource(data),
                                                  columns: [
                                                    GridColumn(
                                                        columnName: 'season',
                                                        width: 124.w,
                                                        label: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16.w),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  border:
                                                                      Border(
                                                            bottom: BorderSide(
                                                                color: AppColors
                                                                    .cD1D1D1,
                                                                width: 1),
                                                            right: BorderSide(
                                                                color: AppColors
                                                                    .cE6E6E6,
                                                                width: 1),
                                                          )),
                                                          child: Text(
                                                            'SEASON',
                                                            style: 12.w5(
                                                              color: AppColors
                                                                  .c000000,
                                                              fontFamily: FontFamily
                                                                  .fRobotoMedium,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        )),
                                                    GridColumn(
                                                        columnName: "value",
                                                        columnWidthMode:
                                                            ColumnWidthMode
                                                                .fill,
                                                        label: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16.w),
                                                          decoration: const BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: AppColors
                                                                          .cD1D1D1,
                                                                      width:
                                                                          1))),
                                                          child: Text(
                                                            statsItem.shortName,
                                                            style: 12.w5(
                                                              color: AppColors
                                                                  .c000000,
                                                              fontFamily: FontFamily
                                                                  .fRobotoMedium,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        )),
                                                    GridColumn(
                                                        columnName: "gp",
                                                        label: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 45.w,
                                                                  left: 16.w),
                                                          decoration: const BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: AppColors
                                                                          .cD1D1D1,
                                                                      width:
                                                                          1))),
                                                          child: Text(
                                                            "GP",
                                                            style: 12.w5(
                                                              color: AppColors
                                                                  .c000000,
                                                              fontFamily: FontFamily
                                                                  .fRobotoMedium,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ));
                                          }

                                          return Center(
                                            child: LoadStatusWidget(
                                              loadDataStatus: controller
                                                  .regularLoadStatus.value,
                                            ),
                                          );
                                        }),

                                        /// 季后赛
                                        Obx(() {
                                          if (controller.offLoadStatus.value ==
                                              LoadDataStatus.success) {
                                            var data = controller
                                                .getOffDataByKey(statsItem);
                                            return SfDataGridTheme(
                                                data: const SfDataGridThemeData(
                                                    gridLineColor:
                                                        AppColors.cE6E6E6,
                                                    frozenPaneLineColor:
                                                        Colors.transparent,
                                                    rowHoverColor: Colors.blue,
                                                    gridLineStrokeWidth: 0),
                                                child: SfDataGrid(
                                                  rowHeight: 34.w,
                                                  headerRowHeight: 34.w,
                                                  horizontalScrollPhysics:
                                                      const NeverScrollableScrollPhysics(),
                                                  verticalScrollPhysics:
                                                      const BouncingScrollPhysics(),
                                                  gridLinesVisibility:
                                                      GridLinesVisibility.none,
                                                  showHorizontalScrollbar:
                                                      false,
                                                  source:
                                                      PerGameDatasource(data),
                                                  columns: [
                                                    GridColumn(
                                                        columnName: 'season',
                                                        width: 124.w,
                                                        label: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16.w),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  border:
                                                                      Border(
                                                            bottom: BorderSide(
                                                                color: AppColors
                                                                    .cD1D1D1,
                                                                width: 1),
                                                            right: BorderSide(
                                                                color: AppColors
                                                                    .cE6E6E6,
                                                                width: 1),
                                                          )),
                                                          child: Text(
                                                            'SEASON',
                                                            style: 12.w5(
                                                              color: AppColors
                                                                  .c000000,
                                                              fontFamily: FontFamily
                                                                  .fRobotoMedium,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        )),
                                                    GridColumn(
                                                        columnName: "value",
                                                        columnWidthMode:
                                                            ColumnWidthMode
                                                                .fill,
                                                        label: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16.w),
                                                          decoration: const BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: AppColors
                                                                          .cD1D1D1,
                                                                      width:
                                                                          1))),
                                                          child: Text(
                                                            statsItem.shortName,
                                                            style: 12.w5(
                                                              color: AppColors
                                                                  .c000000,
                                                              fontFamily: FontFamily
                                                                  .fRobotoMedium,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        )),
                                                    GridColumn(
                                                        columnName: "gp",
                                                        label: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 45.w,
                                                                  left: 16.w),
                                                          decoration: const BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: AppColors
                                                                          .cD1D1D1,
                                                                      width:
                                                                          1))),
                                                          child: Text(
                                                            "GP",
                                                            style: 12.w5(
                                                              color: AppColors
                                                                  .c000000,
                                                              fontFamily: FontFamily
                                                                  .fRobotoMedium,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ));
                                          }
                                          return Center(
                                            child: LoadStatusWidget(
                                              loadDataStatus: controller
                                                  .offLoadStatus.value,
                                            ),
                                          );
                                        })
                                      ]))
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 110.w,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.w),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: AppColors.cE6E6E6,
                        width: 1.w,
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  statsItem.name,
                                  style: 16.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                ),
                                15.vGap,
                                Row(
                                  children: [
                                    Text(
                                      "${statsItem.value.format()}",
                                      style: 35.w7(
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldBold,
                                      ),
                                    ),
                                    27.hGap,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          statsItem.shortName,
                                          style: 14.w5(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoMedium,
                                          ),
                                        ),
                                        6.vGap,
                                        if (statsItem.rank <= 100)
                                          Text(
                                            "${Utils.getSortWithInt(statsItem.rank)} OVERALL",
                                            style: 10.w4(
                                              color: AppColors.c4D4D4D,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fRobotoRegular,
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 2.w),
                            child: IconWidget(
                              iconWidth: 8.w,
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.c000000,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              9.vGap,
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
