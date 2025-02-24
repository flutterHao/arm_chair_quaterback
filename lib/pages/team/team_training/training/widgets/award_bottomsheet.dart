import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

class AwardBottomsheet extends StatefulWidget {
  const AwardBottomsheet({super.key});

  @override
  State<AwardBottomsheet> createState() => _AwardBottomsheetState();
}

class _AwardBottomsheetState extends State<AwardBottomsheet> {
  final TrainingController controller = Get.find<TrainingController>();
  int get _currentLevel {
    return controller.trainingInfo.training.currentTaskId;
  }

  late Timer _timer;
  late Duration _remaining;
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var currentIndex = _list.indexWhere((TrainTaskEntity e) => e.taskLevel == _currentLevel);
      if (currentIndex > 0 && currentIndex < _list.length - 4) {
        controller.awardBottomScrollController.jumpTo(90.h * (currentIndex + 4) - 360.h);
      } else if (currentIndex >= _list.length - 4) {
        controller.awardBottomScrollController.jumpTo(90.h * (_list.length - 1) - 360.h);
      } else {
        controller.awardBottomScrollController.jumpTo(0);
      }
    });
    _updateRemainingTime();
    // 每秒更新一次剩余时间
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateRemainingTime());
  }

  @override
  void dispose() {
    _timer.cancel(); // 当组件销毁时取消定时器
    super.dispose();
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(_remaining.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(_remaining.inSeconds.remainder(60));
    return "${twoDigits(_remaining.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _updateRemainingTime() {
    DateTime now = DateTime.now();
    DateTime midnight = DateTime(now.year, now.month, now.day + 1); // 明天凌晨
    Duration remaining = midnight.difference(now);

    setState(() {
      _remaining = remaining;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 572.h,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          Spacer(),
          _awardTiTleWidget(),
          SizedBox(height: 4.h),
          const Divider(height: 1, color: AppColors.cD1D1D1),
          _lastAwardItemWidget(),
          const Divider(height: 1, color: AppColors.cD1D1D1),
          Container(
            height: 378.h,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20.h),
              itemCount: _list.length,
              physics: NeverScrollableScrollPhysics(),
              controller: controller.awardBottomScrollController,
              itemBuilder: (context, index) {
                bool isLast = index == 0;
                if (isLast) {
                  return SizedBox(height: 0);
                }
                return Stack(
                  children: [_leftWidget(index), _awardItemWidget(index)],
                );
              },
            ),
          )
        ],
      ),
    ));
  }

  List<String> get _lastAwardRewardList {
    TrainTaskEntity taskEntity = _list[0];
    List<String> taskRewardList = taskEntity.taskReward.split("|");
    return taskRewardList;
  }

  List<TrainTaskEntity> get _list {
    TrainTaskEntity task = controller.trainTaskList.where((e) => e.taskLevel == _currentLevel).first;
    String prefix = task.taskLevel.toString().substring(0, 2);
    var list = controller.trainTaskList
        .where((e) => e.taskRound == task.taskRound && e.taskLevel.toString().startsWith(prefix))
        .toList();
    list.sort((a, b) => b.taskLevel - a.taskLevel);
    return list;
  }

  Widget _lastAwardItemWidget() {
    return Container(
      height: 92.h,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          border: Border.all(
            color: AppColors.c000000,
          ),
          color: AppColors.cF2F2F2),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 55.w,
                color: Colors.black,
                child: Column(
                  children: [
                    Spacer(),
                    IconWidget(iconWidth: 24.h, icon: Assets.inboxUiInboxIconAward),
                    SizedBox(height: 6.h),
                    Text(
                      'AWARD',
                      style: 12.w5(color: Colors.white, fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Positioned(
                  right: -7.w,
                  top: 40.h,
                  child: CustomPaint(
                    size: Size(8.w, 12.h), // 设置三角形的大小
                    painter: TrianglePainter(color: Colors.black),
                  )),
              Positioned(
                  right: -3.w,
                  top: 41.h,
                  child: CustomPaint(
                    size: Size(6.w, 10.h), // 设置三角形的大小
                    painter: TrianglePainter(color: AppColors.cFF7954),
                  ))
            ],
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ..._lastAwardRewardList.mapIndexed((index, element) {
                  return Container(
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset(
                          Utils.getPropIconUrl(int.tryParse(element.split("_")[1])),
                          width: 48.h,
                          height: 40.h,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) => IconWidget(
                            iconWidth: 48.h,
                            icon: Assets.teamUiMoney02,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          element.split("_")[2],
                          style: 14.w5(color: AppColors.c000000, fontFamily: FontFamily.fRobotoRegular),
                        ),
                        SizedBox(height: 1.h),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _leftWidget(int index) {
    return index != _list.length - 1 && index != 1
        ? Positioned(
            left: 53.w,
            top: 0,
            bottom: 0,
            child: Container(width: 5.w, color: AppColors.cE6E6E),
          )
        : Positioned(
            left: 53.w,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: 5.w,
              child: Column(
                children: [
                  if (index == 1) const Spacer(),
                  Expanded(
                    child: Container(width: 5.w, height: double.infinity, color: AppColors.cE6E6E),
                  ),
                  if (index == _list.length - 1) const Spacer(),
                ],
              ),
            ),
          );
  }

  OverlayEntry? _overlayEntry;

  Widget _awardTiTleWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _overlayEntry?.remove();
                },
                child: Text(
                  'Training task',
                  style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
              const Spacer(),
              IconWidget(iconWidth: 16.h, icon: Assets.commonUiCommonCountdown02),
              6.hGap,
              Text(
                '6D ${formatDuration(_remaining)}',
                style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
              ),
              6.hGap,
              //_overlayEntry?.remove();
              InkWell(
                onTap: () {
                  _overlayEntry = OverlayEntry(
                    builder: (context) {
                      return _taskCollectWidget(context);
                    },
                  );
                  Overlay.of(context).insert(_overlayEntry!);
                },
                child: Container(
                  width: 18.h,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: AppColors.cB3B3B3,
                    shape: BoxShape.circle,
                  ),
                  child: IconWidget(iconWidth: 3.h, icon: Assets.inboxUiInboxIconTips),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  ///气泡框的任务图标
  Widget _taskCollectWidget(BuildContext context) {
    TrainingController trainingController = Get.find();
    var taskIconNum = [0, 0, 3, 4, 5, 6];
    List<int> taskCollectList = trainingController.trainDefine.taskCollect;
    return SafeArea(
        right: false,
        child: InkWell(
          onTap: () {
            _overlayEntry?.remove();
          },
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                    top: 100.h,
                    right: 36.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            width: 308.w,
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.35),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(4.w, 1.h)),
                              ],
                              borderRadius: BorderRadius.circular(4.h),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: taskCollectList.length,
                              itemBuilder: (context, index) {
                                if (index < 2) {
                                  return SizedBox();
                                }
                                return Container(
                                  height: 40.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          ...List.generate(taskIconNum[index], (int taskIconIndex) {
                                            return Container(
                                                height: 25.h,
                                                margin: taskIconIndex != taskIconNum.length - 1
                                                    ? EdgeInsets.only(right: 8.w)
                                                    : null,
                                                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
                                                decoration: BoxDecoration(
                                                    color: AppColors.cE6E6E, borderRadius: BorderRadius.circular(2.w)),
                                                child: Image.asset(
                                                  Assets.commonUiCommonProp03,
                                                  height: 14.h,
                                                ));
                                          })
                                        ],
                                      )),
                                      Text('Get ${taskIconNum[index]} icon',
                                          style: 12.w4(fontFamily: FontFamily.fRobotoMedium)),
                                      10.hGap,
                                      IconWidget(iconWidth: 20.w, icon: Assets.commonUiCommonProp03),
                                      2.hGap,
                                      SizedBox(
                                        width: 26.w,
                                        child: Text('x ${taskCollectList[index]}',
                                            style: 12.w4(fontFamily: FontFamily.fRobotoMedium)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                if (index < 2) {
                                  return SizedBox();
                                }
                                return Divider(height: 1, color: AppColors.cE6E6E);
                              },
                            )),
                        Positioned(
                            right: -5.w,
                            bottom: 26.h,
                            child: CustomPaint(
                              size: Size(6.w, 10.h), // 设置三角形的大小
                              painter: TrianglePainter(color: AppColors.cFFFFFF),
                            )),
                        Positioned(
                            right: -3.w,
                            bottom: 28.h,
                            child: CustomPaint(
                              size: Size(4.w, 6.h), // 设置三角形的大小
                              painter: TrianglePainter(color: AppColors.cFF7954),
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  Color _getColor(int level) {
    if (level < _currentLevel) {
      return AppColors.c666666;
    } else {
      return AppColors.cD1D1D1;
    }
  }

  Widget _awardItemWidget(int index) {
    int level = _list[index].taskLevel;
    List<String> taskRewardList = _list[index].taskReward.split("|");
    return Container(
      margin: EdgeInsets.only(right: 44.w, top: 18.h),
      height: 72.h,
      child: Row(
        children: [
          42.hGap,
          Container(
            width: 32.h,
            height: 32.h,
            color: AppColors.cFFFFFF,
            alignment: Alignment.center,
            child: Container(
              width: 24.h,
              height: 24.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: AppColors.cD1D1D1)),
              child: level < _currentLevel
                  ? Container(
                      width: 12.h,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        color: AppColors.c000000,
                        shape: BoxShape.circle,
                      ))
                  : Center(
                      child: IconWidget(
                          iconWidth: 10.h, iconColor: AppColors.cD1D1D1, icon: Assets.commonUiCommonIconSystemLock),
                    ),
            ),
          ),
          26.hGap,
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w), border: Border.all(width: 1, color: _getColor(level))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...taskRewardList.mapIndexed((index, element) {
                  return Container(
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 6.h),
                        Image.asset(
                          Utils.getPropIconUrl(int.tryParse(element.split("_")[1])),
                          height: 40.h,
                          width: 43.h,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            Assets.teamUiMoney02,
                            height: 40.h,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            element.split("_")[2],
                            style: 14.w5(color: AppColors.c000000, fontFamily: FontFamily.fRobotoRegular),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

// 创建三角形画笔
class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0); // 左上角
    path.lineTo(size.width, size.height / 2); // 右顶点
    path.lineTo(0, size.height); // 左下角
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
