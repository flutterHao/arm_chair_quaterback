import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/widgets/guess_history_item/guess_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PicksHistoryPage extends GetView<PicksHistoryController> {
  const PicksHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: GetBuilder<PicksHistoryController>(
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(child: Obx(() {
              if (controller.loadStatus.value != LoadDataStatus.success) {
                return Center(
                  child: LoadStatusWidget(
                    loadDataStatus: controller.loadStatus.value,
                  ),
                );
              }
              return DefaultTabController(
                length: 2,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverPersistentHeader(
                            delegate: FixedHeightSliverHeaderDelegate(
                                child: Container(
                                  height: 144.w,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 34.w),
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                        AppColors.c262626,
                                        AppColors.c525252
                                      ])),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          right: -60.w,
                                          top: 16.w,
                                          child: IconWidget(
                                            iconWidth: 200.w,
                                            icon: Assets
                                                .picksUiPicksHistoryJettonBig,
                                            iconColor: AppColors.cFFFFFF
                                                .withOpacity(0.05),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          21.vGap,
                                          Row(
                                            children: [
                                              IconWidget(
                                                  iconWidth: 15.w,
                                                  icon: Assets
                                                      .commonUiCommonIconCurrency02),
                                              4.hGap,
                                              Text(
                                                "AMOUNT WIN",
                                                style: 12.w4(
                                                    color: AppColors.cFFFFFF
                                                        .withOpacity(0.3),
                                                    height: 1,
                                                    fontFamily: FontFamily.fRobotoRegular),
                                              )
                                            ],
                                          ),
                                          10.vGap,
                                          Text(
                                            "${controller.teamSimpleEntity.betCoin}",
                                            style: 45.w7(
                                                color: AppColors.cFFFFFF,
                                                fontFamily:
                                                FontFamily.fOswaldBold,
                                                height: 1),
                                          ),
                                          24.vGap,
                                          Row(
                                            children: [
                                              Text(
                                                "CONTESTS WON: ",
                                                style: 12.w5(
                                                    color: AppColors.cFFFFFF,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoMedium),
                                              ),
                                              Text(
                                                "${controller.teamSimpleEntity.winCount}",
                                                style: 16.w5(
                                                    color: AppColors.cFFFFFF,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoMedium),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                height: 144.w)),
                        SliverPersistentHeader(
                            pinned: true,
                            delegate: FixedHeightSliverHeaderDelegate(
                              child: _buildTabBar(),
                              height: 36.w,
                            )),
                      ];
                    },
                    body: TabBarView(children: [
                      _PicksHistoryPage(data: controller.getOpenList()),
                      _PicksHistoryPage(data: controller.getCloseList()),
                    ])),
              );
            })),
          );
        },
      ),
    );
  }

  Container _buildTabBar() {
    return Container(
      height: 36.w,
      color: AppColors.cFFFFFF,
      child: TabBar(
          labelColor: AppColors.c000000,
          unselectedLabelColor: AppColors.cB3B3B3,
          labelStyle: 16.w5(height: 1, fontFamily: FontFamily.fOswaldMedium),
          unselectedLabelStyle:
              16.w5(height: 1, fontFamily: FontFamily.fOswaldMedium),
          dividerHeight: 0,
          indicatorColor: AppColors.cFF7954,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3.w,
          tabs: List.generate(controller.tabs.length, (index) {
            return Text(controller.tabs[index]);
          })),
    );
  }
}

class _PicksHistoryPage extends StatefulWidget {
  const _PicksHistoryPage({super.key, required this.data});

  final Map<String, List<ReciveAwardV2GuessInfo>> data;

  @override
  State<_PicksHistoryPage> createState() => _PicksHistoryPageState();
}

class _PicksHistoryPageState extends State<_PicksHistoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, widget.data);
  }

  Widget _buildPage(
      BuildContext context, Map<String, List<ReciveAwardV2GuessInfo>> data) {
    return Builder(builder: (context) {
      if (data.isEmpty) {
        return const Center(
          child: LoadStatusWidget(
            loadDataStatus: LoadDataStatus.noData,
          ),
        );
      }
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: data.keys.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, outerIndex) {
            var key = data.keys.toList()[outerIndex];
            var list = data[key]!;
            bool lastIndex = outerIndex == data.keys.length - 1;
            return Container(
              color: AppColors.cFFFFFF,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              margin: EdgeInsets.only(top: 9.w, bottom: lastIndex ? 9.w : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 时间
                  Container(
                    margin: EdgeInsets.only(top: 22.w, bottom: 19.w),
                    child: Text(
                      key,
                      style: 30.w7(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldBold),
                    ),
                  ),
                  ...List.generate(list.length, (innerIndex) {
                    var guessInfo = list[innerIndex];
                    return Container(
                      margin: EdgeInsets.only(bottom: 17.w),
                      child: GuessHistoryItem(
                        guessInfo: guessInfo,
                      ),
                    );
                  })
                ],
              ),
            );
          },
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
