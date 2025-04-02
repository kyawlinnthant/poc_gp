/*
{
"error": "invalid_grant",
"error_description": "The user name or password is incorrect."
}
*/
class ErrorResponse {
  final String message;
  final String type;

  ErrorResponse({required this.message, required this.type});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message:
          json['error_description']?.toString() ?? 'Unknown error occurred.',
      type: json['error']?.toString() ?? 'unknown_error',
    );
  }
}
