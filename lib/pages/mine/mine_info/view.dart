import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MineInfoPage extends GetView<MineInfoController> {
  const MineInfoPage({super.key});

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineInfoController>(
      builder: (_) {
        return HorizontalDragBackWidget(child: BlackAppWidget(const AppBarWidget(
          title: "MINE",
          right: null,
        ),bodyWidget: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              20.vGap,
              Container(
                height: 130.w,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.c262626,
                  borderRadius: BorderRadius.circular(16.w)
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(53.w),
                        border: Border.all(color: AppColors.cFFFFFF.withOpacity(.3),width: 3.w)
                      ),
                      child: ImageWidget(url: "",width: 100.w,height: 100.w,borderRadius: BorderRadius.circular(50.w),),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(15.w)
                        ),
                          child: IconWidget(iconWidth: 19.w, icon: Assets.uiIconCameraPng,iconColor: AppColors.c666666,)),
                    )
                  ],
                ),
              ),
              11.vGap,
              Container(
                height: 53.w,
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)
                ),
              )
            ],
          ),
        ),));
      },
    );
  }
}
