import 'package:get/get.dart';

import 'controller.dart';

class NewDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailController>(() => NewsDetailController());
  }
}
