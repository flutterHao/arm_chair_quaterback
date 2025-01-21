import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/config/wheel_random_reward_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/21/15:36

class RandomRewardWidget extends StatefulWidget {
  const RandomRewardWidget(
      {super.key, this.onEnd, required this.targetId, required this.size});

  final Function()? onEnd;
  final int targetId;
  final double size;

  @override
  State<RandomRewardWidget> createState() => _RandomRewardWidgetState();
}

class _RandomRewardWidgetState extends State<RandomRewardWidget>
    with SingleTickerProviderStateMixin {
  late DailyTaskController controller;
  PageController _pageController = PageController();
  List<WheelRandomRewardEntity> list = [];

  @override
  void initState() {
    super.initState();
    list = CacheApi.wheelRandomRewardList;
    var index = list.indexWhere((e) => e.randomId == widget.targetId);
    Future.delayed(Duration.zero, () {
      var random = Random().nextInt(3) + 3;
      var page = random * list.length + index;
      _pageController.animateToPage(
          page, duration: const Duration(seconds: 4), curve: Curves.easeInOut).then((v){
            widget.onEnd?.call();
      });
    });
  }

  ///test code
  // @override
  // void didUpdateWidget(covariant RandomRewardWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   var index = list.indexWhere((e) => e.randomId == widget.targetId);
  //   var random = Random().nextInt(3) + 3;
  //   var page = random * list.length + index;
  //   print('index:$index;$random;$page');
  //   _pageController.jumpToPage(0);
  //   _pageController.animateToPage(
  //       page, duration: const Duration(seconds: 4), curve: Curves.easeInOut).then((v){
  //     widget.onEnd?.call();
  //   });
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        int realIndex = index % list.length;
        var item = list[realIndex];
        var awardItem = controller.getAwardList(item.randomReward)[0];
        return Container(
          alignment: Alignment.center,
          child: Image.asset(
            controller.getImageByAward(awardItem),
            width: widget.size,
            height: widget.size,
            errorBuilder: (context, error, s) {
              return Image.asset(
                Assets.managerUiManagerGift00,
                width: widget.size,
                height: widget.size,
              );
            },
          ),
        );
      },
    );
  }
}
