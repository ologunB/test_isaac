import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showNotif(BuildContext context, String message) {
    Flushbar(
      message: message,
      margin: EdgeInsets.all(4),
      borderRadius: BorderRadius.circular(4),
      duration: Duration(seconds: 2),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static String generateId(from, to) {
    if (from.hashCode > to.hashCode) {
      return from + to;
    } else {
      return to + from;
    }
  }
}
