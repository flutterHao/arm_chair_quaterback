import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectTeamPage extends GetView<SeasonPassController> {
  const SelectTeamPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              bottom: -0,
              right: 0,
              left: 0,
              child: IconWidget(icon: Assets.managerUiManagerBattltpass01),
            ),
            Container(
              height: 126.w,
              // color: AppColors.c163569,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 22.w, right: 34.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.vGap,
                  Text(
                    'SELECT A TEAM',
                    style: 40.w5(
                        height: .8,
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                  14.vGap,
                  Text(
                    'Complete the season mission and sign the team’s players.',
                    style: 16.w4(
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fRobotoRegular),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 5.w,
              right: 32.w,
              left: 16.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(height: 1, color: AppColors.c2172BD),
                  Positioned(
                      top: -40.w,
                      left: 0,
                      child: Container(
                          width: 1, height: 40.w, color: AppColors.c2172BD))
                ],
              ),
            ),
          ],
        ),
        Expanded(
            child: Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12.w,
                  crossAxisSpacing: 12.w,
                  mainAxisExtent: 104.w),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              itemCount: controller.teamDefine.length,
              itemBuilder: (context, index) {
                var teamId = controller.teamDefine[index].id;
                return MtInkWell(
                    onTap: () {
                      Get.toNamed(RouteNames.battlePassPlayer,
                          arguments: teamId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Column(children: [
                        9.vGap,
                        Container(
                            // color: Colors.pink.withOpacity(.1),
                            child: ImageWidget(
                          url: Utils.getTeamUrl(teamId),
                          width: 64.w,
                          height: 64.w,
                        )),
                        3.vGap,
                        Text(
                          Utils.getTeamInfo(teamId).shortEname,
                          style: 12.w5(
                              height: .8,
                              color: AppColors.cB2B2B2,
                              fontFamily: FontFamily.fOswaldRegular),
                        ),
                      ]),
                    ));
              }),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: GetBuilder<SeasonPassController>(
      init: SeasonPassController(),
      id: "season_pass",
      builder: (_) {
        return BlackAppWidget(
          UserInfoBar(showPop: true),
          bodyWidget: Expanded(child: _buildView()),
        );
      },
    ));
  }
}
