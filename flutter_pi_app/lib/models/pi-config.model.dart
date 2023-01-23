import 'dart:convert';

import 'package:flutter_pi_app/models/card-type.enum.dart';

class PiConfig {
  final String id;
  final String ipAddress;
  final String port;
  final CardType cardType;
  late final String? machineName;

  PiConfig(
      {required this.id,
      required this.cardType,
      required this.ipAddress,
      required this.port,
      this.machineName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ipAddress': ipAddress,
      'port': port,
      'cardType': cardType
    };
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'ipAddress': ipAddress, 'port': port, 'cardType': cardType};

  factory PiConfig.fromDynamicMap(Map<dynamic, dynamic> data) {
    return PiConfig(
        id: data["id"],
        cardType: data["cardType"],
        ipAddress: data["ipAddress"],
        port: data["port"],
        machineName: '');
  }

  @override
  String toString() {
    return 'PiConfig{id: $id, ipaddress: $ipAddress, port: $port, cardType: $cardType }';
  }
}
