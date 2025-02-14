import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/entities/inbox_email_entity.dart';

class EmailRankAwardWidget extends GetView<InboxEmailController> {
  const EmailRankAwardWidget(this.index, {super.key});
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
                            color: AppColors.cFF7954,
                            borderRadius: BorderRadius.circular(9.w),
                          ),
                          child: IconWidget(
                            iconWidth: 11.w,
                            icon: Assets.inboxUiInboxIconAward,
                          )),
                      10.hGap,
                      Text(
                        'Rank Award',
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
                  14.vGap,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.w),
                    decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(9.w)),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My reward'.toUpperCase(),
                          style: 12.w4(fontFamily: FontFamily.fRobotoRegular),
                        ),
                        8.vGap,
                        Wrap(
                            spacing: 10.w,
                            children: controller.emailList[index].awardData
                                .map((InboxEmailMailListAwardData element) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconWidget(
                                      icon: Utils.getPropIconUrl(element.id),
                                      fit: BoxFit.contain,
                                      iconWidth: 35.w,
                                      iconHeight: 33.w,
                                      fieldPath: Assets.managerUiManagerGift05),
                                  4.hGap,
                                  Text(
                                    '×${element.num}',
                                    style: 10.w4(color: AppColors.c666666),
                                  ),
                                ],
                              );
                            }).toList()),
                        16.vGap,
                        SizedBox(
                          child: Row(
                            children: [
                              if (controller.inboxMessageEntity.id != 1005)
                                Expanded(
                                    child: MtInkWell(
                                        onTap: () {
                                          controller.goView();
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.w),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6.w),
                                                border: Border.all(
                                                    color: AppColors.cD9D9D9)),
                                            child: Text('View',
                                                style: 14.w4(
                                                  fontFamily:
                                                      FontFamily.fOswaldRegular,
                                                ))))),
                              if (controller.type != 1) 9.hGap,
                              Expanded(
                                  child: controller.emailList[index].receive
                                      ? Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.cEEEEEE,
                                            border: Border.all(
                                                color: AppColors.cD9D9D9),
                                            borderRadius:
                                                BorderRadius.circular(6.w),
                                          ),
                                          child: Text('Received',
                                              style: 14.w4(
                                                color: AppColors.ccccccc,
                                                fontFamily:
                                                    FontFamily.fOswaldRegular,
                                              )))
                                      : MtInkWell(
                                          onTap: () {
                                            controller.receiveMailAward(
                                                '${controller.emailList[index].mailId}');
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.w),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(6.w),
                                              ),
                                              child: Text('Get',
                                                  style: 14.w4(
                                                    color: AppColors.cFFFFFF,
                                                    fontFamily: FontFamily
                                                        .fOswaldRegular,
                                                  ))))),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
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
