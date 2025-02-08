/*
 * @Description: 音效控制
 * @Author: lihonghao
 * @Date: 2025-02-07 14:44:38
 * @LastEditTime: 2025-02-08 11:42:49
 */
// sound_manager.dart
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class SoundServices extends GetxService {
  static SoundServices get to => Get.find();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();

  // 预加载常用音效（可选，但推荐减少延迟）
  @override
  Future<void> onInit() async {
    // await preloadSounds();
    super.onInit();
  }

  Future<void> preloadSounds() async {
    await _audioCache.loadAll([
      Assets.soundWindowOpen,
      Assets.soundWindowClose,
      Assets.soundClick,
      Assets.soundDelete,
      Assets.soundPropMove,
      Assets.soundNotfication,
      Assets.soundError,
    ]);
  }

  // 播放音效（封装核心逻辑）
  Future<void> playSound(String soundFile,
      {bool loop = false, double volume = 1.0}) async {
    try {
      soundFile = soundFile.replaceAll('assets/', '');
      await _audioPlayer
          .setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
      await _audioPlayer.play(AssetSource(soundFile), volume: volume);
    } catch (e) {
      Log.e('播放音效失败: $e');
    }
  }

  // 停止所有音效
  Future<void> stopAllSounds() async {
    await _audioPlayer.stop();
    await _audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  // 释放资源（在应用退出时调用）
  @override
  void onClose() {
    _audioPlayer.dispose();
    _audioCache.clearAll();
    super.onClose();
  }
}
