import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'en_US.dart';
import 'zh_CN.dart';

/*

https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
https://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html

*/

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}
