import 'package:poc/feature/feature/pin/domain/repostiory/pin_repository.dart';

import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/store/app_data/app_data_store.dart';
import '../../../../../data/store/app_data/app_launch_mode.dart';
import '../service/pin_service.dart';

class PinRepositoryImpl implements PinRepository {
  final AppDataStore appDataStore;
  final PinApiService apiService;

  const PinRepositoryImpl({
    required this.appDataStore,
    required this.apiService,
  });

  @override
  Future<NetworkResource<bool>> createPin({required String pin}) async {
    // todo: after create pin, should go to eKYC process.
    await Future.delayed(Duration(seconds: 2));
    await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.eKyc);
    return NetworkSuccess(data: true);
  }
}
