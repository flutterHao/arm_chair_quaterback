/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-11 16:57:58
 * @LastEditTime: 2025-03-18 17:19:17
 */

import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentController extends GetxController {
  // List<Reviews> commentList;
  CommentController();
  int mainPage = 0;
  var mainList = <ReviewEntity>[].obs; // 主评论列表
  // var subList = <Reviews>[].obs;
  // RxInt count = 0.obs;
  final FocusNode focusNode = FocusNode();
  late TeamLoginInfo userEntity;

  RefreshController refhreshCtrl = RefreshController();
  Rx<LoadDataStatus> loadDataStatus = LoadDataStatus.loading.obs;
  // RefreshController detailRefhreshCtrl = RefreshController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   // setComments(commentList);

  // }

  String timeAgo(int inputTime) {
    // 将 int 时间戳转换为 DateTime
    final inputDateTime = DateTime.fromMillisecondsSinceEpoch(inputTime);
    final now = DateTime.now();
    final difference = now.difference(inputDateTime); // 计算时间差

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''}';
    } else {
      return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''}';
    }
  }

  ///获取主要评论列表
  Future getReviews(NewsListDetail detail, {bool isRefresh = false}) async {
    userEntity =
        Get.find<HomeController>().userEntiry.teamLoginInfo ?? TeamLoginInfo();
    const pageSize = 10;
    if (isRefresh) {
      if (refhreshCtrl.footerStatus == LoadStatus.noMore) return;
      mainList.clear();
      mainPage = 0;
    } else {
      mainPage++;
    }
    loadDataStatus.value = LoadDataStatus.loading;
    await NewsApi.getReviewsByNewsId(detail.id, mainPage, pageSize)
        .then((v) async {
      await Future.wait(v.map((e) => getSubReviews(e)));
      mainList.addAll(v);
      detail.reviewsCount.value =
          max(detail.reviewsCount.value, getCommentCount());
      isRefresh
          ? refhreshCtrl.refreshCompleted()
          : (v.isEmpty
              ? refhreshCtrl.loadNoData()
              : refhreshCtrl.loadComplete());
      loadDataStatus.value = LoadDataStatus.success;

      update();
    }).whenComplete(() {});
  }

  ///获取二级评论,将它添加到主要item下面
  Future getSubReviews(ReviewEntity mainItem) async {
    if (mainItem.sonReviews == 0) return;
    await NewsApi.getSonReviews(mainItem.newsId, mainItem.id, mainItem.page, 10)
        .then((v) {
      Set<int> subListIds = mainItem.subList.map((e) => e.id).toSet();
      for (var e in v) {
        if (!subListIds.contains(e.id)) {
          mainItem.subList.add(e);
          subListIds.add(e.id);
        }
      }
      // mainItem.subList.addAll(v);
      int show = mainItem.current == 0
          ? (mainItem.subList.length < 3 ? mainItem.subList.length : 3)
          : 10;
      mainItem.current += show;
      if (mainItem.current > mainItem.subList.length) {
        mainItem.current = mainItem.subList.length;
      }
      mainItem.page++;

      update();
    }).whenComplete(() {
      refhreshCtrl.refreshCompleted();
    });
  }

  int getCommentCount() {
    int count = 0;
    for (var element in mainList) {
      count += element.subList.length + 1;
    }
    return count;
  }

  //直接发送、回复mianList，回复subLIst
  void sendReviews(
    BuildContext context,
    NewsListDetail detail,
    String content, {
    // int targetId = 0,
    ReviewEntity? reviews,
  }) async {
    if (ObjectUtil.isEmpty(content)) return;
    // if (targetId != 0) {
    //   Navigator.pop(context);
    // }
    int parentId = 0;
    int targetId = 0;
    if (reviews != null) {
      parentId =
          reviews.parentReviewId == 0 ? reviews.id! : reviews.parentReviewId!;
      Navigator.pop(context);
      targetId = reviews.id!;
    }
    await NewsApi.sendReviews(
      detail,
      targetId: targetId,
      parentReviewId: parentId,
      content,
    ).then((item) {
      if (targetId == 0) {
        ///直接评论
        // mainList.add(item);
        mainList.insert(0, item);
      } else if (reviews!.parentReviewId == 0) {
        ///回复主评论
        // reviews.subList.add(item);
        reviews.subList.insert(0, item);
        reviews.sonReviews++;
        reviews.current++;
      } else {
        ///回复二级评论
        for (var e in mainList) {
          if (e.id == reviews.parentReviewId) {
            e.subList.insert(0, item);
            // e.subList.add(item);
            e.sonReviews++;
            e.current++;
          }
        }
      }
      // NewListController controller = Get.find();
      // NewsListDetail newsDetail =
      //     controller.state.newsFlowList.where((e) => e.id == detail).first;
      detail.reviewsCount.value++;
      update();
    }).catchError((v) {
      ErrorUtils.toast(v);
    });
  }

  // void likeReviews(int newsId, int reviewsId, Reviews item) {
  //   NewsApi.likeReviews(newsId, reviewsId, !item.isLike!.value).then((v) {
  //     if (item.isLike?.value == true) {
  //       item.isLike?.value = false;
  //       item.likes?.value -= 1;
  //     } else {
  //       item.isLike?.value = true;
  //       item.likes?.value += 1;
  //     }

  //     // update();
  //   });
  // }

  // void likeNews(NewsDetail item) {
  //   if (item.isLike?.value == 1) return;
  //   NewsApi.newsLike(item.id!).then((value) {
  //     item.isLike!.value = 1;
  //     item.likes = (item.likes ?? 0) + 1;
  //     update(["commentDialog"]);
  //   });
  // }

  // void unLikeNews(NewsDetail item) {
  //   if (item.isLike?.value == -1) return;
  //   NewsApi.newsUnLike(item.id!).then((value) {
  //     item.isLike!.value = -1;
  //     item.likes = (item.likes ?? 0) - 1;
  //     update(["commentDialog"]);
  //   });
  // }

  String getReplayTeamName(ReviewEntity item) {
    for (var main in mainList) {
      if (main.id == item.targetId) {
        if (main.parentReviewId != 0) {
          return "@${main.teamName}";
        }
      }

      for (var e in main.subList) {
        if (e.id == item.targetId) {
          return "@${e.teamName}";
        }
      }
      return "";
    }

    // for (var e in subList) {
    //   if (e.id == item.targetId) {
    //     if (e.parentReviewId != 0) {
    //       return "@${e.teamName}";
    //     }
    //   }
    // }
    return "";
  }
}
