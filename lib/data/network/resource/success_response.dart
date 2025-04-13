/*
* {
    "success": true,
    "data": true,
    "code": "user-register-verify-request",
    "message": null
}
* */

class SuccessResponse {
  final bool success;
  final String code;
  final bool? data;
  final String? message;

  SuccessResponse({
    required this.success,
    required this.code,
    this.data,
    this.message,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return SuccessResponse(
      success: json['success'] ?? false,
      code: json['code']?.toString() ?? 'Unknown Code',
      data: json['data'] ?? false,
      message: json['message']?.toString() ?? 'Unknown Message',
    );
  }
}
