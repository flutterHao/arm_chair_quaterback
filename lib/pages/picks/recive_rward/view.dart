import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/empty_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_detail_item.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class ReciveRwardPage extends GetView<ReciveRwardController> {
  const ReciveRwardPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    /// 上一条数据的时间
    int createTime = 0;
    return Expanded(
        child: controller.newsDefineEntity == null ||
                controller.guessHistoryList.isEmpty
            ? const Center(child: EmptyWidget())
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    sliver: SliverList.builder(
                      itemCount: controller.guessHistoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<ReciveAwardEntity> items =
                            controller.guessHistoryList[index];
                        var itemData = items[0];
                        var itemCreateTime = itemData.createTime;
                        var sameDay = MyDateUtils.isSameDay(
                            MyDateUtils.getDateTimeByMs(createTime),
                            MyDateUtils.getDateTimeByMs(itemCreateTime));
                        createTime = itemCreateTime;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!sameDay)
                              Container(
                                margin: EdgeInsets.only(
                                    right: 13.w, bottom: 10.w, top: 16.w),
                                child: Text(
                                    MyDateUtils.getEnMMDDYYYY(
                                        MyDateUtils.getDateTimeByMs(
                                            itemCreateTime),
                                        short: true),
                                    style: 19.w7(color: AppColors.c262626)),
                              ),
                            ReciveAwardItem(
                                items, controller.newsDefineEntity!),
                          ],
                        );
                      },
                    ),
                  ),
                  SliverPadding(padding: EdgeInsets.symmetric(vertical: 35.w))
                ],
              ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReciveRwardController>(
      builder: (_) {
        return BlackAppWidget(
          const AppBarWidget(
            id: GlobalNestedKey.PICKS,
            title: "RECEIVE AWARD",
          ),
          bodyWidget: _buildView(context),
          floatWidgets: [
            if (!(controller.newsDefineEntity == null ||
                controller.guessHistoryList.isEmpty))
            //下注
              Positioned(
                  left: 63.w,
                  right: 63.w,
                  bottom: 20.w,
                  child: Center(
                    child: InkWell(
                      onTap: ()=> controller.getGuessAllAward,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 300.w,
                        ),
                        child: BtnBackground(
                            child: Center(
                          child: Text("RECEIVE",
                              style: 16.w7(color: AppColors.cFFFFFF)),
                        )),
                      ),
                    ),
                  ))
          ],
        );
      },
    );
  }
}
