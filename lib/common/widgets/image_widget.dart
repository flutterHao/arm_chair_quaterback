/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 17:29:19
 * @LastEditTime: 2024-10-08 14:22:54
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

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

  const ImageWidget(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.imageFailedPath = Assets.testTeamLogoPng, //todo 换默认缺省图
      this.borderRadius,
      this.fit = BoxFit.cover,
      this.loadingWidget});

  @override
  Widget build(BuildContext context) {
    // if (ObjectUtil.isEmptyString(url)) {
    //   return const SizedBox();
    // }
    // if (!ObjectUtil.isEmptyString(url) && !url.isURL) {
    //   return ExtendedImage.asset(url,
    //       fit: fit,
    //       width: width,
    //       height: height,
    //       enableMemoryCache: true,
    //       clearMemoryCacheWhenDispose: true);
    // }

    Widget errorWidget = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: borderRadius ?? BorderRadius.circular(20),
      ),
      child: imageFailedPath != null ? Image.asset(imageFailedPath!) : null,
    );
    return ExtendedImage.network(
      url,
      fit: fit,
      cache: true,
      width: width,
      height: height,
      borderRadius: borderRadius,
      shape: BoxShape.rectangle,
      clearMemoryCacheWhenDispose: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            return errorWidget;
          case LoadState.loading:
            return loadingWidget ?? errorWidget;
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

  const MirrorImageWidget({
    super.key,
    required this.imagePath,
    required this.fullWidth,
    required this.imageHeight,
    this.fit,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    // 计算一半的宽度
    double halfWidth = fullWidth / 2;

    return SizedBox(
      width: fullWidth, // 设置整个拼合后的宽度
      height: imageHeight, // 设置高度
      child: Row(
        children: [
          // 显示原始的一半图片
          Image.asset(
            imagePath,
            width: halfWidth, // 一半的宽度
            height: imageHeight,
            alignment: Alignment.topRight,
            fit: fit ?? BoxFit.fitHeight,
          ),
          // 显示镜像的图片，利用 Transform 翻转
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(-1.0, 1.0), // 水平镜像翻转
            child: Image.asset(imagePath,
                width: halfWidth, // 一半的宽度
                height: imageHeight,
                fit: fit ?? BoxFit.fitHeight,
                alignment: Alignment.topRight),
          ),
        ],
      ),
    );
  }
}
