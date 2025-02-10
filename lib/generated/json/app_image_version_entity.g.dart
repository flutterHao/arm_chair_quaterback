import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/app_image_version_entity.dart';

AppImageVersionEntity $AppImageVersionEntityFromJson(
    Map<String, dynamic> json) {
  final AppImageVersionEntity appImageVersionEntity = AppImageVersionEntity();
  final int? imageVersion = jsonConvert.convert<int>(json['imageVersion']);
  if (imageVersion != null) {
    appImageVersionEntity.imageVersion = imageVersion;
  }
  final String? path = jsonConvert.convert<String>(json['path']);
  if (path != null) {
    appImageVersionEntity.path = path;
  }
  return appImageVersionEntity;
}

Map<String, dynamic> $AppImageVersionEntityToJson(
    AppImageVersionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['imageVersion'] = entity.imageVersion;
  data['path'] = entity.path;
  return data;
}

extension AppImageVersionEntityExtension on AppImageVersionEntity {
  AppImageVersionEntity copyWith({
    int? imageVersion,
    String? path,
  }) {
    return AppImageVersionEntity()
      ..imageVersion = imageVersion ?? this.imageVersion
      ..path = path ?? this.path;
  }
}