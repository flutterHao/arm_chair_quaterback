import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_detail_item.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class ReciveRwardPage extends GetView<ReciveRwardController> {
  const ReciveRwardPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    return Expanded(
        child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
                left: 13.w, right: 13.w, bottom: 10.w, top: 16.w),
            child: Text("Aug 1,2024", style: 19.w7(color: AppColors.c262626)),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverList.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const ReciveAwardItem();
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
            //下注
            Positioned(
                left: 63.w,
                right: 63.w,
                bottom: 20.w,
                child: Center(
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
                ))
          ],
        );
      },
    );
  }
}
