import 'package:arm_chair_quaterback/common/entities/language.dart';
import 'package:get/get.dart';


class MineSettingController extends GetxController {
  MineSettingController();


  var musicSwitchStatus = false.obs;
  var soundSwitchStatus = true.obs;
  var notifySwitchStatus = true.obs;

  var currentLanguageIndex = 0.obs;

  var languages = [
    Language("English", "UK", "English"),
    Language("Chinese", "ZH", "中文")
  ];

  // tap
  void setLanguage(int index) {
    currentLanguageIndex.value = index;
    //todo 切换语言
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }


  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
