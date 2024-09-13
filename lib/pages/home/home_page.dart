import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    controller.auth();
    super.build(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        controller.getCurrentTabGlobalKey()?.currentState?.maybePop();
      },
      child: GetBuilder<HomeController>(
        assignId: true,
        builder: (logic) {
          return Scaffold(
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: controller.tabItems
                  .map((e) => Center(child: e.tabPage))
                  .toList(),
            ),
            bottomNavigationBar: Container(
              color: AppColors.c262626,
              height: 90.w,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                // onTap: (v) => controller.onTap(v),
                // controller: controller.tabController,
                // dividerHeight: 0,
                // indicatorColor: Colors.transparent,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.tabItems.map((e) {
                  int index = controller.tabItems.indexOf(e);
                  bool select = index == controller.tabIndex.value;
                  return InkWell(
                    onTap: () => controller.onTap(index),
                    child: Container(
                      width: 53.w,
                      height: 83.w,
                      decoration: BoxDecoration(
                        color: select ? AppColors.cFF7954 : null,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26.5.w),
                            topRight: Radius.circular(26.5.w)),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5.w),
                          Image.asset(
                            select ? e.tabIconSelected : e.tabIconNormal,
                            width: 25.w,
                            fit: BoxFit.fill,
                            // height: 22.5.w,
                          ),
                          SizedBox(height: 7.w),
                          Text(
                            e.label,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color:
                                    select ? Colors.black : AppColors.c666666),
                          ),
                          SizedBox(height: 9.w),
                          if (select)
                            Image.asset(
                              Assets.sel_2Png,
                              width: 22.5.w,
                              // height: 22.5.w,
                              fit: BoxFit.fill,
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class HomePage extends GetView<HomeController> {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

//   }
// }
