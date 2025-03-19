import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/pages/user_info_edit_page.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  UserInfoController();
  RxInt teamLogo = 1.obs;
  RxString teamName = "".obs;
  RxInt birthday = 0.obs;
  RxString signature = "".obs;
  _initData() {
    update(["user_info"]);
    var team = HomeController.to.userEntiry.teamLoginInfo!.team;
    if (team != null) {
      teamLogo.value = team.teamLogo ?? 1;
      teamName.value = team.teamName ?? "";
      birthday.value = team.birthday ?? 0;
      // birthday.value = team.birthday ?? 1742356465000;
      signature.value = team.signature ?? "";
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void edit() async {
    await Get.to(UserInfoEditPage());
    update(["user_info"]);
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
