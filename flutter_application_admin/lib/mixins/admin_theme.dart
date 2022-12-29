import 'package:flutter/material.dart';

mixin AdminTheme {
  ThemeData getTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.lightBlue[900],
          secondary: Colors.teal[900],
        ),
        // canvas color defines your background color
        canvasColor: Colors.blueGrey[50],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
        ),
        listTileTheme: const ListTileThemeData(
            selectedColor: Colors.teal,
            tileColor: Colors.white10,
            textColor: Colors.black),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ));
  }
}