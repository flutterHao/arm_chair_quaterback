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
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

class AwardBottomsheet extends GetView<TrainingController> {
  AwardBottomsheet({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 570.h,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          14.vGap,
          // InkWell(
          //   onTap: () {
          //     scrollController.jumpTo(78.w * 3);
          //   },
          //   child: Text('data'),
          // ),
          _awardTiTleWidget(),
          const Divider(height: 1, color: AppColors.cD1D1D1),
          4.vGap,
          _lastAwardItemWidget(),
          const Divider(height: 1, color: AppColors.cD1D1D1),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20.w),
              itemCount: _list.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                bool isLast = index == 0;
                if (isLast) {
                  return SizedBox();
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

  int get _currentLevel {
    return controller.trainingInfo.training.currentTaskId;
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
      height: 92.w,
      margin: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
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
                    IconWidget(iconWidth: 24.w, icon: Assets.inboxUiInboxIconAward),
                    8.vGap,
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
                  top: 40.w,
                  child: CustomPaint(
                    size: Size(8.w, 12.w), // 设置三角形的大小
                    painter: TrianglePainter(color: Colors.black),
                  )),
              Positioned(
                  right: -3.w,
                  top: 41.w,
                  child: CustomPaint(
                    size: Size(6.w, 10.w), // 设置三角形的大小
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
                          // Utils.getSlotIconUrl(int.tryParse(element.split("_")[1])),
                          Utils.getPropIconUrl(int.tryParse(element.split("_")[1])),
                          width: 48.w,
                          height: 40.w,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) => IconWidget(
                            iconWidth: 48.w,
                            icon: Assets.teamUiMoney02,
                          ),
                        ),
                        2.vGap,
                        Text(
                          element.split("_")[2],
                          style: 14.w5(color: AppColors.c000000, fontFamily: FontFamily.fRobotoRegular),
                        ),
                        6.vGap
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
            left: 55.w,
            top: 0,
            bottom: 0,
            child: Container(width: 5.w, color: AppColors.cE6E6E),
          )
        : Positioned(
            left: 55.w,
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

  Widget _awardTiTleWidget() {
    // 获取当前时间
    DateTime now = DateTime.now();
    // 创建今天的 23:59:59 时间
    DateTime todayLastSecond = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'Training task',
                style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
              ),
              const Spacer(),
              IconWidget(iconWidth: 16.w, icon: Assets.commonUiCommonCountdown02),
              6.hGap,
              Text(
                '6D ${DateUtil.formatDate(todayLastSecond, format: 'HH:mm:ss')}',
                // DateUtil.formatDateMs(
                //     controller.trainingInfo.training.taskEndTime),
                style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
              ),
              6.hGap,
              Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  color: AppColors.cB3B3B3,
                  shape: BoxShape.circle,
                ),
                child: IconWidget(iconWidth: 3.w, icon: Assets.inboxUiInboxIconTips),
              )
            ],
          ),
        )
      ],
    );
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
      margin: EdgeInsets.only(right: 45.w, top: 8.w),
      height: 70.w,
      child: Row(
        children: [
          42.hGap,
          Container(
            width: 31.w,
            height: 31.w,
            color: AppColors.cFFFFFF,
            alignment: Alignment.center,
            child: Container(
              width: 23.w,
              height: 23.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: AppColors.cD1D1D1)),
              child: level < _currentLevel
                  ? Container(
                      width: 11.w,
                      height: 11.w,
                      decoration: const BoxDecoration(
                        color: AppColors.c000000,
                        shape: BoxShape.circle,
                      ))
                  : Center(
                      child: IconWidget(
                          iconWidth: 9.w, iconColor: AppColors.cD1D1D1, icon: Assets.commonUiCommonIconSystemLock),
                    ),
            ),
          ),
          27.hGap,
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
                        Expanded(
                            child: Image.asset(
                          Utils.getPropIconUrl(int.tryParse(element.split("_")[1])),
                          width: 40.w,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) => IconWidget(
                            iconWidth: 40.w,
                            icon: Assets.teamUiMoney02,
                          ),
                        )),
                        Text(
                          element.split("_")[2],
                          // Utils.formatMoney(
                          //   int.tryParse(element.split("_")[2]) ?? 0,
                          // ),
                          style: 14.w5(color: AppColors.c000000, fontFamily: FontFamily.fRobotoRegular),
                        ),
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
