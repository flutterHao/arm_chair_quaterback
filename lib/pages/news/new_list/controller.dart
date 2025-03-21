/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2025-03-21 10:39:18
 */
import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/emoji_animation.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spine_flutter/spine_widget.dart';

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
  List<PicksPlayerV2> pickPlayerList = [];
  late SpineWidgetController spineController;

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
          812.h * 2) {
        getNewsFlow();
      }
    });

    spineController = SpineWidgetController(onInitialized: (controller) {
      // Set the default mixing time between animations
      controller.animationState.getData().setDefaultMix(0.2);
      // Set the portal animation on track 0
      controller.animationState.setAnimationByName(0, "tx_zan", true);
      // Queue the run animation after the portal animation
      // spineController.animationState.addAnimationByName(0, "run", true, 0);
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
    int size = Random().nextInt(2) + 2;
    await NewsApi.newsFlow(state.page, size).then((value) async {
      int type = await NewsApi.newsEventTrigger();
      if (value.isNotEmpty) {
        value.last.eventType = type;
      }
      state.newsFlowList.addAll(value);
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

  void pageToDetail(NewsListDetail item) async {
    state.detailList.clear();
    pickPlayerList.clear();
    state.detailList.add(item);

    ///获取评论
    final comCtrl = Get.put(CommentController(), tag: item.id.toString());

    Future.wait([
      NewsApi.getNewsDetail(item.id),
      getNewsGuessInfo(item.id),
      comCtrl.getReviews(item, isRefresh: true),
      if (item.reviewsCount <= 2) NewsApi.getRelevantNews(item.id),
    ]).then((v) {
      state.detailList.clear();
      item = v[0] as NewsListDetail;
      state.detailList.add(item);
      if (v.length > 3) state.detailList.addAll(v[3] as List<NewsListDetail>);
      update(["newsDetail"]);
    });

    await Get.toNamed(RouteNames.newsDetail, arguments: item);

    // CommentController commentController = Get.find(tag: item.id.toString());
    // item.reviewsList = commentController.mainList.value;
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

  void scrollToTop() {
    try {
      if (scrollController.offset == 0) {
        return;
      }
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      print('NewListController--scrollToTop--error--: $e');
    }
  }

  Future getNewsGuessInfo(int newsId) async {
    // await NewsApi.getNewsGuessInfo(newsId).then((guessInfoMap) {
    //   var choiceGuessPlayers =
    //       Get.find<PicksIndexController>().guessGamePlayers;
    //   pickPlayerList.clear();
    //   for (int i = 0; i < guessInfoMap.keys.length; i++) {
    //     List<PicksPlayerV2> data = [];
    //     var key = guessInfoMap.keys.toList()[i];
    //     var list = guessInfoMap[key] ?? [];
    //     for (int i1 = 0; i1 < list.length; i1++) {
    //       GuessGameInfoEntity item = list[i1];
    //       PicksPlayerV2? p;
    //       choiceGuessPlayers.forEach((k, e) {
    //         var firstWhereOrNull = e.firstWhereOrNull((e) =>
    //             e.tabStr == key && e.guessInfo.playerId == item.playerId);
    //         if (firstWhereOrNull != null) {
    //           p = firstWhereOrNull;
    //         }
    //       });
    //       if (p != null) {
    //         data.add(p!);
    //         continue;
    //       }
    //       PicksPlayerV2 playerV2 = PicksPlayerV2();
    //       playerV2.tabStr = key;
    //       playerV2.baseInfoList = Utils.getPlayBaseInfo(item.playerId);
    //       playerV2.dataAvgList = Utils.getPlayerDataAvg(item.playerId);
    //       playerV2.awayTeamInfo = Utils.getTeamInfo(item.awayTeamId);
    //       playerV2.guessInfo = item;
    //       data.add(playerV2);
    //     }

    //     //排序：赛季平均得分
    //     data.sort((a, b) {
    //       return b.dataAvgList!.pts.compareTo(a.dataAvgList!.pts);
    //     });

    //     //排序：选过的放后面
    //     // item.sort((a, b) {
    //     //   if (a.guessInfo.guessData.isNotEmpty) return 1;
    //     //   if (b.guessInfo.guessData.isNotEmpty) return -1;
    //     //   return 0;
    //     // });
    //     // playerV2[key] = data;
    //     pickPlayerList.addAll(data);
    //   }
    //   // update(["newsDetail"]);
    // });
  }
}
