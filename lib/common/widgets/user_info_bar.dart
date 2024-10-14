import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/user_entiry.dart';
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

///
///@auther gejiahui
///created at 2024/9/11/11:36

// class UserInfoBar extends StatelessWidget {
//   const UserInfoBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 11.w, bottom: 11.w),
//       child: Row(
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: 40.w,
//                 height: 40.w,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.w)),
//               ),
//               SizedBox(
//                 width: 34.w,
//                 height: 34.w,
//                 child: const CircularProgressIndicator(
//                   color: AppColors.cFF7954,
//                   backgroundColor: AppColors.ce5e5e5,
//                   value: .4,
//                   strokeWidth: 2,
//                 ),
//               ),
//               //todo
//               Image.asset(
//                 Assets.testTeamLogoPng,
//                 width: 27.w,
//               )
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 6.w),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "LV20",
//                       style:
//                           TextStyle(color: AppColors.cFF7954, fontSize: 12.sp),
//                     ),
//                     Container(
//                       // height: 12.w,
//                       // width: 66.w,
//                       constraints: BoxConstraints(minWidth: 66.w),
//                       margin: EdgeInsets.only(left: 9.w),
//                       padding: EdgeInsets.symmetric(horizontal: 2.w),
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(8.w)),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Image.asset(
//                             Assets.uiIconMoneyPng,
//                             width: 11.5.w,
//                           ),
//                           Text(
//                             "999k",
//                             style: TextStyle(
//                                 color: AppColors.cF2F2F2, fontSize: 10.sp),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 12.w,
//                       width: 66.w,
//                       margin: EdgeInsets.only(left: 3.w),
//                       padding: EdgeInsets.symmetric(horizontal: 2.w),
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(6.2)),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Image.asset(
//                             Assets.uiIconJettonPng,
//                             width: 10.w,
//                           ),
//                           Text(
//                             "999k",
//                             style: TextStyle(
//                                 color: AppColors.cF2F2F2, fontSize: 10.sp),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Text(
//                   "NEW YORK YANKEES",
//                   style: 21.w7(color: AppColors.cF2F2F2),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({super.key, this.title = "Title", this.enable = true});

  final String title;
  final bool enable;

  Widget iconText(int propId, int num) {
    return Container(
      width: 66.w,
      height: 16.w,
      alignment: Alignment.center,
      // constraints: BoxConstraints(minWidth: 66.w),
      // margin: EdgeInsets.only(left: 9.w),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageWidget(
            url: Utils.getIconUrl(propId),
            width: 12.w,
          ),
          Text(
            "${num < 1000 ? num : "${(num / 1000).toStringAsFixed(1)}k"}",
            style: TextStyle(color: AppColors.cF2F2F2, fontSize: 10.sp),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var homeCtrl = Get.find<HomeController>();

    return GetBuilder<HomeController>(
        id: "userInfo",
        builder: (_) {
          TeamLoginInfo info =
              homeCtrl.userEntiry.teamLoginInfo ?? TeamLoginInfo();
          var list = info.teamPropList ?? [];
          return Container(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 11.w),
            child: Row(
              children: [
                ///TODO
                InkWell(
                  onTap: () {
                    if (!enable) {
                      return;
                    }
                    _showDialog(context);
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
                Container(
                  width: 80.w,
                  height: 36.w,
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: list.map(
                      (e) {
                        var item = homeCtrl.getPropInfo(e.propId!);
                        return iconText(item?.propId ?? 0, e.num ?? 0);
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showDialog(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        context: Get.context!,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return TopDialog(title: title);
        });
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
