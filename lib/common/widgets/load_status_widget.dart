/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 14:41:22
 * @LastEditTime: 2024-11-19 20:37:01
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 缺省页视图
///@auther gejiahui
///created at 2024/9/23/11:22

class LoadStatusWidget extends StatelessWidget {
  const LoadStatusWidget({
    this.icon,
    this.text,
    this.onRefreshTap,
    super.key,
    this.loadDataStatus,
  });

  final String? icon;
  final String? text;
  final LoadDataStatus? loadDataStatus;
  final Function()? onRefreshTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.w,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (loadDataStatus == LoadDataStatus.loading)
            Center(
              child: SizedBox(
                width: 25.w,
                height: 25.w,
                child: const CircularProgressIndicator(
                  color: AppColors.cB3B3B3,
                  strokeWidth: 2,
                ),
              ),
            )
          else
            IconWidget(
                iconWidth: 123.w,
                icon: icon ?? loadDataStatus?.icon ?? Assets.iconUiDefault01),
          20.vGap,
          Text(
            text ?? loadDataStatus?.desc ?? "",
            style: 12.w4(color: AppColors.cB3B3B3.withOpacity(.7)),
          ),
          // if (onRefreshTap != null && loadDataStatus != LoadDataStatus.loading && loadDataStatus != LoadDataStatus.noData)
          //   InkWell(
          //     onTap: onRefreshTap,
          //     child: Container(
          //       height: 30.w,
          //       width: 120.w,
          //       margin: EdgeInsets.only(top: 5.w),
          //       decoration: BoxDecoration(
          //           color: AppColors.cFF7954,
          //           borderRadius: BorderRadius.circular(15.w)),
          //       child: Center(
          //         child: Text(
          //           "REFRESH",
          //           style: 14.w7(color: AppColors.cFFFFFF),
          //         ),
          //       ),
          //     ),
          //   )
        ],
      ),
    );
  }
}
