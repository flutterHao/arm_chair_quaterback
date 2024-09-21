import 'package:arm_chair_quaterback/common/net/address.dart';

class Utils {
  static String getPlayUrl(int? playerId) {
    return "${Address.httpBaseUrl}/image/player/head_$playerId.png";
  }

  static String getTeamUrl(int? teamId) {
    return "${Address.httpBaseUrl}/image/team/$teamId.png";
  }
}
