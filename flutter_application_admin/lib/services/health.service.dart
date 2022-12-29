import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Health.model.dart';

Future<Health> fetchModel() async {
  final response =
      await http.get(Uri.parse('http://192.168.178.24/api/health'));
  if (response.statusCode == 200) {
    return Health.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load env settings');
  }
}
