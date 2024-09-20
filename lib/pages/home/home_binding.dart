/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-06 16:22:41
 * @LastEditTime: 2024-09-19 20:31:46
 */
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class AllControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NewListController(), fenix: true);
  }
}
