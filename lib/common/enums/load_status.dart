import 'package:arm_chair_quaterback/generated/assets.dart';

///
///@auther gejiahui
///created at 2024/9/24/14:53

enum LoadDataStatus {
  loading(desc: 'loading ...'),
  error(desc: 'Network error ', icon: Assets.iconUiDefault02),
  noData(desc: 'No content yet', icon: Assets.iconUiDefault01),
  success(desc: ' ');

  const LoadDataStatus({required this.desc, this.icon});

  final String desc; //描述

  final String? icon; //图标
}
