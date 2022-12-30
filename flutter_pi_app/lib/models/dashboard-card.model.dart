import 'package:flutter/material.dart';

class DashboardCard {
  // fields
  final String title;
  final String subTitle;
  final MaterialAccentColor iconColor;
  final MaterialColor textSelectionColor;
  final String buttonText;
  // end fields

  const DashboardCard(
      {required this.title,
      required this.subTitle,
      required this.iconColor,
      required this.textSelectionColor,
      required this.buttonText});
}
