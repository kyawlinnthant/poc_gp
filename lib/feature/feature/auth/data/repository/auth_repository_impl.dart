import '../service/auth_api_service.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../../domain/repository/auth_repository.dart';
import '../dto/login_dto.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService apiService;

  AuthRepositoryImpl({required this.apiService});

  // Auth
  @override
  Future<NetworkResource<LoginDto>> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.login(
      username: email,
      password: password,
    );

    if (response is Success<LoginDto>) {
      final data = response.data!;
      if (data.accessToken.isNotEmpty) {
        // await prefService.setToken(token: data.accessToken);
        // await prefService.setUsername(name: data.username);
        // await prefService.setEmail(email: data.email);
        // await prefService.setIsAuthenticated(true);
      }
    }
    return response;
  }

  @override
  Future<NetworkResource<bool>> register({
    required String country,
    required String firstname,
    required String lastname,
    required String mobileNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await apiService.register(
      country: country,
      firstName: firstname,
      lastName: lastname,
      phoneNo: mobileNumber,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    switch (response) {
      case Success<bool>():
        return Success(data: true);
      case Failed<bool>():
        return Failed(message: response.message);
    }
  }
}
