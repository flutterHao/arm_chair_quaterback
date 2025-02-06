import 'dart:math';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/widgets/season_rank_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeasonRankDialog extends StatefulWidget {
  const SeasonRankDialog({super.key});

  @override
  State<SeasonRankDialog> createState() => _SeasonRankDialogState();
}

class _SeasonRankDialogState extends State<SeasonRankDialog> {
  final SeaonRankController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      controller.pageController
          .jumpToPage(controller.seasonRankList.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return VerticalDragBackWidget(
        child: Container(
      height: 650.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          10.vGap,
          _seasonRankHeaderWidget(),
          5.vGap,
          const Divider(
            height: 1,
            color: AppColors.cD4D4D4,
          ),
          Expanded(
              key: controller.ranksBodyGlobalKey,
              child: Obx(() {
                return PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.seasonRankList.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        if (controller.rankDialogloadingStatus.value !=
                            LoadDataStatus.success) {
                          return Center(
                              child: LoadStatusWidget(
                                  loadDataStatus: controller
                                      .rankDialogloadingStatus.value));
                        }
                        return SeasonRankItemView(
                            controller.seasonRankList[index]);
                      });
                    });
              }))
        ],
      ),
    ));
  }

  Widget _seasonRankHeaderWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Obx(() => Row(
            children: [
              Text(
                'Season Ranks'.tr,
                style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
              ),
              const Spacer(),
              MtInkWell(
                  onTap: () async {
                    controller.preSeasonRank();
                  },
                  child: Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: controller
                                          .seasonRankList[
                                              controller.pageviewIndex.value]
                                          .lastRank !=
                                      null
                                  ? AppColors.cB3B3B3
                                  : AppColors.cE6E6E,
                              width: 1)),
                      child: Transform.rotate(
                          angle: pi,
                          child: IconWidget(
                              iconWidth: 5.w,
                              iconColor: controller
                                          .seasonRankList[
                                              controller.pageviewIndex.value]
                                          .lastRank !=
                                      null
                                  ? AppColors.c000000
                                  : AppColors.cB3B3B3,
                              icon: Assets.commonUiCommonIconSystemJumpto)))),
              5.hGap,
              Container(
                  height: 28.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      border: Border.all(color: AppColors.cB3B3B3, width: 1)),
                  alignment: Alignment.center,
                  child: Text(
                    '${controller.getEnMMDD(controller.seasonRankList[controller.pageviewIndex.value].nowCycleStartTime)} - ${controller.getEnMMDD(controller.seasonRankList[controller.pageviewIndex.value].nowCycleEndTime)}',
                    style: 12.w5(fontFamily: FontFamily.fOswaldRegular),
                  )),
              5.hGap,
              MtInkWell(
                  onTap: () async {
                    controller.nextSeasonRank();
                  },
                  child: Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: controller
                                        .seasonRankList[
                                            controller.pageviewIndex.value]
                                        .nextRank !=
                                    null
                                ? AppColors.cB3B3B3
                                : AppColors.cE6E6E,
                            width: 1)),
                    child: IconWidget(
                        iconWidth: 5.w,
                        iconColor: controller
                                    .seasonRankList[
                                        controller.pageviewIndex.value]
                                    .nextRank !=
                                null
                            ? AppColors.c000000
                            : AppColors.cB3B3B3,
                        icon: Assets.commonUiCommonIconSystemJumpto),
                  ))
            ],
          )),
    );
  }
}
