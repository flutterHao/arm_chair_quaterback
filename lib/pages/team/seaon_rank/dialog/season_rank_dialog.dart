import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeasonRankDialog extends GetView<SeaonRankController> {
  const SeasonRankDialog({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return VerticalDragBackWidget(
        child: Container(
      height: 650.h,
      color: Colors.white,
    ));
  }
}
