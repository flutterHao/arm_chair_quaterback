import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/swiper_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/team_rank_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
            return GetPageRoute(
              settings: settings,
              page: () => const NewsDetailPage(),
              binding: NewDetailBinding(),
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
  Widget _buildView() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 16.w),
      child: CustomScrollView(
        slivers: [
          /// Swiper Widget wrapped in SliverToBoxAdapter
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 343.w, // 设置最大宽度
              ),
              child: SwiperWidget(
                width: 343.w,
                height: 150.w,
                bannerList: controller.images,
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
                  Get.toNamed(RouteNames.newsDetail, id: GlobalNestedKey.NEWS);
                },
              ),
            ),
          ),

          /// Text: "Today's express"
          SliverPadding(
            padding: EdgeInsets.only(top: 23.w, left: 16.w),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Today's express",
                style: 19.w7(),
              ),
            ),
          ),

          /// News List
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: const SliverToBoxAdapter(
              child: StatsRankWidget(),
            ),
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: const SliverToBoxAdapter(
              child: TeamRankWidget(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
      builder: (_) {
        // return Scaffold(
        //   body: SafeArea(
        //     child: _buildView(),
        //   ),
        // );
        return BlackAppWidget(
          const UserInfoBar(),
          bodyWidget: Expanded(child: _buildView()),
        );
      },
    );
  }
}
