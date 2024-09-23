import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/empty_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_detail_item.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/23/16:50

class ReciveAwardItem extends StatelessWidget {
  ReciveAwardItem(this.data, this.newsDefineEntity, {super.key});

  final List<ReciveAwardEntity> data;
  final NewsDefineEntity newsDefineEntity;

  late ReciveAwardItemController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(ReciveAwardItemController(data, newsDefineEntity));
    return GetBuilder<ReciveAwardItemController>(builder: (_) {
      return InkWell(
        onTap: () => _buildDetailDialog(context),
        child: Container(
          height: 105.w,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 9.w),
          padding:
              EdgeInsets.only(top: 13.w, bottom: 12.w, right: 15.w, left: 12.w),
          decoration: BoxDecoration(
              color: AppColors.cF2F2F2,
              borderRadius: BorderRadius.circular(16.w)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Text(
                          "${controller.getBetCount()}x",
                          style: 16.w7(color: AppColors.cF2F2F2, height: 1),
                        ),
                      ),
                      if (controller.getAwardCoin() != null) ...[
                        12.hGap,
                        IconWidget(
                            iconWidth: 17.w,
                            icon: Assets.testTeamLogoPng), //todo 换图
                        4.hGap,
                        Text(
                          "+${controller.getAwardCoin()}",
                          style: 16.w7(color: AppColors.c10A86A, height: 1),
                        ),
                      ]
                    ],
                  ),
                  Text(
                    controller.getTime(),
                    style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                  )
                ],
              ),
              6.vGap,
              Divider(
                height: 1,
                color: AppColors.c262626.withOpacity(.15),
              ),
              10.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 44.w,
                    constraints: BoxConstraints(maxWidth: 200.w),
                    child: Stack(
                      children: List.generate(
                          data.length >= 5 ? 5 : data.length, (index) {
                        /// 倒叙绘制
                        return Positioned(
                          left: 30.w *
                              ((data.length >= 5 ? 5 : data.length) -
                                  1 -
                                  index),
                          child: Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                  color: AppColors.cD9D9D9,
                                  borderRadius: BorderRadius.circular(22.w),
                                  border: Border.all(
                                      width: 2.w, color: AppColors.cF2F2F2)),
                              alignment: Alignment.bottomCenter,
                              child: data.length >= 5 && index == 0
                                  ? Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(left: 7.w),
                                      child: Text(
                                        "+${data.length - 5}",
                                        style: 12.w4(color: AppColors.c666666),
                                      ),
                                    )
                                  : Image.asset(
                                      Assets.testTeamLogoPng,
                                      width: 44.w,
                                      fit: BoxFit.fitWidth,
                                    )),
                        );
                      }),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.getGuessAward,
                    child: Container(
                      width: 98.w,
                      height: 27.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: data[0].guessData[0].status == 2 ?AppColors.cFF7954:AppColors.cB3B3B3,
                          borderRadius: BorderRadius.circular(14.w)),
                      child: Text(
                        data[0].guessData[0].status == 2 ? "GET" : "SAL",
                        style: 14.w4(color: AppColors.cF2F2F2),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Future<dynamic> _buildDetailDialog(BuildContext context) {
    return showModalBottomSheet(
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
                                  margin: EdgeInsets.only(top: 14.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.c1A1A1A,
                                      borderRadius: BorderRadius.circular(8)),
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
                                      Get.back(id: GlobalNestedKey.PICKS);
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
                                horizontal: 21.w, vertical: 21.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 55.w,
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.cB3B3B3,
                                            borderRadius:
                                                BorderRadius.circular(28.w)),
                                        child: Image.asset(
                                          Assets.testTeamLogoPng,
                                          width: 45.w,
                                        ),
                                      ),
                                      6.hGap,
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 150.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Player Name",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.cFF7954,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
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
                                                            fontSize: 10.sp),
                                                      ),
                                                      Text(
                                                        "3-2",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .cB3B3B3,
                                                            fontSize: 12.sp),
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
                                                            fontSize: 10.sp),
                                                      ),
                                                      Text(
                                                        "25.5x",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .cB3B3B3,
                                                            fontSize: 12.sp),
                                                      ),
                                                      Text(
                                                        "+8x",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .c10A86A,
                                                            fontSize: 12.sp),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "+256K",
                                      style: TextStyle(
                                          color: AppColors.c10A86A,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "JETTON",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: AppColors.cB3B3B3),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Image.asset(
                                          Assets.uiIconJettonPng,
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
                    //列表
                    Expanded(
                      // constraints: BoxConstraints(
                      //   maxHeight: 465.w
                      // ),
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
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
  }
}
