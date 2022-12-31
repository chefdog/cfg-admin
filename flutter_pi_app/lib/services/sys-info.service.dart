import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_pi_app/models/system-information.model.dart';
import 'package:http/http.dart' as http;

Future<List<SystemInformation>> fetchSysInfo(http.Client client) async {
  final response =
      await http.get(Uri.parse('http://192.168.178.24/api/health'));
  if (response.statusCode == 200) {
    return compute(parseHealthModels, response.body);
  } else {
    throw Exception('Failed to load env settings');
  }
}

List<SystemInformation> parseHealthModels(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<SystemInformation>((json) => SystemInformation.fromJson(json))
      .toList();
}
