import 'package:flutter/material.dart';
import 'package:flutter_pi_app/themes/light_color_scheme.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      listTileTheme: ListTileThemeData(
        iconColor: lightColorScheme.primary,
      ),
      buttonTheme: ButtonThemeData(buttonColor: lightColorScheme.background),
    );
  }

  static ButtonStyle get cardButtonStyle {
    return TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      backgroundColor: lightColorScheme.primary,
    );
  }

  static TextStyle get textStyle {
    return TextStyle(color: lightColorScheme.background);
  }
}
