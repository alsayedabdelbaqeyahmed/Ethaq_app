import '../api/end_points.dart';

class AppConst {
  static const String appName = 'Ethaq';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  static const String isFirstTime = 'isFirstTime';
  static bool isFirstTimeCheck = true;
  static const String countryCode = "SA";
  static const String mediaUrl = "${EndPoints.domain}/uploads/";
  static const String imageNet =
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

  // BOXES NAMES
  static const mainBoxName = "mainBox";

// BOXES KEYS
  static const userIdBox = "userId";
  static const isDarkBox = "isDarkBox";
  static const introFinishBox = "introFinish";
  static const tokenBox = "token";
}
