import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MineAccountPage extends GetView<MineAccountController> {
  const MineAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineAccountController>(
      builder: (_) {
        return HorizontalDragBackWidget(
            child: BlackAppWidget(
          const AppBarWidget(
            right: null,
            title: "ACCOUNT",
          ),
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                24.vGap,
                _buildItem(
                    Assets.uiIconGooglePng, "Google", "dasj98@dwhoi.com"),
                _buildItem(Assets.uiIconFactbookPng, "Facebook", "not bound"),
                _buildItem(Assets.uiIconApplePng, "Apple", "not bound"),
              ],
            ),
          ),
          floatWidgets: [
            Positioned(
              bottom: 30.w,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => _showDialog(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.circular(22.w)
                        ),
                        height: 44.w,
                        width: 260.w,
                        alignment: Alignment.center,
                        child: Text("SWITCH ACCOUNT",style: 18.w7(color: AppColors.cF2F2F2),),
                      ),
                    ),
                    12.vGap,
                    InkWell(
                      onTap: (){
                        print('logout --- ');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.cE41033,width: 1),
                          borderRadius: BorderRadius.circular(22.w)
                        ),
                        height: 44.w,
                        width: 260.w,
                        alignment: Alignment.center,
                        child: Text("LOGOUT",style: 18.w7(color: AppColors.cE41033),),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
      },
    );
  }

  void _showDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return Container(
            height: 666.h,
            child: DialogBackground(
                frontColor: AppColors.cE6E6E6,
                child: Column(
                  children: [
                    12.vGap,
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.cB3B3B3,
                          borderRadius: BorderRadius.circular(2.w)),
                      height: 4.w,
                      width: 64.w,
                    ),
                    24.vGap,
                    Container(
                      height: 81.w,
                      margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 9.w),
                      decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(16.w)
                      ),
                      padding: EdgeInsets.only(left: 18.w,right: 25.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.w),
                                child: ImageWidget(url: "",width: 48.w,height: 48.w,),
                              ),
                              9.hGap,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Player Name",style: 16.w4(color: AppColors.c333333,height: 1),),
                                  5.vGap,
                                  Text("dasj98@dwhoi.com",style: 10.w4(color: AppColors.cB3B3B3,height: 1),)
                                ],
                              )
                            ],
                          ),
                          IconWidget(iconWidth: 18.w, icon: Assets.uiIconRuidgtPng,iconColor: AppColors.c1BC27D,)
                        ],
                      ),
                    ),
                    Container(
                      height: 81.w,
                      margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 9.w),
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)
                      ),
                      padding: EdgeInsets.only(left: 18.w,right: 25.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.cB3B3B3,width: 1),
                              borderRadius: BorderRadius.circular(8.w)
                            ),
                            height: 48.w,
                            width: 48.w,
                            alignment: Alignment.center,
                            child: IconWidget(iconWidth: 12.w, icon: Assets.uiIconPlusPng,iconColor: AppColors.c666666,)
                          ),
                          9.hGap,
                          Text("Add new account",style: 16.w4(color: AppColors.c666666),)
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }


  Container _buildItem(String icon, String title, String text) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(16.w)),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 9.w),
      height: 66.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconWidget(iconWidth: 23.w, icon: icon),
              7.hGap,
              Text(
                title,
                style: 14.w4(color: AppColors.c262626),
              )
            ],
          ),
          Row(
            children: [
              Text(
                text,
                style: 12.w4(color: AppColors.cB3B3B3),
              ),
              15.hGap,
              IconWidget(
                iconWidth: 9.w,
                icon: Assets.uiIconArrows_01Png,
                iconColor: AppColors.c666666,
              )
            ],
          )
        ],
      ),
    );
  }
}
