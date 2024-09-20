/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:23:17
 * @LastEditTime: 2024-09-20 14:14:12
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:23:17
 * @LastEditTime: 2024-09-18 12:26:13
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
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
    getNewsDetail(newsId);
  }

  void getNewsDetail(id) {
    NewsApi.getNewsDetail(id).then((v) {
      state.newDetail = v;
      getMoreNews();
      update();
    });
  }

  ///判断两个字符串是否包含相同字符
  bool checkIsContains(String current, String other) {
    List<String> cur =
        current.split(',').where((label) => label.isNotEmpty).toSet().toList();
    List<String> oth =
        other.split(',').where((label) => label.isNotEmpty).toList();
    for (String e in oth) {
      if (cur.contains(e)) {
        return true;
      }
    }
    return false;
  }

  void getMoreNews() {
    // 清空当前列表
    state.moreList.clear();

    // 当前新闻的标签
    String curLabel = state.newDetail.dataLabel ?? "";

    // 获取新闻列表
    List<NewsDetail> newsList = Get.find<NewListController>().state.newsList;

    // 过滤出符合条件的新闻
    List<NewsDetail> filteredList = newsList.where((e) {
      return checkIsContains(curLabel, e.dataLabel ?? "");
    }).toList();

    Log.i("符合条件的新闻数量: ${filteredList.length}");

    // 如果过滤后的新闻数量小于3，随机获取3条
    if (filteredList.length < 3) {
      // 随机获取3条
      Random random = Random();
      while (state.moreList.length < 3) {
        int randomIndex = random.nextInt(newsList.length);
        NewsDetail randomItem = newsList[randomIndex];

        // 确保没有重复添加相同的新闻
        if (!state.moreList.contains(randomItem)) {
          state.moreList.add(randomItem);
        }
      }
    } else {
      // 如果大于或等于3条，直接添加到列表
      for (var element in filteredList) {
        if (state.moreList.length < 3) {
          state.moreList.add(element);
        }
      }
    }

    // Log 当前更多新闻列表数量
    Log.i("最终更多新闻列表数量: ${state.moreList.length}");
  }
}
