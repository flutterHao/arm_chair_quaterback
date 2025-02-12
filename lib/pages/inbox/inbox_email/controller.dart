import 'dart:math';

import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/award_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/entities/inbox_email_entity.dart';

class InboxEmailController extends GetxController {
  InboxEmailController();
  Rx<LoadDataStatus> loadingStatus = LoadDataStatus.loading.obs;
  RxList<InboxEmailMailList> emailList = <InboxEmailMailList>[].obs;

  List titleList = ['System Mail', 'Pick Ranks', 'Manager Ranks', 'Community'];

  /// 1:系统邮件，2：竞猜发奖邮件，3：赛季结算邮件，4：公告邮件
  int type = 1;
  String title = '';
  // @override
  @override
  void onInit() {
    super.onInit();
    type = 0;
    title = titleList[0];
    initData();
  }

  initData() async {
    try {
      InboxEmailEntity res = (await PicksApi.getMailVOList())
          .firstWhere((element) => element.mailType == type);
      emailList.value = res.mailList;
      loadingStatus.value = LoadDataStatus.success;
    } catch (e) {
      loadingStatus.value = LoadDataStatus.noData;
    }
  }

  ///领取奖励
  void receiveMailAward(String mailIds) async {
    showTopToastDialog(
        needBg: false,
        child: Container(
            margin: EdgeInsets.only(top: 44.w),
            child: AwardWidget(
                image: Assets.managerUiManagerGift00,
                text: "YOU GOT 3  treasure chest".toUpperCase())));
    await PicksApi.receiveMailAward(mailIds);
    InboxEmailEntity res = (await PicksApi.getMailVOList())
        .firstWhere((element) => element.mailType == type);
    emailList.value = res.mailList;
  }

  void goView() {
    if (type == 2) {
      Get.toNamed(RouteNames.picksPickRank);
    } else if (type == 3) {
      Get.toNamed(RouteNames.seaonRankPage);
    }
  }
}
