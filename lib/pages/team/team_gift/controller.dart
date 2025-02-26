import 'package:arm_chair_quaterback/common/entities/girl_gift_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:get/get.dart';

class TeamGiftController extends GetxController {
  TeamGiftController();
  RxList<GirlGiftDefineEntity> girlGiftDefineList = RxList();

  initData() async {
    girlGiftDefineList.value = await CacheApi.getGirlGiftDefine();
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
