import 'package:poc/data/store/user_data/user_data.dart';

import '../../../../../data/network/resource/network_resource.dart';
import '../../data/dto/login_dto.dart';

abstract class AuthRepository {
  // signup - OTP
  Future<NetworkResource<bool>> requestOtpSignup({
    required String phone,
    required String authId,
  });

  Future<NetworkResource<bool>> verifyOtpSignup({
    required String phone,
    required String otp,
  });

  Future<NetworkResource<bool>> resentOtpSignup({
    required String phone,
    required String authId,
  });

  Future<NetworkResource<bool>> register({
    required String prefix,
    required String phone,
    required String password,
    required String email,
  });

  // password - OTP
  Future<NetworkResource<bool>> requestOtpPassword({
    required String phone,
    required String authId,
  });

  Future<NetworkResource<bool>> verifyOtpPassword({
    required String phone,
    required String otp,
  });

  Future<NetworkResource<bool>> resentOtpPassword({
    required String phone,
    required String authId,
  });

  Future<NetworkResource<bool>> resetPassword({
    required String prefix,
    required String phone,
    required String password,
  });

  // login
  Future<NetworkResource<LoginDto>> login({
    required String phone,
    required String password,
  });

  // store
  Future<UserData?> getUserData();
}
