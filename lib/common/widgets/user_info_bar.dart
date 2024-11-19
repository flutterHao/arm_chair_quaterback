import 'dart:developer';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_prop_list.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/clipper/title_bar_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/top_dialog.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar(
      {super.key,
      this.title = "Title",
      this.enable = true,
      this.routeId,
      this.showPop = false});

  final String title;
  final bool enable; //头像是否可点击显示弹框
  final int? routeId;
  final bool showPop;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: GetXBuilderIds.idGlobalUserEntityRefresh,
        builder: (controller) {
          TeamLoginInfo info =
              controller.userEntiry.teamLoginInfo ?? TeamLoginInfo();
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 47.w,
                width: double.infinity,
                color: AppColors.c000000,
                child: ClipPath(
                  clipper: TitleBarClipper(),
                  child: Container(
                    color: AppColors.c262626,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (showPop)
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 36.w,
                                height: 36.w,
                                margin: EdgeInsets.only(left: 15.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36.w),
                                  border: Border.all(
                                    color: AppColors.cFFFFFF.withOpacity(0.3),
                                  ),
                                ),
                                child: IconWidget(
                                  iconWidth: 21.5.w,
                                  iconHeight: 18.5.w,
                                  icon: Assets.iconIconBack,
                                  iconColor: AppColors.cFFFFFF,
                                )),
                          ),
                        showPop ? 12.hGap : 16.hGap,
                        InkWell(
                          onLongPress: () {
                            final List<String> servers = [
                              Address.personalDevUrl,
                              Address.privateDevUrl,
                              Address.publicDevUrl,
                            ];
                            String current = HttpUtil().getUrl;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ServerSwitchDialog(
                                  servers: servers,
                                  currentServer: current,
                                  onServerChanged: (newServer) {
                                    HttpUtil().setUrl(newServer);
                                    HomeController.to.login();
                                  },
                                );
                              },
                            );
                          },
                          onTap: () {
                            if (!enable) {
                              Navigator.pop(context);
                              return;
                            }
                            _showDialog(context, routeId);
                          },
                          child: Container(
                            width: 36.w,
                            height: 36.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.cFFFFFF),
                                borderRadius: BorderRadius.circular(18.w)),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.w),
                                child: UserAvaterWidget(
                                  url: Utils.getAvaterUrl(
                                      info.team?.teamLogo ?? 0),
                                  width: 35.w,
                                  height: 35.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        11.hGap,
                        MoneyAndCoinWidget(
                          home: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 55.w,
                    height: 43.w,
                    child: Stack(
                      children: [
                        IconWidget(
                            iconWidth: 20.w,
                            icon: Assets
                                .commonUiCommonStatusBarNoticeOn /* commonUiCommonStatusBarNoticeOff*/), //todo 根据数量显示图标
                        Positioned(
                            right: 10.w,
                            child: Container(
                              width: 16.w,
                              height: 16.w,
                              decoration: BoxDecoration(
                                  color: AppColors.c000000,
                                  borderRadius: BorderRadius.circular(8.w)),
                              child: Center(
                                  child: Text(
                                "3",
                                style: 12.w4(color: AppColors.cFF7954),
                              )),
                            ))
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  void _showDialog(BuildContext context, int? routeId) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        context: context,
        useRootNavigator: false,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return TopDialog(title: title, routeId: routeId);
        });
  }
}

class MoneyAndCoinWidget extends StatelessWidget {
  ///不要加const，会导致widget不刷新
  MoneyAndCoinWidget({super.key, this.home = false});

  final bool home;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: GetXBuilderIds.idMoneyAndCoinWidget,
        builder: (controller) {
          TeamLoginInfo info =
              controller.userEntiry.teamLoginInfo ?? TeamLoginInfo();
          var child;
          if (home) {
            child = Row(
              children: [
                IconWidget(iconWidth: 21.w, icon: Assets.iconUiIconJetton),
                4.hGap,
                Text(
                  Utils.formatChip(info.getCoin()),
                  style: 16.w4(color: AppColors.cF2F2F2, height: 1),
                ),
                15.hGap,
                IconWidget(iconWidth: 24.w, icon: Assets.teamUiMoney02),
                4.hGap,
                Text(
                  Utils.formatMoney(info.getMoney()),
                  style: 16.w4(color: AppColors.cF2F2F2, height: 1),
                ),
                13.hGap,
                Container(
                  height: 24.w,
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: IconWidget(
                    iconWidth: 12.w,
                    icon: Assets.iconUiIconPlus,
                    iconColor: AppColors.cFF7954,
                  ), //todo 功能待定
                )
              ],
            );
          } else {
            child = Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconText(Assets.iconProp102, Utils.formatChip(info.getCoin())),
                4.vGap,
                iconText(
                    Assets.iconUiIconMoney, Utils.formatMoney(info.getMoney())),
              ],
            );
          }
          return Container(
            alignment: Alignment.centerRight,
            child: child,
          );
        });
  }

  Widget iconText(String icon, String num) {
    return Container(
      width: 66.w,
      height: 16.w,
      alignment: Alignment.center,
      // constraints: BoxConstraints(minWidth: 66.w),
      padding: EdgeInsets.only(left: 4.w, right: 9.w),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconWidget(
            iconWidth: 12.w,
            icon: icon,
            iconColor: AppColors.cFFFFFF,
          ),
          Text(
            num,
            style: TextStyle(color: AppColors.cF2F2F2, fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}

class ServerSwitchDialog extends StatelessWidget {
  final List<String> servers;
  final String currentServer;
  final ValueChanged<String> onServerChanged;

  const ServerSwitchDialog({
    Key? key,
    required this.servers,
    required this.currentServer,
    required this.onServerChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getServerName(String serverUrl) {
      switch (serverUrl) {
        case Address.personalDevUrl:
          return '${Address.personalDevUrl}(本地)';
        case Address.privateDevUrl:
          return '${Address.privateDevUrl}(内网)';
        case Address.publicDevUrl:
          return '${Address.publicDevUrl}(外网)';

        default:
          return '';
      }
    }

    return AlertDialog(
      title: const Text('切换服务器'),
      content: SingleChildScrollView(
        child: ListBody(
          children: servers.map((server) {
            return RadioListTile<String>(
              title: Text(getServerName(server)),
              value: server,
              groupValue: currentServer,
              onChanged: (value) {
                if (value != null) {
                  onServerChanged(value);
                  Navigator.of(context).pop(); // 关闭弹出框
                }
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
