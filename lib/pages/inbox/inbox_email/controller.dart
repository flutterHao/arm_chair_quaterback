import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/award_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/entities/inbox_email_entity.dart';
import '../../../common/net/apis/inbox.dart';

class InboxEmailController extends GetxController {
  InboxEmailController();
  Rx<LoadDataStatus> loadingStatus = LoadDataStatus.loading.obs;
  RxList<InboxEmailMailList> emailList = <InboxEmailMailList>[].obs;

  /// 1:系统补发邮件，2：竞猜发奖邮件，3：赛季结算邮件，4：公告邮件
  int type = 1;
  late InboxMessageEntity inboxMessageEntity;
  // @override
  @override
  void onInit() {
    super.onInit();
    inboxMessageEntity = Get.arguments;
    switch (inboxMessageEntity.id) {
      case 5001:
        type = 3;
      case 4001:
        type = 2;
      case 1005:
        type = 1;
      default:
        type = 4;
    }
    initData();
  }

  @override
  void onClose() async {
    super.onClose();
    await initData();
    InboxController inboxController = Get.find();
    inboxController.messageList.forEach((element) {
      if (element.id == inboxMessageEntity.id) {
        element.noReadNum = emailList.where((e) => e.state == 0).length;
      }
    });
    inboxController.messageList.refresh();
  }

  String readMailId = '';
  Future initData() async {
    try {
      InboxEmailEntity res = (await InboxApi.getMailVOList()).firstWhere((element) => element.mailType == type);
      emailList.value = res.mailList;
      loadingStatus.value = LoadDataStatus.success;
    } catch (e) {
      loadingStatus.value = LoadDataStatus.noData;
    }
  }

  ///领取奖励
  void receiveMailAward(String mailIds) async {
    await InboxApi.receiveMailAward(mailIds);
    showTopToastDialog(
        needBg: false,
        child: Container(
            margin: EdgeInsets.only(top: 44.w),
            child: AwardWidget(image: Assets.managerUiManagerGift00, text: "YOU GOT 3  treasure chest".toUpperCase())));
    InboxEmailEntity res = (await InboxApi.getMailVOList()).firstWhere((element) => element.mailType == type);
    emailList.value = res.mailList;
  }

  void goView() {
    if (inboxMessageEntity.id == 4001) {
      Get.toNamed(RouteNames.picksPickRank);
    } else if (inboxMessageEntity.id == 5001) {
      Get.toNamed(RouteNames.seaonRankPage);
    }
  }
}
