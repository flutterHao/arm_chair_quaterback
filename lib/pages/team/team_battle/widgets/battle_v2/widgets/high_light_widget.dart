import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/18/17:39

class HighLightWidget extends StatefulWidget {
  const HighLightWidget({super.key, required this.event});

  final GameEvent event;

  @override
  State<HighLightWidget> createState() => _HighLightWidgetState();
}

class _HighLightWidgetState extends State<HighLightWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationController2;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        /// 延迟3s后消失
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            animationController2.forward();
          }
        });
      }
    });
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController2, curve: Curves.easeOut));
    animationController2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HighLightWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    reStart();
  }

  void reStart() {
    if (!animationController2.isAnimating && !animationController.isAnimating) {
      animationController.reset();
      animationController2.reset();
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    GameEvent item = widget.event;
    TeamBattleV2Controller controller = Get.find();
    return Positioned(
      bottom: 15.w + animationController2.value * -150.w,
      child: Opacity(
        opacity: 1.0 - animationController2.value,
        child: Opacity(
          opacity: animationController.value,
          child: Transform.scale(
            scale: animationController.value,
            child: Container(
              constraints: BoxConstraints(maxWidth: 254.w),
              padding: EdgeInsets.only(
                  left: 9.w, right: 22.w, top: 11.w, bottom: 11.w),
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.5.w),
                        border: Border.all(
                            color: controller.isSystemEvent(item)
                                ? AppColors.cTransparent
                                : item.isHomePlayer
                                    ? AppColors.c1F8FE5
                                    : AppColors.cD60D20,
                            width: 1.5.w)),
                    child: controller.isSystemEvent(item)
                        ? IconWidget(
                            iconWidth: 20.w, icon: Assets.commonUiCommonProp03)
                        : ImageWidget(
                            url: Utils.getPlayUrl(item.playerId),
                            width: 28.w,
                            height: 28.w,
                            borderRadius: BorderRadius.circular(14.w),
                            imageFailedPath: Assets.teamUiHead03,
                          ),
                  ),
                  9.hGap,
                  Expanded(
                    child: Builder(builder: (context) {
                      var gameEvent = controller
                          .getGameEvent(item.pkEventUpdatedEntity.eventId);
                      var list = Utils.subColorString(
                          controller.insertParamValue(gameEvent?.headLine ?? "",
                              item.pkEventUpdatedEntity));
                      return Text.rich(
                        TextSpan(
                            children: List.generate(list.length, (index) {
                          var colorString = list[index];
                          return TextSpan(
                              text: "${colorString.text} ",
                              style: colorString.isMatch
                                  ? TextStyle(
                                      color: item.isHomePlayer
                                          ? AppColors.c1F8FE5
                                          : AppColors.cD60D20)
                                  : null);
                        })),
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight:
                                item.score ? FontWeight.w500 : FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                            color: item.score
                                ? AppColors.c000000
                                : AppColors.c4D4D4D,
                            height: 1,
                            fontFamily: item.score
                                ? FontFamily.fRobotoMedium
                                : FontFamily.fRobotoRegular),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
