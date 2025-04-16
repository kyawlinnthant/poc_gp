/*
{
    "code": -2,
    "msg": "Internal server error, Http not found",
    "data": {},
    "time": 1744815432157
}
*/
class ErrorResponse {
  final int code;
  final String message;
  final double time;
  final dynamic data;

  ErrorResponse({
    required this.code,
    required this.message,
    required this.time,
    required this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'] ?? -1,
      message: json['msg'] ?? 'Unknown error',
      time:
          (json['time'] is int)
              ? (json['time'] as int).toDouble()
              : double.tryParse(json['time'].toString()) ?? 0.0,
      data: json['data'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'msg': message, 'time': time, 'data': data};
  }
}
