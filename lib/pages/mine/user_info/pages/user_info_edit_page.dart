import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/dialogs/birthday_picker_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/dialogs/edit_avatar_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/dialogs/edit_name_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/dialogs/edit_signature_bottomsheet.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserInfoEditPage extends StatefulWidget {
  const UserInfoEditPage({super.key});

  @override
  State<UserInfoEditPage> createState() => _UserInfoEditPageState();
}

class _UserInfoEditPageState extends State<UserInfoEditPage> {
  final UserInfoController controller = Get.find();

  @override
  initState() {
    super.initState();
    controller.getEditInfoData();
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
      UserInfoBar(showPop: true),
      backgroundColor: Colors.white,
      bodyWidget: Expanded(
          child: Column(
        children: [
          _avatarWidget(),
          Expanded(
              child: Obx(() => Column(
                    children: [
                      _editItemWidget(
                          title: 'Name',
                          value: controller.editTeamName.value != ''
                              ? controller.editTeamName.value
                              : controller.teamName.value,
                          onTap: () {
                            Get.bottomSheet(
                              EditNameBottomsheet(),
                              isScrollControlled: true,
                            );
                          },
                          icon: Image.asset(
                            Assets.managerUiMangerNew213,
                            width: 15.w,
                            color: AppColors.c666666,
                          )),
                      Divider(color: AppColors.cD1D1D1, height: 1),
                      _editItemWidget(
                          title: 'Birthday',
                          value: DateUtil.formatDate(
                              DateTime.fromMillisecondsSinceEpoch(
                                  controller.editBirthday.value),
                              format: 'yyyy-MM-dd'),
                          onTap: () {
                            Get.bottomSheet(
                              BirthdayPickerBottomsheet(
                                  controller.editBirthday.value),
                              isScrollControlled: true,
                            );
                          }),
                      Divider(color: AppColors.cD1D1D1, height: 1),
                      _editItemWidget(
                          title: 'Signature',
                          value: controller.editSignature.value,
                          onTap: () {
                            Get.bottomSheet(EditSignatureBottomsheet(),
                                isScrollControlled: true);
                          }),
                      Divider(color: AppColors.cD1D1D1, height: 1),
                      Spacer(),
                      _saveButtonWidget(),
                      (30 + Utils.getPaddingBottom()).vGap,
                    ],
                  )))
        ],
      )),
    ));
  }

  Widget _editItemWidget({
    required String title,
    required String value,
    Widget? icon,
    required Function onTap,
  }) {
    return InkWell(
        onTap: () {
          onTap.call();
        },
        child: Container(
            height: 66.w,
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              children: [
                SizedBox(
                  width: 66.w,
                  child: Text(
                    title,
                    style: 14.w5(fontFamily: FontFamily.fOswaldRegular),
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: 12.w5(
                        color: AppColors.cA1A1A1,
                        fontFamily: FontFamily.fRobotoRegular),
                  ),
                )),
                Container(
                    width: 15.w,
                    margin: EdgeInsets.only(left: 15.w),
                    alignment: Alignment.center,
                    child: icon ??
                        Image.asset(
                          Assets.commonUiCommonIconSystemJumpto,
                          width: 8.w,
                          color: AppColors.c666666,
                        ))
              ],
            )));
  }

  Widget _avatarWidget() {
    return Container(
        color: AppColors.cF2F2F2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 34.w, bottom: 24.w),
        child: MtInkWell(
            onTap: () async {
              await Get.bottomSheet(EditAvatarBottomsheet(),
                  isScrollControlled: true);
              setState(() {});
            },
            child: Container(
              width: 96.w,
              height: 96.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  ClipOval(
                    child: ImageWidget(
                      url: Utils.getAvatarUrl(HomeController
                              .to.userEntiry.teamLoginInfo!.team?.teamLogo ??
                          0),
                      width: 96.w,
                      height: 96.w,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconWidget(
                          icon: Assets.managerUiMangerNew212,
                          iconWidth: 12.w,
                          iconColor: AppColors.c666666,
                        ),
                      ))
                ],
              ),
            )));
  }

  Widget _saveButtonWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: MtInkWell(
          onTap: () {
            controller.saveEditData();
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.w)),
            height: 50.w,
            alignment: Alignment.center,
            child: Text(
              'SAVE',
              style: 23.w5(
                  color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
            ),
          )),
    );
  }
}
