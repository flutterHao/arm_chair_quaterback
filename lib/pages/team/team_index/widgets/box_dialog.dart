/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 14:09:29
 * @LastEditTime: 2024-12-13 14:54:39
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BoxDialog extends StatelessWidget {
  const BoxDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
      builder: (controller) {
        return CustomBottomDialog(
            height: 400.w,
            title: "Awards",
            content: Container(
              margin: EdgeInsets.symmetric(vertical: 10.w),
              child: controller.awardList.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.all(4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // e.type == 2
                          //     ? ImageWidget(
                          //         url: Utils.getPlayUrl(e.id),
                          //         width: 64.w,
                          //       )
                          //     : Image.asset(
                          //         Utils.getPropIconUrl(e.id),
                          //         width: 40.w,
                          //       ),
                          Image.asset(
                            Assets.picksUiPropsMoeny,
                            width: 60.w,
                          ),
                          10.hGap,
                          Text(
                            "x ${Utils.formatMoney(controller.awardList.first.num)}",
                            style: 14.w4(color: AppColors.c262626),
                          )
                        ],
                      ),
                    )
                  : Container(),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: controller.awardList.map((e) {
              //     return Container(
              //       margin: EdgeInsets.all(4.w),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           e.type == 2
              //               ? ImageWidget(
              //                   url: Utils.getPlayUrl(e.id),
              //                   width: 64.w,
              //                 )
              //               : Image.asset(
              //                   Utils.getPropIconUrl(e.id),
              //                   width: 40.w,
              //                 ),
              //           Image.asset(
              //             Assets.picksUiPropsMoeny,
              //             width: 60.w,
              //           ),
              //           10.hGap,
              //           Text(
              //             "x ${Utils.formatMoney(e.num)}",
              //             style: 14.w4(color: AppColors.c262626),
              //           )
              //         ],
              //       ),
              //     );
              //   }).toList(),
              // ),
            ),
            onComfirm: () {
              Get.back();
            });
      },
    );
  }
}
