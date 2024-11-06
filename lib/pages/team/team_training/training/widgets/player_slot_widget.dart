import 'dart:async';

import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math';

// // class SlotMachineController extends GetxController {
// //   final List<String> playerList = ["🍒", "🍋", "🍇", "🔔", "⭐", "🍉"];
// //   final RxBool isSpinning = false.obs;
// // }

// class SlotMachineWheelView extends StatefulWidget {
//   @override
//   _SlotMachineWheelViewState createState() => _SlotMachineWheelViewState();
// }

// class _SlotMachineWheelViewState extends State<SlotMachineWheelView>
//     with SingleTickerProviderStateMixin {
//   final TrainingController controller = Get.find();
//   late final ScrollController scrollController;
//   static const int maxScrollItems = 10000;

//   late AnimationController animationController;

//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     scrollController = ScrollController(
//       initialScrollOffset: maxScrollItems / 2.0,
//     );

//     animationController.addListener(() {
//       if (!controller.isSpinning.value) return;

//       double curvedValue = Curves.linear.transform(animationController.value);
//       double offset = curvedValue * controller.playerList.length * 300;
//       scrollController.jumpTo(offset % (controller.playerList.length * 100));
//     });

//     animationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed && controller.isSpinning.value) {
//         stopSpin();
//         // double finalPosition = maxScrollItems / 2.0 +
//         //     (Random().nextInt(controller.playerList.length) * 100).toDouble();
//         // scrollController.animateTo(
//         //   finalPosition,
//         //   duration: Duration(milliseconds: 300),
//         //   curve: Curves.easeOut,
//         // );
//       }
//     });
//   }

//   void startSpin() {
//     if (controller.isSpinning.value) return;

//     controller.isSpinning.value = true;
//     animationController.reset();
//     animationController.forward();
//   }

//   void stopSpin() {
//     controller.isSpinning.value = false;
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Slot Machine")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 120,
//             width: 300,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               controller: scrollController,
//               itemCount: maxScrollItems,
//               itemBuilder: (context, index) {
//                 return Obx(() {
//                   bool isCUrrent = controller.currentIndex.value == index;
//                   return Visibility(
//                     visible: !controller.isShot.value || isCUrrent,
//                     child: AnimatedScale(
//                       duration: const Duration(milliseconds: 200),
//                       scale: isCUrrent && controller.isShot.value ? 1.13 : 1,
//                       child: TrainingAvater(
//                         player: controller
//                             .playerList[index ~/ controller.playerList.length],
//                         isCurrent: isCUrrent && controller.isShot.value,
//                       ),
//                     ),
//                   );
//                 });
//               },
//             ),
//           ),
//           SizedBox(height: 40),
//           ElevatedButton(
//             onPressed: startSpin,
//             child: Text("Spin"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SlotMachineWheelView extends StatefulWidget {
  const SlotMachineWheelView({super.key});

  @override
  _SlotMachineWheelViewState createState() => _SlotMachineWheelViewState();
}

class _SlotMachineWheelViewState extends State<SlotMachineWheelView> {
  final TrainingController controller = Get.find();
  late ScrollController _scrollController;
  final double _itemHeight = 100.0; // 每个项的高度
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
        _scrollController.offset + _itemHeight,
        duration: Duration(milliseconds: 100 + 20 * count),
        curve: Curves.linear,
      );

      // 当滚动到最后一个可见项时，重置到起点
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(0);
      }
      count++;
      controller.currentIndex.value =
          (controller.currentIndex.value++) ~/ controller.playerList.length;
    }
    if (count < 20) {
      _startAutoScroll(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _startAutoScroll(0),
      child: SizedBox(
        width: 375.w,
        height: 75.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemExtent: _itemHeight,
          physics: const NeverScrollableScrollPhysics(), // 禁止手动滚动
          itemBuilder: (context, index) {
            bool isCUrrent = controller.currentIndex.value == index;
            return TrainingAvater(
              player:
                  controller.playerList[index ~/ controller.playerList.length],
              isCurrent: isCUrrent && controller.isShot.value,
            );
          },
        ),
      ),
    );
  }
}
