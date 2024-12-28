import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_source_entity.dart';

NewsSourceEntity $NewsSourceEntityFromJson(Map<String, dynamic> json) {
  final NewsSourceEntity newsSourceEntity = NewsSourceEntity();
  final String? sourceEnName = jsonConvert.convert<String>(
      json['sourceEnName']);
  if (sourceEnName != null) {
    newsSourceEntity.sourceEnName = sourceEnName;
  }
  final String? sourceIcon = jsonConvert.convert<String>(json['sourceIcon']);
  if (sourceIcon != null) {
    newsSourceEntity.sourceIcon = sourceIcon;
  }
  final int? sourceId = jsonConvert.convert<int>(json['sourceId']);
  if (sourceId != null) {
    newsSourceEntity.sourceId = sourceId;
  }
  final String? sourceName = jsonConvert.convert<String>(json['sourceName']);
  if (sourceName != null) {
    newsSourceEntity.sourceName = sourceName;
  }
  return newsSourceEntity;
}

Map<String, dynamic> $NewsSourceEntityToJson(NewsSourceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sourceEnName'] = entity.sourceEnName;
  data['sourceIcon'] = entity.sourceIcon;
  data['sourceId'] = entity.sourceId;
  data['sourceName'] = entity.sourceName;
  return data;
}

extension NewsSourceEntityExtension on NewsSourceEntity {
  NewsSourceEntity copyWith({
    String? sourceEnName,
    String? sourceIcon,
    int? sourceId,
    String? sourceName,
  }) {
    return NewsSourceEntity()
      ..sourceEnName = sourceEnName ?? this.sourceEnName
      ..sourceIcon = sourceIcon ?? this.sourceIcon
      ..sourceId = sourceId ?? this.sourceId
      ..sourceName = sourceName ?? this.sourceName;
  }
}