import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/recive_award_pick_page/recive_award_picks_page_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
///@auther gejiahui
///created at 2024/9/23/17:17

class ReciveAwardPicksPage extends StatefulWidget {
  const ReciveAwardPicksPage(this.teamId,this.teamSimpleEntity, {super.key});

  final int teamId;
  final TeamSimpleEntity teamSimpleEntity;

  @override
  State<ReciveAwardPicksPage> createState() => _ReciveAwardPicksPageState();
}

class _ReciveAwardPicksPageState extends State<ReciveAwardPicksPage>
    with AutomaticKeepAliveClientMixin {
  late final ReciveAwardPicksPageController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ReciveAwardPicksPageController(widget.teamId,widget.teamSimpleEntity));
  }

  @override
  Widget build(BuildContext context) {
    /// 上一条数据的时间
    int createTime = 0;
    return GetBuilder<ReciveAwardPicksPageController>(builder: (_) {
      return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 63.w + 88.w + 6.w),
        child: SmartRefresher(
          // enablePullUp: true,
          controller: controller.refreshController,
          onRefresh: () => controller.loading(),
          // onLoading: () => controller.loadMore(),
          child: controller.newsDefineEntity == null ||
                  controller.listData.isEmpty
              ? Center(child: Obx(() {
                  return LoadStatusWidget(
                    text: controller.loadStatusRx.value.desc,
                  );
                }))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 14.w + 34.w + 18.w,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 121.w,
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 25.w, top: 21.w),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  alignment: Alignment.bottomRight,
                                  opacity: .2,
                                  image: AssetImage(Assets.testTeamLogoPng)),

                              ///todo 换图
                              borderRadius: BorderRadius.circular(16.w),
                              gradient: const LinearGradient(colors: [
                                AppColors.c7e2919,
                                AppColors.c251a18
                              ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.teamSimpleEntity?.betCoin ?? 0}",
                                style:
                                    36.w7(color: AppColors.cFFE8DD, height: 1),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "JETTON",
                                    style: 10.w4(
                                        color: AppColors.c945D4A, height: 1),
                                  ),
                                  2.hGap,
                                  IconWidget(
                                      iconWidth: 10.w,
                                      icon: Assets.uiIconJettonPng)
                                ],
                              ),
                              12.vGap,
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.teamSimpleEntity?.winCount ?? 0}",
                                        style: 16.w7(
                                            color: AppColors.cFFE8DD,
                                            height: 1),
                                      ),
                                      3.vGap,
                                      Text(
                                        "WIN COUNT",
                                        style: 10.w4(
                                            color: AppColors.c945D4A,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                  35.hGap,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.teamSimpleEntity.getGuessSuccessRate}%",
                                        style: 16.w7(
                                            color: AppColors.cFFE8DD,
                                            height: 1),
                                      ),
                                      3.vGap,
                                      Text(
                                        "SUCCESS",
                                        style: 10.w4(
                                            color: AppColors.c945D4A,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                  40.hGap,
                                  if (controller
                                          .teamSimpleEntity!.lastGuess.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: List.generate(
                                              controller.teamSimpleEntity
                                                      !.lastGuess.length ,
                                              (index) => Container(
                                                    width: 12.w,
                                                    height: 12.w,
                                                    margin: EdgeInsets.only(
                                                        right: 5.w),
                                                    decoration: BoxDecoration(

                                                        ///todo 判断条件
                                                        color: controller
                                                                        .teamSimpleEntity
                                                                        !.lastGuess[
                                                                    index] ==
                                                                "0"
                                                            ? AppColors.cE72646
                                                            : AppColors.c10A86A,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.w)),
                                                  )),
                                        ),
                                        3.vGap,
                                        Text(
                                          "LAST5",
                                          style: 10.w4(
                                              color: AppColors.c945D4A,
                                              height: 1),
                                        )
                                      ],
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                        24.vGap,
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: 13.w, right: 13.w, bottom: 10.w, top: 16.w),
                        //   child: Text("Aug 1,2024",
                        //       style: 19.w7(color: AppColors.c262626)),
                        // ),
                        ...List.generate(controller.listData.length, (index) {
                          List<PicksPlayer> items = controller.listData[index];
                          var itemData = items[0];
                          var itemCreateTime =
                              itemData.reciveAwardInfo.createTime;
                          var sameDay = MyDateUtils.isSameDay(
                              MyDateUtils.getDateTimeByMs(createTime),
                              MyDateUtils.getDateTimeByMs(itemCreateTime));
                          createTime = itemCreateTime;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!sameDay)
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 13.w, bottom: 10.w, top: 16.w),
                                  child: Text(
                                      MyDateUtils.getEnMMDDYYYY(
                                          MyDateUtils.getDateTimeByMs(
                                              itemCreateTime),
                                          short: true),
                                      style: 19.w7(color: AppColors.c262626)),
                                ),
                              ReciveAwardItem(
                                items,
                                controller.newsDefineEntity!,
                                personalCenterPage: true,
                              ),
                            ],
                          );
                        }),
                        20.vGap
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
