import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/select_player/pages/select_other_player.dart';
import 'package:arm_chair_quaterback/pages/team/select_player/widgets/select_player_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/select_bg.dart';

class SelectPlayerPage extends GetView<SelectPlayerController> {
  const SelectPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectPlayerController>(
      init: SelectPlayerController(),
      id: "select_player",
      builder: (_) {
        return SelectBgWidget(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300.w,
              child: Text('who’s your  favorite player'.toUpperCase(),
                  style: 35.w5(fontFamily: FontFamily.fOswaldMedium)),
            ),
            Expanded(
                child: Obx(() => Container(
                      padding: EdgeInsets.only(top: 20.w),
                      child: ListView.separated(
                        itemCount: controller.playerList.length,
                        itemBuilder: (context, index) {
                          int playerId =
                              int.parse(controller.playerList[index]);
                          return Obx(() {
                            bool isSelect =
                                controller.selectIndex.value == index;
                            return MtInkWell(
                              onTap: () {
                                controller.selectIndex.value = index;
                              },
                              child: SelectPlayerItemWidget(
                                playerId: playerId,
                                isSelect: isSelect,
                              ),
                            );
                          });
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.w),
                      ),
                    ))),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              child: MtInkWell(
                  onTap: () {
                    Get.to(SelectOtherPlayerPage(),
                        arguments: int.parse(
                          controller.playerList[controller.selectIndex.value],
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.w)),
                    height: 50.w,
                    alignment: Alignment.center,
                    child: Text(
                      'CONFIRM',
                      style: 23.w5(
                          color: Colors.white,
                          fontFamily: FontFamily.fOswaldMedium),
                    ),
                  )),
            )
          ],
        ));
      },
    );
  }
}
