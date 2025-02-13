import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class ReceiveRewardPage extends GetView<ReciveRwardController> {
  const ReceiveRewardPage({super.key});

  // 主视图
  Widget _buildView(BuildContext context) {
    return Expanded(
        child: SmartRefresher(
      controller: controller.refreshController,
      onRefresh: () => controller.loading(),
      child: Builder(builder: (context) {
        if (controller.picksDefineEntity == null ||
            controller.listData.isEmpty) {
          return Obx(() {
            return Center(
                child: LoadStatusWidget(
              loadDataStatus: controller.loadStatusRx.value,
            ));
          });
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              sliver: SliverList.builder(
                itemCount: controller.listData.length,
                itemBuilder: (BuildContext context, int index) {
                  List<PicksPlayer> items = controller.listData[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReceiveAwardItem(items, controller.picksDefineEntity!),
                    ],
                  );
                },
              ),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 35.w))
          ],
        );
      }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print('ReceiveRwardPage-----build-----');
    return HorizontalDragBackContainer(
      child: GetBuilder<ReciveRwardController>(
        builder: (_) {
          return BlackAppWidget(
            const AppBarWidget(
              title: "RECEIVE AWARD",
            ),
            bodyWidget: _buildView(context),
            floatWidgets: [
              if (!(controller.picksDefineEntity == null ||
                  controller.listData.isEmpty))
                //下注
                Positioned(
                    left: 63.w,
                    right: 63.w,
                    bottom: 20.w,
                    child: Center(
                      child: InkWell(
                        onTap: () => controller.getGuessAllAward(),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 300.w,
                          ),
                          child: BtnBackground(
                              child: Center(
                            child: Text("GET ALL",
                                style: 16.w7(color: AppColors.cFFFFFF)),
                          )),
                        ),
                      ),
                    ))
            ],
          );
        },
      ),
    );
  }
}
