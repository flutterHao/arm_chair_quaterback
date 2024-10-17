import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/buble_box.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/buble_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/ripple_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingPage extends GetView<TrainingController> {
  const TrainingPage({super.key});

  // Widget _slotLight(){
  //   return IconWidget(iconWidth: 125.w, icon: Assets.uiLight_01Png);
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TrainingController());
    // return HorizontalDragBackWidget(
    //     child: Container(
    //   color: Colors.red,
    // ));
    return TrainingDragBackWidget(
      onDragUpdate: () => controller.swiperControl.stopAutoplay(),
      onCancel: () => controller.swiperControl.startAutoplay(),
      child: GetBuilder<TrainingController>(
          // init: TrainingController(),
          id: "training_page",
          builder: (_) {
            var trainInfo = controller.trainingInfo.training;
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(color: AppColors.cD8D8D8),
                // 背景
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  // bottom: 40.h,
                  child: SizedBox(
                    height: 679.h,
                    child: MirrorImageWidget(
                      imagePath: Assets.uiBgCourtJpg,
                      fullWidth: 375.w,
                      imageHeight: double.infinity,
                    ),
                  ),
                ),

                // 返回按钮
                Positioned(
                  top: 48.h,
                  left: 16.w,
                  child: InkWell(
                    onTap: () {
                      Get.back(id: GlobalNestedKey.TEAM);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconWidget(
                        iconWidth: 18.w,
                        icon: Assets.iconBackPng,
                        iconColor: AppColors.cE6E6E,
                      ),
                    ),
                  ),
                ),

                ///进度
                Positioned(
                  top: 80.h,
                  left: 80.w,
                  child: SizedBox(
                    width: 225.w,
                    height: 37.w,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          left: 0,
                          // right: 10.w,
                          child: Container(
                            width: 214.w,
                            height: 37.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.w),
                                color: AppColors.c262626),
                          ),
                        ),
                        Positioned(
                          left: 30.w,
                          child: CustomLinearProgressBar(
                            width: 150.w,
                            height: 10.w,
                            progress: trainInfo.taskItemCount /
                                controller.getTaskNeed(trainInfo.currentTaskId),
                            backgroundColor: AppColors.c000000,
                            progressColor: AppColors.cFF7954,
                          ),
                        ),
                        Positioned(
                          left: 96.w,
                          child: Text(
                            "${trainInfo.taskItemCount}/${controller.getTaskNeed(trainInfo.currentTaskId)}",
                            style: 10.w4(color: AppColors.cFFFFFF),
                          ),
                        ),
                        Positioned(
                          left: 5.w,
                          child: Container(
                            width: 29.w,
                            height: 29.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.w),
                                color: AppColors.c000000),
                          ),
                        ),
                        Positioned(
                          left: 5.w,
                          child: InkWell(
                            onTap: () => controller.showBubles(),
                            child: IconWidget(
                                iconWidth: 27.w,
                                iconHeight: 20.w,
                                icon: Assets.uiMoney_02Png),
                          ),
                        ),
                        AnimatedPositioned(
                          left: 186.w,
                          duration: Duration(milliseconds: 100),
                          child: InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AwardDialog();
                                }),
                            child: IconWidget(
                              iconWidth: 37.w,
                              icon: Assets.uiTeamBox_03Png,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 大屏获奖展示
                Positioned(
                  top: 160.h,
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.01)
                      ..rotateX(-pi / 20),
                    child: Container(
                      // color: Colors.amber,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Image.asset(
                          //   Assets.uiMoney_02Png,
                          //   width: 60.h,
                          //   fit: BoxFit.fitWidth,
                          // ),
                          // 10.hGap,
                          Obx(() {
                            return Text(
                              controller.showText.value,
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                  color: AppColors.cFF7954.withOpacity(0.5)),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),

                // slot容器
                Positioned(
                  top: 320.h,
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.01)
                      ..rotateX(-pi / 6),
                    child: Container(
                      // color: Colors.black38,
                      width: 375.w,
                      child: GetBuilder<TrainingController>(
                        id: "slot",
                        builder: (ctrl) {
                          return Row(
                            children: [
                              for (int i = 0; i < 3; i++)
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                          // color: Colors.blue,
                                          width: 125.w,
                                          alignment: Alignment.center,
                                          child: Visibility(
                                              visible: i != 2 ||
                                                  controller
                                                      .showThirdCard.value,
                                              // child: ImageWidget(
                                              //   width: 80.h,
                                              //   color:
                                              //       Colors.white.withOpacity(0.6),
                                              //   fit: BoxFit.fitWidth,
                                              //   url: Utils.getPropIconUrl(
                                              //       ctrl.currentAward[i]),
                                              //   errorWidget: Container(),
                                              // ),
                                              child: ctrl.currentAward[i] != 0
                                                  ? Image.asset(
                                                      Utils.getPropIconUrl(
                                                          ctrl.currentAward[i]),
                                                      width: 80.h,
                                                      fit: BoxFit.fitWidth,
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Container(
                                                              width: 80.h))
                                                  : Container())),
                                      // Positioned(
                                      //     bottom: 0,
                                      //     child: IconWidget(
                                      //         iconWidth: 120.w,
                                      //         iconHeight: 40.h,
                                      //         icon: Assets.uiBgLightPng)),
                                      // Positioned(
                                      //     right: 0,
                                      //     child: IconWidget(
                                      //       iconWidth: 120.w,
                                      //       iconHeight: 40.h,
                                      //       icon: Assets.uiBgLightPng,
                                      //       rotateAngle: -90,
                                      //     )),
                                    ],
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // ///球架
                Positioned(
                  top: 193.h,
                  child: Column(
                    children: [
                      MirrorImageWidget(
                          imagePath: Assets.uiBgBackboard_01Png,
                          fullWidth: 128.h,
                          imageHeight: 78.h),
                      MirrorImageWidget(
                          imagePath: Assets.uiBgPillar_01Png,
                          fullWidth: 8.h,
                          imageHeight: 78.h),
                      MirrorImageWidget(
                        imagePath: Assets.uiBgPillar_02Png,
                        fullWidth: 32.h,
                        imageHeight: 78.h,
                        isLeft: false,
                      ),
                      MirrorImageWidget(
                        imagePath: Assets.uiBgPedestalPng,
                        fullWidth: 237.h,
                        imageHeight: 45.h,
                        isLeft: false,
                      ),
                    ],
                  ),
                ),

                ///球员buff
                Positioned(
                  top: 409.h,
                  child: SizedBox(
                    // width: 190.h,
                    height: 50.h,
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 14.h),
                      itemBuilder: (context, index) {
                        int count = controller.trainingInfo.buff.length;
                        return count - 1 > index
                            ? CircleProgressView(
                                title: "PF",
                                progressColor: AppColors.c31E99E,
                                progress: 100,
                                width: 49.h,
                                height: 49.h)
                            : Container(
                                width: 49.h,
                                height: 49.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.c262626,
                                    borderRadius: BorderRadius.circular(25.h)),
                                child: Text(
                                  "?",
                                  style: 27.w4(color: AppColors.c666666),
                                ),
                              );
                      },
                    ),
                  ),
                ),

                ///球员
                Positioned(
                  top: 550.h,
                  child: MirrorImageWidget(
                      imagePath: Assets.uiBgStripePng,
                      fullWidth: 375.w,
                      imageHeight: 65.h),
                ),

                // Positioned(child: ListView.builder(
                //   itemCount:10 ,
                //   itemBuilder: (context,index){
                //   return PlayerAwater();
                // })),

                Positioned(
                  top: 500.h,
                  child: GetBuilder<TrainingController>(
                    id: "player",
                    builder: (_) {
                      return SizedBox(
                        width: 375.w,
                        height: 86.h,
                        child: Swiper(
                          key: Key("${controller.playerList.length}"),
                          physics: const NeverScrollableScrollPhysics(),
                          containerWidth: 64.w,
                          containerHeight: 86.h,
                          itemHeight: 64.w,
                          itemWidth: 64.w,
                          viewportFraction: .2,
                          indicatorLayout: PageIndicatorLayout.COLOR,
                          scale: .5,
                          itemCount: controller.playerList.length,
                          outer: false,
                          autoplay: true,
                          // duration: 200,
                          autoplayDelay: 1000,
                          duration: 800, // 动画的过渡时间
                          controller: controller.swiperControl,
                          axisDirection: AxisDirection.right,
                          onIndexChanged: (value) {
                            controller.currentIndex = value;
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: PlayerAwater(
                                backgroudColor: AppColors.c666666,
                                player: controller.playerList[index],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                    top: 635.h,
                    left: 34.w,
                    child: Column(
                      children: [
                        Container(
                          // width: 98.w,
                          // height: 16.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.w),
                            color: AppColors.c262626.withOpacity(0.7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "OWN",
                                style: 10.w4(color: AppColors.cFFFFFF),
                              ),
                              13.hGap,
                              IconWidget(
                                iconWidth: 9.w,
                                icon: Assets.icon_306Png,
                                iconColor: AppColors.cFFFFFF,
                              ),
                              3.hGap,
                              Obx(() {
                                return Text(
                                  "${controller.ballNum.value}/${controller.trainDefineMap["ballMaxNum"] ?? 0}",
                                  style: 10.w4(color: AppColors.cFFFFFF),
                                );
                              }),
                            ],
                          ),
                        ),
                        5.vGap,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconWidget(
                              iconWidth: 9.w,
                              icon: Assets.icon_306Png,
                              iconColor: AppColors.c666666,
                            ),
                            2.hGap,
                            Text(
                              "+${controller.trainDefineMap["ballRecoverNum"]}",
                              style: 10.w4(color: AppColors.c666666),
                            ),
                            7.5.hGap,
                            Obx(() {
                              return Text(
                                "in ${controller.remainString.value}",
                                style: 10.w4(color: AppColors.c666666),
                              );
                            }),
                          ],
                        ),
                      ],
                    )),

                Positioned(
                  top: 595.h,
                  child: Container(
                    width: 100.h,
                    height: 100.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.h),
                        border: Border.all(
                          width: 5.h,
                          color: Colors.white.withOpacity(0.4),
                        )),
                  ),
                ),

                // Positioned(
                //     top: 638.h,
                //     left: 375.w / 2 + 43.h,
                //     child: IconWidget(
                //       iconWidth: 8.h,
                //       icon: Assets.uiBgFusePng,
                //     )),

                // Positioned(
                //   top: 631.h,
                //   left: 375.w / 2 + 50.h,
                //   child: Container(
                //     width: 74.h,
                //     height: 24.h,
                //     decoration: BoxDecoration(
                //       color: AppColors.c262626,
                //       borderRadius: BorderRadius.circular(12.h),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           "BET x3",
                //           style: 12.w4(
                //             color: AppColors.cF2F2F2,
                //           ),
                //         ),
                //         SizedBox(width: 10.h),
                //         IconWidget(
                //           iconWidth: 8.h,
                //           icon: Assets.uiIconUnfoldPng,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Positioned(
                    top: 600.h,
                    child: Container(
                      width: 88.h,
                      height: 88.h,
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.circular(44.h)),
                    )),

                ///篮球投篮
                Obx(() {
                  // ignore: unused_local_variable
                  var a = controller.isShot.value;
                  return AnimatedBuilder(
                    animation: controller.positionAnimation,
                    builder: (context, child) {
                      double top =
                          602.h + controller.positionAnimation.value.dy * 500.h;
                      double left = 375.w / 2 -
                          42.h +
                          50.h * controller.positionAnimation.value.dx;
                      return Positioned(
                        top: top, // 控制Y轴变化 (从下往上投)
                        left: left,
                        child: GestureDetector(
                          onTap: () => controller.shootBall(
                              "9451bb97-eead-435c-89cd-39a2f9e74897"), // 点击篮球触发投篮
                          child: Opacity(
                            opacity: controller.opacityAnimation.value,
                            child: Transform.scale(
                              scale:
                                  controller.scaleAnimation.value, // 动态缩放篮球大小
                              child: Transform.rotate(
                                angle: controller.rotationAnimation.value,
                                child: IconWidget(
                                  iconWidth: 84.h,
                                  icon: Assets.uiTrainingBallPng,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),

                ///气泡提示
                Positioned(
                  top: 125.h,
                  left: 81.w,
                  child: Obx(() {
                    return Visibility(
                      // visible: true,
                      visible: controller.isShowBuble.value,
                      child: const BubbleBox(
                        arrowDirection: ArrowDirection.up,
                        child: PropBubleWidget(),
                      ),
                    );
                  }),
                ),

                Obx(() {
                  return !controller.isAscending.value
                      ? Positioned(
                          top: 256.h,
                          child: MirrorImageWidget(
                            imagePath: Assets.uiBgBackboard_02Png,
                            fullWidth: 42.h,
                            imageHeight: 4.h,
                          ),
                        )
                      : Container();
                }),

                ///奖励篮球
                AnimatedBuilder(
                  animation: controller.flyCtrl,
                  builder: (BuildContext context, Widget? child) {
                    return Obx(() {
                      return Visibility(
                        visible: controller.isShowBall.value,
                        child: Positioned(
                            left: 160.w - 80.w * controller.flyCtrl.value,
                            top: 273.h + 300.h * controller.flyCtrl.value,
                            child: Transform.scale(
                              scale: 1 - controller.flyCtrl.value * 0.5,
                              child: IconWidget(
                                  iconWidth: 50.w, icon: Assets.icon_306Png),
                            )),
                      );
                    });
                  },
                ),

                ///奖励money
                AnimatedBuilder(
                  animation: controller.flyCtrl,
                  builder: (BuildContext context, Widget? child) {
                    return Obx(() {
                      return Visibility(
                        visible: controller.isShowProp.value,
                        child: Positioned(
                            left: 170.w - 85.w * controller.flyCtrl.value,
                            top: 289.h - 202.h * controller.flyCtrl.value,
                            child: Transform.scale(
                              scale: 1 - controller.flyCtrl.value * 0.5,
                              child: IconWidget(
                                  iconWidth: 40.w, icon: Assets.uiMoney_02Png),
                            )),
                      );
                    });
                  },
                ),

                ///奖励Buff水波纹
                Obx(() {
                  return Visibility(
                    visible: controller.isShowRipple.value,
                    child: Positioned(
                        top: 251.h,
                        child: WaterRipples(
                          maxRadius: 125.h, // 设置波纹的最大半径
                          initialRadius: 49.h, // 设置波纹的初始大小
                          color: Colors.white, // 设置波纹的颜色
                          rippleCount: 3, // 设置波纹的数量
                          duration:
                              const Duration(milliseconds: 1000), // 设置波纹的扩散速度
                        )),
                  );
                }),

                ///奖励Buff
                AnimatedBuilder(
                  animation: controller.flyCtrl,
                  builder: (BuildContext context, Widget? child) {
                    return Obx(() {
                      return Visibility(
                        visible: controller.isShowBuff.value,
                        child: Positioned(
                            top: 289.h + 120.h * controller.flyCtrl.value,
                            child: Transform.scale(
                              scale: 1 - controller.flyCtrl.value * 0.5,
                              child: CircleProgressView(
                                  showAnimation: false,
                                  title: "PF",
                                  progressColor: AppColors.c31E99E,
                                  progress: 100,
                                  width: 49.h,
                                  height: 49.h),
                            )),
                      );
                    });
                  },
                ),

                ///奖励钞票
                ...controller.moneyList.map((leaf) {
                  return AnimatedBuilder(
                    animation: controller.moneyCtrl,
                    builder: (context, child) {
                      return Positioned(
                        // 叶子的左右摇摆
                        left: leaf.x +
                            (sin(controller.moneyCtrl.value * 2 * pi +
                                    leaf.index) *
                                20),
                        // 叶子的垂直下落
                        top: leaf.y + (controller.moneyCtrl.value * 500.h),
                        child: Transform.rotate(
                          // 叶子的旋转效果
                          angle: controller.moneyCtrl.value * 2 * pi +
                              leaf.index * pi / 10,
                          child: Opacity(
                            opacity: controller.moneyCtrl.value != 0
                                ? (1 - (controller.moneyCtrl.value))
                                : 0,
                            child: leaf.widget,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ],
            );
          }),
    );
  }
}
