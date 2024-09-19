/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:23:17
 * @LastEditTime: 2024-09-18 18:40:14
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:23:17
 * @LastEditTime: 2024-09-18 12:26:13
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class NewsDetailController extends GetxController {
  final state = NewDetailState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
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
    state.moreList.clear();
    String curLabel = state.newDetail.dataLabel ?? "";
    List<NewsDetail> newsList = Get.find<NewListController>().state.newsList;
    for (NewsDetail e in newsList) {
      if (checkIsContains(curLabel, e.dataLabel ?? "")) {
        if (state.moreList.length < 3) {
          state.moreList.add(e);
        }
      }
    }
  }
}
