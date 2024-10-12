// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class WaterRipples extends StatefulWidget {
//   const WaterRipples({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _WaterRipplesState();
// }

// class _WaterRipplesState extends State<WaterRipples>
//     with TickerProviderStateMixin, WidgetsBindingObserver {
//   //动画控制器
//   final List<AnimationController> _controllers = [];
//   //动画控件集合
//   final List<Widget> _children = [];
//   //添加蓝牙检索动画计时器
//   Timer? _searchBluetoothTimer;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Column(children: [
//         const SizedBox(
//           height: 40,
//         ),
//         SizedBox(
//           width: 290,
//           height: 290,
//           child: Stack(
//             alignment: Alignment.center,
//             children: _children,
//           ),
//         ),
//       ]),
//     );
//   }

//   ///初始化蓝牙检索动画，依次添加5个缩放动画，形成水波纹动画效果
//   void _startAnimation() {
//     //动画启动前确保_children控件总数为0
//     _children.clear();
//     int count = 0;
//     //添加第一个圆形缩放动画
//     _addSearchAnimation(true);
//     //以后每隔1秒，再次添加一个缩放动画，总共添加4个
//     _searchBluetoothTimer =
//         Timer.periodic(const Duration(milliseconds: 1000), (timer) {
//       if (!mounted) {
//         timer.cancel();
//         return;
//       }
//       _addSearchAnimation(true);
//       count++;
//       if (count >= 4) {
//         timer.cancel();
//       }
//     });
//   }

//   ///添加蓝牙检索动画控件
//   ///init: 首次添加5个基本控件时，=true，
//   void _addSearchAnimation(bool init) {
//     var controller = _createController();
//     _controllers.add(controller);
//     print("tag——children length : ${_children.length}");
//     var animation = Tween(begin: 50.0, end: 290.0)
//         .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
//     if (!init) {
//       //5个基本动画控件初始化完成的情况下，每次添加新的动画控件时，移除第一个，确保动画控件始终保持5个
//       _children.removeAt(0);
//       //添加新的动画控件
//       Future.delayed(const Duration(seconds: 1), () {
//         if (!mounted) return;
//         //动画页面没有执行退出情况下，继续添加动画
//         _children.add(AnimatedBuilder(
//             animation: controller,
//             builder: (BuildContext context, Widget? child) {
//               return Opacity(
//                 // opacity: (300.0 - animation.value) / 300.0,
//                 opacity: 1.0 - ((animation.value - 50.0) / 240.0),
//                 child: ClipOval(
//                   child: Container(
//                     width: animation.value,
//                     height: animation.value,
//                     color: const Color(0xff9fbaff),
//                   ),
//                 ),
//               );
//             }));
//         try {
//           //动画页退出时，捕获可能发生的异常
//           controller.forward();
//           setState(() {});
//         } catch (e) {
//           return;
//         }
//       });
//     } else {
//       _children.add(AnimatedBuilder(
//           animation: controller,
//           builder: (BuildContext context, Widget? child) {
//             return Opacity(
//               opacity: 1.0 - ((animation.value - 50.0) / 240.0),
//               child: ClipOval(
//                 child: Container(
//                   width: animation.value,
//                   height: animation.value,
//                   color: const Color(0xff9fbaff),
//                 ),
//               ),
//             );
//           }));
//       controller.forward();
//       setState(() {});
//     }
//   }

//   ///创建蓝牙检索动画控制器
//   AnimationController _createController() {
//     var controller = AnimationController(
//         duration: const Duration(milliseconds: 4000), vsync: this);
//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller.dispose();
//         if (_controllers.contains(controller)) {
//           _controllers.remove(controller);
//         }
//         //每次动画控件结束时，添加新的控件，保持动画的持续性
//         if (mounted) _addSearchAnimation(false);
//       }
//     });
//     return controller;
//   }

