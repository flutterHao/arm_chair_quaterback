/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-18 21:01:04
 * @LastEditTime: 2024-10-25 16:42:02
 */
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/latest_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/player_dynamics_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/team_rank_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'index.dart';
import './widgets/widgets.dart';

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
              opaque: false,
              settings: settings,
              page: () => NewsDetailList(newsId),
              // binding: NewDetailBinding(), /*  */
            );
          case RouteNames.statsRank:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const StatsRankPage(),
                binding: RankBinding());
          case RouteNames.teamRank:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const TeamRankPage(),
                binding: RankBinding());
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
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
      header: const WaterDropHeader(),
      // 使用水滴风格的下拉刷新
      footer: const ClassicFooter(),
      // 使用经典风格的上拉加载更多
      controller: controller.refreshCtrl,
      onRefresh: () => controller.refreshData(),
      child: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          /// Swiper Widget wrapped in SliverToBoxAdapter
          SliverToBoxAdapter(
            child: NewsBannerWidget(),
          ),

          ///赛事
          SliverToBoxAdapter(
            child: RegularWidget(),
          ),

          ///玩家动态
          SliverToBoxAdapter(
            child: PlayerDynamicsWidget(),
          ),

          ///选秀抽签
          SliverToBoxAdapter(
            child: DraftLotteryWidget(),
          ),

          ///交易信息
          SliverToBoxAdapter(
            child: TradeInfomationWidget(),
          ),

          ///谣言
          SliverToBoxAdapter(
            child: RumorWidget(),
          ),

          ///明星球员
          SliverToBoxAdapter(
            child: PopularPlayerWidget(),
          ),

          ///最新
          SliverToBoxAdapter(
            child: LatestWidget(),
          ),

          /// 球星排行
          SliverToBoxAdapter(
            child: StatsRankWidget(),
          ),

          /// TeamRankWidget
          SliverToBoxAdapter(
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
            routeId: GlobalNestedKey.NEWS,
          ),
          bodyWidget: Expanded(child: _buildView(context)),
        );
      },
    );
  }
}
