// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2024-09-13 17:35:51
//  * @LastEditTime: 2024-11-15 17:31:43
//  */
// /*
//  * @Description: 
//  * @Author: lihonghao
//  * @Date: 2024-09-13 17:35:51
//  * @LastEditTime: 2024-09-14 16:45:55
//  */
// 

// class NewsList {
//   List<NewsDetail>? nbaNewsList;

//   NewsList({this.nbaNewsList});

//   factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
//         nbaNewsList: (json['nbaNewsList'] as List<dynamic>?)
//             ?.map((e) => NewsDetail.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         'nbaNewsList': nbaNewsList?.map((e) => e.toJson()).toList(),
//       };
// }
