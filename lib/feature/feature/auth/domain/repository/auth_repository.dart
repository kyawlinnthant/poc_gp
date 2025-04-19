import 'package:poc/data/store/user_data/user_data.dart';

import '../../../../../data/network/resource/network_resource.dart';

abstract class AuthRepository {
  // signup - OTP
  Future<NetworkResource<bool>> requestOtpSignup({
    required String prefix,
    required String phone,
    required String type,
  });

  Future<NetworkResource<bool>> verifyOtpSignup({
    required String prefix,
    required String phone,
    required int type,
    required String otp,
  });

  Future<NetworkResource<bool>> register({
    required String prefix,
    required String phone,
    required String password,
    required String email,
  });

  // password - OTP
  Future<NetworkResource<bool>> requestOtpPassword({
    required String prefix,
    required String phone,
    required String type,
  });

  Future<NetworkResource<bool>> verifyOtpPassword({
    required String prefix,
    required String phone,
    required int type,
    required String otp,
  });

  Future<NetworkResource<bool>> resetPassword({
    required String prefix,
    required String phone,
    required String password,
  });

  // login
  Future<NetworkResource<bool>> login({
    required String prefix,
    required String phone,
    required int type,
    required String password,
  });

  // store
  Future<UserData?> getUserData();
}
