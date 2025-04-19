import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/store/user_data/user_data.dart';

abstract class EkycRepository {
  Future<NetworkResource<bool>> mock({
    required String prefix,
    required String phone,
    required String type,
  });

  // store
  Future<UserData?> getUserData();
  Future<bool> eKycInAuth();
  Future<bool> resetAuthFlow();
}
