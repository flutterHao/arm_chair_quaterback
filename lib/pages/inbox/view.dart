/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-04 11:25:34
 * @LastEditTime: 2025-01-08 16:45:53
 */

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/pages/inbox/widgets/inbox_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      id: "inbox",
      builder: (_) {
        return Container(
          color: AppColors.cFFFFFF,
          child: const InboxList(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