//   ///监听应用状态，
//   /// 生命周期变化时回调
//   /// resumed:应用可见并可响应用户操作
//   /// inactive:用户可见，但不可响应用户操作
//   /// paused:已经暂停了，用户不可见、不可操作
//   /// suspending：应用被挂起，此状态IOS永远不会回调
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if (state == AppLifecycleState.paused) {
//       //应用退至后台，销毁蓝牙检索动画
//       _disposeSearchAnimation();
//     } else if (state == AppLifecycleState.resumed) {
//       //应用回到前台，重新启动动画
//       _startAnimation();
//     }
//   }

//   ///销毁动画
//   void _disposeSearchAnimation() {
//     //释放动画所有controller
//     for (var element in _controllers) {
//       element.dispose();
//     }
//     _controllers.clear();
//     _searchBluetoothTimer?.cancel();
//     _children.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _startAnimation();
//     //添加应用生命周期监听
//     WidgetsBinding.instance!.addObserver(this);
//   }

//   @override
//   void dispose() {
//     print("tag--=========================dispose===================");
//     //销毁动画
//     _disposeSearchAnimation();
//     //销毁应用生命周期观察者
//     WidgetsBinding.instance!.removeObserver(this);
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';

// class WaterRipples extends StatefulWidget {
//   const WaterRipples({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _WaterRipplesState();
// }

// class _WaterRipplesState extends State<WaterRipples>
//     with TickerProviderStateMixin, WidgetsBindingObserver {
//   // 动画控制器，只用一个控制器
//   late AnimationController _controller;
//   Timer? _searchBluetoothTimer;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Column(children: [
//         const SizedBox(height: 40),
//         SizedBox(
//           width: 290,
//           height: 290,
//           child: Stack(
//             alignment: Alignment.center,
//             children: List.generate(5, (index) {
//               final delay = index * 0.5; // 控制每个波纹的延迟
//               return AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   final progress = (_controller.value + delay) % 1.0; // 控制延迟
//                   final size = 50.0 + (240.0 * progress); // 动态计算波纹大小
//                   final opacity = 1.0 - progress; // 动态计算透明度
//                   return Opacity(
//                     opacity: opacity,
//                     child: Container(
//                       width: size,
//                       height: size,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: const Color(0xff9fbaff),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ),
//       ]),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _startAnimation();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     _disposeSearchAnimation();
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   /// 启动波纹动画
//   void _startAnimation() {
//     // 初始化动画控制器，动画时间为4秒
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 4),
//     )..repeat(); // 持续循环播放动画

//     // 定时器，用于模拟蓝牙动画的启动
//     int count = 0;
//     _searchBluetoothTimer =
//         Timer.periodic(const Duration(milliseconds: 1000), (timer) {
//       if (!mounted) {
//         timer.cancel();
//         return;
//       }
//       count++;
//       if (count >= 4) {
//         timer.cancel(); // 限制总次数，避免无限添加波纹
//       }
//     });
//   }

//   /// 销毁动画控制器及定时器
//   void _disposeSearchAnimation() {
//     _controller.dispose();
//     _searchBluetoothTimer?.cancel();
//   }

//   /// 监听生命周期变化
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if (state == AppLifecycleState.paused) {
//       _disposeSearchAnimation();
//     } else if (state == AppLifecycleState.resumed) {
//       _startAnimation();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

class WaterRipples extends StatefulWidget {
  final double maxRadius; // 波纹最大半径
  final Color color; // 波纹颜色
  final int rippleCount; // 波纹数量
  final Duration duration; // 每个波纹的动画时长
  final double initialRadius; // 初始波纹大小
  final Widget? child;

  const WaterRipples({
    Key? key,
    this.maxRadius = 290.0, // 默认最大波纹大小
    this.initialRadius = 50.0, // 默认初始波纹大小
    this.color = Colors.white, // 默认白色波纹
    this.rippleCount = 5, // 默认波纹数量
    this.duration = const Duration(seconds: 2),
    this.child, // 默认波纹动画时长2秒
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaterRipplesState();
}

class _WaterRipplesState extends State<WaterRipples>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;
  Timer? _rippleTimer;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: widget.maxRadius,
        height: widget.maxRadius,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...List.generate(widget.rippleCount, (index) {
              final delay = index * (1 / widget.rippleCount); // 控制波纹的延迟
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final progress = (_controller.value + delay) % 1.0; // 延迟波纹
                  final size = widget.initialRadius +
                      (widget.maxRadius - widget.initialRadius) *
                          progress; // 动态调整波纹大小
                  final opacity = 1.0 - progress; // 波纹透明度变化
                  return Opacity(
                    opacity: opacity,
                    child: Container(
                      width: size,
                      height: size,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.color, // 动态颜色及透明度
                      ),
                    ),
                  );
                },
              );
            }),
            if (widget.child != null) ...[widget.child!]
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startAnimation();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _disposeAnimation();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// 启动水波纹动画
  void _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration, // 动画时长可由参数控制
    )..repeat(); // 持续循环播放

    // 定时器控制波纹的生成频率
    int count = 0;
    _rippleTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      // 调整生成波纹的间隔
      if (!mounted) {
        timer.cancel();
        return;
      }
      count++;
      if (count >= widget.rippleCount) {
        // 根据设置的波纹数量停止定时器
        timer.cancel();
      }
    });
  }

  /// 销毁动画控制器和定时器
  void _disposeAnimation() {
    _controller.dispose();
    _rippleTimer?.cancel();
  }

  /// 监听生命周期变化，保持动画一致
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _disposeAnimation();
    } else if (state == AppLifecycleState.resumed) {
      _startAnimation();
    }
  }
}
