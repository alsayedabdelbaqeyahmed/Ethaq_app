// ignore: depend_on_referenced_packages
// ignore_for_file: type_annotate_public_apis, require_trailing_commas, unnecessary_await_in_return, depend_on_referenced_packages, duplicate_ignore

import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class CacheHelper {
  static SharedPreferences? sharedPreferences;

  // ignore: always_declare_return_types
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //first time
  static bool isOnBoarding = true;

  //login or not
  static bool isLogin = false;

  static Future<bool> setSaved(
      {required dynamic value, required String key}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }

    return await sharedPreferences!.setDouble(key, value);
  }

  static dynamic getSaved({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<dynamic> deleteSaved({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
