import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatPrice(double price) {
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(price);
  }
  static void showFunctionalityInDevelopmentMessage(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'Esta funcionalidad está en desarrollo',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}