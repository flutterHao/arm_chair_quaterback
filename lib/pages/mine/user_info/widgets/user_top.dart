import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/pages/user_info_page.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserTopWidget extends StatefulWidget {
  const UserTopWidget({super.key});

  @override
  State<UserTopWidget> createState() => _UserTopWidgetState();
}

class _UserTopWidgetState extends State<UserTopWidget> {
  @override
  Widget build(BuildContext context) {
    var team = HomeController.to.userEntiry.teamLoginInfo!.team;
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.vGap,
                    ClipOval(
                      child: UserAvatarWidget(
                        url: Utils.getAvatarUrl(team?.teamLogo ?? 0),
                        width: 74.w,
                        height: 74.w,
                      ),
                    ),
                    10.vGap,
                    Text(
                      "Hi,I’m ${team!.teamName}",
                      style: 21
                          .w5(fontFamily: FontFamily.fOswaldRegular, height: 1),
                    ),
                    8.vGap,
                    Text(
                      "Joined in 2025",
                      style: 16.w5(
                          fontFamily: FontFamily.fRobotoRegular,
                          height: 1,
                          color: AppColors.c999999),
                    ),
                    30.vGap,
                    Divider(color: AppColors.cE6E6E6, height: 1),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UID",
                            style: 16.w5(
                                fontFamily: FontFamily.fOswaldRegular,
                                height: 1),
                          ),
                          8.vGap,
                          Text(
                            "123456789",
                            style: 14.w5(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 1,
                                color: AppColors.c999999),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColors.cE6E6E6, height: 1),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Birthday".toUpperCase(),
                            style: 16.w5(
                                fontFamily: FontFamily.fOswaldRegular,
                                height: 1),
                          ),
                          8.vGap,
                          Text(
                            "2003-02-02",
                            style: 14.w5(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 1,
                                color: AppColors.c999999),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColors.cE6E6E6, height: 1),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Signature".toUpperCase(),
                            style: 16.w5(
                                fontFamily: FontFamily.fOswaldRegular,
                                height: 1),
                          ),
                          8.vGap,
                          Text(
                            "Stone of Perseverance: My signature is like a stone of persever",
                            style: 14.w5(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 1,
                                color: AppColors.c999999),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
              top: 16.w,
              right: 0,
              child: MtInkWell(
                onTap: () async {
                  await Get.to(UserInfoDetailPage());
                  setState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "edit".toUpperCase(),
                      style: 14
                          .w5(fontFamily: FontFamily.fOswaldMedium, height: 1),
                    ),
                    8.hGap,
                    IconWidget(
                      icon: Assets.commonUiCommonIconSystemJumpto,
                      iconWidth: 7.w,
                      iconColor: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
