import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen/fonts.gen.dart';

class ThemeService extends Cubit<ThemeData> {
  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: FontFamily.raleway,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(2, 104, 115, 1.0),
      brightness: Brightness.dark,
    ),
  );
  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.raleway,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(2, 104, 115, 1.0),
      brightness: Brightness.light,
    ),
  );

  ThemeService() : super(_darkTheme);

  static ThemeData currentTheme = _darkTheme;

  void selectTheme(Brightness selectedBrightness) {
    if (selectedBrightness == Brightness.dark) {
      currentTheme = _darkTheme;
      emit(_darkTheme);
    } else {
      currentTheme = _lightTheme;
      emit(_lightTheme);
    }
  }
}
