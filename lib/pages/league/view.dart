import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/my_water_drop_header.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.LEAGUESTabGlobalKey,
      initialRoute: RouteNames.league,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.league:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const LeagueIndexPage(),
                binding: LeagueBinding());
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
        }
      },
    );
  }
}

class LeagueIndexPage extends StatefulWidget {
  const LeagueIndexPage({super.key});

  @override
  State<LeagueIndexPage> createState() => _LeagueIndexPageState();
}

class _LeagueIndexPageState extends State<LeagueIndexPage> with AutomaticKeepAliveClientMixin {

  late LeagueController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
  }
  // 主视图
  Widget _buildView() {
    return Expanded(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: FixedHeightSliverHeaderDelegate(
                child: Container(
                  height: 58.w,
                  width: double.infinity,
                  color: AppColors.c262626,
                  child: Row(
                    children: [
                      16.hGap,
                      Expanded(
                          child: Container(
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.c000000,
                          borderRadius: BorderRadius.circular(9.w),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40.w,
                              height: 40.w,
                              child: MtInkwell(
                                onTap: () => controller.prePage(),
                                child: IconWidget(
                                    iconWidth: 8.w,
                                    icon: Assets.uiIconArrows_02Png),
                              ),
                            ),
                            Expanded(
                                child: PageView.builder(
                                    controller: controller.pageController,
                                    itemCount: controller.pageText.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Text(
                                          controller.pageText[index],
                                          style: 16.w5(
                                              color: AppColors.cB3B3B3,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium),
                                        ),
                                      );
                                    })),
                            SizedBox(
                              width: 40.w,
                              height: 40.w,
                              child: MtInkwell(
                                onTap: () => controller.nextPage(),
                                child: IconWidget(
                                    iconWidth: 8.w,
                                    icon: Assets.uiIconArrows_01Png),
                              ),
                            )
                          ],
                        ),
                      )),
                      9.hGap,
                      Container(
                        width: 112.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            color: AppColors.c3B3B3B,
                            borderRadius: BorderRadius.circular(9.w)),
                        child: Center(
                          child: Text(
                            "STANDINGS",
                            style: 16.w5(
                                color: AppColors.cFFFFFF,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                      ),
                      16.hGap,
                    ],
                  ),
                ),
                height: 58.w),
          ),
          SliverList.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return _buildItem(index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return 9.vGap;
            },
          )
        ],
      ),
    );
    return Expanded(
      child: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.loading(),
        child: const Center(
          child: LoadStatusWidget(
            text: "COMING SOON...",
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    return _ItemWidget(index: index);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueController>(
        builder: (_) {
      return BlackAppWidget(
        const UserInfoBar(
          title: "COMMUNITIES",
          routeId: GlobalNestedKey.LEAGUES,
        ),
        bodyWidget: _buildView(),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class _ItemWidget extends StatelessWidget {
  _ItemWidget({super.key, required this.index});

  final int index;

  var globalKey = GlobalKey();

  Column _buildTeamInfo() {
    return Column(
      children: [
        ImageWidget(
          url: "url",
          imageFailedPath: Assets.testTeamLogoPng,
          color: AppColors.c000000,
          width: 44.w,
        ),
        10.vGap,
        Text(
          "DAS",
          style: 12.w4(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular),
        ),
        4.vGap,
        Text(
          "8-2",
          style: 10.w4(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 9.w : 0),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          RepaintBoundary(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                18.vGap,
                Text(
                  "IN-SEASON TOURNAMENT GROUP PLAY",
                  style: 12.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium),
                ),
                8.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FINAL",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular),
                    ),
                    6.hGap,
                    IconWidget(
                      iconWidth: 5.w,
                      icon: Assets.uiIconArrows_01Png,
                      iconColor: AppColors.c000000,
                    )
                  ],
                ),
                8.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTeamInfo(),
                    12.hGap,
                    Container(
                      height: 44.w,
                      alignment: Alignment.center,
                      child: Text(
                        "198",
                        style: 30.w7(
                            color: AppColors.cB3B3B3,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                    70.hGap,
                    Container(
                      height: 44.w,
                      alignment: Alignment.center,
                      child: Text(
                        "198",
                        style: 30.w7(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                    12.hGap,
                    _buildTeamInfo()
                  ],
                ),
                16.vGap,
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cE6E6E,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                11.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      UserAvaterWidget(
                        url: "",
                        width: 26.w,
                        height: 26.w,
                        radius: 13.w,
                      ),
                      5.hGap,
                      Expanded(
                          child: Text(
                        "Add a comment about this stake about",
                        style: 14.w4(
                          color: AppColors.c4D4D4D,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                      9.hGap,
                      IconWidget(iconWidth: 18.w, icon: Assets.uiIconJettonPng),
                      2.hGap,
                      Text(
                        "294k",
                        style: 12.w5(
                          color: AppColors.c4D4D4D,
                          fontFamily: FontFamily.fRobotoMedium,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                ),
                11.vGap,
              ],
            ),
          ),
          Positioned(
              top: 11.w,
              right: 10.w,
              child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      border: Border.all(color: AppColors.c666666, width: 1)),
                  child: MtInkwell(
                      vibrate: true,
                      onTap: () => Utils.generateAndShareImage(globalKey),
                      child: IconWidget(
                          iconWidth: 15.w, icon: Assets.testTeamLogoPng))))
        ],
      ),
    );
  }
}
