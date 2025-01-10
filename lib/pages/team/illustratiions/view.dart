/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-01-10 17:56:47
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/illustration_list.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/level_arc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class IllustratiionsPage extends GetView<IllustratiionsController> {
  const IllustratiionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IllustratiionsController>(
      init: IllustratiionsController(),
      id: "illustratiions",
      builder: (_) {
        return const HorizontalDragBackWidget(
          child: BlackAppWidget(
            UserInfoBar(showPop: true),
            bodyWidget: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LevelWidget(),
                    IllustrationList(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
