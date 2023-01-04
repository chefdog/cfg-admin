import 'dart:convert';
import 'package:flutter_pi_app/models/result.model.dart';
import 'package:flutter_pi_app/services/storage-http.service.dart';
import 'package:http/http.dart' as http;

class HttpPiService extends StorageHttpService {
  @override
  Future<Result> fetchSysInfo(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load env settings');
    }
  }
}
