/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-03-03 14:13:20
 * @LastEditTime: 2025-03-03 15:29:57
 */
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/controller.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/chat_bubble.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/girl_head_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeautyInfoWidget extends GetView<BeautyChatController> {
  const BeautyInfoWidget({super.key});

  Widget _item(String title, String img, String value) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 17.w, right: 21.w),
      width: 326.w,
      height: 42.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: 14.w4(
                fontFamily: FontFamily.fRobotoRegular,
                color: AppColors.c000000,
              ),
            ),
          ),
          Image.asset(
            img,
            width: 22.w,
            fit: BoxFit.fitWidth,
          ),
          8.hGap,
          Text(
            value,
            style: 14.w4(
              fontFamily: FontFamily.fOswaldMedium,
              color: AppColors.c000000,
            ),
          ),
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
      width: 326.w,
      height: 1.w,
      color: AppColors.cE6E6E,
      margin: EdgeInsets.symmetric(horizontal: 16.5.w),
    );
  }

  Widget _item2(String title, String value) {
    return Container(
      width: 326.w,
      height: 40.w,
      padding: EdgeInsets.only(left: 17.w, right: 21.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: 14.w4(
                fontFamily: FontFamily.fRobotoRegular,
                color: AppColors.c000000,
              ),
            ),
          ),
          8.hGap,
          Text(
            value,
            style: 14.w4(
              fontFamily: FontFamily.fRobotoMedium,
              color: AppColors.c000000,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var girlDefine = controller.getCurrentGirl();
    return HorizontalDragBackContainer(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: 375.w,
            height: 707.h,
            decoration: BoxDecoration(
              color: AppColors.cF3F3F3,
              borderRadius: BorderRadius.circular(23.w),
              border: Border(
                top: BorderSide(width: 5.w, color: AppColors.cE6E6E),
                left: BorderSide(width: 5.w, color: AppColors.cE6E6E),
                right: BorderSide(width: 5.w, color: AppColors.cE6E6E),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    Assets.managerUiManagerChat02,
                    width: 365.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 55.w,
                  child: MtInkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 13.w, vertical: 10.w),
                      child: IconWidget(
                        icon: Assets.iconUiIconArrows04,
                        iconWidth: 19.w,
                        iconColor: AppColors.c000000,
                        rotateAngle: 90,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 65.w,
                    child: Column(
                      children: [
                        GirlHeadWidget(
                          url: girlDefine.icon,
                          width: 86.w,
                        ),
                        13.vGap,
                        Text(
                          girlDefine.eName,
                          style: 24.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 0.8,
                              color: AppColors.c000000),
                        ),
                        16.vGap,
                        Row(
                          children: [
                            OutlinedText(
                              text: controller.girlGrade(girlDefine.quality),
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(0, 3),
                                  blurRadius: 4,
                                ),
                              ],
                              textStyle: TextStyle(
                                fontFamily: FontFamily.fRobotoBlack,
                                height: 1,
                                fontSize: 32.sp,
                              ),
                            ),
                            12.hGap,
                            Container(
                              width: 28.w,
                              height: 28.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.c404040,
                                borderRadius: BorderRadius.circular(6.w),
                              ),
                              child: Image.asset(
                                Assets.cheerleadersUiCheerleadersIconType01,
                                width: 17.w,
                              ),
                            ),
                          ],
                        ),
                        20.vGap,
                        _item(
                          "Charm",
                          Assets.managerUiManagerIconStar03,
                          controller.girlChatEntity.girl.charm.toString(),
                        ),
                        8.vGap,
                        _item(
                          "Intimacy",
                          Assets.cheerleadersUiCheerleadersIconIntimacy,
                          "${controller.girlChatEntity.girl.intimacyLevel}%",
                        ),
                        7.5.vGap,
                        Text(
                          "100% intimacy increases her attractiveness",
                          style: 10.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              color: AppColors.cB3B3B3,
                              height: 1),
                        ),
                        13.5.vGap,
                        Container(
                          width: 326.w,
                          height: 167.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(9.w),
                          ),
                          child: Column(
                            children: [
                              _item2("Age", girlDefine.age.toString()),
                              _line(),
                              _item2("Height", girlDefine.height.toString()),
                              _line(),
                              _item2("Weight", girlDefine.weight.toString()),
                              _line(),
                              _item2(
                                  "B/W/H",
                                  girlDefine.threeDimensions
                                      .replaceAll("|", "/")
                                      .toString()),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
