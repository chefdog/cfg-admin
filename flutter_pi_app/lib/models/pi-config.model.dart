import 'package:flutter_pi_app/models/card-type.enum.dart';

class PiConfig {
  final int id;
  final String ipAddress;
  final String description;
  final String port;
  late final String? machineName;

  PiConfig(
      {required this.id,
      required this.description,
      required this.ipAddress,
      required this.port,
      this.machineName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ipAddress': ipAddress,
      'port': port,
    };
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'ipAddress': ipAddress,
        'port': port,
        'description': description
      };

  factory PiConfig.fromDynamicMap(Map<dynamic, dynamic> data) {
    return PiConfig(
        id: data["id"],
        description: data['description'],
        ipAddress: data["ipAddress"],
        port: data["port"],
        machineName: '');
  }

  @override
  String toString() {
    return 'PiConfig{id: $id, ipaddress: $ipAddress, port: $port, description: $description }';
  }
}
