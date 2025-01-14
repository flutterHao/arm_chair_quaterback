import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/WidgetUtils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/23/16:46

class PickSuccessWidget extends StatefulWidget {
  const PickSuccessWidget({super.key});

  @override
  State<PickSuccessWidget> createState() => _PickSuccessWidgetState();
}

class _PickSuccessWidgetState extends State<PickSuccessWidget>
    with SingleTickerProviderStateMixin {
  late EasyAnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut);
    animationController.controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Future.delayed(const Duration(seconds: 3),(){
          if(mounted) {
            animationController.forward(from: 0.0);
          }
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 350),(){
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dialogHeight = Utils.getDialogHeight();
    return Column(
      children: [
        WidgetUtils.getDialogTransWidget(context),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: dialogHeight
          ),
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
          child: Column(
            children: [
              12.vGap,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.ccccccc,
                    borderRadius: BorderRadius.circular(2.w)),
                height: 4.w,
                width: 44.w,
              ),
              37.vGap,
              Container(
                height: 144.w,
                width: 144.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(72.w),
                    color: AppColors.c53CF8A.withOpacity(0.19)),
                child: Center(
                  child: Obx(() {
                    return Transform.scale(
                      scale: animationController.value.value,
                      child: Container(
                        height: 115.w,
                        width: 115.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58.w),
                            color: AppColors.c10A86A),
                        child: Center(
                          child: Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23.w),
                                color: AppColors.cFFFFFF),
                            child: Center(
                              child: IconWidget(
                                iconWidth: 23.w,
                                icon: Assets.iconUiIconRuidgt,
                                iconColor: AppColors.c10A86A,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              17.vGap,
              Text(
                "PICK SUCCESS",
                style: 27.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fOswaldMedium,
                ),
              ),
              12.vGap,
              Text(
                "${MyDateUtils.formatDate(MyDateUtils.getNowDateTime(),
                    format: DateFormats.PARAM_M_D)} ${MyDateUtils.formatHM_AM(
                    MyDateUtils.getNowDateTime())}",
                style: 14.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular,
                ),
              ),
              63.vGap,
              MtInkWell(
                onTap: ()=> Navigator.pop(context),
                child: Container(
                  height: 51.w,
                  width: 343.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(9.w)),
                  child: Text(
                    "CONFIRM",
                    style: 23.w5(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              ),
              19.vGap,
              MtInkWell(
                onTap: () async {
                  Navigator.pop(context);
                  await Get.toNamed(RouteNames.picksPicksHistory);
                },
                child: Text(
                  "VIEW DETAILS",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular,
                    fontSize: 16.w,
                    decorationColor: AppColors.c000000,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
