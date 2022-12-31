class Result {
  final bool didError;
  final String error;
  final List<Object> data;

  const Result(
      {required this.didError, required this.error, required this.data});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        error: json['error'], didError: json['didError'], data: json['data']);
  }
}
