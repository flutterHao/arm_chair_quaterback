import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/vertival_drag_back_widget.dart';

class AvatarBottomsheet extends StatefulWidget {
  const AvatarBottomsheet({super.key});

  @override
  State<AvatarBottomsheet> createState() => _AvatarBottomsheetState();
}

class _AvatarBottomsheetState extends State<AvatarBottomsheet> {
  ///默认头像id
  int defaultLogoId = 1;
  int currentLogoId = -1;
  @override
  initState() {
    super.initState();
    defaultLogoId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamLogo!;
  }

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 367.w + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogTopBtn(),
          10.vGap,
          Expanded(
              child: SizedBox(
                  // color: Colors.pink.withOpacity(.2),
                  // padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 14.w,
                      ),
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        return MtInkWell(
                            onTap: () {
                              setState(() {
                                currentLogoId = index + 1;
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.cFAFAFA,
                                        border: (index + 1) == defaultLogoId &&
                                                currentLogoId < 0
                                            ? Border.all(
                                                color: AppColors.c000000,
                                                width: 2)
                                            : currentLogoId == index + 1
                                                ? Border.all(
                                                    color: AppColors.c10A86A,
                                                    width: 2)
                                                : null,
                                        borderRadius:
                                            BorderRadius.circular(9.w)),
                                    child: ClipOval(
                                      child: ImageWidget(
                                        url: Utils.getAvatarUrl(index + 1),
                                        width: 70.w,
                                        height: 70.w,
                                      ),
                                    )),
                                Align(
                                    child: currentLogoId == index + 1
                                        ? Container(
                                            width: 32.w,
                                            height: 32.w,
                                            decoration: BoxDecoration(
                                              color: AppColors.c10A86A,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              color: AppColors.cFFFFFF,
                                              size: 20.w,
                                            ),
                                          )
                                        : SizedBox())
                              ],
                            ));
                      }))),
          16.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: MtInkWell(
                onTap: () async {
                  if (currentLogoId > 0) {
                    await UserApi.getupdateTeamLogo(teamLogo: currentLogoId);
                    HomeController.to.userEntiry.teamLoginInfo!.team!.teamLogo =
                        currentLogoId;

                    HomeController.to
                        .update([GetXBuilderIds.idGlobalUserEntityRefresh]);
                  }

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
