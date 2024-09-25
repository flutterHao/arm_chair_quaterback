/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 16:31:51
 * @LastEditTime: 2024-09-25 17:01:27
 */
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///@author lihonghao
///@date 2024/9/9
///@description 轮播图组件
class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    required this.bannerList,
    this.footer,
    required this.onTap,
  });
  final double width;
  final double height;
  final double borderRadius;
  final List<String> bannerList;
  final Function(int) onTap;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AspectRatio(
      aspectRatio: width / height,
      // width: width,
      // height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Swiper(
          key: Key(bannerList.toString()),
          itemCount: bannerList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => onTap(index),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: width / height,
                    child: ImageWidget(
                      width: width,
                      height: height,
                      url: bannerList[index],
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  if (footer != null)
                    Positioned(bottom: 12.w, right: 12.w, child: footer!)
                ],
              ),
            );
          },
          autoplay: true, // 启用自动播放
          // autoplayDelay: 3000,
          // autoplayDisableOnInteraction: true,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 10), // 指示器的下边距
            builder: CustomPaginationBuilder(), // 使用自定义的长条形分页指示器
          ),
        ),
      ),
    ));
  }
}

class CustomPaginationBuilder extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    final int activeIndex = config.activeIndex;
    final int itemCount = config.itemCount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        // 当前索引为白色，其他为灰色
        final bool isActive = index == activeIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4), // 长条之间的间距
          width: isActive ? 23.w : 20.w, // 当前索引长条宽度比非选中状态更长
          height: 3, // 设置高度为8
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey, // 选中为白色，未选中为灰色
            borderRadius: BorderRadius.circular(4), // 设置圆角
          ),
        );
      }),
    );
  }
}
