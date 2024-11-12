/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-06 11:51:15
 * @LastEditTime: 2024-11-12 14:45:16
 */
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerSrollerView extends StatefulWidget {
  const PlayerSrollerView({super.key});

  @override
  State<PlayerSrollerView> createState() => _PlayerSrollerViewState();
}

class _PlayerSrollerViewState extends State<PlayerSrollerView> {
  final TrainingController controller = Get.find();
  late ScrollController _scrollController;
  bool _isAutoScrolling = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 启动自动滚动
  void _startAutoScroll(int count) async {
    if (_scrollController.hasClients && _isAutoScrolling) {
      await _scrollController.animateTo(
        _scrollController.offset + 50.w * 20,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOut,
      );

      // 当滚动到最后一个可见项时，重置到起点
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(0);
      }
      controller.currentIndex.value =
          (controller.currentIndex.value++) ~/ controller.playerList.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _startAutoScroll(0),
      child: SizedBox(
        width: 500.w,
        height: 61.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemExtent: 50.w,
          physics: const NeverScrollableScrollPhysics(), // 禁止手动滚动
          itemCount: controller.playerList.length * 2000,
          itemBuilder: (context, index) {
            bool isCUrrent = controller.currentIndex.value == index;
            int current = index % controller.playerList.length;
            return TrainingAvater(
              player: controller.playerList[current],
              isCurrent: isCUrrent && controller.isShot.value,
            );
          },
        ),
      ),
    );
  }
}
