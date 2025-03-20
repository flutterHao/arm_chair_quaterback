import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
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
  initData() {
    var team = HomeController.to.userEntiry.teamLoginInfo!.team;

    teamLogo.value = team!.teamLogo ?? 1;
    teamName.value = team.teamName ?? "";
    birthday.value = team.birthday ?? 0;
    signature.value = team.signature ?? "";

    update(["user_info"]);
  }

  void getEditInfoData() {
    // editTeamName.value = teamName.value;
    editBirthday.value = birthday.value;
    editSignature.value = signature.value;
  }

  void saveEditData() async {
    HomeController.to.userEntiry = await UserApi.updateTeamInfo(
        teamName: editTeamName.value,
        birthday: editBirthday.value,
        signature: editSignature.value);
    editTeamName.value = '';
    await initData();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void goEditPage() async {
    await Get.toNamed(RouteNames.userInfoEdit);
    update(["user_info"]);
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
