import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/services/storage.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/controller.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InboxSettingDialog extends StatefulWidget {
  const InboxSettingDialog({this.inboxMessageEntity, super.key});
  final InboxMessageEntity? inboxMessageEntity;

  @override
  State<InboxSettingDialog> createState() => _InboxSettingDialogState();
}

class _InboxSettingDialogState extends State<InboxSettingDialog> {
  bool topChat = false;
  InboxController inboxController = Get.find<InboxController>();
  InboxEmailController inboxEmailController = Get.find();
  bool doNotDisturb = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.inboxMessageEntity != null) {
      doNotDisturb = StorageService.to
          .getList('locatDoNotDisturb')
          .map((e) => int.parse(e))
          .toList()
          .contains(widget.inboxMessageEntity!.id);
      topChat = StorageService.to
          .getList('locatTopChatList')
          .map((e) => int.parse(e))
          .toList()
          .contains(widget.inboxMessageEntity!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(children: [
        const DialogTopBtn(),
        10.vGap,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(
            'Setting',
            style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        10.vGap,
        Divider(color: AppColors.cE6E6E6, height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 64.w,
                child: Row(
                  children: [
                    Text(
                      'Top chat',
                      style: 16.w5(
                          fontFamily: FontFamily.fOswaldMedium,
                          color: AppColors.c262626),
                    ),
                    Spacer(),
                    Switch(
                        value: topChat,
                        activeColor: AppColors.cFFFFFF,
                        activeTrackColor: AppColors.c000000,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: AppColors.cB3B3B3,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // splashRadius: .0,
                        onChanged: (value) {
                          if (widget.inboxMessageEntity != null) {
                            inboxController
                                .itemTopChat(widget.inboxMessageEntity!);
                          }
                          setState(() {
                            topChat = value;
                          });
                        }),
                  ],
                ),
              ),
              Divider(color: AppColors.cE6E6E6, height: 1),
              SizedBox(
                height: 64.w,
                child: Row(
                  children: [
                    Text(
                      'Mask message',
                      style: 16.w5(
                          fontFamily: FontFamily.fOswaldMedium,
                          color: AppColors.c262626),
                    ),
                    Spacer(),
                    Switch(
                        value: doNotDisturb,
                        activeColor: AppColors.cFFFFFF,
                        activeTrackColor: AppColors.c000000,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: AppColors.cB3B3B3,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          if (widget.inboxMessageEntity != null) {
                            inboxController
                                .itemDoNotDisturb(widget.inboxMessageEntity!);
                          }
                          setState(() {
                            doNotDisturb = value;
                          });
                        }),
                  ],
                ),
              ),
              Divider(color: AppColors.cE6E6E6, height: 1),
              // MtInkWell(
              //     child: SizedBox(
              //   height: 64.w,
              //   child: Row(
              //     children: [
              //       Text(
              //         'Complaint',
              //         style: 16.w5(
              //             fontFamily: FontFamily.fOswaldMedium,
              //             color: AppColors.c262626),
              //       ),
              //       Spacer(),
              //       IconWidget(
              //         icon: Assets.commonUiCommonIconSystemJumpto,
              //         iconWidth: 8.w,
              //         iconColor: Colors.black,
              //       )
              //     ],
              //   ),
              // )),
              // Divider(color: AppColors.cE6E6E6, height: 1),
              MtInkWell(
                  onTap: () {
                    if (widget.inboxMessageEntity != null) {
                      inboxController.deteleMail(widget.inboxMessageEntity!);
                      inboxEmailController.emailList.clear();
                    }
                    Get.back();
                  },
                  child: SizedBox(
                    height: 64.w,
                    child: Row(
                      children: [
                        Text(
                          'Clear message content',
                          style: 16.w5(
                              fontFamily: FontFamily.fOswaldMedium,
                              color: AppColors.cE71629),
                        ),
                        Spacer(),
                        IconWidget(
                          icon: Assets.commonUiCommonIconSystemJumpto,
                          iconWidth: 8.w,
                          iconColor: Colors.black,
                        )
                      ],
                    ),
                  )),
              Divider(color: AppColors.cE6E6E6, height: 1),
            ],
          ),
        )
      ]),
    );
  }
}
