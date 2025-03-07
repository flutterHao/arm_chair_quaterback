import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool looping;
  final bool autoPlay;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.looping = true,
    this.autoPlay = true,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await _videoController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      aspectRatio: _videoController.value.aspectRatio,
    );

    setState(() {}); // 刷新 UI 以显示播放器
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12.w),
            child: AspectRatio(
              aspectRatio:
                  _chewieController!.videoPlayerController.value.aspectRatio,
              child: SizedBox(
                  width: double.infinity,
                  child: Chewie(controller: _chewieController!)),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(
            color: AppColors.cE6E6E6,
            strokeWidth: 2,
          ));
  }
}
