import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/fonts.constant.dart';
import 'utils/get_material_color.util.dart';

class LightPalette {
  static const textColor = Color(0xFF201F5F);
  static const primary = Color(0xFF137547);
  static const primaryButtonTextColor = Colors.white;
  static const backgroundColor = Color(0xFFF6F7F9);
  static const error = Color(0xFFDB8E8E);
  static const disabledColor = Color(0xFF8682A3);
}

ColorScheme getColorScheme() {
  return const ColorScheme(
    primary: LightPalette.primary,
    onPrimary: LightPalette.primaryButtonTextColor,
    brightness: Brightness.light,
    secondary: LightPalette.textColor,
    onSecondary: LightPalette.primaryButtonTextColor,
    tertiary: LightPalette.primaryButtonTextColor,
    onTertiary: LightPalette.textColor,
    error: LightPalette.error,
    onError: LightPalette.primaryButtonTextColor,
    background: LightPalette.backgroundColor,
    onBackground: LightPalette.textColor,
    surface: LightPalette.primaryButtonTextColor,
    onSurface: LightPalette.textColor,
  );
}

class LightTheme {
  static getTheme() {
    return ThemeData(
      primarySwatch: generateMaterialColor(LightPalette.primary),
      disabledColor: LightPalette.disabledColor,
      colorScheme: getColorScheme(),
      scaffoldBackgroundColor: LightPalette.backgroundColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: FontSizes.headline1,
          fontWeight: FontWeight.w900,
        ),
        headline2: TextStyle(
          fontSize: FontSizes.headline2,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          fontSize: FontSizes.headline3,
          fontWeight: FontWeight.w500,
        ),
        button: TextStyle(
          fontSize: FontSizes.button,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          fontSize: FontSizes.bodyText1,
          fontWeight: FontWeight.w200,
        ),
        bodyText2: TextStyle(
          fontSize: FontSizes.bodyText2,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
