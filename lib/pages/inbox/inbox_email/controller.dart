import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
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
  RxList<InboxEmailEntity> emailList = <InboxEmailEntity>[].obs;
  initData() async {
    emailList.value = await PicksApi.getInBoxEmailList();
    loadingStatus.value = LoadDataStatus.success;
  }

  void receiveMailAward(String mailIds) async {
    showTopToastDialog(
        needBg: false,
        child: Container(
            margin: EdgeInsets.only(top: 44.w),
            child: AwardWidget(
                image: Assets.managerUiManagerGift00,
                text: "YOU GOT 3  treasure chest".toUpperCase())));
    await PicksApi.receiveMailAward(mailIds);
    emailList.value = await PicksApi.getInBoxEmailList();
  }

  // @override
  @override
  void onInit() {
    super.onInit();
    initData();
  }
}
