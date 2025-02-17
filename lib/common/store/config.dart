/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:39:28
 * @LastEditTime: 2024-09-30 18:12:21
 */
import 'package:arm_chair_quaterback/common/langs/en_US.dart';
import 'package:arm_chair_quaterback/common/langs/zh_CN.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
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
    isFirstOpen = StorageService.to.getBool(Constant.firstOpen);
    onInitLocale();
  }

  @override
  void onReady() async {
    super.onReady();
    initLanguages();
  }
  // Future<void> getPlatform() async {
  //   _platform = await PackageInfo.fromPlatform();
  // }

  // 标记用户已打开APP
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(Constant.firstOpen, false);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(Constant.languge);
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
    StorageService.to.setString(Constant.languge, value.languageCode);
  }

  void setServiceUrl(String url) {
    StorageService.to.setString(Constant.serviceUrl, url);
  }

  String getServiceUrl() {
    String url = StorageService.to.getString(Constant.serviceUrl);
    if (url.isEmpty) {
      url = Address.httpBaseUrl;
    }
    return url;
  }

  void setWsServiceUrl(String url) {
    StorageService.to.setString(Constant.wsServiceUrl, url);
  }

  String getWsServiceUrl() {
    String url = StorageService.to.getString(Constant.wsServiceUrl);
    if (url.isEmpty) {
      url = Address.wsBaseUrl;
    }
    return url;
  }

  ///获取远程语言包
  initLanguages() async {
    List resLangs = await CacheApi.getcLanguages();
    await Future.forEach(resLangs, (element) {
      zh_CN[element['key']] = element['zh_CN'];
      en_US[element['key']] = element['en_US'];
    });
    Get.updateLocale(locale);
  }
}
