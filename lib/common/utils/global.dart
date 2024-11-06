import 'package:arm_chair_quaterback/common/constant/firebase_options.dart';
import 'package:arm_chair_quaterback/common/utils/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/store/store.dart';
import 'package:get/get.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setSystemUi();
    Loading();

    await initFirebaseCrashlytics();

    await Get.putAsync<StorageService>(() => StorageService().init());

    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }

  static Future<void> initFirebaseCrashlytics() async {
    if(!kReleaseMode) return;
    await Firebase.initializeApp();
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void setSystemUi() {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light, // 状态栏图标为白色
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
