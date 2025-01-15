import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/utils/data_formats.dart';

class SeasonTopWidget extends StatefulWidget {
  const SeasonTopWidget({super.key});

  @override
  State<SeasonTopWidget> createState() => _SeasonTopWidgetState();
}

class _SeasonTopWidgetState extends State<SeasonTopWidget> {
  SeaonRankController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 375.w,
            child: AspectRatio(
              aspectRatio: 375 / 189, // 宽高比
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.w),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.managerUiManagerRankBg),
                        fit: BoxFit.cover)),
                child: Obx(() {
                  controller.gameStartTimesCountDown.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // gameStartTimesCountDown
                      Text(
                        'SEASON 188',
                        style: 30.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                      Text(
                        '2024-2025',
                        style: 12.w4(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),

                      const Spacer(),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _seasonTimeWidget(
                              controller.twoDigits(controller.day), 'DAY'),
                          Padding(
                            padding: EdgeInsets.only(top: 4.w),
                            child: Text(
                              " : ",
                              style: 21.w5(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                          _seasonTimeWidget(
                              controller.twoDigits(controller.hh), 'HR'),
                          Padding(
                            padding: EdgeInsets.only(top: 4.w),
                            child: Text(
                              " : ",
                              style: 21.w5(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                          _seasonTimeWidget(
                              controller.twoDigits(controller.minute), 'MIN'),
                          Padding(
                            padding: EdgeInsets.only(top: 4.w),
                            child: Text(
                              " : ",
                              style: 21.w5(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                          _seasonTimeWidget(
                              controller.twoDigits(controller.second), 'SEC')
                        ],
                      )
                    ],
                  );
                }),
              ),
            )),
      ],
    );
  }

  Widget _seasonTimeWidget(String time, String title) {
    return SizedBox(
        width: 24.w,
        child: Column(
          children: [
            Text(
              time,
              style: 21.w5(
                  color: AppColors.cFFFFFF,
                  fontFamily: FontFamily.fOswaldMedium),
            ),
            Text(
              title,
              style: 10.w4(
                  color: AppColors.cFFFFFF.withOpacity(.3),
                  fontFamily: FontFamily.fOswaldMedium),
            )
          ],
        ));
  }
}
