import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen/fonts.gen.dart';

class ThemeService extends Cubit<ThemeData> {
  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: FontFamily.baloo2,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(71, 117, 154, 1.0),
      brightness: Brightness.dark,
    ),
  );
  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.baloo2,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(71, 117, 154, 1.0),
      brightness: Brightness.light,
    ),
  );

  ThemeService() : super(_lightTheme);

  static ThemeData currentTheme = _lightTheme;

  void selectTheme(Brightness selectedBrightness) {
    if (selectedBrightness == Brightness.dark) {
      currentTheme = _darkTheme;
      emit(_darkTheme);
    } else {
      currentTheme = _lightTheme;
      emit(_lightTheme);
    }
  }

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      currentTheme = _darkTheme;
      emit(_darkTheme);
    } else {
      currentTheme = _lightTheme;
      emit(_lightTheme);
    }
  }
}
