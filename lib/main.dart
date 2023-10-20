import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme_service.dart';

import 'screens/home_screen.dart';
import './route_register.dart';

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
