/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:39:28
 * @LastEditTime: 2024-09-13 15:40:28
 */
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/values/values.dart';
import 'package:get/get.dart';

//配置
class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  // PackageInfo? _platform;
  // String get version => _platform?.version ?? '-';
  // bool get isRelease => bool.fromEnvironment("dart.vm.product");
  Locale locale = const Locale('en', 'US');
  List<Locale> languages = const [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(UserConstant.firstOpen);
  }

  // Future<void> getPlatform() async {
  //   _platform = await PackageInfo.fromPlatform();
  // }

  // 标记用户已打开APP
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(UserConstant.firstOpen, false);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(UserConstant.languge);
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(UserConstant.languge, value.languageCode);
  }
}
