import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void flushbarErrorMessage(String Message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: Message,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          messageColor: Colors.white,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
        )..show(context));
  }
}
