import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/recive_award_pick_page/recive_award_picks_page_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
///@auther gejiahui
///created at 2024/9/23/17:17

class ReciveAwardPicksPage extends StatefulWidget {
  const ReciveAwardPicksPage(this.teamId, this.teamSimpleEntity, {super.key});

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
    controller = Get.put(
        ReciveAwardPicksPageController(widget.teamId, widget.teamSimpleEntity));
  }

  @override
  Widget build(BuildContext context) {
    print('ReciveAwardPicksPage-----build----');
    return GetBuilder<ReciveAwardPicksPageController>(
        id: ReciveAwardPicksPageController.idReceivePageMain,
        builder: (_) {
          return SmartRefresher(
            // enablePullUp: true,
            controller: controller.refreshController,
            onRefresh: () => controller.loading(),
            // onLoading: () => controller.loadMore(),
            child: controller.picksDefineEntity == null
                ? Center(child: Obx(() {
                    return LoadStatusWidget(
                      text: controller.loadStatusRx.value.desc,
                    );
                  }))
                : NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      var find = Get.find<PersonalCenterController>();
                      return <Widget>[
                        SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 16.w, left: 14.w, right: 14.w),
                            height: 121.w,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 25.w, top: 21.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                gradient: LinearGradient(
                                    colors: find.rank > 0
                                        ? [
                                            AppColors.c7e2919,
                                            AppColors.c251a18,
                                          ]
                                        : [
                                            AppColors.c262626,
                                            AppColors.c4c4c4c
                                          ])),
                            child: Stack(
                              children: [
                                Positioned(
                                    right: -30,
                                    top: 0,
                                    child: Opacity(
                                        opacity: .05,
                                        child: IconWidget(
                                            iconWidth: 120.w,
                                            icon: Assets.iconProp102))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.teamSimpleEntity.betCoin ?? 0}",
                                      style: 36.w7(
                                          color: AppColors.cFFFFFF, height: 1),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "JETTON",
                                          style: 10.w4(
                                              color: AppColors.c666666,
                                              height: 1),
                                        ),
                                        2.hGap,
                                        IconWidget(
                                          iconWidth: 10.w,
                                          icon: Assets.iconProp102,
                                          iconColor: AppColors.cFFFFFF,
                                        )
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
                                              "${controller.teamSimpleEntity.winCount ?? 0}",
                                              style: 16.w7(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1),
                                            ),
                                            3.vGap,
                                            Text(
                                              "WIN COUNT",
                                              style: 10.w4(
                                                  color: AppColors.c666666,
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
                                                  color: AppColors.cFFFFFF,
                                                  height: 1),
                                            ),
                                            3.vGap,
                                            Text(
                                              "SUCCESS",
                                              style: 10.w4(
                                                  color: AppColors.c666666,
                                                  height: 1),
                                            )
                                          ],
                                        ),
                                        40.hGap,
                                        if (controller.teamSimpleEntity!
                                            .lastGuess.isNotEmpty)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: List.generate(
                                                    controller.teamSimpleEntity!
                                                        .lastGuess.length,
                                                    (index) => Container(
                                                          width: 12.w,
                                                          height: 12.w,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 5.w),
                                                          decoration:
                                                              BoxDecoration(

                                                                  ///todo 判断条件
                                                                  color: controller.teamSimpleEntity!.lastGuess[
                                                                              index] ==
                                                                          "0"
                                                                      ? AppColors
                                                                          .cE72646
                                                                      : AppColors
                                                                          .c10A86A,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.w)),
                                                        )),
                                              ),
                                              3.vGap,
                                              Text(
                                                "LAST5",
                                                style: 10.w4(
                                                    color: AppColors.c666666,
                                                    height: 1),
                                              )
                                            ],
                                          )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverHeaderDelegate(
                            //有最大和最小高度
                            maxHeight: 68.w,
                            minHeight: 68.w,
                            child: Container(
                              color: AppColors.cE6E6E6,
                              padding: EdgeInsets.only(left: 14.w, right: 14.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18.w,
                                  ),
                                  Text(
                                    "History",
                                    style: 19.w7(
                                        color: AppColors.c262626, height: 1),
                                  ),
                                  10.vGap,
                                  Container(
                                    constraints:
                                        BoxConstraints(maxWidth: 258.w),
                                    height: 20.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(17.w)),
                                    child: LayoutBuilder(
                                        builder: (context, constraints) {
                                      return TLBuildWidget(
                                          controller: controller.tabController,
                                          builder: (current, next, progress,
                                              totalProgress) {
                                            return Row(
                                              children: List.generate(
                                                  controller.tabs.length,
                                                  (index) => Expanded(
                                                        child: InkWell(
                                                            onTap: () =>
                                                                controller
                                                                    .tabController
                                                                    .animateTo(
                                                                        index),
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          4.w),
                                                              decoration: BoxDecoration(
                                                                  color: current == index
                                                                      ? Color.lerp(AppColors.c262626, AppColors.cD9D9D9, progress)!
                                                                      : next == index
                                                                          ? Color.lerp(AppColors.cD9D9D9, AppColors.c262626, progress)!
                                                                          : AppColors.cD9D9D9,
                                                                  borderRadius: BorderRadius.circular(10.w)),
                                                              child: Center(
                                                                  child: Text(
                                                                      controller
                                                                              .tabs[
                                                                          index],
                                                                      style:
                                                                          13.w4(
                                                                        color: current ==
                                                                                index
                                                                            ? Color.lerp(
                                                                                AppColors.cF2F2F2,
                                                                                AppColors.c262626,
                                                                                progress)!
                                                                            : next == index
                                                                                ? Color.lerp(AppColors.c262626, AppColors.cF2F2F2, progress)!
                                                                                : AppColors.c262626,
                                                                      ))),
                                                            )),
                                                      )),
                                            );
                                          });
                                    }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.tabController,
                        children: [
                          buildContainer(controller.listPointsData,
                              point: true),
                          buildContainer(controller.listNewsData),
                        ])),
          );
        });
  }

  Widget buildContainer(List<List<PicksPlayer>> data, {bool point = false}) {
    if (data.isEmpty) {
      return const Center(
          child: LoadStatusWidget(
        loadDataStatus: LoadDataStatus.noData,
      ));
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.vGap,
          if (point) ...[
            Container(
              height: 60.w,
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)),
              child: Row(
                children: [
                  13.hGap,
                  Container(
                    height: 34.w,
                    width: 91.w,
                    decoration: BoxDecoration(
                        color: AppColors.cE6E6E6,
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.lastWinningStreak}",
                          style: 19.w7(
                              color: AppColors.c666666,
                              height: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          "Last interrupt",
                          style: 10.w4(color: AppColors.c666666),
                        )
                      ],
                    ),
                  ),
                  17.hGap,
                  Container(
                    height: 34.w,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: AppColors.c10A86A,
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.guessWinningStreak}",
                          style: 19.w7(
                              color: AppColors.cF1F1F1,
                              height: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          "Streak",
                          style: 10.w4(color: AppColors.cF1F1F1),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconWidget(
                            iconWidth: 15.w,
                            icon: Assets.iconProp102,
                            iconColor: AppColors.c10A86A,
                          ),
                          4.hGap,
                          Text(
                            "+${Utils.formatChip(controller.streakReward)}",
                            style: 19.w7(
                                color: AppColors.c10A86A,
                                height: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          5.hGap,
                        ],
                      ),
                      Text(
                        "Winning streak bonus",
                        style: 10.w4(color: AppColors.c666666),
                      )
                    ],
                  )),
                  16.hGap,
                ],
              ),
            ),
            9.vGap,
          ],
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    List<PicksPlayer> items = data[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReceiveAwardItem(
                          items,
                          controller.picksDefineEntity!,
                          personalCenterPage: true,
                        ),
                        if (index == data.length - 1) 20.vGap,
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
