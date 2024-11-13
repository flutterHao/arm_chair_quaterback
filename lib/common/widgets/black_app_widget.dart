import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/11/11:06

class BlackAppWidget extends StatefulWidget {
  const BlackAppWidget(this.appbarWidget,
      {this.bodyWidget,
      this.totalScreenBuilder,
      this.floatWidgets,
      super.key,
      this.backgroundColor});

  final Widget appbarWidget; //appbar
  final Widget? bodyWidget; //主体
  final List<Widget>? floatWidgets; //悬浮
  final Color? backgroundColor;
  final Widget Function(BuildContext context, double appBarHeight)?
      totalScreenBuilder;

  @override
  State<BlackAppWidget> createState() => _BlackAppWidgetState();
}

class _BlackAppWidgetState extends State<BlackAppWidget> {
  var appBarHeight = 0.0.obs;
  var cacheAppBarHeight = -1.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      appBarHeight.value = cacheAppBarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? AppColors.ce5e5e5,
      alignment: Alignment.center,
      child: Stack(
        children: [
          if (widget.totalScreenBuilder != null)
            Obx(() {
              if (cacheAppBarHeight < 0) {
                return Container(
                  color: appBarHeight.value == -1 ? Colors.red : Colors.black,
                );
              }
              return widget.totalScreenBuilder!(context, appBarHeight.value);
            }),
          Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                if (widget.totalScreenBuilder != null) {
                  WidgetsBinding.instance.addPostFrameCallback((callBack) {
                    cacheAppBarHeight = context.size?.height ?? -1;
                  });
                }
                return Container(
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).padding.top + 10.w,
                        color: AppColors.c000000,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 0.w),
                        child: widget.appbarWidget,
                      ),
                    ],
                  ),
                );
              }),
              widget.bodyWidget ?? const SizedBox.shrink(),
            ],
          ),
          ...?widget.floatWidgets
        ],
      ),
    );
  }
}
