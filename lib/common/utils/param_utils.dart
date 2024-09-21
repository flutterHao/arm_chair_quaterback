///
///@auther gejiahui
///created at 2024/9/20/20:16

class ParamUtils {
  static String getProKey(String key) {
    return key == "3PM".toLowerCase()
        ? "threePm"
        : key == "3PA".toLowerCase()
            ? "threePa"
            : key;
  }
}
