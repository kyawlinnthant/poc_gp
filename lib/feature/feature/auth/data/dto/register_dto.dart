/*
  {
    "username": "60123456789",
    "full_name": "60123456789",
    "mobile": "60123456789",
    "email": "klt1@kiple.com",
    "token": "149cea799af5437da451564224d3d4de",
    "token_expire": "2025-05-16 23:50:36",
    "registration_time": "2025-04-16 23:50:36",
    "user_id": "1e1068856caf468fa2d9901781be6170"
  }
*/

class RegisterDto {
  final String username;
  final String fullName;
  final String mobile;
  final String email;
  final String token;
  final String tokenExpired;
  final String registrationTime;
  final String userId;

  RegisterDto({
    required this.username,
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.token,
    required this.tokenExpired,
    required this.registrationTime,
    required this.userId,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) {
    return RegisterDto(
      username: json["username"] ?? '',
      fullName: json["full_name"] ?? '',
      mobile: json["mobile"] ?? '',
      email: json["email"] ?? '',
      token: json["token"] ?? '',
      tokenExpired: json["token_expire"] ?? '',
      registrationTime: json["registration_time"] ?? '',
      userId: json["user_id"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "full_name": fullName,
      "mobile": mobile,
      "email": email,
      "token": token,
      "token_expire": tokenExpired,
      "registration_time": registrationTime,
      "user_id": userId,
    };
  }
}
