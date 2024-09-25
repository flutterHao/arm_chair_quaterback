///
///@auther gejiahui
///created at 2024/9/24/14:53

enum LoadDataStatus {
  loading(desc: 'loading ...'),
  error(desc: 'please try again ~~'),
  noData(desc: 'data lost ~~'),
  success(desc: 'nice');

  const LoadDataStatus({required this.desc});

  final String desc; //描述
}
