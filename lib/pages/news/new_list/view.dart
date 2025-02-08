/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-18 21:01:04
 * @LastEditTime: 2025-02-08 17:16:06
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
    return const NewsListPage();
  }
}

class NewsListPage extends GetView<NewListController> {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(CommentController());
    return GetBuilder<NewListController>(
      id: "newsList",
      builder: (_) {
        var hasData = controller.state.newsFlowList.isNotEmpty;
        return SmartRefresher(
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
                    NewsListDetail item = controller.state.newsFlowList[index];
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
                    loadDataStatus: controller.loadingStatus.value,
                  );
                })),
        );
      },
    );
  }
}
