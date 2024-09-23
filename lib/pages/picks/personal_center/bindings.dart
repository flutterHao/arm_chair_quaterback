import 'package:get/get.dart';

import 'controller.dart';

class PersonalCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalCenterController>(() => PersonalCenterController());
  }
}
