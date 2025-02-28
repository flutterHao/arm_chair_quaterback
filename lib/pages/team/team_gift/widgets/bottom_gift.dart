import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/color_grey_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_gift/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomGiftWidget extends GetView<TeamGiftController> {
  const BottomGiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Obx(() => Stack(
            children: [
              ///底部总高度
              Container(height: 294.h + Utils.getPaddingBottom()),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 252.h + Utils.getPaddingBottom(),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 62.h),

                      /// 礼物列表布局
                      Container(
                        height: 152.h,
                        child: controller.sendGift.value ? _sendGiftWidget() : _giftInfoWidget(),
                      )
                    ],
                  ),
                ),
              ),

              ///buff信息
              Positioned(top: 0, left: 16.w, right: 16.w, child: _deepAffectionWidget()),
            ],
          )),
    );
  }

  ///送完礼物
  Widget _sendGiftWidget() {
    return Column(
      children: [
        Container(
          height: 82.h,
          child: ListView.separated(
            itemCount: controller.girlGiftDefineList.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              int propid = int.parse(controller.girlGiftDefineList[index].id);
              return Container(
                alignment: Alignment.center,
                width: 82.w,
                decoration: BoxDecoration(color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(9.h)),
                child: ColorGreyWidget(
                    child: Image.asset(
                  Utils.getPropIconUrl(propid),
                  height: 50.h,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      Assets.picksUiPickGift01,
                      height: 50.h,
                    );
                  },
                )),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
          ),
        ),
        SizedBox(height: 20.h),
        MtInkWell(
            onTap: () => Get.back(),
            child: Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cB3B3B3, width: 1), borderRadius: BorderRadius.circular(9.h)),
              child: Text('go back'.toUpperCase(),
                  style: 23.w5(
                    fontFamily: FontFamily.fOswaldMedium,
                  )),
            ))
      ],
    );
  }

  ///未送礼物
  Widget _giftInfoWidget() {
    return Obx(
      () => ListView.separated(
        itemCount: controller.girlGiftDefineList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          List<String> costList = controller.girlGiftDefineList[index].cost.split('_').toList();
          int propid = int.parse(controller.girlGiftDefineList[index].id);
          return MtInkWell(
              onTap: () {
                controller.sendGiftClick(girlId: controller.gGirlDefine.value.id, giftId: propid, costList: costList);
              },
              child: Container(
                width: 100.h,
                decoration: BoxDecoration(color: AppColors.c000000, borderRadius: BorderRadius.circular(9.h)),
                child: Column(
                  children: [
                    Container(
                      height: 128.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(9.h),
                          border: Border.all(color: AppColors.c666666, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Text(
                            CacheApi.propDefineMap[propid]!.propName,
                            style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Image.asset(
                            Utils.getPropIconUrl(propid),
                            height: 50.h,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Assets.picksUiPickGift01,
                                height: 50.h,
                              );
                            },
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 21.h,
                                icon: Assets.cheerleadersUiCheerleadersIconIntimacy,
                              ),
                              SizedBox(width: 2.h),
                              Text(
                                '+${controller.girlGiftDefineList[index].addIntimacy[0]}~${controller.girlGiftDefineList[index].addIntimacy[1]}',
                                style: 12.w5(fontFamily: FontFamily.fRobotoMedium),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                        ],
                      ),
                    ),
                    Flexible(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconWidget(
                          icon: Utils.getPropIconUrl(int.tryParse(costList[1])),
                          iconHeight: 20.h,
                        ),
                        Text('${costList[2]}${costList[1] == "102" ? "K" : ""}',
                            style:
                                TextStyle(fontSize: 16.h, color: Colors.white, fontFamily: FontFamily.fOswaldMedium)),
                      ],
                    ))
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
      ),
    );
  }

  ///buff信息
  Widget _deepAffectionWidget() {
    return Container(
      height: 84.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(color: AppColors.c000000, borderRadius: BorderRadius.circular(9.w)),
      child: Row(
        children: [
          controller.sendGift.value
              ? Container(
                  height: 56.h,
                  width: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(6.h)),
                  child: Image.asset(
                    Assets.managerUiManagerIcon001,
                    width: 30.h,
                  ),
                )
              : Container(
                  height: 56.h,
                  width: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColors.cB3B3B3, borderRadius: BorderRadius.circular(6.h)),
                  child: ColorGreyWidget(
                    child: Image.asset(
                      Assets.managerUiManagerIcon001,
                      width: 30.h,
                    ),
                  ),
                ),
          SizedBox(width: 10.h),
          Expanded(
              child: Container(
            height: 64.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'deep affeation'.toUpperCase(),
                      style: 16.w5(
                        height: 1,
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                    Spacer(),
                    controller.sendGift.value
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconWidget(
                                iconWidth: 16.h,
                                icon: Assets.commonUiCommonIconManagerTime,
                              ),
                              6.hGap,
                              Obx(() {
                                controller.gameStartTimesCountDown.value;
                                return Text(
                                  controller.getTime,
                                  style: 12.w5(fontFamily: FontFamily.fOswaldRegular, color: AppColors.cFFFFFF),
                                );
                              }),
                            ],
                          )
                        : Text(
                            'invalid'.toUpperCase(),
                            style: 12.w5(color: AppColors.cE34D4D, fontFamily: FontFamily.fOswaldRegular),
                          )
                  ],
                ),
                Flexible(
                    child: Text(
                  '${controller.gGirlDefine.value.loveDesc} ${(controller.gGirlDefine.value.intimacyLevelRate * 100).toInt()}%',
                  style: 12.w5(
                    color: AppColors.cFFFFFF,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
