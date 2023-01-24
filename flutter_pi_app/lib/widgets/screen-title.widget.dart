import 'package:flutter/material.dart';
import 'package:flutter_pi_app/themes/theme_settings.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        title,
        style: ThemeSettings.headerStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
