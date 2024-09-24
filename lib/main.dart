/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 16:17:35
 * @LastEditTime: 2024-09-19 11:56:18
 */
import 'package:arm_chair_quaterback/pages/home/home_binding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/langs/translation_service.dart';
import 'package:arm_chair_quaterback/common/routers/pages.dart';
import 'package:arm_chair_quaterback/common/store/store.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
import 'package:arm_chair_quaterback/common/utils/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double MAXWEBWIDTH = 600;

  @override
  Widget build(BuildContext context) {
    bool isMax = MediaQuery.of(context).size.width > MAXWEBWIDTH && kIsWeb;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: MAXWEBWIDTH),
        child: LayoutBuilder(builder: (context, constraints) {
          return ScreenUtilInit(
            enableScaleWH: (() => isMax ? false : true),
            enableScaleText: (() => isMax ? false : true),
            // designSize:
            //     isMax ? const Size(MAXWEBWIDTH, 812) : const Size(375, 812),
            designSize: const Size(375, 812),
            builder: (context, widget) => RefreshConfiguration(
              headerBuilder: () => const WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
              footerBuilder:  () => const ClassicFooter(),
              child: GetMaterialApp(
                title: 'arm chair puaterback',
                theme: AppTheme.light,
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.main,
                getPages: AppPages.routes,
                builder: EasyLoading.init(),
                translations: TranslationService(),
                initialBinding: AllControllerBindings(),
                navigatorObservers: [AppPages.observer],
                supportedLocales: ConfigStore.to.languages,
                locale: ConfigStore.to.locale,
                fallbackLocale: const Locale('en', 'US'),
                enableLog: true,
                // logWriterCallback: Log.write,
                defaultTransition: Transition.rightToLeftWithFade,
                //  defaultTransition: Transition.noTransition,
              ),
            ),
          );
        }),
      ),
    );
  }
}
