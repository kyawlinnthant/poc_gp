/*
{
    "code": 0,
    "msg": "success",
    "data": null,
    "time": 1744816157639
}
* */

class SuccessResponse {
  final int code;
  final String message;
  final dynamic data;
  final double time;

  SuccessResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.time,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return SuccessResponse(
      code: json['code'] ?? -1,
      message: json['msg'] ?? 'Unknown error',
      data: json['data'],
      time:
          (json['time'] is int)
              ? (json['time'] as int).toDouble()
              : double.tryParse(json['time'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'msg': message, 'data': data, 'time': time};
  }
}

bool checkResponse({required String message}) {
  return (message.trim().toLowerCase() == 'success');
}

/*
final Map<String, dynamic> jsonResponse = {
  "code": 0,
  "msg": "success",
  "data": {"id": 1, "name": "Linn"},
  "time": 1744816157639
};

final response = ApiResponse.fromJson(jsonResponse);

print(response.code);    // 0
print(response.message); // success
print(response.data);    // {id: 1, name: Linn}
print(response.time);
* */
