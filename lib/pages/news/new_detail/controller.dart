/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:23:17
 * @LastEditTime: 2024-11-01 20:31:55
 */

import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:get/get.dart';
import 'index.dart';

class NewsDetailController extends GetxController {
  NewsDetailController(this.newsId);
  final state = NewDetailState();

  final Object? newsId;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    // getNewsDetail(newsId);
    // getReviewsByNewsId(newsId);
  }

  // void getNewsDetail(id) {
  //   state.isLoading = true;
  //   NewsApi.getNewsDetail(id).then((v) {
  //     state.newDetail = v;
  //     state.isLoading = false;
  //     update();
  //   }).catchError((e) {});
  // }

  void likeNews(NewsDetail item) {
    // if (item.isLike?.value == 1) return;
    NewsApi.newsLike(item.id!).then((value) {
      if (item.isLike?.value == 0) {
        /// 未点赞状态
        item.likes = (item.likes ?? 0) + 1;
        item.isLike!.value = 1;
      } else if (item.isLike?.value == 1) {
        /// 已点赞状态
        item.likes = (item.likes ?? 0) - 1;
        item.isLike!.value = 0;
      } else if (item.isLike?.value == -1) {
        /// 点踩状态
        item.unLikes = (item.unLikes ?? 0) - 1;
        item.likes = (item.likes ?? 0) + 1;
        item.isLike!.value = 1;
      }

      // update();
      // getNewsDetail(item.id);
    });
  }

  void unLikeNews(NewsDetail item) {
    // if (item.isLike?.value == -1) return;
    NewsApi.newsUnLike(item.id!).then((value) {
      if (item.isLike?.value == 1) {
        item.likes = (item.likes ?? 0) - 1;
        item.unLikes = (item.unLikes ?? 0) + 1;
        item.isLike!.value = -1;
      } else if (item.isLike?.value == -1) {
        item.unLikes = (item.unLikes ?? 0) - 1;
        item.isLike!.value = 0;
      } else {
        item.unLikes = (item.unLikes ?? 0) + 1;
        item.isLike!.value = -1;
      }

      // update();
    });
  }
}

// class NewsDetailController extends GetxController {
//   NewsDetailController(this.newsId);
//   final state = NewDetailState();

//   final Object? newsId;

//   /// 在 widget 内存中分配后立即调用。
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
//   @override
//   void onReady() {
//     super.onReady();
//     getNewsDetail(newsId);
//   }

//   void getNewsDetail(id) {
//     state.isLoading = true;
//     NewsApi.getNewsDetail(id).then((v) {
//       state.newDetail = v;
//       getMoreNews();
//       state.isLoading = false;
//       update();
//     }).catchError((e) {
//       Log.e("获取新闻详情失败: $e");
//     });
//   }

//   ///判断两个字符串是否包含相同字符
//   bool checkIsContains(String current, String other) {
//     List<String> cur =
//         current.split(',').where((label) => label.isNotEmpty).toSet().toList();
//     List<String> oth =
//         other.split(',').where((label) => label.isNotEmpty).toList();
//     for (String e in oth) {
//       if (cur.contains(e)) {
//         return true;
//       }
//     }
//     return false;
//   }

//   void getMoreNews() {
//     // 清空当前列表
//     state.moreList.clear();

//     // 当前新闻的标签
//     String curLabel = state.newDetail.dataLabel ?? "";

//     // 获取新闻列表
//     List<NewsDetail> newsList = Get.find<NewListController>().state.newsList;

//     // 过滤出符合条件的新闻
//     List<NewsDetail> filteredList = newsList.where((e) {
//       return checkIsContains(curLabel, e.dataLabel ?? "") &&
//           e.id.toString() != newsId.toString() &&
//           e.isView == 0;
//     }).toList();

//     Log.i("符合条件的新闻数量: ${filteredList.length}");

//     // 如果过滤后的新闻数量小于3，随机获取3条
//     if (filteredList.length < 3) {
//       // 随机获取3条
//       // Random random = Random();
//       // while (state.moreList.length < 3) {
//       //   int randomIndex = random.nextInt(newsList.length);
//       //   NewsDetail randomItem = newsList[randomIndex];

//       //   // 确保没有重复添加相同的新闻
//       //   if (!state.moreList.contains(randomItem)) {
//       //     state.moreList.add(randomItem);
//       //   }
//       // }
//     } else {
//       // 如果大于或等于3条，直接添加到列表
//       for (var element in filteredList) {
//         if (state.moreList.length < 3) {
//           state.moreList.add(element);
//         }
//       }
//     }

//     // Log 当前更多新闻列表数量
//     Log.i("最终更多新闻列表数量: ${state.moreList.length}");
//   }
// }
