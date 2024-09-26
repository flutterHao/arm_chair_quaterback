/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-11 16:57:58
 * @LastEditTime: 2024-09-26 10:50:12
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  List<Reviews> commentList;
  CommentController(this.commentList);
  var list = <Reviews>[];
  var mainList = <Reviews>[].obs; // 主评论列表
  var subList = <Reviews>[].obs; // 子评论列表
  int total = 5;
  // RxInt count = 0.obs;
  final FocusNode focusNode = FocusNode();
  late TeamLoginInfo userEntity;
  @override
  void onInit() {
    super.onInit();
    setComments(commentList);
    userEntity =
        Get.find<HomeController>().userEntiry.teamLoginInfo ?? TeamLoginInfo();
  }

  // 初始化时调用的方法，负责将评论分类
  void setComments(List<Reviews> commentList) {
    mainList.clear();
    subList.clear();
    List<Reviews> mainComments = [];
    List<Reviews> subComments = [];
    list = List.from(commentList);
    for (var comment in commentList) {
      if (comment.parentReviewId == 0) {
        mainComments.add(comment); // 主评论
      } else {
        subComments.add(comment); // 子评论
      }
    }
    mainComments.sort((a, b) => b.likes!.value.compareTo(a.likes!.value));
    subComments.sort((a, b) => b.likes!.value.compareTo(a.likes!.value));

    // 批量添加评论，减少重复触发响应
    mainList.addAll(mainComments);
    subList.addAll(subComments);
  }

  int getLength(int id) {
    var len = subList.where((e) => e.targetId == id).toList().length;
    return len;
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

  void sendReviews(
    BuildContext context,
    int newsId,
    String content, {
    int targetId = 0,
    int parentReviewId = 0,
  }) async {
    if (ObjectUtil.isEmpty(content)) return;
    if (targetId != 0) {
      Navigator.pop(context);
    }
    Reviews item = await NewsApi.sendReviews(
        newsId, targetId: targetId, parentReviewId: parentReviewId, content);
    targetId == 0 ? mainList.add(item) : subList.add(item);
    list.add(item);
    update();
  }

  void likeReviews(int newsId, int reviewsId, Reviews item) {
    NewsApi.likeReviews(newsId, reviewsId).then((v) {
      if (item.isLike?.value == true) {
        item.isLike?.value = false;
        item.likes?.value -= 1;
      } else {
        item.isLike?.value = true;
        item.likes?.value += 1;
      }

      // update();
    });
  }

  void likeNews(NewsDetail item) {
    if (item.isLike?.value == true) return;
    NewsApi.newsLike(item.id!).then((value) {
      item.isLike!.value = true;
      item.likes = (item.likes ?? 0) + 1;
      update(["commentDialog"]);
    });
  }

  void unLikeNews(NewsDetail item) {
    if (item.isLike?.value == false) return;
    NewsApi.newsUnLike(item.id!).then((value) {
      item.isLike!.value = false;
      item.likes = (item.likes ?? 0) - 1;
      update(["commentDialog"]);
    });
  }

  String getTeamName(Reviews item) {
    for (var e in list) {
      if (e.id == item.targetId) {
        if (e.parentReviewId != 0) {
          return "@${e.teamName}";
        }
        return "";
      }
    }
    return "";
  }
}
