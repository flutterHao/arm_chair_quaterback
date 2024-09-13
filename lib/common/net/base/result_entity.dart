class Result {
  int? code;
  String? message;
  dynamic data;

  Result({this.code, this.message, this.data});

  @override
  String toString() => 'Result(code: $code, message: $message, data: $data)';

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data,
      };
}
