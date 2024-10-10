import 'package:flutter/material.dart';

class AppRoutes {
  static Future<void> routeTo(BuildContext context, Widget page,
      {int delayMS = 0}) async {
    Future.delayed(Duration(milliseconds: delayMS), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    });
  }

  static Future<void> routeRemoveTo(BuildContext context, Widget page,
      {int delayMS = 0}) async {
    Future.delayed(Duration(milliseconds: delayMS), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    });
  }

  static Future<void> routeRemoveAllTo(BuildContext context, Widget page,
      {int delayMS = 0}) async {
    Future.delayed(Duration(milliseconds: delayMS), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );
    });
  }

  static Future<void> pop(BuildContext context, {int delayMS = 0}) async {
    Future.delayed(Duration(milliseconds: delayMS), () {
      Navigator.pop(context);
    });
  }
}
