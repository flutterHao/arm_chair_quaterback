import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/power_change_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/recover_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/line_up_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_bag_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_changer_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TeamController extends GetxController with GetTickerProviderStateMixin {
  final random = Random();

  late TabController tabController;
  RxInt current = 0.obs;
  // double turns = 0;
  final List<String> tabs = ["LINE-UP", "STASH"];
  final List<Widget> pages = [
    const LineUpTab(),
    const PlayerBagTab(),
  ];
  // RxBool isRecovering = false.obs;
  RxBool showThirdCard = true.obs;

  MyTeamEntity myTeamEntity = MyTeamEntity();
  List<TeamPlayerInfoEntity> subList = [];
  List<TeamPlayerInfoEntity> myBagList = [];
  Timer? _timer;
  late int _recoverSeconds;
  RxString remainString = "00:00".obs;

  TeamPlayerInfoEntity item1 = TeamPlayerInfoEntity();
  TeamPlayerInfoEntity item2 = TeamPlayerInfoEntity();
  bool isAdd = false;

  int sortType = 1;
  // int sortType2 = 0;
  bool isFire = false;
  ScrollController scrollController = ScrollController();
  double offset = 0;
  RxBool hideSort = false.obs;
  var isShowDialog = false.obs;
  List<StarUpDefineEntity> starUpDefineList = [];

  ///换人页面打开关闭动画
  late AnimationController animationCtrl;
  late Animation<double> pageAnimation;
  //换人战力
  late int oVROld = 0;
  int changeDuration = 300;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      current.value = tabController.index;
      if (isFire) {
        isFire = false;
        update();
      }
    });

    scrollController.addListener(() {
      //判断滚动方向，向下展开，向上隐藏
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        hideSort.value = false;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideSort.value = true;
      }
    });

    animationCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    pageAnimation =
        CurvedAnimation(parent: animationCtrl, curve: Curves.easeInOut);

    Future.delayed(const Duration(milliseconds: 300), () {
      animationCtrl.forward();
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    initData();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    animationCtrl.dispose();
  }

  Future initData() async {
    if (HomeController.to.userEntiry.teamLoginInfo == null) {
      await HomeController.to.refreshUserEntity();
    }
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;

    await Future.wait([
      TeamApi.getMyTeamPlayer(teamId),
      TeamApi.getMyBagPlayers(),
      CacheApi.getPlayerStatusConfig(),
      CacheApi.getStarUpDefine(),
      CacheApi.getGradeInStamina(),
    ]).then((v) {
      myTeamEntity = v[0] as MyTeamEntity;
      myBagList = v[1] as List<TeamPlayerInfoEntity>;
      starUpDefineList = v[3] as List<StarUpDefineEntity>;
      subList = myTeamEntity.teamPlayers.where((e) => e.position == 0).toList();
      recoverTimeAndCountDown();
      myBagList.sort(comparePlayers);
      oVROld = myTeamEntity.oVR;
      update();
    });
  }

  ///单个：type=1，2全员
  Future<void> recoverPower(
      {required int cost, int type = 1, String? uuid}) async {
    await TeamApi.recoverPower(type: type, uuid: uuid).then((v) async {
      myTeamEntity.powerP = v.powerP;
      myTeamEntity.powerReplyTime = v.powerReplyTime;
      if (type == 1) {
        if (v.teamPlayers.isEmpty) return;
        int totalPw = 0;
        for (var e in myTeamEntity.teamPlayers) {
          if (e.uuid == uuid) {
            int pw = v.teamPlayers.firstWhere((e) => e.uuid == uuid).power;

            e.power = pw;
          }
          totalPw += e.power;
        }
        myTeamEntity.powerP = (totalPw ~/ myTeamEntity.teamPlayers.length);
        HomeController.to.updateMoney(-cost);
      } else {
        if (myTeamEntity.powerP >= 100) {
          EasyLoading.showToast("Your team's morale is full.");
          return;
        }
        if (v.teamPlayers.isNotEmpty) {
          for (var e in v.teamPlayers) {
            int index =
                myTeamEntity.teamPlayers.indexWhere((e1) => e1.uuid == e.uuid);
            myTeamEntity.teamPlayers[index].power = e.power;
          }
          HomeController.to.updateMoney(-cost);

          //更新训练信息
          TrainingController ctrl = Get.find();
          ctrl.trainingInfo = await TeamApi.getTrainingInfo();
          ctrl.update(["training_page"]);
        }

        //  myTeamEntity=await TeamApi.getMyTeamPlayer(teamId)
      }
      update();
    });
  }

  ///添加球员
  void addPlay(BuildContext context) {
    if (item2.isChange.value) {
      ///选了获取背包已经选择的直接添加
      item1.uuid = "";
      changeTeamPlayer(context);
    } else {
      ///如果之前没选跳转到背包选择
      isAdd = true;
      showChangeDialog(null);
    }
  }

  Future showChangeDialog(TeamPlayerInfoEntity? item) async {
    if (!isShowDialog.value) {
      // animationCtrl.reset();
      isShowDialog.value = true;
      MyTeamEntity? result = await showDialog(
          barrierDismissible: false,
          useSafeArea: false,
          context: Get.context!,
          builder: (context) {
            return PlayerChangerDialog(
              item: item,
            );
          });

      item1.uuid = "";
      item2.uuid = "";
      isShowDialog.value = false;
      item1.isChange.value = false;
      item2.isChange.value = false;
      isShowDialog.value = false;
      isAdd = false;
      //战力变化弹窗
      if (oVROld != myTeamEntity.oVR) {
        await Future.delayed(const Duration(milliseconds: 1500));
        await showTopToastDialog(child: PowerChangeDialog());
        oVROld = myTeamEntity.oVR;
      }

      animationCtrl.reset();
      animationCtrl.forward();
    }
  }

  ///点击更换球员
  void playerChangeTap(
      BuildContext context, bool isBag, TeamPlayerInfoEntity item) async {
    if (!isBag) {
      if (isShowDialog.value && !item2.isChange.value) {
        //如果是从阵容中选择的，并且打开了弹窗
        item2 = item;
        item2.isChange.value = true;
      } else {
        //从阵容中选择
        item1 = TeamPlayerInfoEntity.fromJson(item.toJson());
        item1.isChange.value = true;
      }

      if (item2.isChange.value == true && isShowDialog.value) {
        ///已经选择了背包直接替换
        await changeTeamPlayer(context);
      } else {
        await showChangeDialog(item);
      }
    }

    /// 如果是背包
    else {
      item2 = TeamPlayerInfoEntity.fromJson(item.toJson());
      item2.isChange.value = true;
      if (isAdd) {
        ///如果选择了添加直接添加
        addPlay(context);
      } else if (item1.isChange.value == true) {
        ///已经选择了上阵直接替换
        await changeTeamPlayer(context);
      } else {
        await showChangeDialog(item);
      }
    }
    // Log.d("球员${item.uuid}\n ${item1.uuid} \n ${item2.uuid}");
  }

  Future changeTeamPlayer(BuildContext context, {bool isDown = false}) async {
    MyTeamEntity result = await TeamApi.changeTeamPlayer(
        isAdd ? null : item1.uuid, isDown ? null : item2.uuid);
    myBagList = await TeamApi.getMyBagPlayers();
    myBagList.sort(comparePlayers);
    // if (isDown || isAdd) {
    //   changeDuration = 0;
    // } else {
    //   changeDuration = 300;
    // }
    await animationCtrl.reverse();
    // for (var e in myBagList) {
    //   if (isDown && e.uuid == item1.uuid) {
    //     changeDuration = 0;
    //     e.position = -1;
    //     break;
    //   } else if (isAdd && e.uuid == item2.uuid) {
    //     changeDuration = 0;
    //     e.position = 0;
    //     break;
    //   } else {
    //     changeDuration = 300;

    //     int index1 = myBagList.indexWhere((e) => e.uuid == item1.uuid);
    //     int index2 = myBagList.indexWhere((e) => e.uuid == item2.uuid);

    //     if (index1 != -1 && index2 != -1) {
    //       int tempPosition = myBagList[index1].position;
    //       myBagList[index1].position = myBagList[index2].position;
    //       myBagList[index2].position = tempPosition;
    //     }
    //     break;
    //   }
    // }

    myTeamEntity = result;
    subList = myTeamEntity.teamPlayers.where((e) => e.position == 0).toList();
    update();
    Get.back(result: result);
  }

  ///计算体力回复时间
  void recoverTimeAndCountDown() {
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(myTeamEntity.powerReplyTime);
    _recoverSeconds = recoverTime.difference(DateTime.now()).inSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      _recoverSeconds--;
      // final hours = _recoverSeconds ~/ 3600;
      final minutes = (_recoverSeconds) ~/ 60;
      final remainingSeconds = _recoverSeconds % 60;
      remainString.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (_recoverSeconds <= 0) {
        _timer?.cancel();

        /// 恢复体力刷新数据
        await updateTeamInfo();
        recoverTimeAndCountDown();
        // initData();
      }
    });
  }

  Future updateTeamInfo() async {
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;
    myTeamEntity = await TeamApi.getMyTeamPlayer(teamId);
    subList = myTeamEntity.teamPlayers.where((e) => e.position == 0).toList();
    update();
  }

  String formatNumber(int number) {
    String numberStr = number.toString();
    int length = numberStr.length;

    if (length <= 3) return numberStr;

    // 每次递归处理最后的三位
    return '${formatNumber(int.parse(numberStr.substring(0, length - 3)))},${numberStr.substring(length - 3)}';
  }

  int comparePlayers(TeamPlayerInfoEntity a, TeamPlayerInfoEntity b) {
    if (sortType == 1 || sortType == -1) {
      // 先按星级排序
      int gradeComparison = sortType == 1
          ? b.breakThroughGrade.compareTo(a.breakThroughGrade)
          : a.breakThroughGrade.compareTo(b.breakThroughGrade);
      if (gradeComparison != 0) {
        return gradeComparison;
      }

      // 如果星级相同，按品质排序
      int qualityComparison = sortType == 1
          ? getGrade(b.playerId).compareTo(getGrade(a.playerId))
          : getGrade(a.playerId).compareTo(getGrade(b.playerId));
      if (qualityComparison != 0) {
        return qualityComparison;
      }

      // 如果星级和品质都相同，按战力排序
      return sortType == 1
          ? b.power.compareTo(a.power)
          : a.power.compareTo(b.power);
    } else if (sortType == 2 || sortType == -2) {
      // 先按品质排序
      int qualityComparison = sortType == 2
          ? getGrade(b.playerId).compareTo(getGrade(a.playerId))
          : getGrade(a.playerId).compareTo(getGrade(b.playerId));
      if (qualityComparison != 0) {
        return qualityComparison;
      }

      // 如果品质相同，按星级排序
      int gradeComparison = sortType == 2
          ? b.breakThroughGrade.compareTo(a.breakThroughGrade)
          : a.breakThroughGrade.compareTo(b.breakThroughGrade);
      if (gradeComparison != 0) {
        return gradeComparison;
      }

      // 如果品质和星级都相同，按战力排序
      return sortType == 2
          ? b.power.compareTo(a.power)
          : a.power.compareTo(b.power);
    }

    // 默认情况下不排序
    return 0;
  }

  List<TeamPlayerInfoEntity> playerSort() {
    List<TeamPlayerInfoEntity> list = List.from(myBagList);
    list.sort(comparePlayers);
    return list;
  }

  int getGrade(int playerId) {
    String grade = Utils.getPlayBaseInfo(playerId).grade;

    return Constant.grades.indexOf(grade);

    // grade = grade.replaceAll("-", "").replaceAll("+", "");
    // switch (grade) {
    //   case 'S':
    //     return 5;
    //   case 'A':
    //     return 4;
    //   case 'B':
    //     return 3;
    //   case 'C':
    //     return 2;
    //   case 'D':
    //     return 1;
    //   default:
    //     return 0;
    // }
  }

  Future dismissPlayer(BuildContext context, String uuid) async {
    await TeamApi.dismissPlayer(uuid).then((v) {
      myBagList.removeWhere((element) => element.uuid == uuid);
      update();
    });
  }

  int getFireMoney(TeamPlayerInfoEntity player) {
    int salary = 0;
    for (var e in starUpDefineList) {
      if (e.starUp == player.breakThroughGrade) {
        return Utils.getPlayBaseInfo(player.playerId).salary *
            (1 + e.starRatingCoefficient).round();
      }
    }
    return salary;
  }

  int getRecoverCost() {
    double total = 0;
    for (var e in myTeamEntity.teamPlayers) {
      var player = Utils.getPlayBaseInfo(e.playerId);
      for (var element in CacheApi.gradeInStaminaList) {
        if (element.gradeDes == player.grade) {
          e.recoverCost = (player.salary * element.recoverStaminaValue).ceil();
          total += e.recoverCost;
        }
      }
    }

    return total.ceil();
  }

  void recove() {
    // if (myTeamEntity.powerP >= 100) {
    //   EasyLoading.showToast("Your team's morale is full.");
    //   // Loading.toast("Your team's morale is full.");
    //   return;
    // }
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const RecoverDialog();
        });
  }
}
