import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.headHeight});

  final double headHeight;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  late HistoryController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: controller = HistoryController(),
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
                            _scrollToItem(index);
                          }
                        },
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
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

  void _scrollToItem(int index) {
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
      if (expansionTileYPosition + renderBox.size.height > screenHeight) {
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
