// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2024-10-25 15:29:28
//  * @LastEditTime: 2024-11-01 18:49:36
//  */
// import 'package:arm_chair_quaterback/generated/assets.dart';
// import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
// import 'package:arm_chair_quaterback/common/net/http.dart';
// import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
// import 'package:arm_chair_quaterback/common/widgets/swiper_widget.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class NewsBannerWidget extends StatelessWidget {
//   const NewsBannerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NewListController>(
//         id: "newsBanner",
//         builder: (controller) {
//           return Container(
//             margin: EdgeInsets.only(top: 16.w, right: 16.w, left: 16.w),
//             child: SwiperWidget(
//               width: 343.w,
//               // width: MyApp.MAXWEBWIDTH.w - 40.w,
//               height: 150.w,
//               bannerList: controller.state.banners
//                   .map((e) => HttpUtil().getUrl + e.pictureId!)
//                   .toList(),
//               footer: IconWidget(
//                 iconWidth: 14.w,
//                 iconHeight: 14.w,
//                 icon: Assets.iconUiIconArrows,
//                 backgroudWitdh: 32.w,
//                 backgroudheight: 32.w,
//                 borderRadius: BorderRadius.circular(16.w),
//                 backgroudColor: Colors.white38,
//               ),
//               onTap: (index) {
//                 // var newsId = controller.state.banners[index].id;
//                 // controller.getNewsFlow(newsId, isRefresh: true);
//                 // Get.toNamed(RouteNames.newsDetail,
//                 //     arguments: controller.state.banners[index].id!,
//                 //     id: GlobalNestedKey.NEWS);
//                 // Navigator.of(context).push(
//                 //     createCustomRoute(this, NewsDetailPage(123)));
//                 controller.pageToDetail(NewsListDetail.fromJson(
//                     controller.state.banners[index].toJson()));
//               },
//             ),
//           );
//         });
//   }
// }
