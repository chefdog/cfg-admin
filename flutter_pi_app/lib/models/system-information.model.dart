class SystemInformation {
  final String environment;

  const SystemInformation({required this.environment});

  factory SystemInformation.fromJson(Map<String, dynamic> json) {
    return SystemInformation(
      environment: json['environment'],
    );
  }
}
