class Health {
  final String environment;

  const Health({required this.environment});

  factory Health.fromJson(Map<String, dynamic> json) {
    return Health(
      environment: json['environment'],
    );
  }
}
