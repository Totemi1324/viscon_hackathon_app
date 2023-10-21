import 'package:flutter/material.dart';
//import 'package:page_transition/page_transition.dart';

import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/verification_screen.dart';

class RouteRegister {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LogInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LogInScreen(),
          settings: settings,
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: settings,
        );
      case DashboardScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
          settings: settings,
        );
      case VerificationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const VerificationScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
