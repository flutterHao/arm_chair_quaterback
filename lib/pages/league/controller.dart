import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class LeagueController extends GetxController {
  LeagueController();

  final state = LeagueState();

  RefreshController refreshController = RefreshController();

  List<String> pageText = ["YESTERDAY","TODAY","TOMORROW"];

  PageController pageController = PageController();
  var currentPageIndex = 0;

  loading(){
    Future.delayed(const Duration(seconds: 2),(){
      refreshController.refreshCompleted();
    });
  }

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

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  prePage() {
    ClickFeedBack.selectionClick();
    if(currentPageIndex == 0){
      return;
    }
    pageController.jumpToPage(--currentPageIndex);
  }

  nextPage(){
    ClickFeedBack.selectionClick();
    if(currentPageIndex == pageText.length-1){
      return;
    }
    pageController.jumpToPage(++currentPageIndex);

  }
}
