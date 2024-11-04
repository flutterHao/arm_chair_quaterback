import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_detail_item.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/23/16:50

class ReciveAwardItem extends StatelessWidget {
  ReciveAwardItem(this.data, this.newsDefineEntity,
      {this.personalCenterPage = false, super.key});

  final List<PicksPlayer> data;
  final NewsDefineEntity newsDefineEntity;
  final bool personalCenterPage;

  late ReciveAwardItemController controller;

  @override
  Widget build(BuildContext context) {
    controller = ReciveAwardItemController(data, newsDefineEntity);
    return GetBuilder<ReciveAwardItemController>(
        init: controller,
        tag: data[0].reciveAwardInfo.id.toString(),
        id: controller.idReciveAwardItem,
        builder: (_) {
          return InkWell(
            onTap: () => _buildDetailDialog(context),
            child: Container(
              height: 107.w,
              width: double.infinity,
              margin: EdgeInsets.only(top: 9.w),
              padding: EdgeInsets.only(
                  top: 13.w, bottom: 12.w, right: 15.w, left: 12.w),
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusWidget(),

                      //右上角结果
                      Row(
                        children: List.generate(data.length, (index) {
                          return Container(
                            height: 12.w,
                            width: 12.w,
                            margin: EdgeInsets.only(left: 6.w),
                            decoration: BoxDecoration(
                                color: controller.getStatus() != 1
                                    ? data[index]
                                            .reciveAwardInfo
                                            .guessData[index]
                                            .success
                                        ? AppColors.c10A86A
                                        : AppColors.cE72646
                                    : AppColors.cTransparent,
                                border: controller.getStatus() != 1
                                    ? null
                                    : Border.all(
                                        color: AppColors.cB3B3B3, width: 1),
                                borderRadius: BorderRadius.circular(6.w)),
                          );
                        }),
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
                        height: 46.w,
                        constraints: BoxConstraints(maxWidth: 200.w),
                        child: Stack(
                          children: List.generate(
                              controller.data.length > 5
                                  ? 5
                                  : controller.data.length, (index) {
                            /// 倒叙绘制
                            return Positioned(
                                left: 30.w *
                                    ((controller.data.length >= 5
                                            ? 5
                                            : controller.data.length) -
                                        1 -
                                        index),
                                child: Container(
                                  width: 46.w,
                                  height: 46.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cD9D9D9,
                                      borderRadius: BorderRadius.circular(22.w),
                                      border: Border.all(
                                          width: 2.w,
                                          color: AppColors.cF2F2F2)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(22.w),
                                    child: Container(
                                        width: 44.w,
                                        height: 44.w,
                                        alignment: Alignment.bottomCenter,
                                        child: controller.data.length >= 5 &&
                                                index == 0
                                            ? Container(
                                                alignment: Alignment.center,
                                                padding:
                                                    EdgeInsets.only(left: 7.w),
                                                child: Text(
                                                  "+${controller.data.length - 4}",
                                                  style: 12.w4(
                                                      color: AppColors.c666666),
                                                ),
                                              )
                                            : ImageWidget(
                                                url: Utils.getPlayUrl(controller
                                                    .data[index]
                                                    .guessData
                                                    ?.playerId),
                                                imageFailedPath:
                                                    Assets.uiDefault_04Png,
                                                width: 40.w,
                                                height: 40.w,
                                              )),
                                  ),
                                ));
                          }),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "${MyDateUtils.getMonthEnName(MyDateUtils.getDateTimeByMs(controller.data[0].reciveAwardInfo.createTime), short: true)} ${MyDateUtils.getDateTimeByMs(controller.data[0].reciveAwardInfo.createTime).day}",
                            style: 12.w4(color: AppColors.cB3B3B3),
                          ),
                          if (personalCenterPage)
                            Container(
                              width: 68.w,
                              height: 27.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.w),
                                  border: Border.all(
                                      color: AppColors.c262626.withOpacity(.2),
                                      width: 1)),
                              child: Text(
                                "View all",
                                style: 12.w4(color: AppColors.c666666),
                              ),
                            )
                          else
                            InkWell(
                              onTap:
                                  controller.data[0].reciveAwardInfo.status == 2
                                      ? () => controller.getGuessAward()
                                      : null,
                              child: Container(
                                width: 98.w,
                                height: 27.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: controller.data[0].reciveAwardInfo
                                                .status ==
                                            2
                                        ? AppColors.cFF7954
                                        : AppColors.cB3B3B3,
                                    borderRadius: BorderRadius.circular(14.w)),
                                child: Text(
                                  controller.data[0].reciveAwardInfo.status == 2
                                      ? "GET"
                                      : "SAL",
                                  style: 14.w4(color: AppColors.cF2F2F2),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildStatusWidget({bool showModal = true}) {
    if (controller.getStatus() == 1) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWidget(
            iconWidth: 13.w,
            icon: Assets.uiIconCountdownPng,
            iconColor: AppColors.c262626,
          ),
          3.hGap,
          Text(
            MyDateUtils.formatDate(
                MyDateUtils.getDateTimeByMs(MyDateUtils.getNextDayStartTimeMS(
                        MyDateUtils.nextDay(MyDateUtils.getDateTimeByMs(
                            controller.data[0].reciveAwardInfo.createTime))) -
                    MyDateUtils.getNowDateMs()),
                format: DateFormats.H_M_S),
            style: 16.w4(color: AppColors.c262626, height: 1),
          )
        ],
      );
    }
    return Row(
      mainAxisAlignment:
          showModal ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        if (showModal) ...[
          Container(
            height: 18.w,
            width: 71.w,
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.circular(5.w)),
            child: Center(
              child: Text(
                controller.getTypeString(),
                style: 10.w4(color: AppColors.cF2F2F2, height: 1),
              ),
            ),
          ),
          12.hGap
        ],
        IconWidget(
          iconWidth: 17.w,
          icon: Assets.uiIconJettonBigPng,
          iconColor:
              !controller.getSuccess() ? AppColors.cB3B3B3 : AppColors.c10A86A,
        ),
        4.hGap,
        Text(
          ("+${Utils.formatMoney(double.parse(controller.getSuccess() ? (controller.getAwardCoin() ?? "0") : "0"))}"),
          style: 16.w7(
              color: !controller.getSuccess()
                  ? AppColors.cB3B3B3
                  : AppColors.c10A86A,
              height: 1),
        ),
      ],
    );
  }

