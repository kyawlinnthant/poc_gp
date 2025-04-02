import '../../../../../data/network/resource/network_resource.dart';
import '../../data/dto/login_dto.dart';

abstract class AuthRepository {
  // Auth
  Future<NetworkResource<LoginDto>> login({
    required String email,
    required String password,
  });

  Future<NetworkResource<bool>> register({
    required String country,
    required String firstname,
    required String lastname,
    required String mobileNumber,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
