/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 17:29:19
 * @LastEditTime: 2025-03-05 14:43:14
 */
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:common_utils/common_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  final BlendMode? colorBlendMode;

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
      this.alignment,
      this.colorBlendMode});

  @override
  Widget build(BuildContext context) {
    Widget error = errorWidget ??
        Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? AppColors.cE6E6E,
            borderRadius: borderRadius,
          ),
          child: imageFailedPath != null
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  child: Image.asset(
                    imageFailedPath!,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
        );
    if (ObjectUtil.isEmpty(url)) {
      return error;
    }
    Widget loadingWidgetTemp = Center(
      child: loadingWidget ??
          Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: color ?? AppColors.cE6E6E6,
                strokeWidth: 2,
              )),
    );

    // return Image.network(url,
    //     fit: fit, width: width, height: height, color: color);

    // return CachedNetworkImage(
    //   imageUrl: url,
    //   fit: fit,
    //   width: width,
    //   height: height,
    //   color: color,
    //   imageBuilder: (context, imageProvider) => Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: imageProvider,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    //   alignment: alignment ?? Alignment.center,
    //   placeholder: (context, url) => CircularProgressIndicator(),
    //   errorWidget: (context, url, error) => Icon(Icons.error),
    // );

    String sUrl = ConfigStore.to.getServiceUrl();

    return ExtendedImage.network(
      // "https://seaball-1324211645.cos.ap-guangzhou.myqcloud.com/20241125_37e311267a11f9aacbcd0ea3ad63816b.png",
      url,
      fit: fit,
      cache: true,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      borderRadius: borderRadius,
      shape: BoxShape.rectangle,
      colorBlendMode: colorBlendMode,
      gaplessPlayback: true,
      color: color,
      //非服务器的图片资源缓存4天过期
      cacheMaxAge: url.contains(sUrl)
          ? null
          : const Duration(days: Constant.defaultImageCacheTimes),

      clearMemoryCacheWhenDispose: false,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            // Log.e("$url load failed");
            return error;
          case LoadState.loading:
            // return SizedBox(
            //   width: width,
            //   height: height,
            // );
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

class ImagePreviewPage extends StatelessWidget {
  final List<String> imageUrls; // 图片URL列表
  final int initialIndex; // 初始显示的图片索引

  const ImagePreviewPage({
    Key? key,
    required this.imageUrls,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ExtendedImageGesturePageView();
    return ExtendedImageGesturePageView.builder(
      itemCount: imageUrls.length,
      controller: ExtendedPageController(
        initialPage: initialIndex,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ExtendedImage.network(
          imageUrls[index],
          fit: BoxFit.contain,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9, // 最小缩放比例
              maxScale: 3.0, // 最大缩放比例
              animationMinScale: 0.7, // 缩放动画的最小比例
              animationMaxScale: 3.0, // 缩放动画的最大比例
              speed: 1.0, // 缩放速度
              inertialSpeed: 100.0, // 惯性滑动速度
              cacheGesture: false, // 是否缓存手势
            );
          },
        );
      },
    );
  }
}
