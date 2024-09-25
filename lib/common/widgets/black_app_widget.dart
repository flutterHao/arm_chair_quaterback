/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-23 18:07:15
 * @LastEditTime: 2024-09-24 17:03:31
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/11/11:06

class BlackAppWidget extends StatelessWidget {
  const BlackAppWidget(this.appbarWidget,
      {this.bodyWidget,
      this.floatWidgets,
      this.totalScreenWidget,
      super.key,
      this.backgroundColor})
      : assert(bodyWidget != null || totalScreenWidget != null,
            "select on of bodyWidget,totalScreenWidget");

  final Widget appbarWidget; //appbar
  final Widget? bodyWidget; //主体
  final List<Widget>? floatWidgets; //悬浮
  final Widget? totalScreenWidget; //背景
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? AppColors.ce5e5e5,
      alignment: Alignment.center,
      child: Stack(
        children: [
          totalScreenWidget ?? const SizedBox.shrink(),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.w),
                      bottomRight: Radius.circular(16.w),
                    )),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 6.w),
                  child: appbarWidget,
                ),
              ),
              bodyWidget ?? const SizedBox.shrink(),
            ],
          ),
          ...?floatWidgets
        ],
      ),
    );
  }
}
