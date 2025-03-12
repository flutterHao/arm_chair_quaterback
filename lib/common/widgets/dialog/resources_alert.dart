import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/jump_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///钞票或者筹码不足弹窗
///@auther gejiahui
///created at 2025/3/12/17:31

class ResourcesAlert {
  ///type : 1 筹码 2 钞票
  static show({int type=1}) {
    BottomTipDialog.showWithSound(
        context: Get.context!,
        builder: (context) {
          List<_ResourcesGetItem> list = [];
          if (type == 1) {
            list = [
              _ResourcesGetItem(Assets.commonUiCommonTabBottom04Off,
                  "Make a right pick can get lots of coins.", "/?tab=3"),
              _ResourcesGetItem(Assets.commonUiCommonIconTask,
                  "Finish Daily Task can get coins.", "/mine_daily_task"),
              _ResourcesGetItem(Assets.commonUiCommonTabBottom01Off,
                  "There some cion hide in news.", "/?tab=0"),
            ];
          } else {
            list = [
              _ResourcesGetItem(Assets.managerUiNewManger11,
                  "Start trainning can get lots of cash.", "/?tab=2&scrll=1"),
              _ResourcesGetItem(Assets.commonUiCommonIconTask,
                  "Finish Daily Task can get cash.", "/?tab=0"),
            ];
          }
          return _ResourcesAlertWidget(type: type, list: list);
        });
  }
}

class _ResourcesAlertWidget extends StatefulWidget {
  const _ResourcesAlertWidget(
      {super.key, required this.list, required this.type});

  final List<_ResourcesGetItem> list;
  final int type;

  @override
  State<_ResourcesAlertWidget> createState() => _ResourcesAlertWidgetState();
}

class _ResourcesAlertWidgetState extends State<_ResourcesAlertWidget> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return buildWidget(widget.type, widget.list);
  }

  Container buildWidget(int type, List<_ResourcesGetItem> list) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          DialogTopBtn(),
          25.vGap,
          IconWidget(
            iconWidth: 62.w,
            icon: Assets.commonUiCommonIconSystemDanger,
            iconColor: AppColors.c000000,
          ),
          15.vGap,
          Text(
            "RESOURCES ALERT",
            style: 27.w5(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
          6.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sorry,you don’t have enough ",
                style: 14.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular,
                ),
              ),
              Text(
                type == 2 ? "CASH" : "COINS",
                style: 14.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoMedium,
                ),
              ),
              3.hGap,
              IconWidget(
                icon: type == 2
                    ? Assets.commonUiCommonProp05
                    : Assets.commonUiCommonIconCurrency02,
                iconWidth: 16.w,
              )
            ],
          ),
          25.vGap,
          Divider(
            color: AppColors.cD1D1D1,
            height: 1.w,
          ),
          ...List.generate(list.length, (index) {
            _ResourcesGetItem item = list[index];
            return MtInkWell(
              onTap: () => JumpUtils.goto(item.goUrl),
              child: Container(
                height: 64.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.cD1D1D1,
                  width: 1.w,
                ))),
                child: Row(
                  children: [
                    IconWidget(
                      icon: item.icon,
                      iconWidth: 20.w,
                    ),
                    8.hGap,
                    Expanded(
                      child: Text(
                        item.desc,
                        style: 16.w4(
                          color: AppColors.c262626,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular,
                        ),
                      ),
                    ),
                    20.vGap,
                    IconWidget(
                      icon: Assets.iconUiIconArrows04,
                      rotateAngle: -90,
                      iconWidth: 14.w,
                      iconColor: AppColors.c000000,
                    )
                  ],
                ),
              ),
            );
          }),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MtInkWell(
                onTap: () => setState(() {
                  select = !select;
                  if (select) {
                    ConfigStore.to.setResourceAlert(
                        DateTime.now().millisecondsSinceEpoch);
                  } else {
                    ConfigStore.to.setResourceAlert(0);
                  }
                }),
                child: Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                      color:
                          select ? AppColors.cFF7954 : AppColors.cTransparent,
                      border: Border.all(
                        color: select ? AppColors.cFF7954 : AppColors.c898989,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(4.w)),
                ),
              ),
              11.hGap,
              Text(
                "Do no show the tips today.",
                style: 12.w4(
                  color: AppColors.c898989,
                  fontFamily: FontFamily.fRobotoRegular,
                  height: 1,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _ResourcesGetItem {
  final String icon;
  final String desc;
  final String goUrl;

  _ResourcesGetItem(this.icon, this.desc, this.goUrl);
}
