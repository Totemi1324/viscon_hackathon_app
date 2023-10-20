import 'package:flutter/material.dart';
//import 'package:page_transition/page_transition.dart';

import 'screens/login_screen.dart';

class RouteRegister {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LogInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LogInScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
