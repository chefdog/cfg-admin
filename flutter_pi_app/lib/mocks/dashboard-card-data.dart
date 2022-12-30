import 'package:flutter/material.dart';
import 'package:flutter_pi_app/models/dashboard-card.model.dart';

List<DashboardCard> cards(BuildContext context) {
  return [
    const DashboardCard(
        title: 'my title 1',
        subTitle: 'subtitle 1',
        iconColor: Colors.blueAccent,
        textSelectionColor: Colors.red,
        buttonText: 'buttonText'),
    const DashboardCard(
        title: 'my title 2',
        subTitle: 'subtitle 2',
        iconColor: Colors.blueAccent,
        textSelectionColor: Colors.red,
        buttonText: 'buttonText'),
  ];
}
