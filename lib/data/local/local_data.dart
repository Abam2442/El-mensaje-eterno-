import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final LocalData _instance = LocalData._internal();

  factory LocalData() => _instance;

  LocalData._internal() {
    init();
  }

  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static late SharedPreferences sharedPref;

  //! Setter Functions
  static Future<bool> setString(String key, String value) async {
    return await sharedPref.setString(key, value);
  }

  static String? getString(String key) {
    return sharedPref.getString(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await sharedPref.setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    return await sharedPref.remove(key);
  }

  //! Getter Functions
}

// class LocalKeys {
//   static const String isRememberMe = 'IS_REMEMBER_ME';
// }
