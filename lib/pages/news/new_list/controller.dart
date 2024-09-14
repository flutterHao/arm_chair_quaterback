/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2024-09-14 20:11:30
 */
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/store/user.dart';
import 'package:arm_chair_quaterback/common/values/values.dart';
import 'package:get/get.dart';

import 'index.dart';

class NewListController extends GetxController {
  NewListController();

  final state = NewListState();

  final List<String> images = [
    'https://via.placeholder.com/343x150.png?text=Banner+1',
    'https://via.placeholder.com/343x150.png?text=Banner+2',
    'https://via.placeholder.com/343x150.png?text=Banner+3',
  ];

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    getNewsList();
    getNewsDetail(123);
  }

  void getNewsBanner() {
    NewsApi.getNewsBanner().then((value) {
      state.banners = value;
      update(['newsBanner']);
    });
  }

  void getNewsList() {
    NewsApi.getNewsList().then((value) {
      state.newsList = value.nbaNewsList ?? [];
      update(['newsList']);
    });
  }

  void getNewsDetail(int id) {
    NewsApi.getNewsDetail(id).then((value) {
      state.newsDetail = value;
      update(['newsDetail']);
    });
  }

  void likeNews(int id) {
    NewsApi.newsLike(id).then((value) {
      update(['newsList']);
    });
  }

  void unLikeNews(int id) {
    NewsApi.newsUnLike(id).then((value) {
      update(['newsList']);
    });
  }
}
