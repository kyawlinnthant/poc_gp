/*
{
    "Code": "user-register-send-otp",
    "Message": "Invalid mobile number"
}
*/
class ErrorResponse {
  final String code;
  final String message;

  ErrorResponse({required this.code, required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['Code']?.toString() ?? 'Unknown Code',
      message: json['Message']?.toString() ?? 'Unknown Message',
    );
  }
}
