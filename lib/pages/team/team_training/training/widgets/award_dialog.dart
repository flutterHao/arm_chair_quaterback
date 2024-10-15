/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-12 15:43:49
 * @LastEditTime: 2024-10-15 18:43:20
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AwardDialog extends GetView<TrainingController> {
  const AwardDialog({super.key});

  int get _currentLevel {
    return controller.trainingInfo.training.currentTaskId;
  }

  Color _getColor(int level) {
    if (level < _currentLevel) {
      return AppColors.c10A86A;
    } else if (level == _currentLevel) {
      return AppColors.cFF7954;
    } else {
      return AppColors.cD9D9D9;
    }
  }

  Color _getColor2(int level) {
    if (level < _currentLevel) {
      return AppColors.cF2F2F2;
    } else if (level == _currentLevel) {
      return AppColors.cFF7954;
    } else {
      return AppColors.cD9D9D9;
    }
  }

  Widget _radioContainer(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(width / 2)),
    );
  }

  List<TrainTaskEntity> get _list {
    TrainTaskEntity task = controller.trainTaskList
        .where((e) => e.taskLevel == _currentLevel)
        .first;
    String prefix = task.taskLevel.toString().substring(0, 2);
    var list = controller.trainTaskList
        .where((e) =>
            e.taskRound == task.taskRound &&
            e.taskLevel.toString().startsWith(prefix))
        .toList();
    list.sort((a, b) => b.taskLevel - a.taskLevel);
    return list;
  }

  Widget _leftList() {
    return SizedBox(
      width: 30.w,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _list.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 3.w),
              width: 2.w,
              height: 38.w,
              color: _getColor(_list[index].taskLevel),
            ),
          );
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _radioContainer(12.w, 12.w, _getColor(_list[index].taskLevel)),
                _radioContainer(5.w, 5.w, AppColors.cF2F2F2),
              ],
            ),
          );
        },
      ),
    );
  }

  // String getAward(String award) {
  //   return award.split("_").last;
  // }

  Widget _lastPrize(int index) {
    int level = _list[index].taskLevel;
    List<String>award=_list[index].taskReward.split("_");
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 61.w),
      width: 271.w,
      height: 62.w,
      decoration: BoxDecoration(
        color: AppColors.c262626,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GRAND PRIZE",
            style: 17.w7(color: AppColors.cFEB942),
          ),
          5.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconWidget(iconWidth: 32.w, icon: Assets.uiMoney_02Png),
              8.hGap,
              Text(
                award[2],
                style: 21.w7(color: AppColors.cFFFFFF),
              ),
              Expanded(child: Container()),
              if (level < _currentLevel)
                IconWidget(
                  iconWidth: 16.w,
                  icon: Assets.uiIconRuidgtPng,
                  iconColor: AppColors.c10A86A,
                ),
              16.hGap,
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(int index) {
    int level = _list[index].taskLevel;
       List<String>award=_list[index].taskReward.split("_");
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: level == _currentLevel ? 215.w : 208.w,
      height: 47.w,
      margin: EdgeInsets.only(left: 36.w),
      decoration: BoxDecoration(
          color: _getColor2(level),
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(width: 1, color: _getColor(level))),
      child: Row(
        children: [
          ImageWidget(width: 32.w, url: Utils.getIconUrl(award[2])),
          8.hGap,
          Text(
            award[2],
            // "$level",
            style: 17.w7(color: AppColors.c262626),
          ),
          Expanded(child: Container()),
          if (level < _currentLevel)
            IconWidget(
              iconWidth: 16.w,
              icon: Assets.uiIconRuidgtPng,
              iconColor: AppColors.c10A86A,
            ),
        ],
      ),
    );
  }

  Widget _rightList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _list.length,
      separatorBuilder: (context, index) {
        return 7.vGap;
      },
      itemBuilder: (context, index) {
        bool isLast = index == 0;
        return Align(
          alignment: Alignment.center,
          child: isLast ? _lastPrize(index) : _item(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        // margin: EdgeInsets.symmetric(horizontal: 36.w),
        constraints: const BoxConstraints(maxWidth: 350),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
                height: 38.w,
                child: Text(
                  "REWARDS",
                  style: 52.w7(color: AppColors.cFF7954, height: 1),
                )),
            Container(
              height: 93.w,
              margin: EdgeInsets.only(top: 37.5.w),
              decoration: BoxDecoration(
                  color: AppColors.cFF7954,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w))),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.w),
              child: Image.asset(
                Assets.uiWindowsAwardPng,
                height: 104,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 303.w,
              height: 384.w,
              margin: EdgeInsets.only(top: 108.w),
              constraints: BoxConstraints(minHeight: 244.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(16.w)),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  _rightList(),
                  Positioned(left: 12.w, child: _leftList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
