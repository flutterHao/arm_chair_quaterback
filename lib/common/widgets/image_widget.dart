/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 17:29:19
 * @LastEditTime: 2024-09-21 10:10:13
 */
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
      this.imageFailedPath,
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
        // color: Colors.grey,
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

// class ErrorWidget extends StatelessWidget {
//   const ErrorWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.grey[200]);
//   }
// }
