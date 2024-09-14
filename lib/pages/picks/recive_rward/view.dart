import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guss_item.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class ReciveRwardPage extends GetView<ReciveRwardController> {
  const ReciveRwardPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    return Expanded(
        child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
                left: 13.w, right: 13.w, bottom: 10.w, top: 16.w),
            child: Text("Aug 1,2024", style: 19.w7(color: AppColors.c262626)),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(childCount: 3, (_, index) {
                return InkWell(
                  onTap: () {
                    print('点击了详情$index');
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Container(
                            constraints: BoxConstraints(maxHeight: 550.w),
                            decoration: BoxDecoration(
                                color: AppColors.cE6E6E6,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(22.w),
                                    topRight: Radius.circular(22.w))),
                            child: Stack(
                              children: [
                                Container(
                                  height: 42.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFF7954,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(22.w),
                                          topRight: Radius.circular(22.w))),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 2.w,
                                    ),
                                    //头部
                                    Container(
                                      // height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColors.c262626,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(22.w),
                                              topRight: Radius.circular(22.w))),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: 84.w,
                                                  height: 16.w,
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      top: 14.w),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.c1A1A1A,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Text(
                                                    "AM 8:05",
                                                    style: TextStyle(
                                                      color: AppColors.cB3B3B3,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      print('点击了关闭');
                                                      Get.back(
                                                          id: GlobalNestedKey
                                                              .PICKS);
                                                    },
                                                    child: Container(
                                                      width: 45.w,
                                                      height: 45.w,
                                                      child: Image.asset(
                                                        Assets.iconClosePng,
                                                        width: 13.w,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 21.w,
                                                vertical: 21.w),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 55.w,
                                                  width: 55.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.cB3B3B3,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28.w)),
                                                  child: Image.asset(
                                                    Assets.testTeamLogoPng,
                                                    width: 45.w,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        right: 90.w),
                                                    margin: EdgeInsets.only(
                                                        left: 6.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Player Name",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .cFF7954,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "W-L",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .cB3B3B3,
                                                                  fontSize:
                                                                      10.sp),
                                                            ),
                                                            Text(
                                                              "3-2",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .cB3B3B3,
                                                                  fontSize:
                                                                      12.sp),
                                                            ),
                                                            Container(),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "ODDS",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .cB3B3B3,
                                                                  fontSize:
                                                                      10.sp),
                                                            ),
                                                            Text(
                                                              "25.5x",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .cB3B3B3,
                                                                  fontSize:
                                                                      12.sp),
                                                            ),
                                                            Text(
                                                              "+8x",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .c10A86A,
                                                                  fontSize:
                                                                      12.sp),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "+256K",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.c10A86A,
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "JETTON",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: AppColors
                                                                  .cB3B3B3),
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Image.asset(
                                                          Assets
                                                              .uiIconJettonPng,
                                                          width: 10.w,
                                                          fit: BoxFit.fitWidth,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10.w,
                                    // ),
                                    //列表
                                    Expanded(
                                      // constraints: BoxConstraints(
                                      //   maxHeight: 465.w
                                      // ),
                                      child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                if (index == 0) 8.vGap,
                                                const ReciveAwardDetailItem(),
                                              ],
                                            );
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 100,
                    width: 70,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(16.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 9.w,
                        ),
                        Text(
                          "PM 8:05",
                          style: TextStyle(
                              color: AppColors.cB3B3B3, fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Container(
                          width: 63.w,
                          height: 63.w,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // todo 换图
                              Image.asset(
                                Assets.testTeamLogoPng,
                                width: 63.w,
                              ),
                              Text("8x", style: 24.w7(color: AppColors.c262626))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text("+256K", style: 30.w7(color: AppColors.c10A86A)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "JETTON",
                              style: TextStyle(
                                  color: AppColors.cB3B3B3, fontSize: 10.sp),
                            ),
                            //todo 换图
                            Image.asset(
                              Assets.uiIconJettonPng,
                              width: 10.w,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.w,
                        ),
                        SizedBox(
                          height: 65.w,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 7.w),
                                  child: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.cD9D9D9,
                                              borderRadius:
                                                  BorderRadius.circular(24.w)),
                                          child: Image.asset(
                                            Assets.testTeamLogoPng,
                                            width: 48.w,
                                            fit: BoxFit.fitWidth,
                                          )),
                                      SizedBox(
                                        height: 4.w,
                                      ),
                                      //todo 换图
                                      Image.asset(
                                        Assets.uiIconReadPng,
                                        width: 12.w,
                                        fit: BoxFit.fitWidth,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            print('点击了$index');
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 14.w),
                            alignment: Alignment.center,
                            height: 24.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.w),
                                border: Border.all(
                                    color: AppColors.cFF7954, width: 1.w)),
                            child: Text("GET",
                                style: 12.w7(color: AppColors.cFF7954)),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisSpacing: 9.sp,
                  // mainAxisExtent: 9.sp,
                  childAspectRatio: 167 / 274,
                  crossAxisCount: 2)),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 35.w))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReciveRwardController>(
      builder: (_) {
        return BlackAppWidget(
          const AppBarWidget(
            id: GlobalNestedKey.PICKS,
            title: "RECEIVE AWARD",
          ),
          bodyWidget: _buildView(context),
          floatWidgets: [
            //下注
            Positioned(
                left: 63.w,
                right: 63.w,
                bottom: 20.w,
                child: SizedBox(
                  height: 43.w,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0.w,
                        child: Container(
                          height: 40.w,
                          decoration: BoxDecoration(
                              color: AppColors.cFF7954,
                              borderRadius: BorderRadius.circular(20.w)),
                        ),
                      ),
                      Container(
                        height: 40.w,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.c000000,
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: Text("RECEIVE",
                            style: 16.w7(color: AppColors.cFFFFFF)),
                      )
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}
