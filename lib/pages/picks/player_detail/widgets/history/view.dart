import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/player_property_data_grid_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage(
      {super.key, required this.headHeight, required this.playerId});

  final double headHeight;
  final int playerId;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  late HistoryController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: controller = HistoryController(widget.playerId),
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  bool lastItem = index == controller.items.length - 1;
                  String year = controller.items[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: lastItem ? 20 : 0),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: AppColors.cTransparent,
                      ),
                      child: ExpansionTile(
                        key: controller.tileKeys[index],
                        // 使用 GlobalKey
                        title: Text(
                          year,
                          style: 16.w7(color: AppColors.c262626),
                        ),
                        initiallyExpanded: index == 0,
                        tilePadding: EdgeInsets.only(right: 5.w),
                        onExpansionChanged: (expanded) {
                          if (expanded) {
                            // 在展开时自动滚动到确保内容在屏幕中
                            _scrollToItem(context, index);
                            if (controller.data[year]!.loadStatus.value ==
                                    LoadDataStatus.loading &&
                                controller.data[year]!.seasonHistoryItems
                                        .isEmpty ==
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
                              builder: (controller) {
                                List<SeasonHistoryItems> itemData =
                                    controller.data[year]!.seasonHistoryItems;
                                var loadStatus =
                                    controller.data[year]!.loadStatus;
                                var listSize = itemData.length;
                                print('listSize:$listSize');
                                return Container(
                                  height: listSize * 20.w + (2 * 14.w) + 20.w,
                                  constraints: BoxConstraints(
                                      minHeight: listSize > 0 ? 0 : 350.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11.w, vertical: 14.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: itemData.isEmpty == true
                                      ? Obx(() {
                                          return Center(
                                            child: LoadStatusWidget(
                                              loadDataStatus: loadStatus.value,
                                              onRefreshTap: (){
                                                controller.getData(year);
                                              },
                                            ),
                                          );
                                        })
                                      : SfDataGridTheme(
                                          data: const SfDataGridThemeData(
                                            gridLineColor:
                                                AppColors.cTransparent,
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
                }),
          ),
        );
      },
    );
  }

  List<GridColumn> _obtainColumns(List<SeasonHistoryItems> itemData) {
    List<GridColumn> columns = [];
    columns.addAll([
      GridColumn(
          columnName: 'id',
          width: 20.w,
          label: Container(
            alignment: Alignment.center,
            child: Text(
              'WK',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
      GridColumn(
          columnName: 'name',
          width: 48.w,
          label: Container(
            alignment: Alignment.center,
            child: Text(
              'OPP',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
    ]);
    var list = itemData[0].playerSeasonGameEntity.toJson().keys.toList();
    for (int i = 0; i < list.length; i++) {
      var key = list[i];
      if (PlayerPropertyDataGridSource.excludeKeys.contains(key)) {
        continue;
      }
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
              key.toUpperCase(),
              textAlign: TextAlign.center,
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
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
      headerRowHeight: 20.w,
      rowHeight: 20.w,
      verticalScrollPhysics: const NeverScrollableScrollPhysics(),
      frozenColumnsCount: 2,
      headerGridLinesVisibility: GridLinesVisibility.none,
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
      final screenHeight = MediaQuery.of(context).size.height;

      // 如果 ExpansionTile 的位置接近屏幕底部，滚动到该位置
      if (expansionTileYPosition + renderBox.size.height > screenHeight - 100) {
        // 计算需要滚动的偏移量
        double scrollOffset = controller.scrollController.offset +
            (expansionTileYPosition +
                renderBox.size.height -
                (screenHeight - widget.headHeight));

        // 自动滚动
        controller.scrollController.animateTo(
          scrollOffset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
