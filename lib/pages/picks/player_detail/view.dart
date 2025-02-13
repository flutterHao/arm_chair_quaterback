import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/pages.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/keep_alive_wrapper.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/history/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/stats/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/view.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerDetailPageArguments {
  final int playerId;
  final String? tabStr; //选中的初始tab属性
  final bool isMyPlayer; //是不是我的球员

  PlayerDetailPageArguments(this.playerId,
      {this.tabStr, this.isMyPlayer = false});
}

class PlayerDetailPage extends GetView<PlayerDetailController> {
  const PlayerDetailPage({super.key, required this.arguments});

  @override
  String? get tag => getTag();

  String getTag() => "player_detail_page_${AppPages.history.length}";

  final PlayerDetailPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      responseDepth: const [0, 1, 3],
      child: GetBuilder<PlayerDetailController>(
        init: PlayerDetailController(arguments),
        tag: getTag(),
        id: PlayerDetailController.idMain,
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
                child: DefaultTabController(
              length: controller.tabs.length,
              child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverPersistentHeader(
                          delegate: FixedHeightSliverHeaderDelegate(
                              child: buildHeaderWidget(), height: 138.w)),
                      SliverPersistentHeader(
                          pinned: true,
                          floating: false,
                          delegate: FixedHeightSliverHeaderDelegate(
                              child: Container(
                                width: double.infinity,
                                color: AppColors.cFFFFFF,
                                height: 43.w,
                                child: TabBar(
                                  labelColor: AppColors.c000000,
                                  labelStyle: 16.w5(
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                  unselectedLabelColor: AppColors.cB3B3B3,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorColor: AppColors.cFF7954,
                                  tabs: controller.tabs.map((e) {
                                    return Text(e.tr);
                                  }).toList(),
                                ),
                              ),
                              height: 43.w))
                    ];
                  },
                  body: Obx(() {
                    if (controller.loadStatus.value != LoadDataStatus.success) {
                      return Center(
                        child: LoadStatusWidget(
                          loadDataStatus: controller.loadStatus.value,
                        ),
                      );
                    }
                    return TabBarView(children: [
                      KeepAliveWrapper(
                        child: SummaryPage(
                          playerId: arguments.playerId,
                          tabStr: arguments.tabStr,
                          playerDetailController: controller,
                        ),
                      ),
                      KeepAliveWrapper(
                          child: StatsPage(
                        playerDetailController: controller,
                      )),
                      KeepAliveWrapper(
                        child: HistoryPage(
                          playerId: arguments.playerId,
                        ),
                      ),
                    ]);
                  })),
            )),
          );
        },
      ),
    );
  }

  Widget buildHeaderWidget() {
    return Container(
      height: 138.w,
      color: Utils.getTeamColor(controller.teamInfo?.id ?? 0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
              left: -60,
              bottom: 12.w,
              child: Opacity(
                opacity: .2,
                child: ImageWidget(
                  url: Utils.getTeamUrl(controller.teamInfo?.id),
                  width: 148.w,
                  fit: BoxFit.fitHeight,
                  loadingWidget: const SizedBox.shrink(),
                  errorWidget: const SizedBox.shrink(),
                ),
              )),
          Positioned(
            top: 23.w,
            right: 15.w,
            child: IconWidget(iconWidth: 19.w, icon: Assets.playerUiIconFollow),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              4.hGap,
              SizedBox(
                width: 134.w,
                height: 134.w,
                child: Center(
                  child: ImageWidget(
                    url: Utils.getPlayUrl(controller.baseInfo?.playerId),
                    width: 134.w,
                    height: 134.w,
                    // loadingWidget: const SizedBox.shrink(),
                    errorWidget: const SizedBox.shrink(),
                  ),
                ),
              ),
              11.hGap,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 169.w),
                          child: Text(
                            controller.baseInfo?.elname ?? "",
                            maxLines: 3,
                            style: 21.w5(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                        11.hGap,
                        if (controller.baseInfo?.injuries == true)
                          IconWidget(
                              iconWidth: 20.w,
                              icon: Assets.commonUiCommonIconInjury),
                      ],
                    ),
                    5.vGap,
                    Text(
                      "#${controller.baseInfo?.number ?? ""}-${controller.baseInfo?.position ?? ""} - ${controller.teamInfo?.longEname ?? ""}",
                      style: 10.w4(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular),
                    ),
                    15.vGap,
                    Row(
                      children: [
                        _buildPlayerInfoItem(LangKey.gameName.tr,
                            "${controller.baseInfo?.age ?? "0"}"),
                        33.hGap,

                        ///todo
                        _buildPlayerInfoItem(LangKey.gameNameWt.tr, '0.8'),
                        33.hGap,

                        ///todo
                        _buildPlayerInfoItem(LangKey.gameNameAge.tr, "0.6"),
                      ],
                    ),
                    9.vGap,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildPlayerInfoItem(String key, String value) {
    return Column(
      children: [
        Text(
          value,
          style: 12.w5(
              color: AppColors.cFFFFFF,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium),
        ),
        5.vGap,
        Text(
          key,
          style: 10.w4(
              color: AppColors.cFFFFFF.withOpacity(0.3),
              height: 1,
              fontFamily: FontFamily.fRobotoRegular),
        ),
      ],
    );
  }
}
