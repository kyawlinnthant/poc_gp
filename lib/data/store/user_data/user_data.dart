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
* */

import 'package:poc/feature/feature/auth/data/dto/register_dto.dart';

class UserData {
  final String username;
  final String fullName;
  final String mobile;
  final String prefix;
  final String email;
  final String password;

  UserData({
    required this.mobile,
    required this.password,
    required this.fullName,
    required this.username,
    required this.prefix,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'username': username,
      'prefix': prefix,
      'mobile': mobile,
      'email': email,
      'password': password,
    };
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      fullName: json['full_name'],
      username: json['username'],
      mobile: json['mobile'],
      prefix: json['prefix'],
      email: json['email'],
      password: json['password'],
    );
  }
}

UserData toUserData({
  required RegisterDto dto,
  required String password,
  required String prefix,
}) {
  return UserData(
    mobile: dto.mobile,
    password: password,
    fullName: dto.fullName,
    username: dto.username,
    email: dto.email,
    prefix: '',
  );
}
