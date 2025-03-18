import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
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
          Container(
            color: AppColors.cF2F2F2,
            alignment: Alignment.center,
            child: Column(
              children: [
                34.vGap,
                Container(
                  width: 96.w,
                  height: 96.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: ClipOval(
                      child: UserAvatarWidget(
                        url: Utils.getAvatarUrl(HomeController
                                .to.userEntiry.teamLoginInfo!.team?.teamLogo ??
                            0),
                        width: 96.w,
                        height: 96.w,
                      ),
                    ),
                  ),
                ),
                16.vGap,
                // Row(
                //   children: [
                //     Container(
                //       color: Colors.pink,
                //       // width: 220.w,
                //       child: TextField(
                //           controller: TextEditingController(text: teamName),
                //           decoration: InputDecoration(
                //             border: InputBorder.none, // 设置边框为 none
                //             hintText: "请输入文本",
                //           ),
                //           style: 20.w5(
                //               fontFamily: FontFamily.fOswaldRegular, height: 1),
                //           onChanged: (value) => teamName = value),
                //     ),
                //     8.hGap,
                //     IconWidget(
                //       icon: Assets.managerUiMangerNew213,
                //       iconColor: AppColors.c666666.withOpacity(.4),
                //       iconWidth: 15.w,
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${HomeController.to.userEntiry.teamLoginInfo!.team!.teamName}',
                      style: 20
                          .w5(fontFamily: FontFamily.fOswaldRegular, height: 1),
                    ),
                  ],
                ),
                34.vGap
              ],
            ),
          ),
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
                      Flexible(
                          child: Text(
                        '${HomeController.to.userEntiry.teamLoginInfo!.team!.accountId}',
                        style: 12.w5(
                            color: AppColors.cA1A1A1,
                            fontFamily: FontFamily.fRobotoRegular),
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
                            child: Text(
                          '${HomeController.to.userEntiry.teamLoginInfo!.team!.joinLeagueTime}',
                          style: 12.w5(
                              color: AppColors.cA1A1A1,
                              fontFamily: FontFamily.fRobotoRegular),
                        )),
                        IconWidget(
                          icon: Assets.commonUiCommonIconSystemJumpto,
                          iconColor: AppColors.c666666,
                          iconWidth: 7.w,
                        )
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
                          child: Text(
                        'l have had my invitation to this world’s festival and thus my l',
                        style: 12.w5(
                            color: AppColors.cA1A1A1,
                            fontFamily: FontFamily.fRobotoRegular),
                      )),
                      20.hGap,
                      IconWidget(
                        icon: Assets.managerUiMangerNew213,
                        iconColor: AppColors.c666666.withOpacity(.4),
                        iconWidth: 15.w,
                      )
                    ],
                  )),
              Divider(color: AppColors.cD1D1D1, height: 1),
              42.vGap,
              _saveButtonWidget(),
              24.vGap,
              _bottomUserInfoWidget(),
            ],
          ))
        ],
      )),
    ));
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

  Widget _bottomUserInfoWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MtInkWell(
            child: Text(
          'CONNECT US',
          style: TextStyle(
              fontSize: 10.sp,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.c0A66D7,
              color: AppColors.c0A66D7,
              fontFamily: FontFamily.fRobotoRegular),
        )),
        Container(
            color: AppColors.cD1D1D1,
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            width: 1,
            height: 10.w),
        MtInkWell(
            child: Text(
          'PRIVACY POLICY',
          style: TextStyle(
              fontSize: 10.sp,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.c0A66D7,
              color: AppColors.c0A66D7,
              fontFamily: FontFamily.fRobotoRegular),
        )),
        Container(
            color: AppColors.cD1D1D1,
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            width: 1,
            height: 10.w),
        MtInkWell(
            child: Text(
          'TEAM OF USE',
          style: TextStyle(
              fontSize: 10.sp,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.c0A66D7,
              color: AppColors.c0A66D7,
              fontFamily: FontFamily.fRobotoRegular),
        )),
      ],
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
