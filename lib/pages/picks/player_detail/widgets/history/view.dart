import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/pages.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/player_property_data_grid_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key, required this.playerId});

  final int playerId;

  @override
  String? get tag => getTag();

  String getTag() {
    return "$playerId";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(playerId),
      tag: getTag(),
      builder: (_) {
        return Obx(() {
          if(controller.loadStatus.value != LoadDataStatus.success){
            return Center(
              child: LoadStatusWidget(
                loadDataStatus: controller.loadStatus.value,
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(top: 9.w),
            color: AppColors.cFFFFFF,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                // controller: controller.scrollController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  bool lastItem = index == controller.items.length - 1;
                  String year = controller.items[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: lastItem ? 9.w : 0),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: AppColors.cTransparent,
                      ),
                      child: ExpansionTile(
                        key: controller.tileKeys[index],
                        // 使用 GlobalKey
                        collapsedIconColor: AppColors.c000000,
                        title: Container(
                          margin: EdgeInsets.only(left: 16.w),
                          child: Text(
                            year,
                            style: 24.w7(
                                height: 1, fontFamily: FontFamily.fOswaldBold),
                          ),
                        ),
                        initiallyExpanded:
                        controller.data[year]?.isOpen.value == true,
                        tilePadding: EdgeInsets.only(right: 16.w),
                        onExpansionChanged: (expanded) {
                          controller.data[year]?.isOpen.value = expanded;
                          if (expanded) {
                            // 在展开时自动滚动到确保内容在屏幕中
                            // _scrollToItem(context, index);
                            if (controller.data[year]!.loadStatus.value ==
                                LoadDataStatus.loading &&
                                controller
                                    .data[year]!.seasonHistoryItems.isEmpty ==
                                    true) {
                              Future.delayed(
                                  const Duration(
                                    milliseconds: 300,
                                  ), () {
                                controller.getData(year);
                              });
                            }
                          }
                        },
                        children: [
                          GetBuilder<HistoryController>(
                              id: year,
                              tag: getTag(),
                              builder: (_) {
                                List<SeasonHistoryItems> itemData =
                                    controller.data[year]!.seasonHistoryItems;
                                var loadStatus =
                                    controller.data[year]!.loadStatus;
                                var listSize = itemData.length;
                                print('listSize:$listSize,,,$loadStatus');
                                return Container(
                                  height: (listSize + 1) * 32.w,
                                  constraints: BoxConstraints(
                                      minHeight: listSize > 0 ? 0 : 350.w),
                                  child: itemData.isEmpty == true
                                      ? Obx(() {
                                    return Center(
                                      child: LoadStatusWidget(
                                        loadDataStatus: loadStatus.value,
                                        onRefreshTap: () {
                                          controller.getData(year);
                                        },
                                      ),
                                    );
                                  })
                                      : SfDataGridTheme(
                                      data: SfDataGridThemeData(
                                        gridLineColor: AppColors.cD1D1D1,
                                        gridLineStrokeWidth: 1.w,
                                        frozenPaneLineColor:
                                        Colors.transparent,
                                        rowHoverColor: Colors.blue,
                                      ),
                                      child: _buildDataGrid(itemData)),
                                );
                              }),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 1.w,
                    color: AppColors.cD1D1D1,
                  );
                },
              ),
            ),
          );
        });
      },
    );
  }

  List<GridColumn> _obtainColumns(List<SeasonHistoryItems> itemData) {
    List<GridColumn> columns = [];
    columns.addAll([
      GridColumn(
          columnName: 'id',
          width: 50.w,
          label: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 16.w),
            child: Text(
              'WK',
              style: 12.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoMedium),
            ),
          )),
      GridColumn(
          columnName: 'name',
          width: 50.w,
          label: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                      color: AppColors.cE6E6E6,
                      width: 1.w,
                    ))),
            child: Text(
              'OPP',
              style: 12.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoMedium),
            ),
          )),
    ]);
    for (int i = 0; i < PlayerPropertyDataGridSource.ppKeys.length; i++) {
      var key = PlayerPropertyDataGridSource.ppKeys[i];
      double width = 40.w;

      if (i == 0) {
        width = 48.w;
      }
      var gridColumn = GridColumn(
          columnName: key,
          width: width,
          label: Container(
            alignment: Alignment.center,
            child: Text(
              key,
              textAlign: TextAlign.center,
              style: 12.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoMedium),
            ),
          ));
      columns.add(gridColumn);
    }
    print('columns:${columns.length}');
    return columns;
  }

  SfDataGrid _buildDataGrid(List<SeasonHistoryItems> itemData) {
    return SfDataGrid(
      source: PlayerPropertyDataGridSource(data: itemData),
      frozenRowsCount: 0,
      headerRowHeight: 32.w,
      rowHeight: 32.w,
      verticalScrollPhysics: const NeverScrollableScrollPhysics(),
      horizontalScrollPhysics: const BouncingScrollPhysics(),
      frozenColumnsCount: 2,
      headerGridLinesVisibility: GridLinesVisibility.horizontal,
      gridLinesVisibility: GridLinesVisibility.none,
      columns: _obtainColumns(itemData),
    );
  }

  void _scrollToItem(BuildContext context, int index) {
    // 延迟确保 ExpansionTile 已完全展开
    Future.delayed(const Duration(milliseconds: 100), () {
      // 获取当前 ExpansionTile 的渲染对象
      final RenderBox renderBox = controller.tileKeys[index].currentContext
          ?.findRenderObject() as RenderBox;
      // 获取 ExpansionTile 在屏幕中的位置
      final position = renderBox.localToGlobal(Offset.zero);
      final expansionTileYPosition = position.dy;

      // 获取屏幕高度
      final screenHeight = MediaQuery
          .of(context)
          .size
          .height;

      // 如果 ExpansionTile 的位置接近屏幕底部，滚动到该位置
      if (expansionTileYPosition + renderBox.size.height > screenHeight - 100) {
        // 计算需要滚动的偏移量
        double scrollOffset = controller.scrollController.offset +
            (expansionTileYPosition +
                renderBox.size.height -
                (screenHeight - 200.w));

        // 自动滚动
        controller.scrollController.animateTo(
          scrollOffset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

}
