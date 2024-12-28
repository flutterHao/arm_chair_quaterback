/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2024-12-28 18:23:32
 */
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_source_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class NewListController extends GetxController {
  NewListController();

  final state = NewListState();
  late RefreshController flowRefreshCtrl = RefreshController();
  ScrollController scrollController = ScrollController();

  bool isLoading = false;

  String pointType = "";
  int errCount = 0;
  Rx<LoadDataStatus> loadingStatus = LoadDataStatus.loading.obs;

  RxBool showCommentDialog = true.obs;

  @override
  void onInit() {
    super.onInit();
    CacheApi.getNewsSourceList();
    getNewsFlow(isRefresh: true);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent -
              scrollController.position.pixels <=
          800.h * 5) {
        getNewsFlow();
      }
    });
  }

  Future getNewsFlow({bool isRefresh = false}) async {
    if (isLoading) return;
    Log.d("加载瀑布流数据 ${DateTime.now()}");
    isLoading = true;
    if (isRefresh) {
      state.newsFlowList.clear();
      state.page = 0;
    } else {
      state.page++;
    }
    Log.d("加载瀑布流数据page=${state.page}");
    await NewsApi.newsFlow(state.page, state.pageSize).then((value) {
      state.newsFlowList.addAll(value);
      state.newsList = value;
      update(['newsList']);
      Log.d("加载瀑布流数据 ${DateTime.now()}");
    }).whenComplete(() {
      loadingStatus.value = LoadDataStatus.success;
      isRefresh
          ? flowRefreshCtrl.refreshCompleted()
          : flowRefreshCtrl.loadComplete();
      isLoading = false;
    }).catchError((e) {
      loadingStatus.value = LoadDataStatus.error;
      Log.e("加载瀑布流数据失败 ${e.toString()}");
    });
  }

  void pageToDetail(NewsListDetail item, {Function? callBack}) async {
    state.detailList.clear();
    state.detailList.add(item);

    ///获取评论
    final comCtrl = Get.put(CommentController(), tag: item.id.toString());
    comCtrl.getReviews(item.id, isRefresh: true);

    ///获取相关新闻
    if (item.reviewsCount <= 2) {
      NewsApi.getRelevantNews(item.id).then((value) {
        state.detailList.addAll(value);
        update(["newsDetail"]);
      });
    }
    await Get.toNamed(RouteNames.newsDetail, arguments: item);
    if (callBack != null) {
      callBack();
    }
    CommentController commentController = Get.find(tag: item.id.toString());
    item.reviewsList = commentController.mainList.value;
    update(["newsList"]);
  }

  void likeNews(NewsListDetail item) {
    // if (item.isLike.value == 1) return;
    NewsApi.newsLike(item.id).then((value) {
      if (item.isLike.value == 0) {
        /// 未点赞状态
        item.likes = item.likes + 1;
        item.isLike.value = 1;
      } else if (item.isLike.value == 1) {
        /// 已点赞状态
        item.likes = item.likes - 1;
        item.isLike.value = 0;
      } else if (item.isLike.value == -1) {
        /// 点踩状态
        item.unLikes = item.unLikes - 1;
        item.likes = item.likes + 1;
        item.isLike.value = 1;
      }

      update(["newsList"]);
      // getNewsDetail(item.id);
    });
  }

  void unLikeNews(NewsListDetail item) {
    // if (item.isLike.value == -1) return;
    NewsApi.newsUnLike(item.id).then((value) {
      if (item.isLike.value == 1) {
        item.likes = item.likes - 1;
        item.unLikes = (item.unLikes) + 1;
        item.isLike.value = -1;
      } else if (item.isLike.value == -1) {
        item.unLikes = (item.unLikes) - 1;
        item.isLike.value = 0;
      } else {
        item.unLikes = (item.unLikes) + 1;
        item.isLike.value = -1;
      }

      // update();
    });
  }

  String getNewsSourceImage(String source) {
    String url = ConfigStore.to.getServiceUrl();
    for (var element in CacheApi.newsSourceList) {
      if (element.sourceEnName == source) {
        return "$url/image/icon/${element.sourceIcon}.png";
      }
    }
    return "";
  }
}
