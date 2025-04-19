import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppKeyStore {
  static const String _tokenKey = 'token';
  static const String _userIdKey = 'user_id';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> saveUserId(String token) async {
    await _storage.write(key: _userIdKey, value: token);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  Future<void> deleteUserId() async {
    await _storage.delete(key: _userIdKey);
  }

  Future<void> reset() async {
    await _storage.deleteAll();
  }
}
