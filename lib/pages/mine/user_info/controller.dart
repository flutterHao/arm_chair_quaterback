import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/pages/user_info_edit_page.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  UserInfoController();
  RxInt teamLogo = 1.obs;
  RxString teamName = "".obs;
  RxInt birthday = 0.obs;
  RxString signature = "".obs;
  RxString editTeamName = "".obs;
  RxInt editBirthday = 0.obs;
  RxString editSignature = "".obs;
  _initData() {
    update(["user_info"]);
    var team = HomeController.to.userEntiry.teamLoginInfo!.team;
    if (team != null) {
      teamLogo.value = team.teamLogo ?? 1;
      teamName.value = team.teamName ?? "";
      birthday.value = team.birthday ?? 0;
      signature.value = team.signature ?? "";
    }
  }

  void getEditInfoData() {
    editTeamName.value = teamName.value;
    editBirthday.value = birthday.value;
    editSignature.value = signature.value;
  }

  void saveEditData() async {
    await UserApi.updateTeamInfo(
        teamName: editTeamName.value,
        birthday: editBirthday.value,
        signature: editSignature.value);
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
