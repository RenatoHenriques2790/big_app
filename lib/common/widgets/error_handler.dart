import 'package:flutter/material.dart';

class ErrorHandler {
  static void showSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.redAccent}) {
    if (!context.mounted){
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}