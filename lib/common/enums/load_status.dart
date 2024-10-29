import 'package:arm_chair_quaterback/common/constant/assets.dart';

///
///@auther gejiahui
///created at 2024/9/24/14:53

enum LoadDataStatus {
  loading(desc: 'loading ...'),
  error(desc: 'please try again ~~',icon: Assets.uiDefaultMistakePng),
  noData(desc: 'no data ~~', icon: Assets.uiDefaultNonePng),
  success(desc: 'nice');

  const LoadDataStatus({required this.desc, this.icon});

  final String desc; //描述

  final String? icon; //图标
}
