import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PlayerDetailPage extends GetView<PlayerDetailController> {
  const PlayerDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerDetailController>(
      builder: (_) {
        return BlackAppWidget(
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 19.w,
                      height: 19.w,
                      child: InkWell(
                        onTap: () => Get.back(id: GlobalNestedKey.PICKS),
                        child: IconWidget(
                          iconWidth: 19.w,
                          iconHeight: 19.w,
                          icon: Assets.iconBackPng,
                          iconColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "PLAYER",
                          style: 19.w7(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              11.vGap,
              Stack(
                children: [
                  Positioned(
                    right: 0,
                      bottom: 0,
                      child: Container(
                        width: 130.w,
                        height: 100.w,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(32.w)),
                            child:  IconWidget(icon: "", iconWidth: 130.w,)),//todo icon换图
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 29.w,bottom: 12.w),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 13.w),
                            child: ImageWidget(url: "url",width: 64.w,height: 64.w,borderRadius: BorderRadius.circular(32.w),)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HOU  #6",style: TextStyle(
                              color: AppColors.cB3B3B3,
                              fontSize: 10.sp,
                            ),),
                            3.vGap,
                            Text("Player Name",style: TextStyle(
                              color: AppColors.cF2F2F2,
                              fontSize: 16.sp,
                            ),),
                            3.vGap,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 0.w
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(2.w)
                              ),
                              child: Text("PF",style: 10.w7(color: AppColors.c262626)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          bodyWidget: Container(),
        );
      },
    );
  }
}
