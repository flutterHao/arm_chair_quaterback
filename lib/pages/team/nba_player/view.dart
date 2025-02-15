import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class NbaPlayerPage extends GetView<NbaPlayerController> {
  const NbaPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NbaPlayerController>(
      init: NbaPlayerController(),
      id: "nba_player",
      builder: (_) {
        return Container(
          width: double.infinity,
          height: 409.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.w),
          ),
          margin: EdgeInsets.only(top: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.5.w, top: 22.w),
                child: Text(
                  "ovr standing".toUpperCase(),
                  style: 30.w4(
                    fontFamily: FontFamily.fOswaldBold,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
