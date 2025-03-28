/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-02-28 11:09:59
 */

import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/illustration_list.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/level_arc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class IllustratiionsPage extends GetView<IllustratiionsController> {
  const IllustratiionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IllustratiionsController>(
      // init: IllustratiionsController(),
      id: "list",
      builder: (_) {
        var list =
            CacheApi.playerBookRuleMap.entries.map((e) => e.value).toList();

        return HorizontalDragBackContainer(
          child: BlackAppWidget(
            const UserInfoBar(showPop: true),
            bodyWidget: Expanded(
              child: list.isEmpty
                  ? const Center(
                      child: LoadStatusWidget(
                      loadDataStatus: LoadDataStatus.loading,
                    ))
                  : const Column(
                      children: [
                        LevelWidget(),
                        Expanded(
                          child: IllustrationList(),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
