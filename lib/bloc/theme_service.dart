import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen/fonts.gen.dart';

class ThemeService extends Cubit<ThemeData> {
  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: FontFamily.raleway,
  );
  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.raleway,
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
