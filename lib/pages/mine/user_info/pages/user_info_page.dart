import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/widgets/avatar_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/entities/user_entity/team.dart';

class UserInfoDetailPage extends StatefulWidget {
  const UserInfoDetailPage({super.key});

  @override
  State<UserInfoDetailPage> createState() => _UserInfoDetailPageState();
}

class _UserInfoDetailPageState extends State<UserInfoDetailPage> {
  String signature = '';
  int birthday = 0;
  String teamName = '';
  @override
  initState() {
    super.initState();
    Team? team = HomeController.to.userEntiry!.teamLoginInfo!.team!;
    signature = team.signature ?? '';
    birthday = team.birthday ?? 0;
    teamName = team.teamName ?? '-';
  }

  _showPicker() {
    Get.bottomSheet(
      WidgetPage(),
      isScrollControlled: true,
    );
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
              child: Column(
            children: [
              Container(
                  height: 66.w,
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 66.w,
                        child: Text(
                          'UID',
                          style: 14.w5(fontFamily: FontFamily.fOswaldRegular),
                        ),
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${HomeController.to.userEntiry.teamLoginInfo!.team!.accountId}',
                          style: 12.w5(
                              color: AppColors.cA1A1A1,
                              fontFamily: FontFamily.fRobotoRegular),
                        ),
                      )),
                      Container(
                          width: 15.w,
                          margin: EdgeInsets.only(left: 15.w),
                          alignment: Alignment.center,
                          child: Image.asset(
                            Assets.managerUiMangerNew213,
                            width: 15.w,
                            color: AppColors.c666666,
                          ))
                    ],
                  )),
              Divider(color: AppColors.cD1D1D1, height: 1),
              InkWell(
                onTap: () {
                  _showPicker();
                },
                child: Container(
                    height: 66.w,
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 66.w,
                          child: Text(
                            'Birthday',
                            style: 14.w5(fontFamily: FontFamily.fOswaldRegular),
                          ),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${HomeController.to.userEntiry.teamLoginInfo!.team!.joinLeagueTime}',
                            style: 12.w5(
                                color: AppColors.cA1A1A1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                        )),
                        Container(
                            width: 15.w,
                            margin: EdgeInsets.only(left: 15.w),
                            alignment: Alignment.center,
                            child: Image.asset(
                              Assets.commonUiCommonIconSystemJumpto,
                              width: 8.w,
                              color: AppColors.c666666,
                            ))
                      ],
                    )),
              ),
              Divider(color: AppColors.cD1D1D1, height: 1),
              Container(
                  height: 66.w,
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 66.w,
                        child: Text(
                          'Signature',
                          style: 14.w5(fontFamily: FontFamily.fOswaldRegular),
                        ),
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'l have had my invitation to this world’s festival and thus my l',
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
                          child: Image.asset(
                            Assets.commonUiCommonIconSystemJumpto,
                            width: 8.w,
                            color: AppColors.c666666,
                          ))
                    ],
                  )),
              Divider(color: AppColors.cD1D1D1, height: 1),
              Spacer(),
              _saveButtonWidget(),
              (30 + Utils.getPaddingBottom()).vGap,
            ],
          ))
        ],
      )),
    ));
  }

  Widget _avatarWidget() {
    return Container(
        color: AppColors.cF2F2F2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 34.w, bottom: 24.w),
        child: MtInkWell(
            onTap: () {
              Get.bottomSheet(AvatarBottomsheet(), isScrollControlled: true);
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
          onTap: () {},
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

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 375.w + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogTopBtn(),
          16.vGap,
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: DatePickerWidget(
              looping: false,
              firstDate: DateTime(1960, 1, 1),
              lastDate: DateTime.now(),
              initialDate: DateTime(2000, 1, 1),
              dateFormat: "yyyy/MM/dd",
              locale: DatePicker.localeFromString('en'),
              onChange: (DateTime newDate, _) {
                _selectedDate = newDate;
              },
              pickerTheme: DateTimePickerTheme(
                pickerHeight: 260.w,
                itemTextStyle: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                dividerColor: AppColors.cD2D2D2,
                dividerThickness: 1,
                diameterRatio: 5,
                dividerSpacing: 0,
                squeeze: 0.8,
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: MtInkWell(
                onTap: () {
                  print(_selectedDate);
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.w)),
                  height: 50.w,
                  alignment: Alignment.center,
                  child: Text(
                    'confirm'.toUpperCase(),
                    style: 23.w5(
                        color: Colors.white,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                )),
          ),
          30.vGap,
        ],
      ),
    ));
  }
}
