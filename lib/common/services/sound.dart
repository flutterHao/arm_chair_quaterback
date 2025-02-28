/*
 * @Description: 音效控制
 * @Author: lihonghao
 * @Date: 2025-02-07 14:44:38
 * @LastEditTime: 2025-02-27 10:09:45
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
    await preloadSounds();
    super.onInit();
  }

  Future<void> preloadSounds() async {
    var files = [
      Assets.soundWaitingAward,
      Assets.soundWindowOpen,
      Assets.soundWindowClose,
      Assets.soundClick,
      Assets.soundDelete,
      Assets.soundPropMove,
      Assets.soundNotfication,
      Assets.soundError,
    ].map((e) => e.replaceAll('assets/', '')).toList();
    await _audioCache.loadAll(files);
  }

  Future<void> loadSound(String file) async {
    _audioCache.load(file);
  }

  // 播放音效（封装核心逻辑）
  Future<void> playSound(String soundFile,
      {bool loop = false, double volume = 1.0, double playbackRate = 1}) async {
    try {
      soundFile = soundFile.replaceAll('assets/', '');
      _audioCache.load(soundFile);
      await _audioPlayer
          .setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
      await _audioPlayer.setPlaybackRate(playbackRate);

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

// import 'package:arm_chair_quaterback/common/utils/logger.dart';
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';

// class SoundServices extends GetxService {
//   static SoundServices get to => Get.find();
//   final Map<String, AudioPlayer> _audioPlayers = {}; // 音效实例池

//   @override
//   Future<void> onInit() async {
//     await preloadSounds();
//     super.onInit();
//   }

//   /// 预加载所有常用音效到内存
//   Future<void> preloadSounds() async {
//     final soundFiles = [
//       Assets.soundWaitingAward,
//       Assets.soundWindowOpen,
//       Assets.soundWindowClose,
//       Assets.soundClick,
//       Assets.soundDelete,
//       Assets.soundPropMove,
//       Assets.soundNotfication,
//       Assets.soundError,
//     ];

//     for (final file in soundFiles) {
//       try {
//         final player = AudioPlayer();
//         await player.setAsset(file);
//         _audioPlayers[file] = player;
//         Log.d('预加载音效成功: $file');
//       } catch (e) {
//         Log.e('预加载音效失败: $file - $e');
//       }
//     }
//   }

//   /// 播放音效（优化延迟版）
//   Future<void> playSound(
//     String soundFile, {
//     bool loop = false,
//     double volume = 1.0,
//     double speed = 1.0,
//   }) async {
//     try {
//       final player = _audioPlayers[soundFile];
//       if (player == null) {
//         Log.e('音效未预加载: $soundFile');
//         return;
//       }

//       // 处理正在播放的冲突
//       // if (player.playing) {
//       //   await player.stop();
//       // }
//       await player.setLoopMode(loop ? LoopMode.one : LoopMode.off);
//       await player.setSpeed(1);
//       await player.setVolume(volume);
//       await player.seek(Duration.zero); // 重置播放位置
//       await player.play();
//     } catch (e) {
//       Log.e('播放音效失败: $soundFile - $e');
//     }
//   }

//   /// 停止所有音效
//   Future<void> stopAllSounds() async {
//     for (final player in _audioPlayers.values) {
//       await player.stop();
//     }
//   }

//   @override
//   void onClose() {
//     _disposePlayers();
//     super.onClose();
//   }

//   void _disposePlayers() {
//     _audioPlayers.forEach((key, player) => player.dispose());
//     _audioPlayers.clear();
//     Log.d('已释放所有音频资源');
//   }
// }
