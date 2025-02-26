/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-19 22:04:25
 * @LastEditTime: 2025-02-07 18:34:19
 */
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/match_success_new/match_success_new.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/matching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TeamBattlePage extends StatefulWidget {
  const TeamBattlePage({super.key});

  @override
  State<TeamBattlePage> createState() => _TeamBattlePageState();
}

class _TeamBattlePageState extends State<TeamBattlePage> {

  late TeamBattleController controller;
  /// todo test code
  bool loadData = false;
  @override
  void initState() {
    super.initState();
    if(!Get.isRegistered<TeamBattleController>()) {
      ///todo 测试代码，需删除
      controller = Get.put(TeamBattleController());
      controller.teamMatchV2().then((value) {
        loadData = true;
        if(mounted) {
          setState(() {});
        }
      }, onError: (e) {
        Get.delete<TeamBattleController>();
        Get.back();
        EasyLoading.showToast("MATCH FAILED");
      });
    }else {
      controller = Get.find();
      loadData = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<TeamBattleController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleController>(
      id: "team_battle",
      builder: (_) {
        /// todo test code
        if(!loadData){
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Obx(() {
          return Stack(
            alignment: Alignment.center,
            children: [
              if (controller.step.value == 1)
                const Matching()
              else if (controller.step.value == 2)
                // MatchSuccess(onCompleted: () {
                //   controller.nextStep();
                // })
                MatchSuccessNew(onEnd: (){
                  controller.nextStep();
                },)
              else
                // const BattleMain()
                TeamBattleV2Page()
            ],
          );
        });
      },
    );
  }
}
