import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class MineInfoPage extends GetView<MineInfoController> {
  const MineInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineInfoController>(
      builder: (_) {
        return HorizontalDragBackContainer(
            child: BlackAppWidget(
          const AppBarWidget(
            title: "MINE",
            right: SizedBox.shrink(),
          ),
          totalScreenBuilder: (_, h) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    h.vGap,
                    20.vGap,
                    Container(
                      height: 130.w,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(53.w),
                                border: Border.all(
                                    color: AppColors.cFFFFFF.withOpacity(.3),
                                    width: 3.w)),
                            child: ImageWidget(
                              url: "",
                              imageFailedPath: Assets.teamUiHead01,
                              width: 100.w,
                              height: 100.w,
                              borderRadius: BorderRadius.circular(50.w),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                                height: 30.w,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(15.w)),
                                child: IconWidget(
                                  iconWidth: 19.w,
                                  icon: Assets.iconUiIconCamera,
                                  iconColor: AppColors.c666666,
                                )),
                          )
                        ],
                      ),
                    ),
                    11.vGap,
                    Container(
                      height: 53.w,
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      padding: EdgeInsets.only(left: 25.w, right: 13.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Player Name",
                            style: 16.w4(color: AppColors.c262626, height: 1),
                          ),
                          IconWidget(
                            iconWidth: 15.w,
                            icon: Assets.iconUiIconCompile,
                            iconColor: AppColors.c666666,
                          )
                        ],
                      ),
                    ),
                    9.vGap,
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 78.w,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 21.w, top: 12.w, bottom: 14.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "UID",
                                  style: 16
                                      .w7(color: AppColors.c262626, height: 1),
                                ),
                                Text(
                                  "12345",
                                  style: 12
                                      .w4(color: AppColors.cB3B3B3, height: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        8.hGap,
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 78.w,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 24.w,
                                top: 12.w,
                                bottom: 14.w,
                                right: 20.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Birthday",
                                      style: 16.w7(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                    IconWidget(
                                      iconWidth: 9.w,
                                      icon: Assets.playerUiIconArrows01,
                                      iconColor: AppColors.c666666,
                                    ),
                                  ],
                                ),
                                Text(
                                  "2004-04-26",
                                  style: 12
                                      .w4(color: AppColors.cB3B3B3, height: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.vGap,
                    Container(
                      constraints: BoxConstraints(minHeight: 198.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      padding: EdgeInsets.only(
                          top: 12.w, left: 21.w, right: 16.w, bottom: 20.w),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Signature",
                                style:
                                    16.w7(color: AppColors.c262626, height: 1),
                              ),
                              15.vGap,
                              Container(
                                margin: EdgeInsets.only(right: 34.w),
                                child: Text(
                                  "I have had my invitation to this world's festival, and thus my life has been blessed.",
                                  style: 12.w4(color: AppColors.cB3B3B3),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: IconWidget(
                                iconWidth: 15.w,
                                icon: Assets.iconUiIconCompile,
                                iconColor: AppColors.c666666,
                              ))
                        ],
                      ),
                    ),
                    200.vGap
                  ],
                ),
              ),
            );
          },
          floatWidgets: [
            Positioned(
                left: 0,
                right: 0,
                bottom: 20.w,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      print('save----');
                    },
                    child: Container(
                      height: 44.w,
                      width: 263.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.circular(22.w)),
                      child: Text(
                        "SAVE",
                        style: 18.w7(color: AppColors.cF2F2F2, height: 1),
                      ),
                    ),
                  ),
                ))
          ],
        ));
      },
    );
  }
}
