import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/theme_service.dart';
import 'bloc/authentication_service.dart';
import 'bloc/database_service.dart';
import 'bloc/functions_service.dart';

import 'screens/home_screen.dart';
import './route_register.dart';
import './firebase_options.dart';
import './scroll_behavior.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        BlocProvider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        BlocProvider<DatabaseService>(
          create: (_) => DatabaseService(),
        ),
        BlocProvider<FunctionsService>(
          create: (_) => FunctionsService(),
        ),
      ],
      child: BlocBuilder<ThemeService, ThemeData>(
        builder: (context, activeTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "NerdHerd",
          theme: activeTheme,
          scrollBehavior: NerdHerdScrollBehavior(),
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
          onGenerateRoute: RouteRegister.onGenerateRoute,
        ),
      ),
    );
  }
}
