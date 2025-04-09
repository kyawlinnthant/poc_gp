import 'package:poc/data/store/user_data/user_data.dart';

import '../../../../../data/network/resource/network_resource.dart';
import '../../data/dto/login_dto.dart';

abstract class AuthRepository {
  // Auth
  Future<NetworkResource<bool>> requestOtp({
    required String phone,
    required String authId,
  });

  Future<NetworkResource<bool>> verifyOtp({
    required String phone,
    required String otp,
  });

  Future<NetworkResource<bool>> resentOtp({
    required String phone,
    required String authId,
  });

  Future<NetworkResource<LoginDto>> login({
    required String phone,
    required String password,
  });

  Future<NetworkResource<bool>> register({
    required String prefix,
    required String phone,
    required String password,
    required String email,
  });

  Future<NetworkResource<bool>> createPin({required String pin});

  Future<UserData?> getUserData();
}
