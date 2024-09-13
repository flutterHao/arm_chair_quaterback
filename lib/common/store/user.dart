import 'package:arm_chair_quaterback/common/services/services.dart';
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
    token = StorageService.to.getString(UserConstant.token);
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(UserConstant.token, value);
    token = value;
  }
}
