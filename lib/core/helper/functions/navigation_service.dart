import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get currentContext =>
      NavigationService.navigatorKey.currentContext!;
}
