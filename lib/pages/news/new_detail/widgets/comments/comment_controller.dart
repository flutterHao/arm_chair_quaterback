/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-11 16:57:58
 * @LastEditTime: 2024-10-21 14:16:03
 */

import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
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
  final pageSize = 10;
  var mainList = <Reviews>[].obs; // 主评论列表
  // var subList = <Reviews>[].obs;
  // RxInt count = 0.obs;
  final FocusNode focusNode = FocusNode();
  late TeamLoginInfo userEntity;

  RefreshController refhreshCtrl = RefreshController();
  @override
  void onInit() {
    super.onInit();
    // setComments(commentList);
    userEntity =
        Get.find<HomeController>().userEntiry.teamLoginInfo ?? TeamLoginInfo();
  }

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
  void getReviews(id, {bool isRefresh = false}) {
    if (isRefresh) {
      mainList.clear();
      mainPage = 0;
    } else {
      mainPage++;
    }
    NewsApi.getReviewsByNewsId(123, mainPage, pageSize).then((v) {
      mainList.addAll(v);
      update();
    }).whenComplete(() {
      isRefresh ? refhreshCtrl.refreshCompleted() : refhreshCtrl.loadComplete();
    });
  }

  ///获取二级评论,将它添加到主要item下面
  void getSubReviews(Reviews mainItem) {
    NewsApi.getSonReviews(
            mainItem.newsId, mainItem.id!, mainItem.page, pageSize)
        .then((v) {
      mainItem.subList.addAll(v);
      mainItem.current += pageSize;
      if (mainItem.current > mainItem.subList.length) {
        mainItem.current = mainItem.subList.length;
      }
      mainItem.page++;

      update();
    }).whenComplete(() {
      refhreshCtrl.refreshCompleted();
    });
  }

  //直接发送、回复mianList，回复subLIst
  void sendReviews(
    BuildContext context,
    int newsId,
    String content, {
    // int targetId = 0,
    Reviews? reviews,
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
      newsId,
      targetId: targetId,
      parentReviewId: parentId,
      content,
    ).then((item) {
      if (targetId == 0) {
        ///直接评论
        mainList.add(item);
      } else if (reviews!.parentReviewId == 0) {
        ///回复主评论
        reviews.subList.add(item);
        reviews.sonReviews++;
        reviews.current++;
      } else {
        ///回复二级评论
        for (var e in mainList) {
          if (e.id == reviews.parentReviewId) {
            e.subList.add(item);
            e.sonReviews++;
            e.current++;
          }
        }
      }
      NewListController controller = Get.find();
      NewsDetail newsDetail =
          controller.state.newsFlowList.where((e) => e.id == newsId).first;
      newsDetail.reviewsCount!.value++;
      update();
    }).catchError((v) {
      EasyLoading.showToast(v.error.toString());
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

  String getTeamName(Reviews item) {
    for (var e in mainList) {
      if (e.id == item.targetId) {
        if (e.parentReviewId != 0) {
          return "@${e.teamName}";
        }
      }

      for (var e in e.subList) {
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
