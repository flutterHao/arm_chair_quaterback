/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-09-27 18:08:51
 */
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamIndexController extends GetxController {
  TeamIndexController();

  RxDouble trainingLeft = 0.0.obs;
  RxDouble bettleRight = 0.0.obs;
  RxDouble myTeamTop = 566.0.h.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void showTeamTraining() {
    trainingLeft.value = -152.h;
    bettleRight.value = -163.h;
    myTeamTop.value = 16.h;
  }
}
