import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/girl_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_gift_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/query_girls_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/user_entiry.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/girl.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/low_resources_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:get/get.dart';

class TeamGiftController extends GetxController {
  TeamGiftController();
  RxList<GirlGiftDefineEntity> girlGiftDefineList = RxList();
  Rx<GirlDefineEntity> gGirlDefine = GirlDefineEntity().obs;
  RxBool sendGift = false.obs;
  int giftType = 0;

  UserEntity userEntiry = UserEntity();
  Rx<QueryGirlsEntity> queryGirlDefine = QueryGirlsEntity().obs;
  initData() async {
    HomeController homeController = Get.find();
    userEntiry = homeController.userEntiry;
    girlGiftDefineList.value = await CacheApi.getGirlGiftDefine();
    List<GirlDefineEntity> girlDefineList = await CacheApi.getGirlDefine();
    List<QueryGirlsEntity> queryGirlDefineList = await GirlApi.getQueryGirls();
    queryGirlDefine.value = queryGirlDefineList[0];
    final beautyController = Get.find<BeautyController>();
    gGirlDefine.value = girlDefineList[beautyController.beautyIndex.value];
    giftType = gGirlDefine.value.type - 1;
  }

  @override
  void onInit() {
    super.onInit();

    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future sendGiftClick({required int girlId, required int giftId, required List<String> costList}) async {
    if (costList[1] == '102') {
      if (userEntiry.teamLoginInfo!.getMoney().toInt() < int.parse(costList[2])) {
        LowResourcesBottomsheet.show(ResourceType.cash);
        return;
      }
    } else if (costList[1] == '103') {
      if (userEntiry.teamLoginInfo!.getCoin().toInt() < int.parse(costList[2])) {
        LowResourcesBottomsheet.show(ResourceType.coins);
        return;
      }
    }
    var givingGiftsEntity = await GirlApi.getGivingGifts(girlId: girlId, giftId: giftId);
    queryGirlDefine.value.intimacyLevel = givingGiftsEntity.intimacyLevel;
    sendGift.value = true;
    timeCountDown(givingGiftsEntity.buffEndTime);
    HomeController homeController = Get.find();
    await homeController.refreshMoneyCoinWidget();
    userEntiry = homeController.userEntiry;
    update(['team_gift']);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Timer? _timer;
  RxInt gameStartTimesCountDown = 0.obs;
  int day = 0;
  int hh = 0;
  int minute = 0;
  int second = 0;

  void timeCountDown(int buffEndTime) {
    _timer?.cancel();
    // var nowDate = DateTime.now();
    ///当前时间加上时区偏移
    var nowMs = DateTime.now().add(Utils.getTimeZoneOffset()).millisecondsSinceEpoch;

    var serverMs = buffEndTime;
    // ///结束时间
    // var endDate = DateTime.now().add(Duration(seconds: gGirlDefine.value.buffTime)).add(Utils.getTimeZoneOffset());

    // ///结束时间的服务器时间
    // ///注意：服务器时间是utc时间，需要加上时区偏移
    // var serverDate = endDate.add(Utils.getTimeZoneOffset());
    // var serverMs = serverDate.millisecondsSinceEpoch;
    var diff = serverMs - nowMs;

    if (diff <= 0) {
      return;
    }
    gameStartTimesCountDown.value = diff;
    day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
    hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
    minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
    second = gameStartTimesCountDown.value ~/ 1000 % 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      var temp = gameStartTimesCountDown.value - 1000;
      if (temp <= 0) {
        t.cancel();
      } else {
        gameStartTimesCountDown.value = temp;
        day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
        hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
        minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
        second = gameStartTimesCountDown.value ~/ 1000 % 60;
      }
    });
  }

  /// 格式化为两位数
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String get getTime => '${twoDigits(hh)}:${twoDigits(minute)}:${twoDigits(second)}';
}
