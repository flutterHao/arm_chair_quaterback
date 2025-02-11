/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2025-02-07 20:16:53
 */
import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';

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

  bool loadDataSuccess = false;
  late StreamSubscription<int> subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = WSInstance.netStream.listen((_) {
      if (!loadDataSuccess) {
        _initData();
      }
    });
    _initData();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent -
              scrollController.position.pixels <=
          800.h * 5) {
        getNewsFlow();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void _initData() {
    CacheApi.getNewsSourceList();
    getNewsFlow(isRefresh: true);
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
        SoundServices.to.playSound(Assets.soundSayYes);
      } else if (item.isLike.value == 1) {
        /// 已点赞状态
        item.likes = item.likes - 1;
        item.isLike.value = 0;
      } else if (item.isLike.value == -1) {
        /// 点踩状态
        item.unLikes = item.unLikes - 1;
        item.likes = item.likes + 1;
        item.isLike.value = 1;
        SoundServices.to.playSound(Assets.soundSayYes);
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
        SoundServices.to.playSound(Assets.soundSayNo);
      } else if (item.isLike.value == -1) {
        item.unLikes = (item.unLikes) - 1;
        item.isLike.value = 0;
      } else {
        item.unLikes = (item.unLikes) + 1;
        item.isLike.value = -1;
        SoundServices.to.playSound(Assets.soundSayNo);
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

  shareNews(NewsListDetail newsDetail) async {
    // Utils.generateAndShareImage(_globalKey);
    var shareResult = await Share.share(
        "${newsDetail.title}\n\n${newsDetail.content}",
        subject: newsDetail.title);
    if (shareResult.status == ShareResultStatus.success) {
      NewsApi.shareNews();
    }
    // Share.shareXFiles([XFile(newsDetail.imgUrl)],
    //     text: newsDetail.content, subject: newsDetail.title);
  }

  void scrollToTop(){
    try {
      if(scrollController.offset == 0){
        return;
      }
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }catch(e){
      print('NewListController--scrollToTop--error--: $e');
    }
  }
}
