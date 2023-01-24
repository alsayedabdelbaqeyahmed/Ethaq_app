import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MostUsedFun {
  void printFullText(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    // ignore: avoid_print
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  void showToast({
    required String msg,
  }) =>
      Fluttertoast.showToast(
        msg: msg.tr().toCapitalized(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  // show date picker and return date format yyyy-mm-dd
  Future<String> showDatePickerDialog({
    required BuildContext context,
    DateTime? firstDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
    );
    if (picked != null) {
      return picked.toString().substring(0, 10);
    } else {
      return '';
    }
  }

  // email validation =====>>>
  bool isEmail(String email) {
    final emailRegex = RegExp(r'''
^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''');
    return emailRegex.hasMatch(email);
  }

  // iban validation =====>>>
  bool isIban(String iban) {
    final ibanRegex = RegExp(r'^SA\d{2}[a-zA-Z0-9]{18}$');
    return ibanRegex.hasMatch(iban);
  }
  // validation to check if paragraph is arabic only
  bool isArabicOnly(String text) {
    final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    return arabicRegex.hasMatch(text);
  }
}
