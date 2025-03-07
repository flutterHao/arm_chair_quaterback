import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/widget/love_plan_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/battle_box_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spine_flutter/spine_widget.dart';

/*
 * @Description: 换人+宝箱
 * @Author: lihonghao
 * @Date: 2024-11-11 14:05:07
 * @LastEditTime: 2024-11-11 17:27:46
 */
class BeautyAndBoxView extends StatelessWidget {
  const BeautyAndBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeautyController>(builder: (beautyCtrl) {
      return SizedBox(
        width: double.infinity,
        height: 608.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Positioned(
            //   top: -15.w,
            //   left: -25.w,
            //   child: ShaderMask(
            //     shaderCallback: (Rect bounds) {
            //       return LinearGradient(
            //         begin: Alignment.center,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Colors.white.withOpacity(1),
            //           Colors.white.withOpacity(0.1),
            //         ],
            //       ).createShader(bounds);
            //     },
            //     child: Text(
            //       "cheerleaders".toUpperCase(),
            //       style: TextStyle(
            //           fontSize: 121.sp,
            //           letterSpacing: 0,
            //           // color: AppColors.c262626,
            //           color: Color(beautyCtrl.currentGirl.bgColor),
            //           height: 0.95,
            //           fontFamily: FontFamily.fOswaldBold),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 32.h,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     color: AppColors.cF2F2F2,
            //     height: 30.w,
            //     alignment: Alignment.center,
            //     child: Text(
            //       "cheerleaders".toUpperCase(),
            //       style: TextStyle(
            //           fontSize: 21.sp,
            //           letterSpacing: 18,
            //           fontFamily: FontFamily.fOswaldBold),
            //     ),
            //   ),
            // ),

            ///妹子
            Positioned(
              top: 0.w,
              left: 0,
              right: 0,
              // bottom: 98.w,
              child: GetBuilder<BeautyController>(builder: (beautyCtrl) {
                return Obx(() {
                  beautyCtrl.beautyIndex.value;
                  return SizedBox(
                    height: 546.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Opacity(
                          opacity: beautyCtrl.beautyIndex.value != 0 ? 0 : 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 20.w),
                            child: SpineWidget.fromAsset(
                              Assets.assetsSpineNv1,
                              "assets/spine/nv_1.json",
                              beautyCtrl.spineWidgetController,
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        if (beautyCtrl.beautyIndex.value != 0)
                          Image.asset(
                            beautyCtrl.currentGirl.girlImg,
                            fit: BoxFit.fitHeight,
                            height: 500.h,
                            alignment: Alignment.topCenter,
                          ),
                        ...beautyCtrl.hearts,
                        //美女区域点击响应
                        Positioned(
                            top: 0,
                            // left: 0.w,
                            // right: 0.w,
                            bottom: 0.w,
                            // height:
                            //     MediaQuery.of(context).size.height * 0.33,
                            child: GestureDetector(
                              onTapDown: (details) {
                                double top =
                                    MediaQuery.of(context).size.height * 0.33;
                                double x = details.localPosition.dx +
                                    (375.w - 200.w) / 2;
                                var offset =
                                    Offset(x, details.localPosition.dy);
                                beautyCtrl.addHeart(offset);
                                beautyCtrl.setAnimation(
                                    details.localPosition.dy > top ? 2 : 1);
                              },
                              child: Container(
                                width: 200.w,
                                color: Colors.transparent,
                              ),
                            )),

                        // Positioned(
                        //   top: 0.w,
                        //   // left: 10,
                        //   // right: 10,
                        //   child: Lottie.asset(
                        //     Assets.lottieLove,
                        //     height: 200.w,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                });
              }),
            ),

            //任务
            Positioned(
              top: 359.w,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  BottomTipDialog.showWithSound(
                      context: Get.context!,
                      builder: (context) {
                        return const LovePlanDialog();
                      });
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 6.5.w),
                  width: double.infinity,
                  height: 56.w,
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(9.w),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 34.w,
                        height: 34.w,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 16.w, right: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.w),
                            border: Border.all(color: AppColors.c666666)),
                        child: IconWidget(
                            iconWidth: 19.w,
                            icon: Assets.commonUiCommonIconLoveletter),
                      ),
                      16.hGap,
                      Text(
                        "Signed 10 top girls Signed 10",
                        style: 12.w4(
                          color: AppColors.cFFFFFF,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      ),
                      Text(
                        " (10/10) ",
                        style: 12.w4(
                          color: AppColors.c2DE298,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "...",
                          style: 12.w4(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      ),
                      MtInkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          BottomTipDialog.showWithSound(
                              context: Get.context!,
                              isScrollControlled: true,
                              builder: (context) {
                                return const LovePlanDialog();
                              });
                        },
                        child: Container(
                          width: 45.w,
                          height: 30.w,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.w),
                              border: Border.all(color: AppColors.c666666)),
                          child: Text(
                            "GO TO",
                            style: 12.w4(
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //亲密按钮
            Positioned(
              right: 0.w,
              top: 107.w,
              child: InkWell(
                onTap: () => Get.toNamed(RouteNames.teamBeautyPage),
                child: Container(
                  width: 65.w,
                  height: 41.w,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 17.w),
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(21.w)),
                  ),
                  child: MtInkWell(
                    splashColor: Colors.transparent,
                    onTap: () => Get.toNamed(RouteNames.teamBeautyPage),
                    child: Image.asset(
                      Assets.cheerleadersUiCheerleadersIconIntimacy,
                      width: 38.w,
                      height: 18.w,
                    ),
                  ),
                ),
              ),
            ),
            //宝箱
            Positioned(
              // top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: GetBuilder<TeamIndexController>(
                  id: "battleBox",
                  builder: (ctrl) {
                    return Container(
                      // height: 219.w,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.w),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ///战斗进度
                              Expanded(
                                  flex: 204,
                                  child: Container(
                                    height: 51.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13.w, vertical: 10.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.c000000,
                                      borderRadius: BorderRadius.circular(12.w),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              LangKey.teamButtonBattlePass.tr,
                                              style: 14.w4(
                                                  color: AppColors.cFFFFFF,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                  height: 0.75),
                                            )),
                                            IconWidget(
                                              iconWidth: 14.w,
                                              icon: Assets.iconUiIconRead,
                                              iconColor: AppColors.cFFFFFF,
                                            )
                                          ],
                                        ),
                                        const Expanded(
                                            child: SizedBox.shrink()),
                                        CustomLinearProgressBar(
                                          progress: 0.3,
                                          height: 8.w,
                                          width: double.infinity,
                                          backgroundColor: AppColors.c4D4D4D,
                                          progressColor: AppColors.cFFFFFF,
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(width: 9.w),

                              ///免费宝箱
                              Expanded(
                                flex: 134,
                                child: MtInkWell(
                                  onTap: () async {
                                    if (ctrl.recieved) return;
                                    ctrl.openFreeGift();
                                  },
                                  child: SizedBox(
                                    height: 55.w,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          bottom: 0,
                                          top: 3.5.w,
                                          right: 3.5.w,
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(left: 13.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9.w),
                                                border: Border.all(
                                                    width: 1.w,
                                                    color: AppColors.c666666)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  LangKey.teamTabGift.tr,
                                                  style: 14.w4(
                                                      color: AppColors.c262626,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
                                                      height: 0.75),
                                                ),
                                                10.vGap,
                                                !ctrl.recieved
                                                    ? Row(
                                                        children: [
                                                          Text(
                                                            LangKey
                                                                .teamButtonGift
                                                                .tr,
                                                            style: 10.w4(
                                                                color: AppColors
                                                                    .cFF7954,
                                                                height: 0.75),
                                                          ),
                                                          4.hGap,
                                                          IconWidget(
                                                            iconWidth: 5.w,
                                                            icon: Assets
                                                                .iconUiIconShrink,
                                                            iconColor: AppColors
                                                                .cFF7954,
                                                            rotateAngle: 90,
                                                          )
                                                        ],
                                                      )
                                                    : Obx(() {
                                                        return Text(
                                                          ctrl
                                                              .cardPackInfo
                                                              .freeTimeString
                                                              .value,
                                                          style: 10.w4(
                                                              color: AppColors
                                                                  .cFF7954,
                                                              height: 0.75),
                                                        );
                                                      }),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: SizedBox(
                                            width: 55.w,
                                            height: 45.w,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: Image.asset(
                                                      ctrl.recieved
                                                          ? Assets
                                                              .teamUiTeamBox04
                                                          : Assets
                                                              .teamUiTeamBox03,
                                                      width: 30.h,
                                                      fit: BoxFit.fill,
                                                    )),
                                                Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  child: Image.asset(
                                                    ctrl.cardPackInfo
                                                                    .freeGiftCount >=
                                                                1 ||
                                                            ctrl.recieved
                                                        ? Assets.teamUiTeamBox02
                                                        : Assets
                                                            .teamUiTeamBox01,
                                                    width: 42.w,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          //战斗宝箱
                          const BattleBoxWidget(),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      );
    });
  }
}
