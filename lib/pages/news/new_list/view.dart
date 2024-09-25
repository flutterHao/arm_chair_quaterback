import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/swiper_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';

import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/team_rank_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import './widgets/widgets.dart';
import 'index.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: GlobalNestedKey.NewsTabGlobalKey,
      initialRoute: RouteNames.newList,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouteNames.newList:
            return GetPageRoute(
              settings: settings,
              page: () => const NewsListPage(),
            );
          case RouteNames.newsDetail:
            final newsId = settings.arguments;
            return GetPageRoute(
              settings: settings,
              page: () => NewsDetailPage(newsId),
              // binding: NewDetailBinding(), /*  */
            );
          case RouteNames.statsRank:
            return GetPageRoute(
                settings: settings,
                page: () => const StatsRankPage(),
                binding: RankBinding());
          case RouteNames.teamRank:
            return GetPageRoute(
                settings: settings,
                page: () => const TeamRankPage(),
                binding: RankBinding());
        }
        return null;
      },
    );
  }
}

class NewsListPage extends GetView<NewListController> {
  const NewsListPage({super.key});

  // 主视图
  Widget _buildView(BuildContext context) {
    return SmartRefresher(
      header: const WaterDropHeader(), // 使用水滴风格的下拉刷新
      footer: const ClassicFooter(), // 使用经典风格的上拉加载更多
      controller: controller.refreshCtrl,
      onRefresh: () => controller.refreshData(),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// Swiper Widget wrapped in SliverToBoxAdapter
          SliverToBoxAdapter(
            child: Container(
              // margin: EdgeInsets.only(top: 16.w, right: 10.w, left: 10.w),
              child: GetBuilder<NewListController>(
                  id: "newsBanner",
                  builder: (_) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 16.w, right: 16.w, left: 16.w),
                          child: SwiperWidget(
                            width: 343.w,
                            // width: MyApp.MAXWEBWIDTH.w - 40.w,
                            height: 150.w,
                            bannerList: controller.state.banners
                                .map((e) => Address.httpBaseUrl + e.pictureId!)
                                .toList(),
                            footer: IconWidget(
                              iconWidth: 14.w,
                              iconHeight: 14.w,
                              icon: Assets.uiIconArrowsPng,
                              backgroudWitdh: 32.w,
                              backgroudheight: 32.w,
                              borderRadius: BorderRadius.circular(16.w),
                              backgroudColor: Colors.white38,
                            ),
                            onTap: (index) {
                              Get.toNamed(RouteNames.newsDetail,
                                  arguments:
                                      controller.state.banners[index].id!,
                                  id: GlobalNestedKey.NEWS);
                              // Navigator.of(context).push(
                              //     createCustomRoute(this, NewsDetailPage(123)));
                            },
                          ),
                        ),
                        Positioned(
                            top: 8.w,
                            right: 8.w,
                            child: InkWell(
                              onTap: () => controller.getAward(),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconWidget(
                                    iconWidth: 36.w,
                                    icon: Assets.uiIconLabelPng,
                                    iconColor: AppColors.cED1451,
                                  ),
                                  IconWidget(
                                    iconWidth: 16.w,
                                    icon: Assets.uiIconAwardPng,
                                    iconColor: Colors.white,
                                  ),
                                ],
                              ),
                            ))
                      ],
                    );
                  }),
            ),
          ),

          /// Text: "Today's express"
          SliverPadding(
            padding: EdgeInsets.only(top: 23.w, left: 16.w),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Today's express",
                      style: 19.w7(),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        final List<String> servers = [
                          Address.personalDevUrl,
                          Address.privateDevUrl,
                          Address.publicDevUrl,
                        ];
                        String current = HttpUtil().url;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ServerSwitchDialog(
                              servers: servers,
                              currentServer: current,
                              onServerChanged: (newServer) {
                                HttpUtil().setUrl(newServer);
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "切换服务器",
                          style: 15.w7(color: Colors.black),
                        ),
                      ))
                ],
              ),
            ),
          ),

          /// News List
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            sliver: const SliverToBoxAdapter(
              child: NewsListView(),
            ),
          ),

          /// Text: "Stats"
          SliverPadding(
            padding: EdgeInsets.only(left: 16.w, top: 6.w, bottom: 10.w),
            sliver: SliverToBoxAdapter(
              // 修复：使用 SliverToBoxAdapter 包裹 Text
              child: Text(
                "Stats",
                style: 19.w7(),
              ),
            ),
          ),

          /// StatsRankWidget
          const SliverToBoxAdapter(
            child: StatsRankWidget(),
          ),

          /// Text: "2024 standings"
          SliverPadding(
            padding: EdgeInsets.only(left: 16.w, top: 23.w, bottom: 10.w),
            sliver: SliverToBoxAdapter(
              child: Text(
                "2024 standings",
                style: 19.w7(),
              ),
            ),
          ),

          /// TeamRankWidget
          const SliverToBoxAdapter(
            child: TeamRankWidget(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
      id: "newsPage",
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            title: "NEWS",
          ),
          bodyWidget: Expanded(child: _buildView(context)),
        );
      },
    );
  }
}
