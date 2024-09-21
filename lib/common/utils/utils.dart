import 'package:arm_chair_quaterback/common/net/address.dart';

class Utils {
  static String getPlayUrl(int? playerId) {
    return "${Address.url}/image/player/head_$playerId.png";
  }

  static String getTeamUrl(int? teamId) {
    return "${Address.url}/image/team/$teamId.png";
  }
}
