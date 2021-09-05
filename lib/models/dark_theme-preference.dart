import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setdarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(THEME_STATUS) ?? false;
  }
}

// class GetUserInfo {
//   static const USER_INFO = 'USERINFO';

//   setUserInfo(String text) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString(USER_INFO, text);
//   }

//   Future<String> getUserInfo() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//    return preferences.getString(USER_INFO) ?? 'NULL';
//   }
// }
