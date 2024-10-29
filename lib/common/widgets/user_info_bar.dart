import 'dart:developer';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/top_dialog.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar(
      {super.key, this.title = "Title", this.enable = true, this.routeId});

  final String title;
  final bool enable; //头像是否可点击显示弹框
  final int? routeId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: GetXBuilderIds.idGlobalUserEntityRefresh,
        builder: (controller) {
          TeamLoginInfo info =
              controller.userEntiry.teamLoginInfo ?? TeamLoginInfo();
          return Container(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 11.w),
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.w),
                  bottomRight: Radius.circular(16.w),
                )),
            child: Row(
              children: [
                InkWell(
                  onLongPress: (){
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
                    width: 80.w,
                    alignment: Alignment.centerLeft,
                    child: ImageWidget(
                        width: 36.w,
                        height: 36.w,
                        borderRadius: BorderRadius.circular(12.w),
                        url: Utils.getTeamUrl(info.team?.teamLogo ?? 0)),
                  ),
                ),
                Expanded(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: 19.w7(color: AppColors.cF2F2F2),
                )),
                MoneyAndCoinWidget(),
              ],
            ),
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
  MoneyAndCoinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: GetXBuilderIds.idMoneyAndCoinWidget,
        builder: (controller) {
          TeamLoginInfo info =
              controller.userEntiry.teamLoginInfo ?? TeamLoginInfo();
          var list = info.teamPropList
                  ?.where((e) => e.propId == 102 || e.propId == 103).toList();
          return Container(
            width: 80.w,
            height: 36.w,
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: list?.map(
                (e) {
                  return iconText(
                      e.propId == 102
                          ? Assets.uiIconMoneyPng
                          : Assets.uiIconJettonPng,
                      e.propId == 102 ? info.getMoney() : info.getCoin());
                },
              ).toList()??[],
            ),
          );
        });
  }

  Widget iconText(String icon, num num) {
    return Container(
      // width: 66.w,
      height: 16.w,
      alignment: Alignment.center,
      constraints: BoxConstraints(minWidth: 66.w),
      // margin: EdgeInsets.only(left: 9.w),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8.w)),
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
            Utils.formatMoney(num),
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
