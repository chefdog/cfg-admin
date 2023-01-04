class PiConfig {
  final int id;
  final String ipaddress;
  final String port;
  late final String? machineName;

  PiConfig(
      {required this.id,
      required this.ipaddress,
      required this.port,
      this.machineName});

  Map<String, dynamic> toMap() {
    return {'id': id, 'ipaddress': ipaddress, 'port': port};
  }

  factory PiConfig.fromDynamicMap(Map<dynamic, dynamic> data) {
    return PiConfig(
        id: data["id"],
        ipaddress: data["ipaddress"],
        port: data["port"],
        machineName: '');
  }

  @override
  String toString() {
    return 'PiConfig{id: $id, ipaddress: $ipaddress, port: $port }';
  }
}
