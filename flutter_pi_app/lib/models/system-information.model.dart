class SystemInformation {
  final String machineName;

  const SystemInformation({required this.machineName});

  factory SystemInformation.fromJson(Map<String, dynamic> json) {
    return SystemInformation(
      machineName: json['machineName'],
    );
  }

  factory SystemInformation.fromDynamic(dynamic data) {
    return SystemInformation(
      machineName: data['machineName'],
    );
  }
}
