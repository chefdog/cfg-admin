import 'dart:convert';
import 'package:flutter_pi_app/models/result-system-information.model.dart';

class DashboardCard {
  final bool didError;
  final String error;
  final List<SystemInformation> data;

  const DashboardCard(
      {required this.didError, required this.error, required this.data});

  factory DashboardCard.fromJson(Map<String, dynamic> json) {
    return DashboardCard(
      error: json['error'],
      didError: json['didError'],
      data: jsonDecode(json['data'])
          .map<SystemInformation>(
              (object) => SystemInformation.fromJson(object))  
          .toList(),
    );
  }
}
