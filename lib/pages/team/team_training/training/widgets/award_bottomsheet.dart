import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'package:collection/collection.dart';

class AwardBottomsheet extends GetView<TrainingController> {
  const AwardBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 570.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          14.vGap,
          _awardTiTleWidget(),
          4.vGap,
          const Divider(height: 1, color: AppColors.cD1D1D1),
          Expanded(
            child: _rightAwardList(),
          )
        ],
      ),
    ));
  }

  List<String> get _awardTiTleRewardList {
    // TrainTaskEntity taskEntity =
    //     _list.firstWhere((element) => element.taskLevel == _currentLevel);
    TrainTaskEntity taskEntity = _list[0];
    List<String> taskRewardList = taskEntity.taskReward.split("|");
    return taskRewardList;
  }

  int get _currentLevel {
    return controller.trainingInfo.training.currentTaskId;
  }

  Widget _listAwardList() {
    return Column(
      children: [
        Container(
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
              Container(width: 55.w, color: Colors.black),
              Expanded(
                  child: Container(
                child: Row(
                  children: [
                    ..._awardTiTleRewardList.mapIndexed((index, element) {
                      return Container(
                        margin: EdgeInsets.only(left: index == 0 ? 0 : 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Image.asset(
                              Utils.getSlotIconUrl(
                                  int.tryParse(element.split("_")[1])),
                              width: 40.w,
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, error, stackTrace) =>
                                  IconWidget(
                                iconWidth: 40.w,
                                icon: Assets.teamUiMoney02,
                              ),
                            )),
                            Text(
                              element.split("_")[2],
                              // Utils.formatMoney(
                              //   int.tryParse(element.split("_")[2]) ?? 0,
                              // ),
                              style: 14.w5(
                                  color: AppColors.c000000,
                                  fontFamily: FontFamily.fRobotoRegular),
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
        ),
        const Divider(height: 1, color: AppColors.cD1D1D1),
      ],
    );
  }

  Widget _rightAwardList() {
    return SizedBox(
      // width: 271.w,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        itemCount: _list.length,
        // separatorBuilder: (context, index) {
        //   return 8.vGap;
        // },

        itemBuilder: (context, index) {
          bool isLast = index == 0;
          if (isLast) {
            return _listAwardList();
          }
          return Stack(
            children: [
              index != _list.length - 1 && index != 1
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
                              child: Container(
                                  width: 5.w,
                                  height: double.infinity,
                                  color: AppColors.cE6E6E),
                            ),
                            if (index == _list.length - 1) const Spacer(),
                          ],
                        ),
                      ),
                    ),
              _awardItemWidget(index)
            ],
          );
        },
      ),
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

  Widget _awardTiTleWidget() {
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
              Text(
                DateUtil.formatDateMs(
                    controller.trainingInfo.training.taskEndTime),
                style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColors.cD1D1D1)),
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
                          iconWidth: 9.w,
                          iconColor: AppColors.cD1D1D1,
                          icon: Assets.commonUiCommonIconSystemLock),
                    ),
            ),
          ),
          27.hGap,
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(width: 1, color: _getColor(level))),
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
                          Utils.getSlotIconUrl(
                              int.tryParse(element.split("_")[1])),
                          width: 40.w,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              IconWidget(
                            iconWidth: 40.w,
                            icon: Assets.teamUiMoney02,
                          ),
                        )),
                        Text(
                          element.split("_")[2],
                          // Utils.formatMoney(
                          //   int.tryParse(element.split("_")[2]) ?? 0,
                          // ),
                          style: 14.w5(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fRobotoRegular),
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
