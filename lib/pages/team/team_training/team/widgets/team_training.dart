import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamTrainingPage extends GetView<TrainingController> {
  const TeamTrainingPage({super.key});

  // Widget _slotLight(){
  //   return IconWidget(iconWidth: 125.w, icon: Assets.uiLight_01Png);
  // }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: Stack(
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
                Log.d("返回");
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
            child: InkWell(
              onTap: () {},
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
                        progress: 0.5,
                        backgroundColor: AppColors.c000000,
                        progressColor: AppColors.cFF7954,
                      ),
                    ),
                    Positioned(
                      left: 96.w,
                      child: Text(
                        "10/20",
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
                      child: IconWidget(
                          iconWidth: 27.w,
                          iconHeight: 20.w,
                          icon: Assets.uiMoney_02Png),
                    ),
                    Positioned(
                      left: 186.w,
                      child: IconWidget(
                        iconWidth: 37.w,
                        icon: Assets.uiTeamBox_02Png,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 大屏获奖展示
          Positioned(
            top: 150.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.uiMoney_02Png,
                  width: 60.h,
                  fit: BoxFit.fitWidth,
                ),
                10.hGap,
                Text(
                  "+100K",
                  style: TextStyle(
                      fontSize: 50.w,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      color: AppColors.cFF7954.withOpacity(0.5)),
                )
              ],
            ),
          ),

          // slot容器
          Positioned(
            top: 320.h,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(-pi / 4),
              child: Container(
                // color: Colors.black38,
                width: 375.w,
                child: GetBuilder<TeamController>(
                  id: "slot",
                  builder: (controller) {
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
                                          controller.showThirdCard.value,
                                      child: Image.asset(
                                        controller.currentAward[i],
                                        width: 80.h,
                                        fit: BoxFit.fitWidth,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(),
                                      ),
                                    )),
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

          ///球架
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleProgressView(
                    title: "PF",
                    progressColor: AppColors.c31E99E,
                    progress: 100,
                    width: 49.h,
                    height: 49.h),
                14.hGap,
                CircleProgressView(
                    title: "PF",
                    progressColor: AppColors.c4CB8FC,
                    progress: 40,
                    width: 49.h,
                    height: 49.h),
                14.hGap,
                Container(
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
                )
              ],
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
            child: SizedBox(
              width: 375.w,
              height: 86.h,
              child: Swiper(
                containerWidth: 64.w,
                containerHeight: 86.h,
                itemHeight: 64.w,
                itemWidth: 64.w,
                viewportFraction: .2,
                indicatorLayout: PageIndicatorLayout.COLOR,
                scale: .5,
                itemCount: 5,
                autoplay: true,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: PlayerAwater(
                      backgroudColor: AppColors.c666666,
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
              top: 635.h,
              left: 34.w,
              child: Column(
                children: [
                  Container(
                    width: 98.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: AppColors.c262626.withOpacity(0.7),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COST",
                          style: 10.w4(color: AppColors.cFFFFFF),
                        ),
                        13.hGap,
                        IconWidget(
                          iconWidth: 9.w,
                          icon: Assets.icon_306Png,
                          iconColor: AppColors.cFFFFFF,
                        ),
                        3.hGap,
                        Text(
                          "88/100",
                          style: 10.w4(color: AppColors.cFFFFFF),
                        ),
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
                        "+5",
                        style: 10.w4(color: AppColors.c666666),
                      ),
                      7.5.hGap,
                      Text(
                        "in 05:35",
                        style: 10.w4(color: AppColors.c666666),
                      ),
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

          Positioned(
              top: 638.h,
              left: 375.w / 2 + 43.h,
              child: IconWidget(
                iconWidth: 8.h,
                icon: Assets.uiBgFusePng,
              )),

          Positioned(
            top: 631.h,
            left: 375.w / 2 + 50.h,
            child: Container(
              width: 74.h,
              height: 24.h,
              decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.circular(12.h),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BET x3",
                    style: 12.w4(
                      color: AppColors.cF2F2F2,
                    ),
                  ),
                  SizedBox(width: 10.h),
                  IconWidget(
                    iconWidth: 8.h,
                    icon: Assets.uiIconUnfoldPng,
                  ),
                ],
              ),
            ),
          ),

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
                    onTap: controller.shootBall, // 点击篮球触发投篮
                    child: Opacity(
                      opacity: controller.opacityAnimation.value,
                      child: Transform.scale(
                        scale: controller.scaleAnimation.value, // 动态缩放篮球大小
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

          // Positioned(top: 300.h, child: FallingLeaves())
          ///钞票
          ...controller.leaves.map((leaf) {
            return AnimatedBuilder(
              animation: controller.prizeController,
              builder: (context, child) {
                return Positioned(
                  // 叶子的左右摇摆
                  left: leaf.x +
                      (sin(controller.prizeController.value * 2 * pi +
                              leaf.index) *
                          20),
                  // 叶子的垂直下落
                  top: leaf.y + (controller.prizeController.value * 500.h),
                  child: Transform.rotate(
                    // 叶子的旋转效果
                    angle: controller.prizeController.value * 2 * pi +
                        leaf.index * pi / 10,
                    child: Opacity(
                      opacity: 1 - (controller.prizeController.value),
                      child: leaf.widget,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}


// class SlotMachineScroll extends StatefulWidget {
//   const SlotMachineScroll({super.key});

//   @override
//   _SlotMachineScrollState createState() => _SlotMachineScrollState();
// }

// class _SlotMachineScrollState extends State<SlotMachineScroll> {
//   late ScrollController _scrollController;
//   Timer? _timer;
//   final double _itemHeight = 100.0; // 每个项的高度
//   final List<String> _items = ['🍒', '🍋', '🍉', '🍇', '🍓', '🍌'];
//   bool _isAutoScrolling = true;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _startAutoScroll();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // 启动自动滚动
//   void _startAutoScroll() {
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       if (_scrollController.hasClients && _isAutoScrolling) {
//         _scrollController.animateTo(
//           _scrollController.offset + _itemHeight,
//           duration: Duration(milliseconds: 50),
//           curve: Curves.easeInOut,
//         );

//         // 当滚动到最后一个可见项时，重置到起点
//         if (_scrollController.offset >=
//             _scrollController.position.maxScrollExtent) {
//           _scrollController.jumpTo(0);
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       controller: _scrollController,
//       itemExtent: _itemHeight,
//       physics: NeverScrollableScrollPhysics(), // 禁止手动滚动
//       itemBuilder: (context, index) {
//         final actualIndex = index % _items.length;
//         return Container(
//           alignment: Alignment.center,
//           child: Text(
//             _items[actualIndex],
//             style: TextStyle(fontSize: 48),
//           ),
//         );
//       },
//     );
//   }
// }
