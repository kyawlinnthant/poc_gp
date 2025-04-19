import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'user_data.dart';

class AppUserStore {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _userDataKey = 'user_data';

  Future<void> saveUserData(UserData userData) async {
    String jsonString = json.encode(userData.toJson());
    await _storage.write(key: _userDataKey, value: jsonString);
  }

  Future<UserData?> getUserData() async {
    String? jsonString = await _storage.read(key: _userDataKey);
    if (jsonString == null) {
      return null;
    }
    Map<String, dynamic> jsonData = json.decode(jsonString);
    return UserData.fromJson(jsonData);
  }

  Future<void> deleteUserData() async {
    await _storage.delete(key: _userDataKey);
  }

  Future<void> reset() async {
    await _storage.deleteAll();
  }
}
