/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-10 09:53:30
 * @LastEditTime: 2025-01-18 16:36:23
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustrationList extends StatelessWidget {
  const IllustrationList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IllustratiionsController>(
      id: "list",
      builder: (ctrl) {
        var list = ctrl.onfilter();
        var activeList = list.where((e) => e.isActive == 0).toList();
        activeList.sort((a, b) => b.isLight.compareTo(a.isLight));
        var notActiveList = list.where((e) => e.isActive == 1).toList();
        notActiveList.sort((a, b) => b.isLight.compareTo(a.isLight));
        int length = list.where((e) => e.isLight == 1).length;
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w),
              width: double.infinity,
              height: 37.w,
              color: AppColors.c4D4D4D,
              child: Row(
                children: [
                  IconWidget(
                    iconWidth: 19.w,
                    icon: Assets.managerUiManagerArchiveAtlas,
                  ),
                  8.5.hGap,
                  Expanded(
                    child: Text(
                      "$length/${list.length}",
                      style: 14.w4(
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fRobotoRegular,
                      ),
                    ),
                  ),
                  MtInkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: Get.context!,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return FilterDialog();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.w,
                      ),
                      child: IconWidget(
                        iconWidth: 17.w,
                        icon: Assets.commonUiCommonIconSift,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 21.w, vertical: 25.w),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 100 / 160,
                        crossAxisSpacing: 16.5.w,
                        mainAxisSpacing: 10.w,
                        crossAxisCount: 3,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return _Item(item: activeList[index]);
                        },
                        childCount: activeList.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        "free agency".toUpperCase(),
                        style: 24.w4(
                          fontFamily: FontFamily.fOswaldBold,
                          height: 0.9,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors.cD1D1D1,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 21.w, vertical: 25.w),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 100 / 160,
                        crossAxisSpacing: 16.5.w,
                        mainAxisSpacing: 10.w,
                        crossAxisCount: 3,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return _Item(item: notActiveList[index]);
                        },
                        childCount: notActiveList.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Item extends GetView<IllustratiionsController> {
  const _Item({super.key, required this.item});
  final PlayerCollectCollects item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.toNamed(
          RouteNames.illustrationDetail,
          arguments: item,
        );
        // if (result == true)
        controller.getPlayerCollectInfo();
      },
      child: Center(
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 140.w,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  color:
                      item.isLight == 1 ? AppColors.cFFFFFF : AppColors.cE6E6E),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ImageWidget(
                    url: Utils.getPlayUrl(item.playerId),
                    color: item.isLight == 1
                        ? null
                        : AppColors.c000000.withOpacity(0.2),
                    width: 100.w,
                    height: 140.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16.w,
                      alignment: Alignment.center,
                      color: AppColors.c262626,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 16.w,
                      width: 100.w * item.fragmentNum / item.needNum,
                      alignment: Alignment.center,
                      color: AppColors.c10A86A,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 16.w,
                        alignment: Alignment.center,
                        child: Text(
                          "${item.fragmentNum}/${item.needNum}",
                          style: 12.w4(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        )),
                  ),
                  Positioned(
                    left: 4.5.w,
                    bottom: 2.5.w,
                    child: IconWidget(
                      iconWidth: 13.w,
                      // iconHeight: 12.8.w,
                      icon: Assets.managerUiManagerArchiveDebris,
                      iconColor: AppColors.cFFFFFF,
                    ),
                  ),
                  if (item.isLight == 1)
                    Positioned(
                      top: 7.5.w,
                      left: 7.w,
                      child: OutlinedText(
                        text: Utils.getPlayBaseInfo(item.playerId).grade,
                        textStyle: TextStyle(
                            fontSize: 34.h,
                            fontFamily: FontFamily.fRobotoBlack,
                            height: 0.8),
                      ),
                    ),
                ],
              ),
            ),
            5.5.vGap,
            Text(
              Utils.getPlayBaseInfo(item.playerId).ename,
              overflow: TextOverflow.ellipsis,
              style: 16.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
            ),
          ],
        ),
      ),
    );
  }
}
