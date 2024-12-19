/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 14:09:29
 * @LastEditTime: 2024-12-19 21:02:40
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FreeBoxDialog extends StatelessWidget {
  const FreeBoxDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
      builder: (controller) {
        return CustomBottomDialog(
            isShowCancelButton: false,
            height: 400.w,
            title: "GET FREE GIRF".toUpperCase(),
            content: Container(
              margin: EdgeInsets.symmetric(vertical: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.awardList.map((e) {
                  return Container(
                    margin: EdgeInsets.all(4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        e.type == 2
                            ? ImageWidget(
                                url: Utils.getPlayUrl(e.id),
                                width: 64.w,
                              )
                            : Image.asset(
                                Utils.getPropIconUrl(e.id),
                                width: 64.w,
                              ),
                        // Image.asset(
                        //   Assets.picksUiPropsMoeny,
                        //   width: 60.w,
                        // ),
                        10.hGap,
                        Text(
                          "x ${Utils.formatMoney(e.num)}",
                          style: 14.w4(color: AppColors.c262626),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            onComfirm: () {
              // Get.back();
            });
      },
    );
  }
}

class BattleBoxDialog extends StatelessWidget {
  const BattleBoxDialog({super.key, required this.item, required this.index});
  final CardPackInfoCard item;
  final int index;

  @override
  Widget build(BuildContext context) {
    var propItem = CacheApi.propDefineList!
        .firstWhere((element) => element.propId == item.cardId);

    return GetBuilder<TeamIndexController>(
      builder: (controller) {
        bool noWait =
            controller.cardPackInfo.card.where((e) => e.status == 1).isEmpty;
        bool isUnlock = item.status == 0 && noWait;
        bool enable = isUnlock || item.status == 2;
        return Container(
          width: double.infinity,
          height: 554.w,
          // constraints: BoxConstraints(
          //   maxHeight: MediaQuery.of(context).size.height * 0.8, // 最大高度为屏幕高度的80%
          // ),
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
          child: Column(
            children: [
              12.vGap,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.ccccccc,
                    borderRadius: BorderRadius.circular(2.w)),
                height: 4.w,
                width: 44.w,
              ),
              27.5.vGap,
              Text(
                "open the package".toUpperCase(),
                style: 27.w4(
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 0.8,
                ),
              ),
              13.5.vGap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: Container(
                  // constraints: BoxConstraints(minHeight: 47.5.w),
                  child: Text(
                    propItem.desc,
                    textAlign: TextAlign.center,
                    style: 14.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.8,
                        color: AppColors.c000000),
                  ),
                ),
              ),
              27.5.vGap,
              Container(
                width: 164.w,
                height: 164.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cF1F1F1,
                  borderRadius: BorderRadius.circular(164.w / 2),
                ),
                child: Image.asset(
                  _getBoxAssets(item.status, isUnlock),
                  width: 102.w,
                  height: 102.w,
                  fit: BoxFit.fill,
                ),
              ),
              9.5.vGap,
              Text(
                propItem.propName,
                style: 21.w4(
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fOswaldRegular),
              ),
              Expanded(child: Container()),
              if (isUnlock)
                Text(
                  "unlock time:${item.totalTime}MIN".toUpperCase(),
                  style: 16.w4(
                    fontFamily: FontFamily.fOswaldMedium,
                    height: 0.8,
                  ),
                ),
              if (item.status == 1)
                Obx(() {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 43.5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "open time:".toUpperCase(),
                              style: 16.w4(
                                fontFamily: FontFamily.fOswaldMedium,
                                height: 0.8,
                              ),
                            ),
                            Text(
                              item.remainTime.value.toUpperCase(),
                              style: 16.w4(
                                fontFamily: FontFamily.fOswaldMedium,
                                height: 0.8,
                              ),
                            )
                          ],
                        ),
                      ),
                      7.vGap,
                      OutLineProgressWidget(
                        // width: 68.w,
                        // height: 6.w,
                        width: 297.w,
                        height: 14.w,
                        progress: item.progress,
                        progressColor: AppColors.cFF7954,
                      ),
                      // Stack(
                      //   alignment: Alignment.centerLeft,
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.centerLeft,
                      //       margin: EdgeInsets.symmetric(horizontal: 39.w),
                      //       width: 297.w,
                      //       height: 14.w,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: AppColors.cD1D1D1),
                      //         borderRadius: BorderRadius.circular(7.w),
                      //       ),
                      //     ),
                      //     AnimatedContainer(
                      //       duration: 300.milliseconds,
                      //       alignment: Alignment.centerLeft,
                      //       margin: EdgeInsets.symmetric(horizontal: 39.w),
                      //       width: 7.w + 290 * item.progress,
                      //       height: 14.w,
                      //       clipBehavior: Clip.antiAlias,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.horizontal(
                      //               left: Radius.circular(7.w)),
                      //           gradient: const LinearGradient(colors: [
                      //             AppColors.c000000,
                      //             AppColors.cFF7954
                      //           ])),
                      //     ),
                      //   ],
                      // ),
                      18.vGap
                    ],
                  );
                }),
              9.5.vGap,
              MtInkwell(
                onTap: () {
                  if (item.status == 0 && isUnlock) {
                    controller.activeBattleBox(index);
                  } else if (item.status == 1) {
                    controller.speedOpneBattleBox(index);
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  height: 51.w,
                  width: 343.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: enable ? AppColors.c000000 : AppColors.cEEEEEE,
                      borderRadius: BorderRadius.circular(9.w)),
                  child: Text(
                    _getButtonString(item.status, isUnlock).toUpperCase(),
                    style: 23.w4(
                        color: enable ? AppColors.cFFFFFF : AppColors.ccccccc,
                        height: 0.8,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              ),
              41.vGap,
            ],
          ),
        );
      },
    );
  }
}

String _getBoxAssets(int status, bool isUnlock) {
  if (status == 0) {
    return isUnlock
        ? Assets.managerUiManagerGift03
        : Assets.managerUiManagerGift02;
  } else if (status == 1) {
    return Assets.managerUiManagerGift01;
  } else {
    return Assets.managerUiManagerGift03;
  }
}

String _getButtonString(int status, bool isUnlock) {
  String comfirmText = "other package is opening";
  if (status == 0) {
    comfirmText = isUnlock ? "unlock" : "other package is opening";
  } else if (status == 1) {
    comfirmText = "Waiting to open";
  } else {
    comfirmText = "open";
  }
  return comfirmText;
}
