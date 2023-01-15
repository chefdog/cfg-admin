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
    );
  }
}
