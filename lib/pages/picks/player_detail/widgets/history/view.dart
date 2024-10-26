import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/product_datagridsource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.headHeight, required this.playerId});

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
      builder: (controller) {
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
                  return Container(
                    margin: EdgeInsets.only(bottom: lastItem ? 150 : 0),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: AppColors.cTransparent,
                      ),
                      child: ExpansionTile(
                        key: controller.tileKeys[index],
                        // 使用 GlobalKey
                        title: Text(
                          "${2024 - index}",
                          style: 16.w7(color: AppColors.c262626),
                        ),
                        initiallyExpanded: index == 0,
                        tilePadding: EdgeInsets.only(right: 5.w),
                        onExpansionChanged: (expanded) {
                          if (expanded) {
                            // 在展开时自动滚动到确保内容在屏幕中
                            _scrollToItem(context, index);
                          }
                        },
                        children: [
                          Builder(
                            builder: (context) {
                              var listSize =21;
                              return Container(
                                height: listSize*20.w+(2*11.w)+10.w,
                                constraints: BoxConstraints(
                                  minHeight: 350.w
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 11.w,vertical: 14.w),
                                decoration: BoxDecoration(
                                    color: AppColors.cF2F2F2,
                                    borderRadius: BorderRadius.circular(16.w)),
                                child: SfDataGridTheme(
                                    data: const SfDataGridThemeData(
                                      gridLineColor: AppColors.cTransparent,
                                      frozenPaneLineColor: Colors.transparent,
                                      rowHoverColor: Colors.blue,
                                    ),
                                    child: _buildDataGrid(listSize)),
                              );
                            }
                          ),
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

  List<GridColumn> _obtainColumns() {
    List<GridColumn> columns;
    columns = <GridColumn>[
      GridColumn(
          columnName: 'id',
          width: 20.w,
          label: Container(
            height: 20,
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
            child:  Text(
              'OPP',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
      GridColumn(
          columnName: 'productId',
          width: 48.w,
          label: Container(
            alignment: Alignment.center,
            child: Text(
              'PTS',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),

      GridColumn(
          columnName: 'product',
          width: 40.w,
          label: Container(
            alignment: Alignment.center,
            child:  Text(
              'PTS',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
      GridColumn(
          columnName: 'orderDate',
          width: 40.w,
          label: Container(
            alignment: Alignment.center,
            child:  Text(
              'PTS',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
      GridColumn(
          columnName: 'quantity',
          width: 40.w,
          label: Container(
            alignment: Alignment.center,
            child:  Text(
              'PTS',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
      GridColumn(
          columnName: 'city',
          width: 40.w,
          label: Container(
            alignment: Alignment.center,
            child:  Text(
              'PTS',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
      GridColumn(
          columnName: 'unitPrice',
          width: 40.w,
          label: Container(
            alignment: Alignment.center,
            child:  Text(
              'PTS',
              style: 10.w4(color: AppColors.cB3B3B3, height: 1),
            ),
          )),
    ];
    return columns;
  }

  SfDataGrid _buildDataGrid(int listSize) {
    return SfDataGrid(
      source: ProductDataGridSource('FreezePanes', productDataCount: listSize),
      frozenRowsCount: 0,
      headerRowHeight: 20.w,
      rowHeight: 20.w,
      verticalScrollPhysics: const NeverScrollableScrollPhysics(),
      frozenColumnsCount: 2,
      headerGridLinesVisibility: GridLinesVisibility.none,
      columns: _obtainColumns(),
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
