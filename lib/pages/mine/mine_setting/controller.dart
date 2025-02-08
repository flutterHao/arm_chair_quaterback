import 'dart:ui';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/language.dart';
import 'package:arm_chair_quaterback/common/services/storage.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:get/get.dart';

class MineSettingController extends GetxController {
  MineSettingController();

  var musicSwitchStatus = false.obs;
  var soundSwitchStatus = true.obs;
  var notifySwitchStatus = true.obs;

  var currentLanguageIndex = 0.obs;

  var languages = [
    Language("English", "UK", "English", const Locale('en', 'US')),
    Language("Chinese", "ZH", "中文", const Locale('zh', 'CN'))
  ];

  // tap
  void setLanguage(int index) {
    currentLanguageIndex.value = index;
    //todo 切换语言
    ConfigStore.to.onLocaleUpdate(languages[index].locale);
  }

  void getCurrentLanguage() {
    var langCode = StorageService.to.getString(Constant.languge);
    if (langCode.isNotEmpty) {
      currentLanguageIndex.value = languages.indexWhere((element) {
        return element.locale.languageCode == langCode;
      });
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getCurrentLanguage();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
