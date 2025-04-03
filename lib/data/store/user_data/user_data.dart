class UserData {
  final String userId;
  final String username;
  final String email;

  UserData({required this.userId, required this.username, required this.email});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'username': username, 'email': email};
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
    );
  }
}
