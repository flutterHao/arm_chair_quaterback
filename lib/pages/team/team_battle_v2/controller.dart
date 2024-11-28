import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShootHistory {
  final bool isBlue;
  final Offset shootLocation;
  final bool isSuccess;

  ShootHistory(this.isBlue, this.shootLocation, this.isSuccess);
}

class TeamBattleV2Controller extends GetxController
    with GetTickerProviderStateMixin {
  TeamBattleV2Controller();

  late BarrageWallController normalBarrageWallController =
      BarrageWallController();
  late BarrageWallController highLightBarrageWallController =
      BarrageWallController();

  late AnimationController shootAnimationController;
  Animation? shootAnimation;
  var shootOffset = Offset.infinite.obs;

  // 投篮轨迹点
  Offset start = Offset.zero; // 起点
  Offset end = Offset.zero; // 终点
  Offset peak = Offset.zero; // 随机生成的最高点

  late double a, b, c; // 抛物线参数

  var isSuccess = false;
  var isSecondAnimationRunning = false;

  List<ShootHistory> shootHistory = [];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    normalBarrageWallController.addListener(() {
      if (normalBarrageWallController.value.processedSize ==
          normalBarrageWallController.value.size) {
        Future.delayed(const Duration(seconds: 6), () {
          normalBarrageWallController.clear();
          normalBarrageWallController.add(getNormalBullets());
          normalBarrageWallController.reStart();
        });
      }
    });
    highLightBarrageWallController.addListener(() {
      if (highLightBarrageWallController.value.processedSize ==
          highLightBarrageWallController.value.size) {
        Future.delayed(const Duration(seconds: 20), () {
          highLightBarrageWallController.clear();
          highLightBarrageWallController.add(getHighLightBullets());
          highLightBarrageWallController.reStart();
        });
      }
    });
    shootAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  Timer? _timer;

  @override
  void onReady() {
    super.onReady();
    _timer = Timer.periodic(const Duration(seconds: 3), (t) {
      shoot();
    });
  }

  shoot() {
    ///todo 测试代码

    // 球场宽高比例：716/184
    // width 的最大值 375.w
    //start x 取值范围 right：9.w ~ width-9.w ; left : 9.w ~ width-9.w
    //start y 取值范围 right：9.w ~ width-9.w ; left : 9.w ~ width-9.w
    start = Offset(getRandom(375.w - 18.w, 18.w),
        getRandom((375.w - 18.w) / 716 / 184, 38.w));
    isSuccess = Random().nextBool();
    var isBlue = Random().nextBool();
    addToShootHistory(ShootHistory(isBlue, start, isSuccess));
    update([idPlayersLocation]);
    end = isBlue ? Offset(22.w, 49.w) : Offset(375.w - 22.w - 18.w - 6.w, 49.w);
    // 随机生成最高点
    peak = Offset(
        (start.dx + end.dx) / 2, Random().nextDouble() * min(start.dy, end.dy));

    // 计算抛物线参数
    calculateParabola();

    isSecondAnimationRunning = false;
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation?.removeListener(shootIIAnimationListener);
    shootAnimation = CurvedAnimation(
        parent: shootAnimationController, curve: const Cubic(0.1, 0.5, 0.7, 2))
      ..addListener(shootAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  addToShootHistory(ShootHistory item) {
    // print('shootHistory.length--00--:${shootHistory.length}');
    shootHistory.add(item);
    var list = shootHistory.where((e) => e.isBlue == item.isBlue).toList();
    if (list.length > 5) {
      var lastWhere = shootHistory.firstWhereOrNull((e) => e.isBlue == item.isBlue);
      shootHistory.remove(lastWhere);
    }
    // print('shootHistory.length--111--:${shootHistory.length}');
  }

  double getRandom(num max, [num minValue = 0]) {
    return minValue +
        Random().nextDouble() * (max - minValue + (minValue == 0 ? 0 : 1));
  }

  static String get idPlayersLocation => "id_players_location";

  shootSuccessAnimation() {
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: shootAnimationController, curve: Curves.bounceOut));
    shootAnimation?.addListener(shootIIAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  shootFailedAnimation() {
    start = Offset(end.dx, end.dy);
    if (end.dx == 22.w) {
      //右边投篮
      end =
          Offset(Random().nextDouble() * 50 + end.dx + 10, end.dy + end.dy / 2);
    } else {
      //左边投篮
      end =
          Offset(end.dx - Random().nextDouble() * 50 - 10, end.dy + end.dy / 2);
    }
    // 随机生成最高点
    peak = Offset((start.dx + end.dx) / 2, peak.dy - 5);

    // 计算抛物线参数
    calculateParabola();
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: shootAnimationController, curve: Curves.bounceOut));
    shootAnimation?.addListener(shootIIAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  shootIIAnimationListener() {
    if (isSuccess) {
      var t = shootAnimation!.value;
      shootOffset.value = Offset(end.dx, end.dy + (end.dy / 2 * t));
    } else {
      double t = shootAnimation!.value; // 当前动画进度
      final x = start.dx + (end.dx - start.dx) * t;
      final y = calculateY(x);
      shootOffset.value = Offset(x, y);
    }
  }

  shootAnimationListener() {
    double t = shootAnimation!.value; // 当前动画进度
    if (t > 1) {
      shootAnimationController.stop();
      isSecondAnimationRunning = true;
      if (isSuccess) {
        shootSuccessAnimation();
      } else {
        shootFailedAnimation();
      }
    }
    final x = start.dx + (end.dx - start.dx) * t;
    final y = calculateY(x);
    shootOffset.value = Offset(x, y);
  }

  List<Bullet> getNormalBullets() {
    var random = Random();
    List<Bullet> bullets = List<Bullet>.generate(10, (i) {
      final showTime = random.nextInt(6000);
      var text = [
        "DAMN IT !!!",
        "holly shit !!!",
        "what the fuck !!!"
      ][random.nextInt(3)];
      var size = calculateTextSize(text, 12.sp, 0, FontWeight.w400);
      return Bullet(
          child: Container(
            width: size.width + 12.w * 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(14.w),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.cDEDEDE,
                      offset: Offset(3.w, 3.w),
                      blurRadius: 3.w)
                ]),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            height: 21.w,
            child: Text(
              text,
              style: 12.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            ),
          ),
          showTime: showTime);
    });
    return bullets;
  }

  List<Bullet> getHighLightBullets() {
    var random = Random();
    List<Bullet> bullets = List<Bullet>.generate(1, (i) {
      final showTime = random.nextInt(6000);
      var text = "Kyrie Irving makes free throw 1of 2";
      var size = calculateTextSize(text, 12.sp, 0, FontWeight.w500);
      return Bullet(
          child: Container(
            width: size.width + 12.w + 4.w + 20.w + 7.w,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(14.w),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.cDEDEDE,
                      offset: Offset(3.w, 3.w),
                      blurRadius: 3.w)
                ]),
            padding: EdgeInsets.only(left: 4.w, right: 12.w),
            height: 28.w,
            child: Row(
              children: [
                ImageWidget(
                  url: "",
                  imageFailedPath: Assets.testTestTeamLogo,
                  borderRadius: BorderRadius.circular(10.w),
                  width: 20.w,
                  height: 20.w,
                ),
                7.hGap,
                Text(
                  text,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: 12.w5(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoMedium),
                ),
              ],
            ),
          ),
          showTime: showTime);
    });
    return bullets;
  }

  /// 计算文本尺寸
  Size calculateTextSize(
    String value,
    double fontSize,
    double strokeWidth,
    FontWeight fontWeight,
  ) {
    TextPainter painter = TextPainter(
      // locale: Localizations.localeOf(context),
      maxLines: 1,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: value,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          // letterSpacing: letterSpacing,
          overflow: TextOverflow.visible,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round
            ..color = Colors.black,
        ),
      ),
    );
    painter.layout();

    return Size(painter.width, painter.height);
  }

  // 根据起点、最高点、终点计算抛物线参数
  void calculateParabola() {
    final matrix = [
      [pow(start.dx, 2), start.dx, 1],
      [pow(peak.dx, 2), peak.dx, 1],
      [pow(end.dx, 2), end.dx, 1],
    ];

    final results = [start.dy, peak.dy, end.dy];
    final coefficients = solveLinearSystem(matrix, results);

    a = coefficients[0];
    b = coefficients[1];
    c = coefficients[2];
  }

  // 计算抛物线上的y坐标
  double calculateY(double x) {
    return a * pow(x, 2) + b * x + c;
  }

  // 计算行列式
  num determinant(List<List<num>> matrix) {
    return matrix[0][0] *
            (matrix[1][1] * matrix[2][2] - matrix[2][1] * matrix[1][2]) -
        matrix[0][1] *
            (matrix[1][0] * matrix[2][2] - matrix[2][0] * matrix[1][2]) +
        matrix[0][2] *
            (matrix[1][0] * matrix[2][1] - matrix[2][0] * matrix[1][1]);
  }

// 解线性方程组
  List<double> solveLinearSystem(List<List<num>> matrix, List<num> results) {
    final det = determinant(matrix);

    if (det == 0) throw Exception('Matrix is singular and cannot be solved.');

    replaceColumn(int index) {
      return List<List<num>>.generate(
        3,
        (row) => List<num>.from(matrix[row])..[index] = results[row],
      );
    }

    final detA = determinant(replaceColumn(0));
    final detB = determinant(replaceColumn(1));
    final detC = determinant(replaceColumn(2));

    return [detA / det, detB / det, detC / det];
  }

  @override
  void onClose() {
    normalBarrageWallController.dispose();
    highLightBarrageWallController.dispose();
    shootAnimationController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
