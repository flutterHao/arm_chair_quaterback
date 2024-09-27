import 'package:get/get.dart';

import 'controller.dart';

class TeamTrainingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamTrainingController>(() => TeamTrainingController());
  }
}
