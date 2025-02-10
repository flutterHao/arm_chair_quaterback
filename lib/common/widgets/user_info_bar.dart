import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/clipper/daily_task_bar_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/clipper/title_bar_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/top_dialog.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({
    super.key,
    this.title = "Title",
    this.enable = true,
    this.routeId,
    this.showPop = false,
    this.onClickPop,
    this.canTapDailyTask = true,
  });

  final String title;
  final bool enable; //头像是否可点击显示弹框
  final int? routeId;
  final bool showPop;
  final GestureTapCallback? onClickPop;
  final bool canTapDailyTask;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: GetXBuilderIds.idGlobalUserEntityRefresh,
        builder: (controller) {
          TeamLoginInfo info =
              controller.userEntiry.teamLoginInfo ?? TeamLoginInfo();
          bool hasDailyTask = controller.ongoingTaskList.isNotEmpty;
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 47.w,
                width: double.infinity,
                color: AppColors.c000000,
                child: ClipPath(
                  clipper: TitleBarClipper(55.w),
                  child: Container(
                    color: AppColors.c262626,
                    child: ClipPath(
                      clipper: DailyTaskBarClipper(55.w),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color: hasDailyTask
                            ? AppColors.cFF7954
                            : AppColors.c262626,
                      ),
                    ),
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
                        showPop ? 0.hGap : 16.hGap,
                        if (showPop)
                          InkWell(
                            onTap: onClickPop ??
                                () {
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
                          )
                        else
                          InkWell(
                            onLongPress: () {
                              final List<String> servers = [
                                Address.personalDevUrl,
                                Address.personalDevUrl2,
                                Address.privateDevUrl,
                                Address.publicDevUrl,
                                Address.pubDevUrl,
                              ];
                              final List<String> wsServers = [
                                Address.wsPersonalDevUrl,
                                Address.wsPrivateDevUrl,
                                Address.wsPublicDevUrl,
                                Address.wsPubDevUrl,
                              ];
                              String current = HttpUtil().getUrl;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ServerSwitchDialog(
                                    servers: servers,
                                    currentServer: current,
                                    onServerChanged: (newServer) {
                                      var indexOf = servers.indexOf(newServer);
                                      HttpUtil().setUrl(newServer);
                                      WSInstance.setUrl(wsServers[indexOf]);
                                      WSInstance.close();
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
                                    url: Utils.getAvatarUrl(
                                        info.team?.teamLogo ?? 0),
                                    width: 36.w,
                                    height: 36.w,
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
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10.w)),
                    child: Builder(builder: (context) {
                      Widget child = SizedBox(
                        width: 55.w,
                        height: 43.w,
                        child: Stack(
                          children: [
                            IconWidget(
                              iconWidth: 20.w,
                              icon: Assets.commonUiCommonStatusBarMission01,
                              iconColor: hasDailyTask
                                  ? AppColors.c000000
                                  : AppColors.c686868,
                            ),
                            if (!hasDailyTask)
                              Positioned(
                                  bottom: 9.w,
                                  right: 10.w,
                                  child: IconWidget(
                                    iconWidth: 14.w,
                                    icon:
                                        Assets.commonUiCommonStatusBarMission02,
                                    iconColor: AppColors.c23E8A9,
                                  ))
                          ],
                        ),
                      );
                      if (canTapDailyTask) {
                        child = MtInkWell(
                          onTap: () {
                            Get.toNamed(RouteNames.mineDailyTask);
                          },
                          child: child,
                        );
                      }
                      return child;
                    }),
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
                IconWidget(
                    iconWidth: 17.w, icon: Assets.commonUiCommonIconCurrency02),
                2.hGap,
                AnimatedNum(
                  number: info.getCoin().toInt(),
                  textStyle: 12.w4(
                      color: AppColors.cF2F2F2,
                      height: 1,
                      fontFamily: FontFamily.fOswaldRegular),
                ),
                10.hGap,
                IconWidget(iconWidth: 20.w, icon: Assets.teamUiMoney02),
                2.hGap,
                AnimatedNum(
                  number: info.getMoney().toInt(),
                  isMoney: true,
                  milliseconds: 1000,
                  textStyle: 12.w4(
                      color: AppColors.cF2F2F2,
                      height: 1,
                      fontFamily: FontFamily.fOswaldRegular),
                )
                // Text(
                //   Utils.formatMoney(info.getMoney()),
                //   style: 12.w4(
                //       color: AppColors.cF2F2F2,
                //       height: 1,
                //       fontFamily: FontFamily.fOswaldRegular),
                // ),
              ],
            );
          } else {
            child = Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconText(Assets.commonUiCommonIconCurrency02,
                    Utils.formatChip(info.getCoin())),
                4.vGap,
                iconText(Assets.commonUiCommonProp05,
                    Utils.formatMoney(info.getMoney())),
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
    super.key,
    required this.servers,
    required this.currentServer,
    required this.onServerChanged,
  });

  @override
  Widget build(BuildContext context) {
    String getServerName(String serverUrl) {
      switch (serverUrl) {
        case Address.personalDevUrl:
          return '${Address.personalDevUrl}(本地yw)';
        case Address.personalDevUrl2:
          return '${Address.personalDevUrl}(本地yx)';
        case Address.privateDevUrl:
          return '${Address.privateDevUrl}(内网)';
        case Address.publicDevUrl:
          return '${Address.publicDevUrl}(外网)';
        case Address.pubDevUrl:
          return '${Address.pubDevUrl}(海外)';
        default:
          return '';
      }
    }

    return AlertDialog(
      title: InkWell(
          onTap: () {
            // launchUrl(currentServer);
          },
          child: const Text('切换服务器')),
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
