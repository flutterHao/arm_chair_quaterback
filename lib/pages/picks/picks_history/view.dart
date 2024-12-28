import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class PicksHistoryPage extends GetView<PicksHistoryController> {
  const PicksHistoryPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PicksHistoryController>(
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            showPop: true,
          ),
          bodyWidget: Expanded(child: Obx((){
            if(controller.loadStatus.value != LoadDataStatus.success){
              return Center(
                child: LoadStatusWidget(
                  loadDataStatus: controller.loadStatus.value,
                ),
              );
            }
            return DefaultTabController(
              length: 2,
              child: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverPersistentHeader(delegate: FixedHeightSliverHeaderDelegate(child: Container(
                    height: 144.w,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 34.w),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.c262626,
                            AppColors.c525252
                          ])
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -50.w,
                            bottom: -50.w,
                            child: IconWidget(iconWidth: 200.w, icon: Assets.testTestTeamLogo)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            21.vGap,
                            Row(
                              children: [
                                IconWidget(iconWidth: 15.w, icon: Assets.commonUiCommonIconCurrency02),
                                4.hGap,
                                Text("AMOUNT WIN",style: 12.w4(
                                  color: AppColors.cFFFFFF.withOpacity(0.3),
                                  height: 1,
                                  fontFamily: Assets.fontsRobotoRegular
                                ),)
                              ],
                            ),
                            10.vGap,
                            Text("${controller.teamSimpleEntity.betCoin}",style: 45.w7(
                              color: AppColors.cFFFFFF,
                              fontFamily: Assets.fontsOswaldBold,
                              height: 1
                            ),),
                            24.vGap,
                            Row(
                              children: [
                                Text("CONTESTS WON: ",style: 12.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoMedium
                                ),),
                                Text("${controller.teamSimpleEntity.winCount}",style: 16.w5(
                                    color: AppColors.cFFFFFF,
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoMedium
                                ),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ), height: 144.w))
                ];
              }, body: Container()),
            );
          })),
        );
      },
    );
  }
}
