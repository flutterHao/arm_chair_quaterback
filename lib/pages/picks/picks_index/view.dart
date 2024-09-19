import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guss_item.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guss_player_item.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/picks_swiper_pagination_builder.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/rank_start_button.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/index.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PicksIndex extends StatelessWidget {
  const PicksIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.PicksTabGlobalKey,
      initialRoute: RouteNames.picksPicksIndex,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.picksPicksIndex:
            return GetPageRoute(
                settings: setting, page: () => const PicksIndexPage());
          case RouteNames.picksReciveRward:
            return GetPageRoute(
                settings: setting,
                page: () => const ReciveRwardPage(),
                binding: ReciveRwardBinding());
          case RouteNames.picksPickRank:
            return GetPageRoute(
                settings: setting,
                page: () => const PickRankPage(),
                binding: PickRankBinding());
          case RouteNames.picksPlayerDetail:
            return GetPageRoute(
                settings: setting,
                page: () => const PlayerDetailPage(),
                binding: PlayerDetailBinding());
        }
      },
    );
  }
}

class PicksIndexPage extends StatefulWidget {
  const PicksIndexPage({super.key});

  @override
  State<PicksIndexPage> createState() => _PicksIndexPageState();
}

class _PicksIndexPageState extends State<PicksIndexPage>
    with AutomaticKeepAliveClientMixin {
  late PicksIndexController picksIndexController;

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: picksIndexController.scrollController,
      slivers: [
        SliverPadding(padding: EdgeInsets.only(top: 40.w+MediaQuery.of(context).padding.top+6.w+11.w)),
        //banner
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 315/137,
            child: Container(
              margin: EdgeInsets.only(top: 16.w),
              child: Center(
                child: Swiper(
                  itemCount: 3,
                  autoplay: true,
                  viewportFraction: .8,
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  scale: .9,
                  pagination: PicksSwiperPaginationBuilder(),
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        Get.toNamed(RouteNames.picksReciveRward,
                            id: GlobalNestedKey.PICKS);
                      case 1:
                        Get.toNamed(RouteNames.picksPickRank,
                            id: GlobalNestedKey.PICKS);
                      case 2:
                    }
                  },
                  itemBuilder: (_, index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: AspectRatio(
                        aspectRatio: 315/137,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Image.asset(Assets.uiBannerAwardPng,height: 137.w,fit: BoxFit.fitWidth,)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
                left: 16.w, right: 37.w, top: 20.w, bottom: 13.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Point Guessing",
                  style: 19.w7(color: AppColors.c000000),
                ),
                Text(
                  "07/28 Wed",
                  style: TextStyle(fontSize: 13.sp, color: AppColors.c666666),
                )
              ],
            ),
          ),
        ),
        //竞猜球员列表
        SliverFixedExtentList(
          itemExtent: 125.w, //列表项高度固定
          delegate: SliverChildBuilderDelegate(
            (_, index) => GussItem(),
            childCount: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
                left: 16.w, right: 37.w, top: 20.w, bottom: 13.w),
            child: Text(
              "Point Guessing",
              style: 19.w7(color: AppColors.c000000),
            ),
          ),
        ),
        //竞猜榜单
        SliverToBoxAdapter(
          child: InkWell(
            onTap: () => Get.toNamed(RouteNames.picksPickRank,
                id: GlobalNestedKey.PICKS),
            child: Container(
              height: 36.w,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 24.w, right: 26.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    child: Text(
                      "LIST",
                      style: TextStyle(
                          fontSize: 10.sp, color: AppColors.c666666),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "NAME",
                      style: TextStyle(
                          fontSize: 10.sp, color: AppColors.c666666),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 55.w,
                    child: Text(
                      "JETTON",
                      style: TextStyle(
                          fontSize: 10.sp, color: AppColors.c666666),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(childCount: 10, (_, index) {
              return InkWell(
                onTap: () => Get.toNamed(RouteNames.picksPickRank,
                    id: GlobalNestedKey.PICKS),
                child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color:
                            index % 2 != 0 ? Colors.white : AppColors.cEDEDED,
                        borderRadius: index == 9
                            ? BorderRadius.only(
                                bottomRight: Radius.circular(16.w),
                                bottomLeft: Radius.circular(16.w))
                            : null),
                    padding: EdgeInsets.only(left: 24.w, right: 26.w),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GussPlayerItem(
                      index,
                      //滑动到榜单的第3个列表项时显示个人榜单信息
                      key: index == 2 ? picksIndexController.targetKey : null,
                    )),
              );
            }),
            itemExtent: 70.w),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 90.w,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    picksIndexController = Get.put(PicksIndexController());
    return GetBuilder<PicksIndexController>(
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(),
          totalScreenWidget: _buildView(),
          floatWidgets: [
            //个人榜单信息浮窗
            Obx(() {
              return AnimatedPositioned(
                  left: 6.w,
                  right: 6.w,
                  bottom: picksIndexController.isSelfInfoFloatShow.value
                      ? 9.w
                      : -68.w,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: EdgeInsets.only(left: 43.w, right: 33.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppColors.c333333),
                    height: 68.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "--",
                              style: 18.w7(color: AppColors.cFF7954),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Image.asset(
                              Assets.testTeamLogoPng,
                              width: 48.w,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Player Name",
                                    style: 12.w7(
                                        color: AppColors.cFF7954,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 3.w,
                                  ),
                                  Text(
                                    "WIN  256",
                                    style: TextStyle(
                                        color: AppColors.cB3B3B3,
                                        fontSize: 10.sp),
                                  ),
                                  Text(
                                    "SUCCESS  47%",
                                    style: TextStyle(
                                        color: AppColors.cB3B3B3,
                                        fontSize: 10.sp),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          "256K",
                          style: 18.w7(color: AppColors.cFFFFFF),
                        )
                      ],
                    ),
                  ));
            }),
            //下注
            Positioned(
                left: 63.w,
                right: 63.w,
                bottom: 20.w,
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 300.w,
                    ),
                      child: const RankStartButton()),
                ))
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
