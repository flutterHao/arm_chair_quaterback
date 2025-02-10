import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/app_image_version_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:extended_image/extended_image.dart';

///
///@auther gejiahui
///created at 2025/2/8/17:47

class RemoveCacheImageManager {
  static void check() async {
    try {
      ///1.获取最新图片版本号
      List<AppImageVersionEntity> appImageVersions =
          await CacheApi.getAppImageVersion();
      if (appImageVersions.isEmpty) {
        return;
      }
      appImageVersions.sort((a, b) => a.imageVersion.compareTo(b.imageVersion));
      int newestImageVersion = appImageVersions.last.imageVersion;
      var currentImageVersion = StorageService.to
          .getInt(Constant.appImageVersionKey, defaultValue: 1);

      ///2.检查是否需要更新
      if (currentImageVersion >= newestImageVersion) {
        return;
      }

      ///2.1.需要更新，获取待更新图片
      List<AppImageVersionEntity> deleteCacheUrls = appImageVersions
          .where((e) => e.imageVersion > currentImageVersion)
          .toList();

      ///3.删除需要更新的图片缓存
      deleteCacheUrls.map((e) {
        clearDiskCachedImage(
            "${StorageService.to.getString(Constant.serviceUrl)}${e.path}");
      });

      ///4.更新本地版本
      StorageService.to.setInt(Constant.appImageVersionKey, newestImageVersion);
    } catch (e) {
      print("RemoveCacheImageManager--check--error--:$e");
    }
  }
}
