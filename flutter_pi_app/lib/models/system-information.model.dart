import 'package:flutter/foundation.dart';

class SystemInformation {
  final String machineName;

  SystemInformation({required this.machineName});

  factory SystemInformation.fromDynamic(dynamic data) {
    return SystemInformation(
      machineName: data['machineName'],
    );
  }
}
