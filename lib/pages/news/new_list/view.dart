/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-18 21:01:04
 * @LastEditTime: 2024-11-24 14:11:17
 */
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/news_list_item.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const NewsListPage(),
            );
          case RouteNames.newsDetail:
            final item = settings.arguments as NewsListDetail;
            return GetPageRoute(
              opaque: false,
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => NewsDetailPage(newsDetail: item),
              // binding: NewDetailBinding(), /*  */
            );
          case RouteNames.statsRank:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const StatsRankPage(),
                binding: RankBinding());
          case RouteNames.teamRank:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
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
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
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

  @override
  Widget build(BuildContext context) {
    Get.put(CommentController());
    return GetBuilder<NewListController>(
      id: "newsList",
      builder: (_) {
        var hasData = controller.state.newsFlowList.isNotEmpty;
        return BlackAppWidget(
          const UserInfoBar(
            title: "NEWS",
            routeId: GlobalNestedKey.NEWS,
          ),
          bodyWidget: Expanded(
              child: SmartRefresher(
            enablePullUp: true,
            controller: controller.flowRefreshCtrl,
            onRefresh: () => controller.getNewsFlow(isRefresh: true),
            onLoading: () => controller.getNewsFlow(),
            physics: const BouncingScrollPhysics(),
            child: hasData
                ? ListView.separated(
                    controller: controller.scrollController,
                    padding: EdgeInsets.symmetric(vertical: 9.w),
                    itemCount: controller.state.newsFlowList.length,
                    separatorBuilder: (context, index) {
                      return 9.vGap;
                    },
                    itemBuilder: (context, index) {
                      NewsListDetail item =
                          controller.state.newsFlowList[index];
                      return InkWell(
                        onTap: () {
                          controller.pageToDetail(item);
                        },
                        child: NewsListItem(
                          newsDetail: item,
                          // key: Key(item.id.toString()),
                        ),
                        // child: Text("sdsa"),
                      );
                    })
                : Center(child: Obx(() {
                    return LoadStatusWidget(
                      text: "loading...",
                      loadDataStatus: controller.loadingStatus.value,
                    );
                  })),
          )),
        );
      },
    );
  }
}
