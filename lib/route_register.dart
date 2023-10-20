import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/login_screen.dart';

class RouteRegister {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LogInScreen.routeName:
        return PageTransition(
          child: const LogInScreen(),
          type: PageTransitionType.fade,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1200),
        );
      default:
        return null;
    }
  }
}
