/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 17:29:19
 * @LastEditTime: 2024-11-15 15:10:28
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///@author lihonghao
///@date 2024/9/9
///@description 网络缓存图片
class ImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final String? imageFailedPath;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Color? color;
  final Alignment? alignment;

  const ImageWidget(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.imageFailedPath,
      this.borderRadius,
      this.fit = BoxFit.cover,
      this.loadingWidget,
      this.errorWidget,
      this.color,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    Widget error = errorWidget ??
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            // color: AppColors.cE6E6E,
            borderRadius:
                borderRadius ?? BorderRadius.circular((width ?? height)! / 2),
          ),
          child: imageFailedPath != null
              ? Image.asset(
                  imageFailedPath!,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                )
              : null,
        );
    Widget loadingWidgetTemp = Center(
      child: loadingWidget ??
          SizedBox(
              width: 25.w,
              height: 25.w,
              child: const CircularProgressIndicator(
                color: AppColors.cE6E6E6,
                strokeWidth: 2,
              )),
    );

    if (borderRadius != null) {
      error = ClipRRect(
        borderRadius: borderRadius!,
        child: error,
      );
      loadingWidgetTemp = ClipRRect(
        borderRadius: borderRadius!,
        child: loadingWidgetTemp,
      );
    }
    return ExtendedImage.network(
      url,
      fit: fit,
      cache: true,
      width: width,
      height: height,
      color: color,
      alignment: alignment ?? Alignment.center,
      borderRadius: borderRadius,
      shape: BoxShape.rectangle,
      clearMemoryCacheWhenDispose: false,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            // Log.e("$url load failed");
            return error;
          case LoadState.loading:
            return loadingWidgetTemp;
          case LoadState.completed:
            // TODO: Handle this case.
            break;
        }
        return null;
      },
    );
  }
}

///镜像图片
class MirrorImageWidget extends StatelessWidget {
  final String imagePath; // 本地图片路径
  final double fullWidth; // UI给出的完整宽度
  final double imageHeight; // 图片高度
  final BoxFit? fit;
  final Alignment? alignment;
  final bool isLeft;

  const MirrorImageWidget({
    super.key,
    required this.imagePath,
    required this.fullWidth,
    required this.imageHeight,
    this.fit,
    this.alignment,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    // 计算一半的宽度
    double halfWidth = fullWidth / 2;
    Widget image = isLeft
        ? Image.asset(
            imagePath,
            width: halfWidth, // 一半的宽度
            height: imageHeight,
            fit: fit ?? BoxFit.fitHeight,
            alignment: alignment ?? Alignment.topRight,
          )
        : Image.asset(
            imagePath,
            width: halfWidth, // 一半的宽度
            height: imageHeight,
            fit: fit ?? BoxFit.fitHeight,
            alignment: alignment ?? Alignment.topLeft,
          );
    return SizedBox(
      width: fullWidth, // 设置整个拼合后的宽度
      height: imageHeight, // 设置高度
      child: isLeft
          ? Row(
              children: [
                // 显示原始的一半图片
                image,
                // 显示镜像的图片，利用 Transform 翻转
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, 1.0), // 水平镜像翻转
                  child: image,
                ),
              ],
            )
          : Row(
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, 1.0), // 水平镜像翻转
                  child: image,
                ),
                image,
              ],
            ),
    );
  }
}
