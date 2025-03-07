/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 20:05:20
 * @LastEditTime: 2024-11-14 20:42:18
 */
import 'dart:async' show Completer;
import 'dart:ui' show ImmutableBuffer, ImageDescriptor;
import 'package:flutter/widgets.dart';

extension GetImageSize on ImageProvider {
  Future<Size?> getImageSize({bool avoidDecode = false}) async {
    if (avoidDecode) {
      // 是否要免解码
      final cacheStatus =
          await obtainCacheStatus(configuration: const ImageConfiguration());
      final tracked = cacheStatus?.tracked ?? false;
      // 内存缓存中存在时优先从缓存中取，不在内存缓存中时转换为 ImageDescriptor
      if (!tracked) {
        ImmutableBuffer? buffer;
        if (this is AssetBundleImageProvider) {
          final key = await obtainKey(const ImageConfiguration())
              as AssetBundleImageKey;
          buffer = await key.bundle.loadBuffer(key.name);
        } else if (this is FileImage) {
          final file = (this as FileImage).file;
          final int lengthInBytes = await file.length();
          if (lengthInBytes > 0) {
            buffer = await ImmutableBuffer.fromFilePath(file.path);
          }
        } else if (this is MemoryImage) {
          final bytes = (this as MemoryImage).bytes;
          buffer = await ImmutableBuffer.fromUint8List(bytes);
        }
        if (buffer != null) {
          final descriptor = await ImageDescriptor.encoded(buffer);
          final size =
              Size(descriptor.width.toDouble(), descriptor.height.toDouble());
          buffer.dispose();
          descriptor.dispose();
          if (!size.isEmpty) return size;
        }
      }
    }

    // 免解码末开启或内存缓存已存在，最后再兜底上面未处理的情况
    final completer = Completer<Size?>();
    ImageStream imageStream = resolve(const ImageConfiguration());

    ImageStreamListener? listener;
    listener = ImageStreamListener(
      (imageInfo, synchronousCall) {
        if (!completer.isCompleted) {
          completer.complete(Size(imageInfo.image.width.toDouble(),
              imageInfo.image.height.toDouble()));
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          imageInfo.dispose();
          imageStream.removeListener(listener!);
        });
      },
      onError: (exception, stackTrace) {
        if (!completer.isCompleted) {
          completer.complete();
        }
        imageStream.removeListener(listener!);
      },
    );
    imageStream.addListener(listener);

    return completer.future;
  }
}
