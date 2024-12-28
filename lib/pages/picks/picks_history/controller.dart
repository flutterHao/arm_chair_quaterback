import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:get/get.dart';


class PicksHistoryController extends GetxController {
  PicksHistoryController();

  var loadStatus = LoadDataStatus.loading.obs;

  late TeamSimpleEntity teamSimpleEntity;
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    HomeController homeController = Get.find();
    PicksApi.getTeamSimple(homeController.userEntiry.teamLoginInfo?.team?.teamId ?? 0).then((result) {
      loadStatus.value = LoadDataStatus.success;
      teamSimpleEntity = result;
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
    });
  }

}
