import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailRankChangeWidget extends GetView<InboxEmailController> {
  const EmailRankChangeWidget(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _timestamp(controller.emailList[index].createTime),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9.w),
                  border: Border.all(color: AppColors.cB3B3B3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 18.w,
                          height: 18.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(9.w),
                          ),
                          child: IconWidget(
                            iconWidth: 11.w,
                            icon: Assets.inboxUiInboxIconMessage,
                          )),
                      10.hGap,
                      Text(
                        'Rank change',
                        style: 16.w4(fontFamily: FontFamily.fOswaldMedium),
                      )
                    ],
                  ),
                  Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 6.w, bottom: 15.w),
                      color: AppColors.cB3B3B3),
                  SizedBox(
                    child: Text(
                      controller.emailList[index].content,
                      style: 14.w4(fontFamily: FontFamily.fRobotoRegular),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  /// 时间戳
  Widget _timestamp(int time) {
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(time);
    return Container(
      margin: EdgeInsets.only(bottom: 10.w),
      child: Text(
        "${MyDateUtils.formatDate(datetime, format: DateFormats.Y_M_D)}  ${MyDateUtils.formatAM_HM(datetime)}",
        style: 14.w4(
          color: AppColors.cB3B3B3,
          fontFamily: FontFamily.fRobotoRegular,
        ),
      ),
    );
  }
}
