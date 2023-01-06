import 'dart:convert';

import 'package:flutter_pi_app/models/result.model.dart';
import 'package:flutter_pi_app/models/system-information.model.dart';

class SystemInformationResult with Result {
  final List<SystemInformation> data;

  SystemInformationResult({required this.data});

  factory SystemInformationResult.fromJson(Map<String, dynamic> json) {
    var si = SystemInformationResult(
        data: jsonDecode(json['data'])
            .map<SystemInformation>(
                (object) => SystemInformation.fromDynamic(object))
            .toList());
    si.didError = json['didError'];
    si.error = json['error'];
    return si;
  }
}
