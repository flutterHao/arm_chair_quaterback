import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_parent_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_widget.dart';
import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2025/1/23/11:28
class HorizontalDragBackContainer extends StatelessWidget {
  const HorizontalDragBackContainer({
    required this.child,
    this.onWidgetOut,
    this.canPop = true,
    this.responseDepth = const [],
    this.hasScrollChild = false,
    this.noBackAnimation = false,
    super.key,
    this.builder,
  }) : assert(child != null || builder != null,
            "child or builder cannot all be null");

  final Widget? child;
  final Widget Function(BuildContext context)? builder;

  ///是否支持右滑返回，实体/虚拟按键返回
  final bool canPop;

  ///响应哪个子滚动组件
  final List<int> responseDepth;
  final bool hasScrollChild;

  /// 自定义返回响应
  final Function()? onWidgetOut;

  /// 只响应事件，不执行动画
  final bool noBackAnimation;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackParentWidget(
      child: HorizontalDragBackWidget(
        canPop: canPop,
        responseDepth: responseDepth,
        hasScrollChild: hasScrollChild,
        onWidgetOut: onWidgetOut,
        noBackAnimation: noBackAnimation,
        child: child,
      ),
    );
  }
}
