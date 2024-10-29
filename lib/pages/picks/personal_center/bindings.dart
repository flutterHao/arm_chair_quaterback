import 'package:get/get.dart';

import 'controller.dart';

class PersonalCenterBinding implements Bindings {
  PersonalCenterBinding({this.teamId});

  final int? teamId;
  @override
  void dependencies() {
    Get.lazyPut<PersonalCenterController>(() => PersonalCenterController(teamId: (Get.arguments as Map)["teamId"],initTab:(Get.arguments as Map)["initTab"]));
  }
}
