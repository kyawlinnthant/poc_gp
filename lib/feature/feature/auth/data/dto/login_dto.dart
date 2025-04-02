class LoginDto {
  final String accessToken;
  final String tokenType;
  final num expiresIn;
  final String issued;
  final String expires;
  final String username;
  final String email;
  final String roles;
  final String phoneNumberConfirmed;

  LoginDto({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.issued,
    required this.expires,
    required this.username,
    required this.email,
    required this.roles,
    required this.phoneNumberConfirmed,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: json['expires_in'] as num,
      issued: json['.issued'] as String,
      expires: json['.expires'] as String,
      username: json['userName'] as String,
      email: json['Email'] as String,
      roles: json['Roles'] as String,
      phoneNumberConfirmed: json['PhoneNumberConfirmed'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      '.issued': issued,
      '.expires': expires,
      'userName': username,
      'Email': email,
      'Roles': roles,
      'PhoneNumberConfirmed': phoneNumberConfirmed,
    };
  }

  LoginDto copyWith({
    String? accessToken,
    String? tokenType,
    num? expiresIn,
    String? issued,
    String? expires,
    String? username,
    String? email,
    String? roles,
    String? phoneNumberConfirmed,
  }) {
    return LoginDto(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      issued: issued ?? this.issued,
      expires: expires ?? this.expires,
      username: username ?? this.username,
      email: email ?? this.email,
      roles: roles ?? this.roles,
      phoneNumberConfirmed: phoneNumberConfirmed ?? this.phoneNumberConfirmed,
    );
  }
}
