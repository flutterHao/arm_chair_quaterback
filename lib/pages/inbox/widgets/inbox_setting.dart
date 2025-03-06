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
                    CustomSwitch(
                      value: topChat,
                      width: 50.w,
                      height: 25.w,
                      activeColor: AppColors.c000000,
                      trackColor: AppColors.cB3B3B3,
                      onChanged: (value) {
                        if (widget.inboxMessageEntity != null) {
                          inboxController
                              .itemTopChat(widget.inboxMessageEntity!);
                        }
                        setState(() {
                          topChat = value;
                        });
                      },
                    ),
                    // Switch(
                    //     value: topChat,
                    //     activeColor: AppColors.cFFFFFF,
                    //     activeTrackColor: AppColors.c000000,
                    //     inactiveThumbColor: Colors.white,
                    //     inactiveTrackColor: AppColors.cB3B3B3,
                    //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //     onChanged: (value) {
                    //       if (widget.inboxMessageEntity != null) {
                    //         inboxController
                    //             .itemTopChat(widget.inboxMessageEntity!);
                    //       }
                    //       setState(() {
                    //         topChat = value;
                    //       });
                    //     }),
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
                    CustomSwitch(
                        value: doNotDisturb,
                        width: 50.w,
                        height: 25.w,
                        activeColor: AppColors.c000000,
                        trackColor: AppColors.cB3B3B3,
                        onChanged: (value) {
                          if (widget.inboxMessageEntity != null) {
                            inboxController
                                .itemDoNotDisturb(widget.inboxMessageEntity!);
                          }
                          setState(() {
                            doNotDisturb = value;
                          });
                        }),
                    // Switch(
                    //     value: doNotDisturb,
                    //     activeColor: AppColors.cFFFFFF,
                    //     activeTrackColor: AppColors.c000000,
                    //     inactiveThumbColor: Colors.white,
                    //     inactiveTrackColor: AppColors.cB3B3B3,
                    //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //     onChanged: (value) {
                    //       if (widget.inboxMessageEntity != null) {
                    //         inboxController
                    //             .itemDoNotDisturb(widget.inboxMessageEntity!);
                    //       }
                    //       setState(() {
                    //         doNotDisturb = value;
                    //       });
                    //     }),
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

class CustomSwitch extends StatefulWidget {
  final bool value; // 当前开关的状态
  final ValueChanged<bool> onChanged; // 开关状态改变时的回调函数
  final Color activeColor; // 开关打开时的颜色
  final Color trackColor; // 开关关闭时的背景颜色
  final double width; // 开关的宽度
  final double height; // 开关的高度

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.trackColor,
    this.width = 40, // 默认宽度
    this.height = 20, // 默认高度
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.value ? 1.0 : 0.0, // 根据初始状态设置动画进度
    );
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationController.animateTo(widget.value ? 1.0 : 0.0); // 当状态改变时更新动画
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value); // 切换状态
        _animationController.animateTo(widget.value ? 1.0 : 0.0); // 切换时触发动画
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width, // 使用设置的宽度
        height: widget.height, // 使用设置的高度
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height), // 设置圆角
          color:
              widget.value ? widget.activeColor : widget.trackColor, // 根据状态切换颜色
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut, // 滑动的动画曲线
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft, // 滑块的位置
          child: Container(
            width: widget.height - (widget.height / 5), // 滑块的宽度
            height: widget.height - (widget.height / 5), // 滑块的高度
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // 滑块是一个圆形
              color: Colors.white, // 滑块颜色
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // 销毁动画控制器
    super.dispose();
  }
}
