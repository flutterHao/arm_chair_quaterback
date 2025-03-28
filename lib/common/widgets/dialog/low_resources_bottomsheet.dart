import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///资源类型
enum ResourceType { coins, cash }

///资源不足弹窗
class LowResourcesBottomsheet {
  static RxBool noshowToday = false.obs;
  static Widget _resourcesLayouBuild(ResourceType resourceType) {
    if (resourceType == ResourceType.coins) {
      return Column(
        children: [
          _getResourcesWidget(
              icon: Assets.commonUiCommonTabBottom04Off,
              title: 'Make a right pick can get lots of coins. ',
              onTap: () {
                Get.until((route) => route.isFirst); // 通过条件判断循环返回到第一个路由
                HomeController homeController = Get.find();
                homeController.goto(3);
              }),
          _getResourcesWidget(
              icon: Assets.commonUiCommonIcon01,
              title: 'Finish Daily Task can get coins.',
              onTap: () {
                Get.offNamed(RouteNames.mineDailyTask);
                final DailyTaskController dailyTaskController = Get.find();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  dailyTaskController.scrollController.jumpTo(400.h);
                });
              }),
          _getResourcesWidget(
              icon: Assets.commonUiCommonTabBottom01Off,
              title: 'There some coin hide in news.',
              onTap: () {
                Get.until((route) => route.isFirst); // 通过条件判断循环返回到第一个路由
                HomeController homeController = Get.find();
                homeController.goto(0);
              }),
        ],
      );
    }
    return Column(
      children: [
        _getResourcesWidget(
            icon: Assets.commonUiCommonIcon02,
            title: 'Start trainning can get lots of cash. ',
            onTap: () {
              Get.until((route) => route.isFirst); // 通过条件判断循环返回到第一个路由
              HomeController homeController = Get.find();
              homeController.goto(2);
              TeamIndexController teamIndexController = Get.find();
              teamIndexController.scrollToSlot();
            }),
        _getResourcesWidget(
            icon: Assets.commonUiCommonIcon01,
            title: 'Finish Daily Task can get cash.',
            onTap: () {
              Get.offNamed(RouteNames.mineDailyTask);
              final DailyTaskController dailyTaskController = Get.find();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                dailyTaskController.scrollController.jumpTo(400.h);
              });
            }),
      ],
    );
  }

  /// 显示弹窗成功为true，否则为false
  static show(ResourceType resourceType) {
    // String lastPressedDate = StorageService.to.getString('lastPressedDate');
    // String today = DateTime.now().toLocal().toString().split(' ')[0]; // 获取今天的日期，格式为"YYYY-MM-DD"
    // noshowToday.value = (lastPressedDate == today);
    // if (noshowToday.value) {
    //   print('已开启今天不显示');
    //   return Future.value(false);
    // }
    return BottomTipDialog.showWithSound(
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return Container(
              width: double.infinity,
              height: 466.w,
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(9.w))),
              child: Column(children: [
                _topWidget(),
                _titleWidget(resourceType),
                24.vGap,
                Divider(height: 1, color: AppColors.cD1D1D1),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: _resourcesLayouBuild(resourceType),
                ),
                Spacer(),
                // _bottomtipWidget(),
                // SizedBox(height: Utils.getPaddingBottom() + 40.w)
              ]));
        }).then((v) {
      ///判断是否不再显示弹窗，则记录今日时间
      // if (noshowToday.value) {
      //   String today = DateTime.now().toLocal().toString().split(' ')[0];
      //   StorageService.to.setString('lastPressedDate', today);
      // }
    });
    return Future.value(true);
  }

  static Widget _titleWidget(ResourceType resourceType) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sorry,you don’t have enough ',
          textAlign: TextAlign.center,
          style: 14.w4(
              color: AppColors.c000000, fontFamily: FontFamily.fRobotoRegular),
        ),
        1.hGap,
        Text(
          resourceType == ResourceType.coins ? 'COINS' : 'CASH',
          style: 14.w7(
              color: AppColors.c000000, fontFamily: FontFamily.fRobotoRegular),
        ),
        2.hGap,
        IconWidget(
          icon: resourceType == ResourceType.coins
              ? Assets.commonUiCommonIconCurrency02
              : Assets.commonUiCommonProp05,
          iconWidth: 16.w,
        )
      ],
    );
  }

  static Widget _topWidget() {
    return Column(
      children: [
        DialogTopBtn(),
        24.vGap,
        IconWidget(
          iconWidth: 62.w,
          icon: Assets.commonUiCommonIconSystemDanger,
          iconColor: AppColors.c000000,
        ),
        16.vGap,
        Text(
          'Low resources',
          textAlign: TextAlign.center,
          style: 27.w5(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium),
        ),
        4.vGap
      ],
    );
  }

  static Widget _bottomtipWidget() {
    return Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCheckbox(
                value: noshowToday.value,
                size: 16.w,
                onChanged: (value) {
                  noshowToday.value = value!;
                }),
            10.hGap,
            Text(
              'Do no show the tips today.',
              style: 12.w4(color: AppColors.c898989),
            )
          ],
        ));
  }

  static Widget _getResourcesWidget(
      {required String icon, required String title, required Function onTap}) {
    return MtInkWell(
        onTap: () {
          onTap.call();
          // Get.back();
        },
        child: SizedBox(
            height: 64.w + 1,
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    IconWidget(
                      icon: icon,
                      iconColor: Colors.black,
                      iconWidth: 20.w,
                    ),
                    10.hGap,
                    Expanded(
                        child: Text(
                      title,
                      style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
                    )),
                    10.hGap,
                    IconWidget(
                      icon: Assets.commonUiCommonIconSystemJumpto,
                      iconColor: Colors.black,
                      iconWidth: 8.w,
                    )
                  ],
                )),
                Divider(height: 1, color: AppColors.cD1D1D1),
              ],
            )));
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;
  final Color activeColor;
  final Color checkColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 24.0, // 默认大小
    this.activeColor = Colors.blue, // 默认激活颜色
    this.checkColor = Colors.white, // 默认勾选颜色
  });

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        width: size,
        height: size,
        padding: EdgeInsets.zero,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: value ? activeColor : Colors.transparent,
          border: Border.all(color: value ? activeColor : Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: value
            ? Icon(Icons.check, size: size * 0.7, color: checkColor)
            : null,
      ),
    );
  }
}
