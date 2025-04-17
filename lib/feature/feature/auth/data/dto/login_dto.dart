/*
  {
        "username": "600000000000",
        "full_name": "600000000000",
        "gender": 0,
        "mobile": "600000000000",
        "email": "linn0000000000@kiple.com",
        "token": "7ade6eca0b22425e977f8e4995e312a6",
        "token_expire": "2025-05-17 23:42:30",
        "user_id": "b22db1c85c1b48038112df677b1e3ed6"
    }
*/

class LoginDto {
  final String username;
  final String fullName;
  final String mobile;
  final String email;
  final String token;
  final String tokenExpired;
  final int gender;
  final String userId;

  LoginDto({
    required this.username,
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.token,
    required this.tokenExpired,
    required this.gender,
    required this.userId,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      username: json["username"] ?? '',
      fullName: json["full_name"] ?? '',
      mobile: json["mobile"] ?? '',
      email: json["email"] ?? '',
      token: json["token"] ?? '',
      tokenExpired: json["token_expire"] ?? '',
      gender: json["gender"] ?? '',
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
      "gender": gender,
      "user_id": userId,
    };
  }
}