  Future<dynamic> _buildDetailDialog(BuildContext context) {
    int winTimesCount = controller.data[0].reciveAwardInfo.guessData
        .where((e) => e.success)
        .toList()
        .length;
    var status = controller.getStatus();
    var success = controller.data[0].reciveAwardInfo.success;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            constraints: BoxConstraints(maxHeight: 666.h),
            child: DialogBackground(
                frontColor: AppColors.cE6E6E6,
                borderHeight: 2.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.ccccccc,
                          borderRadius: BorderRadius.circular(2.w)),
                      height: 4.w,
                      width: 64.w,
                    ),
                    24.vGap,
                    Builder(builder: (context) {
                      Color big = status == 1
                          ? AppColors.ccccccc
                          : success
                              ? AppColors.c53CF8A
                              : AppColors.cE8909E;
                      Color mid = status == 1
                          ? AppColors.cB3B3B3
                          : success
                              ? AppColors.c10A86A
                              : AppColors.cE72646;
                      return Container(
                        height: 112.w,
                        width: 112.w,
                        decoration: BoxDecoration(
                            color: big.withOpacity(0.19),
                            borderRadius: BorderRadius.circular(56.w)),
                        child: Center(
                          child: Container(
                            width: 90.w,
                            height: 90.w,
                            decoration: BoxDecoration(
                                color: mid,
                                borderRadius: BorderRadius.circular(45.w)),
                            child: Center(
                              child: Container(
                                width: 35.w,
                                height: 35.w,
                                decoration: BoxDecoration(
                                    color: AppColors.cE6E6E6,
                                    borderRadius: BorderRadius.circular(18.w)),
                                child: IconWidget(
                                  iconWidth: 18.w,
                                  icon: Assets.uiIconRuidgtPng,
                                  iconColor: mid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    8.vGap,
                    _buildStatusWidget(showModal: false),
                    5.vGap,
                    Text(
                      controller.getTime(),
                      style: 12.w4(
                          color: AppColors.c262626.withOpacity(0.4), height: 1),
                    ),
                    17.vGap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 131.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                              color: AppColors.cD9D9D9,
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.getTypeString(),
                                  style: 14
                                      .w7(color: AppColors.c666666, height: 1),
                                ),
                                if (controller.getStatus() == 1)
                                  Text(
                                    "Be settling",
                                    style: 16.w7(
                                        color: AppColors.c262626, height: 1),
                                  )
                                else
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$winTimesCount",
                                        style: 16.w7(
                                            color: AppColors.c282828,
                                            height: 1),
                                      ),
                                      4.hGap,
                                      Text(
                                        "correct",
                                        style: 12.w4(
                                            color: AppColors.c262626,
                                            height: 1),
                                      ),
                                      12.hGap,
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.c262626,
                                            borderRadius:
                                                BorderRadius.circular(5.w)),
                                        width: 40.w,
                                        height: 15.w,
                                        child: Center(
                                          child: Text(
                                            "${controller.getBetCount()}x",
                                            style: 11.w4(
                                                color: AppColors.cF2F2F2,
                                                height: 1),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ],
                            ),
                          ),
                        ),
                        12.hGap,
                        Container(
                          width: 131.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                              color: AppColors.cD9D9D9,
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Win-Lose",
                                  style: 14
                                      .w7(color: AppColors.c666666, height: 1),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(data.length, (index) {
                                    return Container(
                                      height: 12.w,
                                      width: 12.w,
                                      margin: EdgeInsets.only(left: 6.w),
                                      decoration: BoxDecoration(
                                          color: controller.getStatus() != 1
                                              ? data[index]
                                                      .reciveAwardInfo
                                                      .guessData[index]
                                                      .success
                                                  ? AppColors.c10A86A
                                                  : AppColors.cE72646
                                              : AppColors.cTransparent,
                                          border: controller.getStatus() != 1
                                              ? null
                                              : Border.all(
                                                  color: AppColors.cB3B3B3,
                                                  width: 1),
                                          borderRadius:
                                              BorderRadius.circular(6.w)),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    24.vGap,
                    //列表
                    Expanded(
                      // constraints: BoxConstraints(
                      //   maxHeight: 465.w
                      // ),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ReciveAwardDetailItem(
                                      controller.data[index], newsDefineEntity),
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
