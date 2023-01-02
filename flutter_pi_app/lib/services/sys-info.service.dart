import 'dart:convert';
import 'package:flutter_pi_app/models/result.model.dart';
import 'package:http/http.dart' as http;

Future<Result> fetchSysInfo() async {
  final response =
      await http.get(Uri.parse('http://192.168.178.24/api/systeminformation'));
  if (response.statusCode == 200) {
    return Result.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load env settings');
  }
}
