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

class UserData {
  final String mobile;
  final String prefix;
  final String email;

  UserData({required this.mobile, required this.prefix, required this.email});

  Map<String, dynamic> toJson() {
    return {'prefix': prefix, 'mobile': mobile, 'email': email};
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      mobile: json['mobile'],
      prefix: json['prefix'],
      email: json['email'],
    );
  }
}

UserData toUserData({
  required String prefix,
  required String mobile,
  required String email,
}) {
  return UserData(mobile: mobile, email: email, prefix: prefix);
}

/*
* Register
* {
    "code": 0,
    "msg": "success",
    "data": {
        "username": "600000000001",
        "full_name": "600000000001",
        "mobile": "600000000001",
        "email": "linn0000000001@kiple.com",
        "token": "a44860e2a0c64dc0915ca829c4d04917",
        "token_expire": "2025-05-17 23:43:45",
        "registration_time": "2025-04-17 23:43:45",
        "user_id": "3ac711617a4a4d45b0631c571597c814"
    },
    "time": 1744904625593
}
*
* Login
* {
    "code": 0,
    "msg": "success",
    "data": {
        "username": "600000000000",
        "full_name": "600000000000",
        "gender": 0,
        "mobile": "600000000000",
        "email": "linn0000000000@kiple.com",
        "token": "7ade6eca0b22425e977f8e4995e312a6",
        "token_expire": "2025-05-17 23:42:30",
        "user_id": "b22db1c85c1b48038112df677b1e3ed6"
    },
    "time": 1744904550923
}
*
* */
