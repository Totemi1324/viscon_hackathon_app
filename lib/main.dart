import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme_service.dart';

import 'screens/login_screen.dart';
import './route_register.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeService>(
          create: (_) => ThemeService(),
        ),
      ],
      child: BlocBuilder<ThemeService, ThemeData>(
        builder: (context, activeTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "NerdHerd",
          theme: activeTheme,
          initialRoute: LogInScreen.routeName,
          routes: {
            LogInScreen.routeName: (context) => const LogInScreen(),
          },
          onGenerateRoute: RouteRegister.onGenerateRoute,
        ),
      ),
    );
  }
}
