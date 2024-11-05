import 'package:arm_chair_quaterback/common/entities/language.dart';
import 'package:get/get.dart';

import 'index.dart';

class MineSettingController extends GetxController {
  MineSettingController();

  final state = MineSettingState();

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

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
