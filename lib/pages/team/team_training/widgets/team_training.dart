import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamTrainingPage extends StatelessWidget {
  const TeamTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        ///背景
        MirrorImageWidget(
            imagePath: Assets.uiBgCourtJpg,
            fullWidth: 375.w,
            imageHeight: double.infinity),

        ///返回
        Positioned(
          top: 56.h,
          left: 24.w,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: IconWidget(
              iconWidth: 18.w,
              icon: Assets.iconBackPng,
              iconColor: AppColors.cE6E6E,
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

        ///大屏获奖展示
        Positioned(
          top: 152.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // IconWidget(iconWidth: 50.w, icon: Assets.),
              Text(
                "+100K",
                style: 55.w7(color: AppColors.cFF7954.withOpacity(0.5)),
              )
            ],
          ),
        ),
        Positioned(
            top: 350.h,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(-pi / 4),
              child: SizedBox(
                  width: 100.w, height: 400.h, child: SlotMachineScroll()),
            ))
      ],
    ));
  }
}

class SlotMachineScroll extends StatefulWidget {
  @override
  _SlotMachineScrollState createState() => _SlotMachineScrollState();
}

class _SlotMachineScrollState extends State<SlotMachineScroll> {
  late ScrollController _scrollController;
  Timer? _timer;
  final double _itemHeight = 100.0; // 每个项的高度
  final List<String> _items = ['🍒', '🍋', '🍉', '🍇', '🍓', '🍌'];
  bool _isAutoScrolling = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  // 启动自动滚动
  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_scrollController.hasClients && _isAutoScrolling) {
        _scrollController.animateTo(
          _scrollController.offset + _itemHeight,
          duration: Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );

        // 当滚动到最后一个可见项时，重置到起点
        if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h, // 显示三项的高度
      color: Colors.amber,
      width: 100.w,
      alignment: Alignment.center,
      // child: ListView.builder(
      //   controller: _scrollController,
      //   itemExtent: _itemHeight,
      //   physics: NeverScrollableScrollPhysics(), // 禁止手动滚动
      //   itemBuilder: (context, index) {
      //     final actualIndex = index % _items.length;
      //     return Container(
      //       alignment: Alignment.center,
      //       child: Text(
      //         _items[actualIndex],
      //         style: TextStyle(fontSize: 48),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SlotMachineScroll(),
  ));
}
