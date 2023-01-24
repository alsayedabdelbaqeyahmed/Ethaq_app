import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

import '../../config/themes/colors.dart';
import '../utils/app_sizes.dart';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

void navigateTo(BuildContext context, Widget widget,
        {PageTransitionType? pageTransitionType,}) =>
    Navigator.push(
      context,
      PageTransition(
        child: widget,
        type: pageTransitionType ?? PageTransitionType.fade,
        duration: const Duration(milliseconds: 500),
      ),
    );

void navigateAndFinish(BuildContext context, Widget widget,
        {PageTransitionType? pageTransitionType,}) =>
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: widget,
        type: pageTransitionType ?? PageTransitionType.fade,
        duration: const Duration(milliseconds: 500),
      ),
      (route) => false,
    );

void showToast({
  required String msg,
}) =>
    Fluttertoast.showToast(
      msg: msg.tr().toCapitalized(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      fontSize: AppFontSize.f16,
    );

String? validateEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'enter a valid email address'.tr().toCapitalized();
  } else {
    return null;
  }
}

void showAlertDialog({
  required BuildContext context,
  String? title,
  Widget? body,
  VoidCallback? onPressed1,
  String? txtBtn1,
  VoidCallback? onPressed2,
  String? txtBtn2,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: body,
        scrollable: true,
        actions: [
          if (onPressed1 != null)
            ElevatedButton(
              onPressed: onPressed1,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                      color: AppColors.cPrimary,
                      width: .6,
                    ),
                  ),
                ),
              ),
              child: Text(
                '$txtBtn1'.tr().toUpperCase(),
              ),
            ),
          if (onPressed2 != null)
            ElevatedButton(
              onPressed: onPressed2,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.cPrimary),
              ),
              child: Text(
                '$txtBtn2'.tr().toTitleCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      );
    },
  );
}
