/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-11 16:57:58
 * @LastEditTime: 2024-09-20 10:21:38
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  var list = <Reviews>[];
  var mainList = <Reviews>[].obs; // 主评论列表
  var subList = <Reviews>[].obs; // 子评论列表
  int total = 5;
  // RxInt count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // count.value = (total < 3 ? total : 3);
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
    Navigator.pop(context);
    Reviews item = await NewsApi.sendReviews(newsId, content);
    targetId == 0 ? mainList.add(item) : subList.add(item);
    update();
  }

  void likeReviews(int newsId, int reviewsId, Reviews item) {
    NewsApi.likeReviews(newsId, reviewsId).then((v) {
      item.isLike?.value = true;
      item.likes?.value += 1;
      // update();
    });
  }
}
