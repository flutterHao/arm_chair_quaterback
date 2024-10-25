/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 19:09:06
 * @LastEditTime: 2024-10-22 09:46:00
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///@author lihonghao
///@date 2024/9/9
///@description 页面标题栏
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.left,
    this.right,
    this.title,
    this.titleWidget,
    this.bottomChild,
    this.borderRadius,
  }) : assert(titleWidget != null || title != null,
            "select one of titleWidget,title");
  final Widget? left;
  final Widget? right;
  final String? title;
  final Widget? titleWidget;
  final Widget? bottomChild;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      borderRadius: borderRadius,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 63.w,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: SizedBox(
                    width: 68.w,
                    height: 48.w,
                    child: left ??
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          highlightColor: Colors.red,
                          splashColor: Colors.green,
                          child: Container(
                            width: 68.w,
                            height: 48.w,
                            padding: EdgeInsets.only(left: 20.w),
                            child: IconWidget(
                              iconWidth: 19.w,
                              iconHeight: 19.w,
                              icon: Assets.iconBackPng,
                              iconColor: Colors.white,
                            ),
                          ),
                        ),
                  ),
                ),
                Center(
                  child: titleWidget ??
                      Text(
                        title!,
                        style: 19.w7(color: Colors.white),
                      ),
                ),
                Positioned(
                  right: 8.w,
                  child: SizedBox(
                    // width: 19.w,
                    // height: 19.w,
                    child: right?? MoneyAndCoinWidget(),
                  ),
                )
              ],
            ),
          ),
          bottomChild ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class AppBarContainer extends StatelessWidget {
  static double APPBARCONTAINERHEIGHT = ScreenUtil().setWidth(63);
  const AppBarContainer({super.key, required this.child, this.borderRadius});

  final Widget child;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 361.w,
      constraints: BoxConstraints(minHeight: 63.w),
      decoration: BoxDecoration(
        color: AppColors.c262626,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius ?? 16.w),
            bottomRight: Radius.circular(borderRadius ?? 16.w)),
      ),
      child: child,
    );
  }
}
