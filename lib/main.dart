/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 16:17:35
 * @LastEditTime: 2025-01-24 19:22:38
 */
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_route_observer.dart';
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
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMax = MediaQuery.of(context).size.width > Constant.maxWebWidth && kIsWeb;
    Get.config(
      // defaultOpaqueRoute: false,// 此全局配置无效，使用GetPageRoute的opaque属性
      defaultPopGesture: false,
      // defaultDurationTransition: Duration.zero,
    );
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: Constant.maxWebWidth),
        child: LayoutBuilder(builder: (context, constraints) {
          return ScreenUtilInit(
            minTextAdapt: true,
            enableScaleWH: (() => isMax ? false : true),
            enableScaleText: (() => isMax ? false : true),
            designSize:
                isMax ? const Size(Constant.maxWebWidth, 812) : const Size(375, 812),
            // designSize: const Size(375, 812),
            builder: (context, widget) => RefreshConfiguration(
              headerBuilder: () => const WaterDropHeader(),
              footerBuilder: () => const ClassicFooter(),
              child: MediaQuery(
                data: MediaQueryData.fromView(View.of(context))
                    .copyWith(textScaler: TextScaler.noScaling

                        /// 禁用系统字体缩放
                        ),
                child: GetMaterialApp(
                  title: 'arm chair quaterback',
                  theme: AppTheme.light,
                  debugShowCheckedModeBanner: false,
                  initialRoute: AppPages.main,
                  onGenerateRoute: AppPages.generateRoute,
                  // getPages: AppPages.routes,
                  builder: EasyLoading.init(),
                  initialBinding: AllControllerBindings(),
                  navigatorObservers: [
                    AppPages.observer,
                    HorizontalRouteObserver.getInstance(),
                  ],
                  translations: TranslationService(),
                  supportedLocales: ConfigStore.to.languages,
                  locale: ConfigStore.to.locale,
                  fallbackLocale: const Locale('en', 'US'),
                  enableLog: true,
                  // logWriterCallback: Log.write,
                  // defaultTransition: Transition.rightToLeft,
                  // transitionDuration:
                  //     Duration(milliseconds: Constant.transitionDuration),
                  // customTransition:
                  //     HalfSlideRightToLeftTransition(), //只作用在一级路由，局部路由需要单独加
                  defaultTransition: Transition.noTransition,
                  localizationsDelegates: GlobalMaterialLocalizations.delegates,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
