import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_pi_app/models/result.model.dart';
import 'package:http/http.dart' as http;

Future<Result> fetchSysInfo() async {
  final response =
      await http.get(Uri.parse('http://192.168.178.24/api/systeminformation'));
  if (response.statusCode == 200) {
    return compute(parseModel, response.body);
  } else {
    throw Exception('Failed to load env settings');
  }
}

Result parseModel(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Result>((json) => Result.fromJson(json)).toList();
}
