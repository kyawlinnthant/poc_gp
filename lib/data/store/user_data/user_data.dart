class UserData {
  final String userId;
  final String username;
  final String mobile;
  final String email;
  final String password;

  UserData({
    required this.mobile,
    required this.password,
    required this.userId,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'mobile': mobile,
      'email': email,
      'password': password,
    };
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      username: json['username'],
      mobile: json['mobile'],
      email: json['email'],
      password: json['password'],
    );
  }
}
