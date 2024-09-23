/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:39:28
 * @LastEditTime: 2024-09-23 11:53:54
 */
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/values/values.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 令牌 token
  String token = '';

  bool get isLogin => _isLogin.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(Constant.token);
  }

  // 保存 token
  Future<void> setToken(String value) async {
    token = value;
    Log.d('setToken: $token token是否存在${UserStore.to.hasToken} token.isNotEmpty=${token.isNotEmpty}');
    await StorageService.to.setString(Constant.token, value);
  }
}
